(module
  (func $trace (import "imports" "trace") (param i32))

  ;; We keep 512 KB of memory 
  (memory (export "memory") 8)


  ;; ==========================================================================
  ;; CPU API

  (export "turnOnCpu" (func $turnOnCpu))
  (export "resetMemory" (func $resetMemory))
  (export "resetCpu" (func $resetCpu))
  (export "getA" (func $getA))
  (export "setA" (func $setA))
  (export "getF" (func $getF))
  (export "setF" (func $setF))
  (export "getAF" (func $getAF))
  (export "getB" (func $getB))
  (export "setB" (func $setB))
  (export "getC" (func $getC))
  (export "setC" (func $setC))
  (export "getBC" (func $getBC))
  (export "setBC" (func $setBC))
  (export "getD" (func $getD))
  (export "setD" (func $setD))
  (export "getE" (func $getE))
  (export "setE" (func $setE))
  (export "getDE" (func $getDE))
  (export "setDE" (func $setDE))
  (export "getH" (func $getH))
  (export "setH" (func $setH))
  (export "getL" (func $getL))
  (export "setL" (func $setL))
  (export "getHL" (func $getHL))
  (export "setHL" (func $setHL))
  (export "getI" (func $getI))
  (export "setI" (func $setI))
  (export "getR" (func $getR))
  (export "setR" (func $setR))
  (export "getPC" (func $getPC))
  (export "setPC" (func $setPC))
  (export "getSP" (func $getSP))
  (export "setSP" (func $setSP))
  (export "getXH" (func $getXH))
  (export "setXH" (func $setXH))
  (export "getXL" (func $getXL))
  (export "setXL" (func $setXL))
  (export "getIX" (func $getIX))
  (export "setIX" (func $setIX))
  (export "getYH" (func $getYH))
  (export "setYH" (func $setYH))
  (export "getYL" (func $getYL))
  (export "setYL" (func $setYL))
  (export "getIY" (func $getIY))
  (export "setIY" (func $setIY))
  (export "getWH" (func $getWH))
  (export "setWH" (func $setWH))
  (export "getWL" (func $getWL))
  (export "setWL" (func $setWL))
  (export "getWZ" (func $getWZ))
  (export "setWZ" (func $setWZ))
  (export "getReg8" (func $getReg8))
  (export "setReg8" (func $setReg8))
  (export "getReg16" (func $getReg16))
  (export "setReg16" (func $setReg16))
  (export "setIndexMode" (func $setIndexMode))
  (export "getIndexReg" (func $getIndexReg))
  (export "setIndexReg" (func $setIndexReg))
  (export "setTactsInFrame" (func $setTactsInFrame))
  (export "getFrameCount" (func $getFrameCount))
  (export "getFrameTacts" (func $getFrameTacts))
  (export "incTacts" (func $incTacts))
  (export "setCpuSignals" (func $setCpuSignals))
  (export "setInterruptBlocked" (func $setInterruptBlocked))
  (export "setInterruptMode" (func $setInterruptMode))
  (export "setIff1" (func $setIff1))
  (export "processCpuSignals" (func $processCpuSignals))
  (export "executeCpuCycle" (func $executeCpuCycle))
  (export "getCpuState" (func $getCpuState))
  (export "updateCpuState" (func $updateCpuState))
  (export "enableExtendedInstructions" (func $enableExtendedInstructions))

  ;; Test machine exports
  (export "prepareTest" (func $prepareTest))
  (export "setTestInputLength" (func $setTestInputLength))
  (export "getMemLogLength" (func $getMemLogLength))
  (export "getIoLogLength" (func $getIoLogLength))
  (export "getTbBlueLogLength" (func $getTbBlueLogLength))
  (export "runTestCode" (func $runTestCode))
  (export "resetMachineType" (func $resetMachineType))

  ;; ==========================================================================
  ;; Function signatures

  (type $MemReadFunc (func (param $addr i32) (result i32)))
  (type $MemWriteFunc (func (param $addr i32) (param $v i32)))
  (type $OpFunc (func))

  ;; ==========================================================================
  ;; Constant values

  ;; The offset of the first byte of the ZX Spectrum 48 memory
  ;; Block lenght: 0x1_0000
  (global $SP_MEM_OFFS i32 (i32.const 0))

  ;; ==========================================================================
  ;; Z80 CPU state

  ;; The index of the register area (length: 0x1c)
  (global $REG_AREA_INDEX i32 (i32.const 0x1_0000))

  ;; Reg8 index conversion table
  (global $REG8_TAB_OFFS i32 (i32.const 0x1_0020))
  (data (i32.const 0x1_0020) "\03\02\05\04\07\06\00\01")

  ;; Reg16 index conversion table
  (global $REG16_TAB_OFFS i32 (i32.const 0x1_0028))
  (data (i32.const 0x1_0028) "\02\04\06\14")

  ;; State transfer buffer (length: 0xc0)
  (global $STATE_TRANSFER_BUFF i32 (i32.const 0x1_0040))
  
  ;; The offset of the test input stream (length: 0x0100)
  (global $TEST_INPUT_OFFS i32 (i32.const 0x1_0100))

  ;; The offset of the test memory access log stream stream (length: 0x0400)
  (global $TEST_MEM_LOG_OFFS i32 (i32.const 0x1_0200))

  ;; The offset of the test I/O access log stream stream (length: 0x0400)
  (global $TEST_IO_LOG_OFFS i32 (i32.const 0x1_0600))

  ;; The offset of the test TBBlue access log stream stream (length: 0x0400)
  (global $TEST_TBBLUE_LOG_OFFS i32 (i32.const 0x1_0A00))

  ;; 8-bit INC operation flags table
  (global $INC_FLAGS i32 (i32.const 0x1_0b00))
  (data (i32.const 0x1_0b00) "\00\00\00\00\00\00\00\08\08\08\08\08\08\08\08\10\00\00\00\00\00\00\00\08\08\08\08\08\08\08\08\30\20\20\20\20\20\20\20\28\28\28\28\28\28\28\28\30\20\20\20\20\20\20\20\28\28\28\28\28\28\28\28\10\00\00\00\00\00\00\00\08\08\08\08\08\08\08\08\10\00\00\00\00\00\00\00\08\08\08\08\08\08\08\08\30\20\20\20\20\20\20\20\28\28\28\28\28\28\28\28\30\20\20\20\20\20\20\20\28\28\28\28\28\28\28\28\94\80\80\80\80\80\80\80\88\88\88\88\88\88\88\88\90\80\80\80\80\80\80\80\88\88\88\88\88\88\88\88\b0\a0\a0\a0\a0\a0\a0\a0\a8\a8\a8\a8\a8\a8\a8\a8\b0\a0\a0\a0\a0\a0\a0\a0\a8\a8\a8\a8\a8\a8\a8\a8\90\80\80\80\80\80\80\80\88\88\88\88\88\88\88\88\90\80\80\80\80\80\80\80\88\88\88\88\88\88\88\88\b0\a0\a0\a0\a0\a0\a0\a0\a8\a8\a8\a8\a8\a8\a8\a8\b0\a0\a0\a0\a0\a0\a0\a0\a8\a8\a8\a8\a8\a8\a8\a8\50")

  ;; 8-bit DEC operation flags table
  (global $DEC_FLAGS i32 (i32.const 0x1_0c00))
  (data (i32.const 0x1_0c00) "\ba\42\02\02\02\02\02\02\02\0a\0a\0a\0a\0a\0a\0a\1a\02\02\02\02\02\02\02\02\0a\0a\0a\0a\0a\0a\0a\1a\22\22\22\22\22\22\22\22\2a\2a\2a\2a\2a\2a\2a\3a\22\22\22\22\22\22\22\22\2a\2a\2a\2a\2a\2a\2a\3a\02\02\02\02\02\02\02\02\0a\0a\0a\0a\0a\0a\0a\1a\02\02\02\02\02\02\02\02\0a\0a\0a\0a\0a\0a\0a\1a\22\22\22\22\22\22\22\22\2a\2a\2a\2a\2a\2a\2a\3a\22\22\22\22\22\22\22\22\2a\2a\2a\2a\2a\2a\2a\3e\82\82\82\82\82\82\82\82\8a\8a\8a\8a\8a\8a\8a\9a\82\82\82\82\82\82\82\82\8a\8a\8a\8a\8a\8a\8a\9a\a2\a2\a2\a2\a2\a2\a2\a2\aa\aa\aa\aa\aa\aa\aa\ba\a2\a2\a2\a2\a2\a2\a2\a2\aa\aa\aa\aa\aa\aa\aa\ba\82\82\82\82\82\82\82\82\8a\8a\8a\8a\8a\8a\8a\9a\82\82\82\82\82\82\82\82\8a\8a\8a\8a\8a\8a\8a\9a\a2\a2\a2\a2\a2\a2\a2\a2\aa\aa\aa\aa\aa\aa\aa\ba\a2\a2\a2\a2\a2\a2\a2\a2\aa\aa\aa\aa\aa\aa\aa")

  ;; Next slot: 0x1_0d00

  ;; Z80 State flags
  (global $Z80_STATE_INT i32 (i32.const 0x01))
  (global $Z80_STATE_INT_INV i32 (i32.const 0xfe))
  (global $Z80_STATE_NMI i32 (i32.const 0x02))
  (global $Z80_STATE_NMI_INV i32 (i32.const 0xfd))
  (global $Z80_STATE_RST i32 (i32.const 0x04))
  (global $Z80_STATE_RST_INV i32 (i32.const 0xfb))
  (global $Z80_STATE_HLT i32 (i32.const 0x08))
  (global $Z80_STATE_HLT_INV i32 (i32.const 0xf7))

  ;; Machine type discriminator
  (global $MACHINE_TYPE (mut i32) (i32.const 0x00))

  ;; Number of functions per machine types
  (global $MACHINE_FUNC_COUNT i32 (i32.const 0x06))

  ;; Once-set
  (global $tactsInFrame (mut i32) (i32.const 1_000_000)) ;; Number of tacts within a frame
  (global $allowExtendedSet (mut i32) (i32.const 0x00))  ;; Should allow extended operation set?

  ;; Mutable
  (global $frameCount (mut i32) (i32.const 0x0000)) ;; Number of frames from start
  (global $frameTacts (mut i32) (i32.const 0x0000)) ;; Number of tacts in the current frame
  (global $stateFlags (mut i32) (i32.const 0x00)) ;; Z80 state flags
  (global $useGateArrayContention (mut i32) (i32.const 0x0000)) ;; Should use gate array contention?
  (global $iff1 (mut i32) (i32.const 0x00)) ;; Interrupt flip-flop #1
  (global $iff2 (mut i32) (i32.const 0x00)) ;; Interrupt flip-flop #2
  (global $interruptMode (mut i32) (i32.const 0x00)) ;; Current interrupt mode
  (global $isInterruptBlocked (mut i32) (i32.const 0x00)) ;; Current interrupt block
  (global $isInOpExecution (mut i32) (i32.const 0x00)) ;; Is currently processing an op?
  (global $prefixMode (mut i32) (i32.const 0x00)) ;; Current operation prefix mode
  (global $indexMode (mut i32) (i32.const 0x00)) ;; Current operation index mode
  (global $maskableInterruptModeEntered (mut i32) (i32.const 0x00)) ;; Signs that CPU entered into maskable interrupt mode
  (global $opCode (mut i32) (i32.const 0x00)) ;; Operation code being processed

  ;; Writes the CPU state to the transfer area
  (func $getCpuState
    get_global $STATE_TRANSFER_BUFF
    get_global $tactsInFrame
    i32.store offset=0
    get_global $STATE_TRANSFER_BUFF
    get_global $allowExtendedSet
    i32.store8 offset=4
    get_global $STATE_TRANSFER_BUFF
    get_global $frameCount
    i32.store offset=5
    get_global $STATE_TRANSFER_BUFF
    get_global $frameTacts
    i32.store offset=9
    get_global $STATE_TRANSFER_BUFF
    get_global $stateFlags
    i32.store8 offset=13
    get_global $STATE_TRANSFER_BUFF
    get_global $useGateArrayContention
    i32.store8 offset=14
    get_global $STATE_TRANSFER_BUFF
    get_global $iff1
    i32.store8 offset=15
    get_global $STATE_TRANSFER_BUFF
    get_global $iff2
    i32.store8 offset=16
    get_global $STATE_TRANSFER_BUFF
    get_global $interruptMode
    i32.store8 offset=17
    get_global $STATE_TRANSFER_BUFF
    get_global $isInterruptBlocked
    i32.store8 offset=18
    get_global $STATE_TRANSFER_BUFF
    get_global $isInOpExecution
    i32.store8 offset=19
    get_global $STATE_TRANSFER_BUFF
    get_global $prefixMode
    i32.store8 offset=20
    get_global $STATE_TRANSFER_BUFF
    get_global $indexMode
    i32.store8 offset=21
    get_global $STATE_TRANSFER_BUFF
    get_global $maskableInterruptModeEntered
    i32.store8 offset=22
    get_global $STATE_TRANSFER_BUFF
    get_global $opCode
    i32.store8 offset=23
  )

  ;; Restores the CPU state from the transfer area
  (func $updateCpuState
    get_global $STATE_TRANSFER_BUFF
    i32.load offset=0
    set_global $tactsInFrame
    get_global $STATE_TRANSFER_BUFF
    i32.load8_u offset=4
    set_global $allowExtendedSet
    get_global $STATE_TRANSFER_BUFF
    i32.load offset=5
    set_global $frameCount
    get_global $STATE_TRANSFER_BUFF
    i32.load offset=9
    set_global $frameTacts
    get_global $STATE_TRANSFER_BUFF
    i32.load8_u offset=13
    set_global $stateFlags
    get_global $STATE_TRANSFER_BUFF
    i32.load8_u offset=14
    set_global $useGateArrayContention
    get_global $STATE_TRANSFER_BUFF
    i32.load8_u offset=15
    set_global $iff1
    get_global $STATE_TRANSFER_BUFF
    i32.load8_u offset=16
    set_global $iff2
    get_global $STATE_TRANSFER_BUFF
    i32.load8_u offset=17
    set_global $interruptMode
    get_global $STATE_TRANSFER_BUFF
    i32.load8_u offset=18
    set_global $isInterruptBlocked
    get_global $STATE_TRANSFER_BUFF
    i32.load8_u offset=19
    set_global $isInOpExecution
    get_global $STATE_TRANSFER_BUFF
    i32.load8_u offset=20
    set_global $prefixMode
    get_global $STATE_TRANSFER_BUFF
    i32.load8_u offset=21
    set_global $indexMode
    get_global $STATE_TRANSFER_BUFF
    i32.load8_u offset=22
    set_global $maskableInterruptModeEntered
    get_global $STATE_TRANSFER_BUFF
    i32.load8_u offset=23
    set_global $opCode
  )

  ;; ==========================================================================
  ;; Helpers for testing the Z80 CPU

  ;; The mode to run tests
  (global $testRunMode (mut i32) (i32.const 0x0000))

  ;; The end of the code injected for test pusposes
  (global $testCodeEndsAt (mut i32) (i32.const 0x0000))

  ;; The length of test input sequence
  (global $testInputLength (mut i32) (i32.const 0x0000))

  ;; The index of the next test input
  (global $nextTestInput (mut i32) (i32.const 0x0000))

  ;; The length of the memory access log
  (global $memLogLength (mut i32) (i32.const 0x0000))
  
  ;; The length of the I/O access log
  (global $ioLogLength (mut i32) (i32.const 0x0000))
  
  ;; The length of the TBBLUE access log
  (global $tbBlueLogLength (mut i32) (i32.const 0x0000))
  
  ;; Prepares the test code to run
  (func $prepareTest (param $mode i32) (param $codeEnds i32)
    get_local $mode
    set_global $testRunMode
    get_local $codeEnds
    set_global $testCodeEndsAt
    i32.const 0
    set_global $nextTestInput
    i32.const 0
    set_global $memLogLength
    i32.const 0
    set_global $ioLogLength
    i32.const 0
    set_global $tbBlueLogLength

    ;; Set the machine type to Z80 CPU test machine
    i32.const 4
    set_global $MACHINE_TYPE
  )

  ;; Sets the length of the test input
  (func $setTestInputLength (param $l i32)
    get_local $l
    set_global $testInputLength
  )

  ;; Gets the length of the memory access log
  (func $getMemLogLength (result i32)
    get_global $memLogLength
  ) 

  ;; Gets the length of the I/O access log
  (func $getIoLogLength (result i32)
    get_global $ioLogLength
  ) 

  ;; Gets the length of the TBBLUE access log
  (func $getTbBlueLogLength (result i32)
    get_global $tbBlueLogLength
  ) 

  ;; Runs the test code. Stops according to the specified $testRunMode
  (func $runTestCode
    loop $codeExec
      call $executeCpuCycle
      
      ;; Check the run mode
      ;; Test for Normal or OneCycle
      get_global $testRunMode
      i32.const 1
      i32.le_u
      if
        ;; Stop immediately
        return
      end

      ;; Test for OneInstruction
      get_global $testRunMode
      i32.const 2
      i32.eq
      if
        get_global $isInOpExecution
        i32.const 0
        i32.eq
        if
          ;; Stop if operation execution completed
          return
        else
          ;; continue        
          br $codeExec
        end
      end

      ;; Test for UntilHalt
      get_global $testRunMode
      i32.const 3
      i32.eq
      if
        ;; Stop if HLT flag set
        get_global $stateFlags
        get_global $Z80_STATE_HLT
        i32.and
        i32.const 0
        i32.ne
        if
          ;; Stop if CPU halted
          return
        else
          ;; continue        
          br $codeExec
        end
      end

      ;; Run until code ends
      call $getPC
      get_global $testCodeEndsAt
      i32.ge_u
      if
        ;; Reached the end of the code
        return
      end

      ;; Go on with code execution
      br $codeExec
    end
  )

  ;; Sets the machine type to the default Z80 machine
  (func $resetMachineType
    i32.const 0
    set_global $MACHINE_TYPE
  )

  ;; Test machine memory read operation; logs the memory access
  ;; $addr: 16-bit memory address
  ;; $suppCont: Suppress memory contention flag
  ;; returns: Memory contents
  (func $testMachineRead (param $addr i32) (result i32)
    (local $value i32)
    (local $logAddr i32)
    ;; Read the memory value
    (i32.add (get_local $addr) (get_global $SP_MEM_OFFS))
    i32.load8_u
    set_local $value

    ;; Calculate the address in the memory log
    (i32.add (get_global $TEST_MEM_LOG_OFFS)
      (i32.mul (get_global $memLogLength) (i32.const 4))
    )
    tee_local $logAddr

    ;; Store address in the log
    get_local $addr
    i32.store16 offset=0

    ;; Store value in the log
    get_local $logAddr
    get_local $value
    i32.store8 offset=2

    ;; Store "read" flag
    get_local $logAddr
    i32.const 0
    i32.store8 offset=3
    
    ;; Increment log length
    (i32.add (get_global $memLogLength) (i32.const 1))
    set_global $memLogLength

    ;; Done, return the memory value
    get_local $value
  )

  ;; Default memory write operation
  ;; $addr: 16-bit memory address
  ;; $v: 8-bit value to write
  ;; $suppCont: Suppress memory contention flag
  (func $testMachineWrite (param $addr i32) (param $v i32)
    (local $logAddr i32)

    ;; Write the memory value
    (i32.add (get_local $addr) (get_global $SP_MEM_OFFS))
    get_local $v
    i32.store8

    ;; Calculate the address in the memory log
    (i32.add (get_global $TEST_MEM_LOG_OFFS)
      (i32.mul (get_global $memLogLength) (i32.const 4))
    )
    tee_local $logAddr

    ;; Store address in the log
    get_local $addr
    i32.store16 offset=0

    ;; Store value in the log
    get_local $logAddr
    get_local $v
    i32.store8 offset=2

    ;; Store "write" flag
    get_local $logAddr
    i32.const 1
    i32.store8 offset=3
    
    ;; Increment log length
    (i32.add (get_global $memLogLength) (i32.const 1))
    set_global $memLogLength
  )

  ;; ==========================================================================
  ;; Function jump table

  ;; Jump table start indices
  (global $STANDARD_JT i32 (i32.const 30))
  (global $INDEXED_JT i32 (i32.const 286))
  (global $EXTENDED_JT i32 (i32.const 542))
  (global $BIT_JT i32 (i32.const 798))
  (global $INDEXED_BIT_JT i32 (i32.const 1054))

  ;; 30: 5 machine types (6 function for each)
  ;; 256: Standard operations
  ;; 256: Indexed operations
  ;; 256: Extended operations
  ;; 256: Bit operations
  ;; 256: Indexed bit operations

  (table $dispatch 1310 anyfunc)
  (elem (i32.const 0) 
    ;; Index 0: Machine type #0
    $defaultRead
    $defaultWrite
    $NOOP
    $NOOP
    $NOOP
    $NOOP

    ;; Index 6: Machine type #1
    $defaultRead
    $defaultWrite
    $NOOP
    $NOOP
    $NOOP
    $NOOP

    ;; Index 12: Machine type #2
    $defaultRead
    $defaultWrite
    $NOOP
    $NOOP
    $NOOP
    $NOOP

    ;; Index 18: Machine type #3
    $defaultRead
    $defaultWrite
    $NOOP
    $NOOP
    $NOOP
    $NOOP

    ;; Index 18: Test Z80 CPU Machine (type #4)
    $testMachineRead
    $testMachineWrite
    $NOOP
    $NOOP
    $NOOP
    $NOOP
  )

;; Table of standard instructions
(elem (i32.const 30)
    ;; 0x00-0x07
    $NOOP     $LdQQNN   $LdBCiA   $IncQQ    $IncQ     $DecQ     $LdQN     $Rlca     
    ;; 0x08-0x0f
    $ExAf     $AddHLQQ  $LdABCi   $DecQQ    $IncQ     $DecQ     $LdQN     $Rrca     
    ;; 0x10-0x17
    $Djnz     $LdQQNN   $LdDEiA   $IncQQ    $IncQ     $DecQ     $LdQN     $Rla     
    ;; 0x18-0x1f
    $JrE      $AddHLQQ  $LdADEi   $DecQQ    $IncQ     $DecQ     $LdQN     $Rra     
    ;; 0x20-0x27
    $JrNz     $LdQQNN   $LdNNiHL  $IncQQ    $IncQ     $DecQ     $LdQN     $Daa     
    ;; 0x28-0x2f
    $JrZ      $AddHLQQ  $NOOP     $DecQQ    $IncQ     $DecQ     $LdQN     $NOOP     
    ;; 0x30-0x37
    $JrNc     $LdQQNN   $NOOP     $IncQQ    $IncQ     $DecQ     $LdQN     $NOOP     
    ;; 0x38-0x3f
    $JrC      $AddHLQQ  $NOOP     $DecQQ    $IncQ     $DecQ     $LdQN     $NOOP     
    ;; 0x40-0x47
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x48-0x4f
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x50-0x57
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x58-0x5f
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x60-0x67
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x68-0x6f
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x70-0x77
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x78-0x7f
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x80-0x87
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x88-0x8f
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x90-0x97
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x98-0x9f
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0xa0-0xa7
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0xa8-0xaf
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0xb0-0xb7
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0xb8-0xbf
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0xc0-0xc7
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0xc8-0xcf
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0xd0-0xd7
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0xd8-0xdf
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0xe0-0xe7
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0xe8-0xef
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0xf0-0xf7
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0xf8-0xff
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
  )

;; Table of indexed instructions
(elem (i32.const 286)
    ;; 0x00-0x07
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x08-0x0f
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x10-0x17
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x18-0x1f
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x20-0x27
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x28-0x2f
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x30-0x37
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x38-0x3f
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x40-0x47
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x48-0x4f
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x50-0x57
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x58-0x5f
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x60-0x67
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x68-0x6f
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x70-0x77
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x78-0x7f
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x80-0x87
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x88-0x8f
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x90-0x97
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x98-0x9f
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0xa0-0xa7
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0xa8-0xaf
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0xb0-0xb7
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0xb8-0xbf
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0xc0-0xc7
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0xc8-0xcf
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0xd0-0xd7
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0xd8-0xdf
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0xe0-0xe7
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0xe8-0xef
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0xf0-0xf7
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0xf8-0xff
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
  )

;; Table of extended instructions
(elem (i32.const 542)
    ;; 0x00-0x07
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x08-0x0f
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x10-0x17
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x18-0x1f
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x20-0x27
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x28-0x2f
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x30-0x37
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x38-0x3f
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x40-0x47
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x48-0x4f
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x50-0x57
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x58-0x5f
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x60-0x67
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x68-0x6f
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x70-0x77
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x78-0x7f
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x80-0x87
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x88-0x8f
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x90-0x97
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x98-0x9f
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0xa0-0xa7
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0xa8-0xaf
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0xb0-0xb7
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0xb8-0xbf
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0xc0-0xc7
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0xc8-0xcf
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0xd0-0xd7
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0xd8-0xdf
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0xe0-0xe7
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0xe8-0xef
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0xf0-0xf7
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0xf8-0xff
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
  )

;; Table of bit instructions
(elem (i32.const 798)
    ;; 0x00-0x07
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x08-0x0f
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x10-0x17
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x18-0x1f
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x20-0x27
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x28-0x2f
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x30-0x37
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x38-0x3f
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x40-0x47
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x48-0x4f
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x50-0x57
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x58-0x5f
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x60-0x67
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x68-0x6f
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x70-0x77
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x78-0x7f
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x80-0x87
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x88-0x8f
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x90-0x97
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x98-0x9f
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0xa0-0xa7
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0xa8-0xaf
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0xb0-0xb7
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0xb8-0xbf
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0xc0-0xc7
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0xc8-0xcf
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0xd0-0xd7
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0xd8-0xdf
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0xe0-0xe7
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0xe8-0xef
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0xf0-0xf7
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0xf8-0xff
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
  )

;; Table of indexed bit instructions
(elem (i32.const 1054)
    ;; 0x00-0x07
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x08-0x0f
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x10-0x17
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x18-0x1f
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x20-0x27
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x28-0x2f
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x30-0x37
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x38-0x3f
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x40-0x47
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x48-0x4f
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x50-0x57
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x58-0x5f
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x60-0x67
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x68-0x6f
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x70-0x77
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x78-0x7f
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x80-0x87
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x88-0x8f
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x90-0x97
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0x98-0x9f
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0xa0-0xa7
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0xa8-0xaf
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0xb0-0xb7
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0xb8-0xbf
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0xc0-0xc7
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0xc8-0xcf
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0xd0-0xd7
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0xd8-0xdf
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0xe0-0xe7
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0xe8-0xef
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0xf0-0xf7
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
    ;; 0xf8-0xff
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     
  )

  ;; Represents a no-operation function
  (func $NOOP)

  ;; ==========================================================================
  ;; Z80 CPU registers access

  ;; Gets the value of A
  (func $getA (result i32)
    get_global $REG_AREA_INDEX
    i32.load8_u offset=1
  )

  ;; Sets the value of A
  (func $setA (param $v i32) 
    get_global $REG_AREA_INDEX
    get_local $v
    i32.store8 offset=1    
  )
 
  ;; Gets the value of F
  (func $getF (result i32)
    get_global $REG_AREA_INDEX
    i32.load8_u offset=0
  )

  ;; Sets the value of F
  (func $setF (param $v i32) 
    get_global $REG_AREA_INDEX
    get_local $v
    i32.store8 offset=0
  )

  ;; Gets the value of AF
  (func $getAF (result i32)
    get_global $REG_AREA_INDEX
    i32.load16_u offset=0
  )

  ;; Gets the value of B
  (func $getB (result i32)
    get_global $REG_AREA_INDEX
    i32.load8_u offset=3
  )

  ;; Sets the value of B
  (func $setB (param $v i32) 
    get_global $REG_AREA_INDEX
    get_local $v
    i32.store8 offset=3
  )
 
  ;; Gets the value of C
  (func $getC (result i32)
    get_global $REG_AREA_INDEX
    i32.load8_u offset=2
  )

  ;; Sets the value of C
  (func $setC (param $v i32) 
    get_global $REG_AREA_INDEX
    get_local $v
    i32.store8 offset=2
  )

  ;; Gets the value of BC
  (func $getBC (result i32)
    get_global $REG_AREA_INDEX
    i32.load16_u offset=2
  )

  ;; Sets the value of BC
  (func $setBC (param $v i32)
    get_global $REG_AREA_INDEX
    get_local $v
    i32.store16 offset=2
  )

  ;; Gets the value of D
  (func $getD (result i32)
    get_global $REG_AREA_INDEX
    i32.load8_u offset=5
  )

  ;; Sets the value of D
  (func $setD (param $v i32) 
    get_global $REG_AREA_INDEX
    get_local $v
    i32.store8 offset=5
  )
 
  ;; Gets the value of E
  (func $getE (result i32)
    get_global $REG_AREA_INDEX
    i32.load8_u offset=4
  )

  ;; Sets the value of E
  (func $setE (param $v i32) 
    get_global $REG_AREA_INDEX
    get_local $v
    i32.store8 offset=4
  )

  ;; Gets the value of DE
  (func $getDE (result i32)
    get_global $REG_AREA_INDEX
    i32.load16_u offset=4
  )

  ;; Sets the value of DE
  (func $setDE (param $v i32)
    get_global $REG_AREA_INDEX
    get_local $v
    i32.store16 offset=4
  )

  ;; Gets the value of H
  (func $getH (result i32)
    get_global $REG_AREA_INDEX
    i32.load8_u offset=7
  )

  ;; Sets the value of H
  (func $setH (param $v i32) 
    get_global $REG_AREA_INDEX
    get_local $v
    i32.store8 offset=7
  )
 
  ;; Gets the value of L
  (func $getL (result i32)
    get_global $REG_AREA_INDEX
    i32.load8_u offset=6
  )

  ;; Sets the value of L
  (func $setL (param $v i32) 
    get_global $REG_AREA_INDEX
    get_local $v
    i32.store8 offset=6
  )

  ;; Gets the value of HL
  (func $getHL (result i32)
    get_global $REG_AREA_INDEX
    i32.load16_u offset=6
  )

  ;; Sets the value of HL
  (func $setHL (param $v i32)
    get_global $REG_AREA_INDEX
    get_local $v
    i32.store16 offset=6
  )

  ;; Gets the value of I
  (func $getI (result i32)
    get_global $REG_AREA_INDEX
    i32.load8_u offset=16
  )

  ;; Sets the value of I
  (func $setI (param $v i32) 
    get_global $REG_AREA_INDEX
    get_local $v
    i32.store8 offset=16
  )

  ;; Gets the value of R
  (func $getR (result i32)
    get_global $REG_AREA_INDEX
    i32.load8_u offset=17
  )

  ;; Sets the value of R
  (func $setR (param $v i32) 
    get_global $REG_AREA_INDEX
    get_local $v
    i32.store8 offset=17
  )

  ;; Gets the value of PC
  (func $getPC (result i32)
    get_global $REG_AREA_INDEX
    i32.load16_u offset=18
  )

  ;; Sets the value of PC
  (func $setPC (param $v i32)
    get_global $REG_AREA_INDEX
    get_local $v
    i32.store16 offset=18
  )

  ;; Gets the value of SP
  (func $getSP (result i32)
    get_global $REG_AREA_INDEX
    i32.load16_u offset=20
  )

  ;; Sets the value of SP
  (func $setSP (param $v i32)
    get_global $REG_AREA_INDEX
    get_local $v
    i32.store16 offset=20
  )

  ;; Gets the value of XH
  (func $getXH (result i32)
    get_global $REG_AREA_INDEX
    i32.load8_u offset=23
  )

  ;; Sets the value of XH
  (func $setXH (param $v i32) 
    get_global $REG_AREA_INDEX
    get_local $v
    i32.store8 offset=23
  )
 
  ;; Gets the value of XL
  (func $getXL (result i32)
    get_global $REG_AREA_INDEX
    i32.load8_u offset=22
  )

  ;; Sets the value of XL
  (func $setXL (param $v i32) 
    get_global $REG_AREA_INDEX
    get_local $v
    i32.store8 offset=22
  )

  ;; Gets the value of IX
  (func $getIX (result i32)
    get_global $REG_AREA_INDEX
    i32.load16_u offset=22
  )

  ;; Sets the value of IX
  (func $setIX (param $v i32)
    get_global $REG_AREA_INDEX
    get_local $v
    i32.store16 offset=22
  )

  ;; Gets the value of YH
  (func $getYH (result i32)
    get_global $REG_AREA_INDEX
    i32.load8_u offset=25
  )

  ;; Sets the value of YH
  (func $setYH (param $v i32) 
    get_global $REG_AREA_INDEX
    get_local $v
    i32.store8 offset=25
  )
 
  ;; Gets the value of YL
  (func $getYL (result i32)
    get_global $REG_AREA_INDEX
    i32.load8_u offset=24
  )

  ;; Sets the value of YL
  (func $setYL (param $v i32) 
    get_global $REG_AREA_INDEX
    get_local $v
    i32.store8 offset=24
  )

  ;; Gets the value of IY
  (func $getIY (result i32)
    get_global $REG_AREA_INDEX
    i32.load16_u offset=24
  )

  ;; Sets the value of IY
  (func $setIY (param $v i32)
    get_global $REG_AREA_INDEX
    get_local $v
    i32.store16 offset=24
  )

  ;; Gets the value of WH
  (func $getWH (result i32)
    get_global $REG_AREA_INDEX
    i32.load8_u offset=27
  )

  ;; Sets the value of WH
  (func $setWH (param $v i32) 
    get_global $REG_AREA_INDEX
    get_local $v
    i32.store8 offset=27
  )
 
  ;; Gets the value of WL
  (func $getWL (result i32)
    get_global $REG_AREA_INDEX
    i32.load8_u offset=26
  )

  ;; Sets the value of WL
  (func $setWL (param $v i32) 
    get_global $REG_AREA_INDEX
    get_local $v
    i32.store8 offset=26
  )

  ;; Gets the value of WZ
  (func $getWZ (result i32)
    get_global $REG_AREA_INDEX
    i32.load16_u offset=26
  )

  ;; Sets the value of WZ
  (func $setWZ (param $v i32)
    get_global $REG_AREA_INDEX
    get_local $v
    i32.store16 offset=26
  )

  ;; Gets the specified 8-bit register
  ;; $r: Register index from 0-7: B, C, D, E, H, L, F, A
  ;; returns: 8-bit register value
  (func $getReg8 (param $r i32) (result i32)
    get_global $REG_AREA_INDEX
    get_global $REG8_TAB_OFFS
    (i32.and (get_local $r) (i32.const 0x07))
    i32.add
    i32.load8_u 
    i32.add
    i32.load8_u
  )

  ;; Sets the specified 8-bit register
  ;; $r: Register index from 0-7: B, C, D, E, H, L, F, A
  (func $setReg8 (param $r i32) (param $v i32)
    get_global $REG_AREA_INDEX
    get_global $REG8_TAB_OFFS
    (i32.and (get_local $r) (i32.const 0x07))
    i32.add
    i32.load8_u 
    i32.add
    get_local $v
    i32.store8
  )

  ;; Gets the specified 16-bit register
  ;; $r: Register index from 0-3: BC, DE, HL, SP
  ;; returns: 8-bit register value
  (func $getReg16 (param $r i32) (result i32)
    get_global $REG_AREA_INDEX
    get_global $REG16_TAB_OFFS
    (i32.and (get_local $r) (i32.const 0x03))
    i32.add
    i32.load8_u 
    i32.add
    i32.load16_u
  )

  ;; Sets the specified 16-bit register
  ;; $r: Register index from 0-3: BC, DE, HL, SP
  (func $setReg16 (param $r i32) (param $v i32)
    get_global $REG_AREA_INDEX
    get_global $REG16_TAB_OFFS
    (i32.and (get_local $r) (i32.const 0x03))
    i32.add
    i32.load8_u 
    i32.add
    get_local $v
    i32.store16
  )

  ;; Sets the current index mode
  ;; $im: Index mode: 1: IX; other: IY
  (func $setIndexMode (param $im i32)
    get_local $im
    set_global $indexMode
  )

  ;; Gets the value of the index register according to the current indexing mode
  (func $getIndexReg (result i32)
    get_global $indexMode
    i32.const 1
    i32.eq
    if (result i32)
      get_global $REG_AREA_INDEX
      i32.load16_u offset=22
    else
      get_global $REG_AREA_INDEX
      i32.load16_u offset=24
    end
  )

  ;; Sets the value of the index register according to the current indexing mode
  ;; $v: 16-bit index register value
  (func $setIndexReg (param $v i32)
    get_global $indexMode
    i32.const 1
    i32.eq
    if
      get_global $REG_AREA_INDEX
      get_local $v
      i32.store16 offset=22
    else
      get_global $REG_AREA_INDEX
      get_local $v
      i32.store16 offset=24
    end
  )

  ;; ==========================================================================
  ;; Z80 clock management

  ;; Gets the current frame counter
  (func $getFrameCount (result i32)
    get_global $frameCount
  )

  ;; Get the current frame tact
  (func $getFrameTacts (result i32)
    get_global $frameTacts
  )

  ;; Increments the current frame tact with the specified value
  ;; $inc: Increment
  (func $incTacts (param $inc i32)
    get_global $frameTacts
    get_local $inc
    i32.add
    set_global $frameTacts
    get_global $frameTacts
    get_global $tactsInFrame
    i32.ge_u
    if 
      get_global $frameTacts
      get_global $tactsInFrame
      i32.sub
      set_global $frameTacts
      get_global $frameCount
      i32.const 1
      i32.add
      set_global $frameCount
    end
  )


  ;; ==========================================================================
  ;; Z80 CPU life cycle methods

  ;; Turns on the CPU
  (func $turnOnCpu
    get_global $REG_AREA_INDEX
    i32.const 0xffff
    i32.store16 offset=0
    get_global $REG_AREA_INDEX
    i32.const 0xffff
    i32.store16 offset=2
    get_global $REG_AREA_INDEX
    i32.const 0xffff
    i32.store16 offset=4
    get_global $REG_AREA_INDEX
    i32.const 0xffff
    i32.store16 offset=6
    get_global $REG_AREA_INDEX
    i32.const 0xffff
    i32.store16 offset=8
    get_global $REG_AREA_INDEX
    i32.const 0xffff
    i32.store16 offset=10
    get_global $REG_AREA_INDEX
    i32.const 0xffff
    i32.store16 offset=12
    get_global $REG_AREA_INDEX
    i32.const 0xffff
    i32.store16 offset=14
    get_global $REG_AREA_INDEX
    i32.const 0xffff
    i32.store16 offset=16
    get_global $REG_AREA_INDEX
    i32.const 0xffff
    i32.store16 offset=18
    get_global $REG_AREA_INDEX
    i32.const 0xffff
    i32.store16 offset=20
    get_global $REG_AREA_INDEX
    i32.const 0xffff
    i32.store16 offset=22
    get_global $REG_AREA_INDEX
    i32.const 0xffff
    i32.store16 offset=24
    get_global $REG_AREA_INDEX
    i32.const 0xffff
    i32.store16 offset=26
    i32.const 0x0000
    set_global $frameCount
    i32.const 0x0000
    set_global $frameTacts
    i32.const 0x0000
    set_global $stateFlags
    i32.const 0x0000
    set_global $useGateArrayContention
    i32.const 0x0000
    set_global $iff1
    i32.const 0x0000
    set_global $iff2
    i32.const 0x0000
    set_global $interruptMode
    i32.const 0x0000
    set_global $isInterruptBlocked
    i32.const 0x0000
    set_global $isInOpExecution
    i32.const 0x0000
    set_global $prefixMode
    i32.const 0x0000
    set_global $indexMode
    i32.const 0x0000
    set_global $maskableInterruptModeEntered
    i32.const 0x0000
    set_global $opCode
  )

  ;; Sets the number of tacts in a frame
  ;; $tact: #of tacts in a frame
  (func $setTactsInFrame (param $tact i32)
    get_local $tact
    set_global $tactsInFrame
  )

  ;; Sets the CPU state flags to the specified value
  ;; $s: CPU state flags
  (func $setCpuSignals (param $s i32)
    get_local $s
    set_global $stateFlags
  )

  ;; Sets the isInterruptBlocked flag
  (func $setInterruptBlocked (param $f i32)
    get_local $f
    set_global $isInterruptBlocked
  )

  ;; Sets the isInterruptMode value
  (func $setInterruptMode (param $f i32)
    get_local $f
    set_global $interruptMode
  )

  ;; Sets the iff1 flag
  (func $setIff1 (param $f i32)
    get_local $f
    set_global $iff1
  )

  ;; Enables/disables extended instruction set
  ;; $f: True, enable; false, disable
  (func $enableExtendedInstructions (param $f i32)
    get_local $f
    set_global $allowExtendedSet
  )

  ;; ==========================================================================
  ;; Z80 Memory access

  (func $resetMemory
    (local $i i32)
    i32.const 0
    set_local $i
    (loop $loop
      get_local $i   ;; addr
      i32.const 0x00 ;; v
      call $writeMemory
      (i32.add (get_local $i) (i32.const 1))
      tee_local $i
      i32.const 0xffff
      i32.le_u
      br_if $loop
    )
  )

  ;; Default memory read operation
  ;; $addr: 16-bit memory address
  ;; returns: Memory contents
  (func $defaultRead (param $addr i32) (result i32)
    (i32.add (get_local $addr) (get_global $SP_MEM_OFFS))
    i32.load8_u
  )

  ;; Default memory write operation
  ;; $addr: 16-bit memory address
  ;; $v: 8-bit value to write
  (func $defaultWrite (param $addr i32) (param $v i32)
    (i32.add (get_local $addr) (get_global $SP_MEM_OFFS))
    get_local $v
    i32.store8
  )

  ;; Reads the specified memory location of the current machine type
  ;; $addr: 16-bit memory address
  ;; returns: Memory contents
  (func $readMemory (param $addr i32) (result i32)
    get_local $addr
    (i32.mul (get_global $MACHINE_TYPE) (get_global $MACHINE_FUNC_COUNT))
    call_indirect (type $MemReadFunc)
    i32.const 3
    call $incTacts
  )

  ;; Reads the specified memory location of the current machine type
  ;; but with no extra delay applies
  ;; $addr: 16-bit memory address
  (func $memoryDelay (param $addr i32)
    get_local $addr
    (i32.mul (get_global $MACHINE_TYPE) (get_global $MACHINE_FUNC_COUNT))
    call_indirect (type $MemReadFunc)
    drop
  )

  ;; Writes the specified memory location of the current machine type
  ;; $addr: 16-bit memory address
  ;; $v: 8-bit value to write
  (func $writeMemory (param $addr i32) (param $v i32)
    get_local $addr
    get_local $v
    (i32.add 
      (i32.mul (get_global $MACHINE_TYPE) (get_global $MACHINE_FUNC_COUNT))
      (i32.const 1)
    )
    call_indirect (type $MemWriteFunc)
    i32.const 3
    call $incTacts
  )

  ;; ==========================================================================
  ;; Execution cycle methods

  ;; Executes the CPU's processing cycle
  (func $executeCpuCycle
    ;; Is there any CPU signal raised?
    (i32.ne (get_global $stateFlags) (i32.const 0))
    if 
      ;; Yes, process them
      call $processCpuSignals
      ;; Processed any signal?
      i32.const 0
      i32.ne
      if 
        ;; Yes, nothing to do in this cycle
        return
      end
    end

    ;; It's time to process the next op code
    ;; Read it from PC and store in opCode
    call $readCodeMemory
    set_global $opCode

    ;; Execute a memory refresh
    call $refreshMemory

    ;; Branch according to prefix modes
    ;; Test for no prefix
    get_global $prefixMode
    i32.const 0
    i32.eq
    if
      ;; No prefix, test opcode prefixes
      ;; Test for extended operations
      get_global $opCode
      i32.const 0xed
      i32.eq
      if
        ;; prefixMode := extended
        i32.const 1
        set_global $prefixMode
        ;; isInOpExecution := true
        i32.const 1
        set_global $isInOpExecution
        ;; isInterruptBlocked := true;
        i32.const 1
        set_global $isInterruptBlocked
        return
      end

      ;; Test for bit operations
      get_global $opCode
      i32.const 0xcb
      i32.eq
      if
        ;; prefixMode := bit
        i32.const 2
        set_global $prefixMode
        ;; isInOpExecution := true
        i32.const 1
        set_global $isInOpExecution
        ;; isInterruptBlocked := true;
        i32.const 1
        set_global $isInterruptBlocked
        return
      end

      ;; Test for IY prefix
      get_global $opCode
      i32.const 0xfd
      i32.eq
      if
        ;; indexMode := IY
        i32.const 2
        set_global $indexMode
        ;; isInOpExecution := true
        i32.const 1
        set_global $isInOpExecution
        ;; isInterruptBlocked := true;
        i32.const 1
        set_global $isInterruptBlocked
        return
      end

      ;; Test for IX prefix
      get_global $opCode
      i32.const 0xdd
      i32.eq
      if
        ;; indexMode := IX
        i32.const 1
        set_global $indexMode
        ;; isInOpExecution := true
        i32.const 1
        set_global $isInOpExecution
        ;; isInterruptBlocked := true;
        i32.const 1
        set_global $isInterruptBlocked
        return
      end

      ;; isInterruptBlocked := false;
      i32.const 0
      set_global $isInterruptBlocked
      call $processStandardOrIndexedOperations
      ;; indexMode := 0
      i32.const 0
      set_global $indexMode
      ;; prefixMode := 0
      i32.const 0
      set_global $prefixMode
      ;; isInOpExecution := 0
      i32.const 0
      set_global $isInOpExecution
      return
    end

    ;; Branch according to prefix modes
    ;; Test for no extended mode
    get_global $prefixMode
    i32.const 1
    i32.eq
    if
      ;; isInterruptBlocked := false;
      i32.const 0
      set_global $isInterruptBlocked
      call $processExtendedOperations
      ;; indexMode := 0
      i32.const 0
      set_global $indexMode
      ;; prefixMode := 0
      i32.const 0
      set_global $prefixMode
      ;; isInOpExecution := 0
      i32.const 0
      set_global $isInOpExecution
      return
    end

    ;; Branch according to prefix modes
    ;; Test for bit mode
    get_global $prefixMode
    i32.const 2
    i32.eq
    if
      ;; isInterruptBlocked := false;
      i32.const 0
      set_global $isInterruptBlocked
      call $processBitOperations
      ;; indexMode := 0
      i32.const 0
      set_global $indexMode
      ;; prefixMode := 0
      i32.const 0
      set_global $prefixMode
      ;; isInOpExecution := 0
      i32.const 0
      set_global $isInOpExecution
      return
    end
  )

  ;; Process the CPU signals
  (func $processCpuSignals (result i32)
    ;; Test for INT
    (i32.and (get_global $stateFlags) (get_global $Z80_STATE_INT))
    if
      ;; Test for unblocked interrupt
      (i32.eq (get_global $isInterruptBlocked) (i32.const 0))
      if
        ;; Test the iff1 flip-flop
        (i32.ne (get_global $iff1) (i32.const 0))
        if
          call $executeInterrupt
          ;; Done
          i32.const 1
          return
        end
      end
    end

    ;; Test for NMI
    (i32.and (get_global $stateFlags) (get_global $Z80_STATE_NMI))
    if
      call $executeNMI
      ;; Done
      i32.const 1
      return
    end

    ;; Test for HLT
    (i32.and (get_global $stateFlags) (get_global $Z80_STATE_HLT))
    if
      ;; Wait for 3 tacts
      i32.const 3
      call $incTacts
      call $refreshMemory
      ;; Done
      i32.const 1
      return
    end

    ;; Test for RST
    (i32.and (get_global $stateFlags) (get_global $Z80_STATE_RST))
    if
      call $resetCpu
      ;; Done
      i32.const 1
      return
    end

    ;; No active signals to process
    i32.const 0
  )

  ;; Refreshes the memory
  (func $refreshMemory
    (local $r i32)
    ;; r := (r + 1) & 0x7f | (r & 0x80)
    call $getR
    tee_local $r
    i32.const 1
    i32.add
    i32.const 0x7f
    i32.and
    get_local $r
    i32.const 0x80
    i32.and
    i32.or
    call $setR

    ;; Add +1 tact
    i32.const 1
    call $incTacts
  )

  ;; Resets the CPU
  (func $resetCpu
    i32.const 0
    set_global $iff1
    i32.const 0
    set_global $iff2
    i32.const 0
    set_global $interruptMode
    i32.const 0
    set_global $isInterruptBlocked
    i32.const 0
    set_global $stateFlags
    i32.const 0
    set_global $prefixMode
    i32.const 0
    set_global $indexMode
    i32.const 0
    call $setPC
    i32.const 0
    call $setI
    i32.const 0
    call $setR
    i32.const 0x0000
    set_global $isInOpExecution
    i32.const 0x0000
    set_global $frameCount
    i32.const 0x0000
    set_global $frameTacts
  )

  ;; Executes the NMI request
  (func $executeNMI
     ;; Test for HLT
    (i32.and (get_global $stateFlags) (get_global $Z80_STATE_HLT))
    if
      call $incPC
      (i32.and (get_global $stateFlags) (get_global $Z80_STATE_HLT_INV))
      set_global $stateFlags
    end
    ;; iff2 := iff1
    get_global $iff1
    set_global $iff2
    ;; iff1 := false
    i32.const 0
    set_global $iff1

    ;; Push PC
    call $getPC
    call $pushValue

    ;; Set NMI routione address
    i32.const 0x0066
    call $setPC
  )

  ;; Executes the NMI request
  (func $executeInterrupt
    (local $addr i32)
    ;; Test for HLT
    (i32.and (get_global $stateFlags) (get_global $Z80_STATE_HLT))
    if
      call $incPC
      (i32.and (get_global $stateFlags) (get_global $Z80_STATE_HLT_INV))
      set_global $stateFlags
    end

    ;; iif1 := false
    i32.const 0
    set_global $iff1
    ;; iff2 := false
    i32.const 0
    set_global $iff2
    ;; Push PC
    call $getPC
    call $pushValue
    ;; Test interrupt mode 0
    get_global $interruptMode
    i32.const 2
    i32.eq
    if
      ;; Interrupt mode 2
      i32.const 2
      call $incTacts
      ;; Let's assume, the device retrieves 0xff (the least significant bit is ignored)
      ;; addr = i << 8 | 0xfe;
      call $getI
      i32.const 8
      i32.shl
      i32.const 0xfe
      i32.or
      tee_local $addr
      i32.const 5
      call $incTacts
      call $readMemory ;;  l
      i32.const 3
      call $incTacts
      get_local $addr
      i32.const 1
      i32.add
      call $readMemory ;; h, l
      i32.const 3
      call $incTacts
      i32.const 8
      i32.shl         ;; h << 8, l
      i32.or          ;; h << 8 | l
      call $setWZ
      i32.const 6
      call $incTacts
    else
      ;; Interrupt mode 0 or 1
      i32.const 0x0038
      call $setWZ
      i32.const 5
      call $incTacts
    end

    ;; pc := wz
    call $getWZ
    call $setPC
  )

  ;; Processes standard or indexed operations
  (func $processStandardOrIndexedOperations
    get_global $indexMode
    i32.const 0
    i32.eq
    if (result i32)
      get_global $STANDARD_JT
    else
      get_global $INDEXED_JT
    end
    get_global $opCode
    i32.add
    call_indirect (type $OpFunc)
  )

  ;; Processes bit operations
  (func $processBitOperations)

  ;; Processes extended operations
  (func $processExtendedOperations)

  ;; ==========================================================================
  ;; Instruction helpers

  ;; Increments the value of PC
  (func $incPC
    call $getPC
    i32.const 1
    i32.add
    call $setPC
  )

  ;; Decrements the value of SP
  (func $decSP
    call $getSP
    i32.const 1
    i32.sub
    call $setSP
  )

  ;; Pushes the value to the stack
  (func $pushValue (param $v i32)
    call $decSP
    i32.const 1
    call $incTacts
    call $getSP
    get_local $v
    i32.const 8
    i32.shr_u
    call $writeMemory
    i32.const 3
    call $incTacts
    call $decSP
    call $getSP
    get_local $v
    call $writeMemory
    i32.const 3
    call $incTacts
  )

  ;; Reads the memory location at PC
  (func $readCodeMemory (result i32)
    (local $result i32)
    call $getPC
    call $readMemory
    call $incPC
  )

  ;; Add two 16-bit values followinf the add hl,NN logic
  (func $AluAddHl (param $regHL i32) (param $other i32) (result i32)
    (local $f i32)
    (local $res i32)

    ;; Keep S, Z, and PV from F
    call $getF
    i32.const 0xc4 ;; Mask for preserving S, Z, PV
    i32.and
    set_local $f

    ;; Calc the value of H flag
    (i32.add
      (i32.and (get_local $regHL) (i32.const 0x0fff))
      (i32.and (get_local $other) (i32.const 0x0fff))
    )
    i32.const 0x08
    i32.shr_u
    i32.const 0x10 ;; Mask for H flag
    i32.and        ;; Now, we have H flag on top

    ;; Combine H flag with others
    get_local $f
    i32.or
    set_local $f

    ;; Calculate result
    get_local $regHL
    get_local $other
    i32.add
    tee_local $res

    ;; Test for C flag
    i32.const 0x1_0000
    i32.ge_u
    if
      ;; Set C
      get_local $f
      i32.const 0x01
      i32.or
      set_local $f
    end

    ;; Calculate R3 and R5 flags
    get_local $res
    i32.const 8
    i32.shr_u
    i32.const 0x28 ;; Mask for R3, R5
    i32.and

    ;; Combine them with F
    get_local $f
    i32.or
    call $setF

    ;; Fetch the result
    get_local $res
  )

  ;; Carries out a relative jump
  ;; $e: 8-bit distance value
  (func $relativeJump (param $e i32)
    ;; Adjust tacts
    get_global $useGateArrayContention
    i32.const 0
    i32.ne
    if
      i32.const 5
      call $incTacts
    else
      call $getPC
      call $memoryDelay
      i32.const 1
      call $incTacts
      call $getPC
      call $memoryDelay
      i32.const 1
      call $incTacts
      call $getPC
      call $memoryDelay
      i32.const 1
      call $incTacts
      call $getPC
      call $memoryDelay
      i32.const 1
      call $incTacts
      call $getPC
      call $memoryDelay
      i32.const 1
      call $incTacts
    end

    ;; Convert the 8-bit distance to i32
    get_local $e
    i32.const 24
    i32.shl
    i32.const 24
    i32.shr_s
    
    ;; Calculate the destination address
    call $getPC
    i32.add
    call $setPC

    ;; Copy to WZ
    call $getPC
    call $setWZ
  )

  ;; ==========================================================================
  ;; Standard operations

  ;; ld QQ,NN (0x01, 0x11, 0x21, 0x31)
  ;; QQ: BC, DE, HL, SP
  (func $LdQQNN
    ;; Get 16-bit reg index
    get_global $opCode
    i32.const 0x30
    i32.and
    i32.const 4
    i32.shr_u

    ;; Get value to put into the reg
    call $readCodeMemory
    call $readCodeMemory
    i32.const 8
    i32.shl
    i32.add

    ;; Store value
    call $setReg16
  )

  ;; ld (bc),a (0x02)
  (func $LdBCiA
    call $getBC
    call $getA
    call $writeMemory
  )

  ;; inc QQ (0x03, 0x13, 0x23, 0x33)
  ;; QQ: BC, DE, HL, SP
  (func $IncQQ
    (local $qq i32)
    ;; Get 16-bit reg index
    get_global $opCode
    i32.const 0x30
    i32.and
    i32.const 4
    i32.shr_u
    tee_local $qq
    get_local $qq

    ;; Increment reg value
    call $getReg16
    i32.const 1
    i32.add

    ;; Store value
    call $setReg16

    ;; Adjust clock
    i32.const 2
    call $incTacts
  )

  ;; inc Q (0x04, 0x0c, 0x14, 0x1c, 0x24, 0x2c, 0x34, 0x3c)
  (func $IncQ
    (local $q i32)
    (local $v i32)

    ;; Get 8-bit reg index
    get_global $opCode
    i32.const 0x38
    i32.and
    i32.const 3
    i32.shr_u
    tee_local $q
    get_local $q

    ;; Get reg value for later use
    call $getReg8
    tee_local $v

    ;; Increment register value
    i32.const 1
    i32.add
    call $setReg8

    ;; Adjust flags
    get_global $INC_FLAGS
    get_local $v
    i32.add
    i32.load8_u
    call $getF
    i32.const 0x01 ;; C flag mask
    i32.and
    i32.or
    call $setF
  )

  ;; dec Q (0x05, 0x0d, 0x15, 0x1d, 0x25, 0x2d, 0x35, 0x3d)
  (func $DecQ
    (local $q i32)
    (local $v i32)

    ;; Get 8-bit reg index
    get_global $opCode
    i32.const 0x38
    i32.and
    i32.const 3
    i32.shr_u
    tee_local $q
    get_local $q

    ;; Get reg value for later use
    call $getReg8
    tee_local $v

    ;; Decrement register value
    i32.const 1
    i32.sub
    call $setReg8

    ;; Adjust flags
    get_global $DEC_FLAGS
    get_local $v
    i32.add
    i32.load8_u
    call $getF
    i32.const 0x01 ;; C flag mask
    i32.and
    i32.or
    call $setF
  )

  ;; dec Q (0x06, 0x0e, 0x16, 0x1e, 0x26, 0x2e, 0x36, 0x3e)
  (func $LdQN
    (local $q i32)

    ;; Get 8-bit reg index
    get_global $opCode
    i32.const 0x38
    i32.and
    i32.const 3
    i32.shr_u
    tee_local $q

    ;; Fetch data and store it
    call $readCodeMemory
    call $setReg8
  )

  ;; rlca (0x07)
  (func $Rlca
    (local $res i32)
    (local $newC i32)
    call $getA
    i32.const 1
    i32.shl
    tee_local $res
    i32.const 0x100
    i32.ge_u
    if (result i32)
      i32.const 0x01
    else
      i32.const 0x00
    end
    tee_local $newC
    get_local $res
    i32.or
    call $setA
    call $getF
    i32.const 0xc4 ;; S, Z, PV flags mask
    i32.and
    get_local $newC
    i32.or
    call $setF
  )

  ;; ex af,af'
  (func $ExAf
    (local $tmp i32)
    call $getAF
    set_local $tmp
    get_global $REG_AREA_INDEX
    i32.load16_u offset=8
    call $setA
    get_global $REG_AREA_INDEX
    get_local $tmp
    i32.store16 offset=8
  )

  ;; add hl,QQ (0x09, 0x19, 0x29, 0x39)
  ;; QQ: BC, DE, HL, SP
  (func $AddHLQQ
    (local $qq i32)
    ;; Get 16-bit reg index
    get_global $opCode
    i32.const 0x30
    i32.and
    i32.const 4
    i32.shr_u
    set_local $qq

    ;; Calculate WZ
    call $getHL
    i32.const 1
    i32.add
    call $setWZ

    ;; Calc the new HL value
    call $getHL
    get_local $qq
    call $getReg16
    call $AluAddHl
    call $setHL

    ;; Adjust tacts
    i32.const 7
    call $incTacts
  )

  ;; ld a,(bc) (0x0a)
  (func $LdABCi
    ;; Calculate WZ
    call $getBC
    i32.const 1
    i32.add
    call $setWZ

    ;; Read A from (BC)
    call $getBC
    call $readMemory
    call $setA
  )

  ;; dec QQ (0x0b, 0x1b, 0x2b, 0x3b)
  ;; QQ: BC, DE, HL, SP
  (func $DecQQ
    (local $qq i32)
    ;; Get 16-bit reg index
    get_global $opCode
    i32.const 0x30
    i32.and
    i32.const 4
    i32.shr_u
    tee_local $qq
    get_local $qq

    ;; Decrement reg value
    call $getReg16
    i32.const 1
    i32.sub

    ;; Store value
    call $setReg16

    ;; Adjust clock
    i32.const 2
    call $incTacts
  )

  ;; rrca (0x0f)
  (func $Rrca
    (local $newC i32)
    ;; Calc new C flag
    call $getA
    i32.const 1
    i32.and
    set_local $newC

    ;; Shift value
    call $getA
    i32.const 1
    i32.shr_u

    ;; Combine with C flag
    get_local $newC
    i32.const 7
    i32.shl
    i32.or
    call $setA

    ;; Calc the new F
    call $getF
    i32.const 0xC4 ;; Keep S, Z, PV
    i32.and
    get_local $newC
    i32.or
    call $setF
  )

  ;; djnz (0x10)
  (func $Djnz
    (local $e i32)
    i32.const 1
    call $incTacts
    call $readCodeMemory
    set_local $e

    ;; Decrement B
    call $getB
    i32.const 1
    i32.sub
    call $setB

    ;; Reached 0?
    call $getB
    i32.const 0
    i32.eq
    if
      return
    end

    ;; Jump
    get_local $e
    call $relativeJump
  )

  ;; ld (de),a (0x12)
  (func $LdDEiA
    call $getDE
    call $getA
    call $writeMemory
  )

  ;; rla (0x17)
  (func $Rla
    (local $res i32)
    (local $newC i32)
    ;; Shift left
    call $getA
    i32.const 1
    i32.shl
    tee_local $res

    ;; Calculate new C flag
    i32.const 8
    i32.shr_u
    i32.const 0x01 ;; C Flag mask
    i32.and
    set_local $newC

    ;; Adjust with current C flag
    call $getF
    i32.const 0x01 ;; C Flag mask
    i32.and
    get_local $res
    i32.or
    call $setA

    ;; Calculate new C Flag
    call $getF
    i32.const 0xc4 ;; Keep S, Z, PV
    i32.and
    get_local $newC
    i32.or
    call $setF
  )

  ;; jr NN (0x18)
  (func $JrE
    ;; Calculate new address
    call $readCodeMemory
    i32.const 24
    i32.shl
    i32.const 24
    i32.shr_s
    call $getPC
    i32.add
    call $setPC

    ;; Set WZ
    call $getPC
    call $setWZ

    ;; Adjust tacts
    i32.const 5
    call $incTacts
  )

  ;; ld a,(de) (0x1a)
  (func $LdADEi
    ;; Calculate WZ
    call $getDE
    i32.const 1
    i32.add
    call $setWZ

    ;; Read A from (DE)
    call $getDE
    call $readMemory
    call $setA
  )

  ;; rra (0x1f)
  (func $Rra
    (local $newC i32)

    ;; Calculate the new C flag
    call $getA
    i32.const 1
    i32.and
    set_local $newC

    ;; Shift right
    call $getA
    i32.const 1
    i32.shr_u

    ;; Adjust with current C flag
    call $getF
    i32.const 0x01 ;; C Flag mask
    i32.and
    i32.const 7
    i32.shl
    i32.or
    call $setA

    ;; Calculate new C Flag
    call $getF
    i32.const 0xc4 ;; Keep S, Z, PV
    i32.and
    get_local $newC
    i32.or
    call $setF
  )

  ;; jr nz,NN (0x20)
  (func $JrNz
    (local $e i32)
    call $readCodeMemory
    set_local $e

    ;; Decrement B
    call $getF
    i32.const 0x40 ;; Mask for Z flag
    i32.and
    i32.const 0
    
    ;; Z Flag set?
    i32.ne
    if
      ;; NZ condition is false, return
      return
    end

    ;; Jump
    get_local $e
    call $relativeJump
  )

  ;; ld (NN),hl
  (func $LdNNiHL
    (local $addr i32)
    ;; Obtain the address to store HL
    call $readCodeMemory
    call $readCodeMemory
    i32.const 8
    i32.shl
    i32.or
    tee_local $addr

    ;; Set WZ to addr + 1
    i32.const 1
    i32.add
    call $setWZ

    ;; Store HL
    get_local $addr
    call $getL
    call $writeMemory
    call $getWZ
    call $getH
    call $writeMemory
  )

  ;; daa (0x27)
  (func $Daa
    (local $a i32)
    (local $lNibble i32)
    (local $hNibble i32)
    (local $diff i32)
    (local $cAfter i32)
    (local $hFlag i32)
    (local $nFlag i32)
    (local $hAfter i32)
    (local $pvAfter i32)
    
    ;; Get A and store nibbles
    call $getA
    tee_local $a
    i32.const 4
    i32.shr_u
    set_local $hNibble
    get_local $a
    i32.const 0x0f
    i32.and
    set_local $lNibble

    ;; Calculate H flag
    call $getF
    i32.const 0x10 ;; Mask for H flag
    i32.and
    set_local $hFlag

    ;; Calculate N flag
    call $getF
    i32.const 0x02 ;; Mask for N flag
    i32.and
    set_local $nFlag

    ;; Set default calculation values
    i32.const 0x00
    set_local $diff
    i32.const 0x00
    set_local $cAfter

    ;; Calculate the diff value
    call $getF
    i32.const 0x01 ;; C flag mask
    i32.and
    i32.const 0
    i32.eq
    if
      ;; C flag is 0
      ;; Test if hNibble is 0..9 and lNibble is 0..9
      (i32.and 
        (i32.le_u (get_local $hNibble) (i32.const 9))
        (i32.le_u (get_local $lNibble) (i32.const 9))
      )
      if
        i32.const 0x06
        i32.const 0x00
        get_local $hFlag
        select
        set_local $diff
      else
        ;; Test if hNibble is 0..8 and lNibble is a..f
        (i32.le_u (get_local $hNibble) (i32.const 8))
        (i32.ge_u (get_local $lNibble) (i32.const 0x0a))
        (i32.le_u (get_local $lNibble) (i32.const 0x0f))
        i32.and
        i32.and
        if
          i32.const 6
          set_local $diff
        else
          ;; Test if hNibble is a..f and lNibble is 0..9 and H flag not set
          (i32.ge_u (get_local $hNibble) (i32.const 0x0a))
          (i32.le_u (get_local $hNibble) (i32.const 0x0f))
          (i32.le_u (get_local $lNibble) (i32.const 0x09))
          (i32.eq (get_local $hFlag) (i32.const 0x00))
          i32.and
          i32.and
          i32.and
          if
            i32.const 0x60
            set_local $diff
            i32.const 1
            set_local $cAfter
          else
            ;; Test if hNibble is 9..f and lNibble is a..f
            (i32.ge_u (get_local $hNibble) (i32.const 0x09))
            (i32.le_u (get_local $hNibble) (i32.const 0x0f))
            (i32.ge_u (get_local $lNibble) (i32.const 0x0a))
            (i32.le_u (get_local $lNibble) (i32.const 0x0f))
            i32.and
            i32.and
            i32.and
            if
              i32.const 0x66
              set_local $diff
              i32.const 1
              set_local $cAfter
            else
              ;; Test if hNibble is a..f and lNibble is 0..9
              (i32.ge_u (get_local $hNibble) (i32.const 0x0a))
              (i32.le_u (get_local $hNibble) (i32.const 0x0f))
              (i32.le_u (get_local $lNibble) (i32.const 0x09))
              i32.and
              i32.and
              if
                ;; Test if H flag is set
                get_local $hFlag
                i32.const 0
                i32.ne
                if
                  i32.const 0x66
                  set_local $diff
                end
                i32.const 1
                set_local $cAfter
              end
            end
          end
        end
      end
    else
      ;; C flag is 1
      i32.const 1
      set_local $cAfter

      ;; Test if lNibble is 0..9 
        (i32.le_u (get_local $lNibble) (i32.const 0x09))
      if
        i32.const 0x66
        i32.const 0x60
        get_local $hFlag
        select
        set_local $diff
      else
        ;; Test if lNibble is a..f
        (i32.ge_u (get_local $lNibble) (i32.const 0x0a))
        (i32.le_u (get_local $lNibble) (i32.const 0x0f))
        i32.and
        if
          i32.const 0x66
          set_local $diff
        end
      end
    end

    ;; Calculate the new value of H flag
    i32.const 0
    set_local $hAfter

    ;; Test if lNibble is a..f and N is reset
    (i32.ge_u (get_local $lNibble) (i32.const 0x0a))
    (i32.le_u (get_local $lNibble) (i32.const 0x0f))
    get_local $nFlag
    i32.const 1
    i32.shr_u   ;; Conver N to 0 or 1
    i32.const 1
    i32.xor
    i32.and
    i32.and
    if
      i32.const 0x10
      set_local $hAfter
    else
      ;; Test if lNibble is 0..5 and N is set and H is set
      (i32.le_u (get_local $lNibble) (i32.const 0x05))
      get_local $nFlag
      i32.const 1
      i32.shr_u   ;; Conver N to 0 or 1
      get_local $hFlag
      i32.const 4
      i32.shr_u   ;; Conver H to 0 or 1
      i32.and
      i32.and
      if
        i32.const 0x10
        set_local $hAfter
      end
    end

    ;; Calculate the new value of A
    get_local $a
    get_local $diff
    i32.sub
    call $getA
    get_local $diff
    i32.add
    get_local $nFlag
    select
    tee_local $a
    call $setA

    ;; Calculate parity
    i32.const 0x04 ;; PV flag mask
    set_local $pvAfter
    get_local $a
    i32.const 0xff00
    i32.or
    set_local $a
    loop $parity
      ;; Test exit criterium
      get_local $a
      i32.const 0x100
      i32.and
      if
        get_local $a
        i32.const 0x01
        i32.and
        if
          get_local $pvAfter
          i32.const 0x04
          i32.xor
          set_local $pvAfter
        end
        get_local $a
        i32.const 1
        i32.shr_u
        set_local $a
        br $parity
      end
    end

    ;; Calculate F value
    ;; Z flag
    i32.const 0x00
    i32.const 0x40
    call $getA
    tee_local $a
    select   ;; Z is on top
    ;; S, R3, R5 flag
    get_local $a
    i32.const 0xA8 ;; Mask for S, R3, R5 
    i32.and  ;; Z, S|R3|R5
    i32.or   ;; Z|S|R3|R5
    get_local $pvAfter
    i32.or
    get_local $nFlag
    i32.or
    get_local $hAfter
    i32.or
    get_local $cAfter
    i32.or

    ;; Done
    call $setF
  )

  ;; jr z,NN (0x28)
  (func $JrZ
    (local $e i32)
    call $readCodeMemory
    set_local $e

    ;; Decrement B
    call $getF
    i32.const 0x40 ;; Mask for Z flag
    i32.and
    i32.const 0
    
    ;; Z Flag set?
    i32.eq
    if
      ;; Z condition is false, return
      return
    end

    ;; Jump
    get_local $e
    call $relativeJump
  )

  ;; jr nc,NN (0x30)
  (func $JrNc
    (local $e i32)
    call $readCodeMemory
    set_local $e

    ;; Decrement B
    call $getF
    i32.const 0x01 ;; Mask for C flag
    i32.and
    i32.const 0
    
    ;; C Flag set?
    i32.ne
    if
      ;; NC condition is false, return
      return
    end

    ;; Jump
    get_local $e
    call $relativeJump
  )

  ;; jr c,NN (0x38)
  (func $JrC
    (local $e i32)
    call $readCodeMemory
    set_local $e

    ;; Decrement B
    call $getF
    i32.const 0x01 ;; Mask for C flag
    i32.and
    i32.const 0
    
    ;; C Flag set?
    i32.eq
    if
      ;; C condition is false, return
      return
    end

    ;; Jump
    get_local $e
    call $relativeJump
  )
)


