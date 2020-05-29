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
  (export "setAF" (func $setAF))
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
  (type $PortReadFunc (func (param $addr i32) (result i32)))
  (type $PortWriteFunc (func (param $addr i32) (param $v i32)))
  (type $TbBlueWriteFunc (func (param $addr i32)))
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

  ;; 8-bit ALU logical operation flags table
  (global $LOG_FLAGS i32 (i32.const 0x1_0d00))
  (data (i32.const 0x1_0d00) "\44\00\00\04\00\04\04\00\08\0c\0c\08\0c\08\08\0c\00\04\04\00\04\00\00\04\0c\08\08\0c\08\0c\0c\08\20\24\24\20\24\20\20\24\2c\28\28\2c\28\2c\2c\28\24\20\20\24\20\24\24\20\28\2c\2c\28\2c\28\28\2c\00\04\04\00\04\00\00\04\0c\08\08\0c\08\0c\0c\08\04\00\00\04\00\04\04\00\08\0c\0c\08\0c\08\08\0c\24\20\20\24\20\24\24\20\28\2c\2c\28\2c\28\28\2c\20\24\24\20\24\20\20\24\2c\28\28\2c\28\2c\2c\28\80\84\84\80\84\80\80\84\8c\88\88\8c\88\8c\8c\88\84\80\80\84\80\84\84\80\88\8c\8c\88\8c\88\88\8c\a4\a0\a0\a4\a0\a4\a4\a0\a8\ac\ac\a8\ac\a8\a8\ac\a0\a4\a4\a0\a4\a0\a0\a4\ac\a8\a8\ac\a8\ac\ac\a8\84\80\80\84\80\84\84\80\88\8c\8c\88\8c\88\88\8c\80\84\84\80\84\80\80\84\8c\88\88\8c\88\8c\8c\88\a0\a4\a4\a0\a4\a0\a0\a4\ac\a8\a8\ac\a8\ac\ac\a8\a4\a0\a0\a4\a0\a4\a4\a0\a8\ac\ac\a8\ac\a8\a8\ac")

  ;; 8-bit RLC operation flags table
  (global $RLC_FLAGS i32 (i32.const 0x1_0e00))
  (data (i32.const 0x1_0e00) "\44\00\00\04\08\0c\0c\08\00\04\04\00\0c\08\08\0c\20\24\24\20\2c\28\28\2c\24\20\20\24\28\2c\2c\28\00\04\04\00\0c\08\08\0c\04\00\00\04\08\0c\0c\08\24\20\20\24\28\2c\2c\28\20\24\24\20\2c\28\28\2c\80\84\84\80\8c\88\88\8c\84\80\80\84\88\8c\8c\88\a4\a0\a0\a4\a8\ac\ac\a8\a0\a4\a4\a0\ac\a8\a8\ac\84\80\80\84\88\8c\8c\88\80\84\84\80\8c\88\88\8c\a0\a4\a4\a0\ac\a8\a8\ac\a4\a0\a0\a4\a8\ac\ac\a8\01\05\05\01\0d\09\09\0d\05\01\01\05\09\0d\0d\09\25\21\21\25\29\2d\2d\29\21\25\25\21\2d\29\29\2d\05\01\01\05\09\0d\0d\09\01\05\05\01\0d\09\09\0d\21\25\25\21\2d\29\29\2d\25\21\21\25\29\2d\2d\29\85\81\81\85\89\8d\8d\89\81\85\85\81\8d\89\89\8d\a1\a5\a5\a1\ad\a9\a9\ad\a5\a1\a1\a5\a9\ad\ad\a9\81\85\85\81\8d\89\89\8d\85\81\81\85\89\8d\8d\89\a5\a1\a1\a5\a9\ad\ad\a9\a1\a5\a5\a1\ad\a9\a9\ad")

  ;; 8-bit RRC operation flags table
  (global $RRC_FLAGS i32 (i32.const 0x1_0f00))
  (data (i32.const 0x1_0f00) "\44\81\00\85\00\85\04\81\00\85\04\81\04\81\00\85\08\8d\0c\89\0c\89\08\8d\0c\89\08\8d\08\8d\0c\89\00\85\04\81\04\81\00\85\04\81\00\85\00\85\04\81\0c\89\08\8d\08\8d\0c\89\08\8d\0c\89\0c\89\08\8d\20\a5\24\a1\24\a1\20\a5\24\a1\20\a5\20\a5\24\a1\2c\a9\28\ad\28\ad\2c\a9\28\ad\2c\a9\2c\a9\28\ad\24\a1\20\a5\20\a5\24\a1\20\a5\24\a1\24\a1\20\a5\28\ad\2c\a9\2c\a9\28\ad\2c\a9\28\ad\28\ad\2c\a9\00\85\04\81\04\81\00\85\04\81\00\85\00\85\04\81\0c\89\08\8d\08\8d\0c\89\08\8d\0c\89\0c\89\08\8d\04\81\00\85\00\85\04\81\00\85\04\81\04\81\00\85\08\8d\0c\89\0c\89\08\8d\0c\89\08\8d\08\8d\0c\89\24\a1\20\a5\20\a5\24\a1\20\a5\24\a1\24\a1\20\a5\28\ad\2c\a9\2c\a9\28\ad\2c\a9\28\ad\28\ad\2c\a9\20\a5\24\a1\24\a1\20\a5\24\a1\20\a5\20\a5\24\a1\2c\a9\28\ad\28\ad\2c\a9\28\ad\2c\a9\2c\a9\28\ad")

  ;; 8-bit RL operation flags with no carry table
  (global $RL0_FLAGS i32 (i32.const 0x1_1000))
  (data (i32.const 0x1_1000) "\44\00\00\04\08\0c\0c\08\00\04\04\00\0c\08\08\0c\20\24\24\20\2c\28\28\2c\24\20\20\24\28\2c\2c\28\00\04\04\00\0c\08\08\0c\04\00\00\04\08\0c\0c\08\24\20\20\24\28\2c\2c\28\20\24\24\20\2c\28\28\2c\80\84\84\80\8c\88\88\8c\84\80\80\84\88\8c\8c\88\a4\a0\a0\a4\a8\ac\ac\a8\a0\a4\a4\a0\ac\a8\a8\ac\84\80\80\84\88\8c\8c\88\80\84\84\80\8c\88\88\8c\a0\a4\a4\a0\ac\a8\a8\ac\a4\a0\a0\a4\a8\ac\ac\a8\45\01\01\05\09\0d\0d\09\01\05\05\01\0d\09\09\0d\21\25\25\21\2d\29\29\2d\25\21\21\25\29\2d\2d\29\01\05\05\01\0d\09\09\0d\05\01\01\05\09\0d\0d\09\25\21\21\25\29\2d\2d\29\21\25\25\21\2d\29\29\2d\81\85\85\81\8d\89\89\8d\85\81\81\85\89\8d\8d\89\a5\a1\a1\a5\a9\ad\ad\a9\a1\a5\a5\a1\ad\a9\a9\ad\85\81\81\85\89\8d\8d\89\81\85\85\81\8d\89\89\8d\a1\a5\a5\a1\ad\a9\a9\ad\a5\a1\a1\a5\a9\ad\ad\a9")

  ;; 8-bit RL operation flags with carry table
  (global $RL1_FLAGS i32 (i32.const 0x1_1100))
  (data (i32.const 0x1_1100) "\00\04\04\00\0c\08\08\0c\04\00\00\04\08\0c\0c\08\24\20\20\24\28\2c\2c\28\20\24\24\20\2c\28\28\2c\04\00\00\04\08\0c\0c\08\00\04\04\00\0c\08\08\0c\20\24\24\20\2c\28\28\2c\24\20\20\24\28\2c\2c\28\84\80\80\84\88\8c\8c\88\80\84\84\80\8c\88\88\8c\a0\a4\a4\a0\ac\a8\a8\ac\a4\a0\a0\a4\a8\ac\ac\a8\80\84\84\80\8c\88\88\8c\84\80\80\84\88\8c\8c\88\a4\a0\a0\a4\a8\ac\ac\a8\a0\a4\a4\a0\ac\a8\a8\ac\01\05\05\01\0d\09\09\0d\05\01\01\05\09\0d\0d\09\25\21\21\25\29\2d\2d\29\21\25\25\21\2d\29\29\2d\05\01\01\05\09\0d\0d\09\01\05\05\01\0d\09\09\0d\21\25\25\21\2d\29\29\2d\25\21\21\25\29\2d\2d\29\85\81\81\85\89\8d\8d\89\81\85\85\81\8d\89\89\8d\a1\a5\a5\a1\ad\a9\a9\ad\a5\a1\a1\a5\a9\ad\ad\a9\81\85\85\81\8d\89\89\8d\85\81\81\85\89\8d\8d\89\a5\a1\a1\a5\a9\ad\ad\a9\a1\a5\a5\a1\ad\a9\a9\ad")

  ;; 8-bit RR operation flags with no carry table
  (global $RR0_FLAGS i32 (i32.const 0x1_1200))
  (data (i32.const 0x1_1200) "\44\45\00\01\00\01\04\05\00\01\04\05\04\05\00\01\08\09\0c\0d\0c\0d\08\09\0c\0d\08\09\08\09\0c\0d\00\01\04\05\04\05\00\01\04\05\00\01\00\01\04\05\0c\0d\08\09\08\09\0c\0d\08\09\0c\0d\0c\0d\08\09\20\21\24\25\24\25\20\21\24\25\20\21\20\21\24\25\2c\2d\28\29\28\29\2c\2d\28\29\2c\2d\2c\2d\28\29\24\25\20\21\20\21\24\25\20\21\24\25\24\25\20\21\28\29\2c\2d\2c\2d\28\29\2c\2d\28\29\28\29\2c\2d\00\01\04\05\04\05\00\01\04\05\00\01\00\01\04\05\0c\0d\08\09\08\09\0c\0d\08\09\0c\0d\0c\0d\08\09\04\05\00\01\00\01\04\05\00\01\04\05\04\05\00\01\08\09\0c\0d\0c\0d\08\09\0c\0d\08\09\08\09\0c\0d\24\25\20\21\20\21\24\25\20\21\24\25\24\25\20\21\28\29\2c\2d\2c\2d\28\29\2c\2d\28\29\28\29\2c\2d\20\21\24\25\24\25\20\21\24\25\20\21\20\21\24\25\2c\2d\28\29\28\29\2c\2d\28\29\2c\2d\2c\2d\28\29")

  ;; 8-bit RL operation flags with carry table
  (global $RR1_FLAGS i32 (i32.const 0x1_1300))
  (data (i32.const 0x1_1300) "\80\81\84\85\84\85\80\81\84\85\80\81\80\81\84\85\8c\8d\88\89\88\89\8c\8d\88\89\8c\8d\8c\8d\88\89\84\85\80\81\80\81\84\85\80\81\84\85\84\85\80\81\88\89\8c\8d\8c\8d\88\89\8c\8d\88\89\88\89\8c\8d\a4\a5\a0\a1\a0\a1\a4\a5\a0\a1\a4\a5\a4\a5\a0\a1\a8\a9\ac\ad\ac\ad\a8\a9\ac\ad\a8\a9\a8\a9\ac\ad\a0\a1\a4\a5\a4\a5\a0\a1\a4\a5\a0\a1\a0\a1\a4\a5\ac\ad\a8\a9\a8\a9\ac\ad\a8\a9\ac\ad\ac\ad\a8\a9\84\85\80\81\80\81\84\85\80\81\84\85\84\85\80\81\88\89\8c\8d\8c\8d\88\89\8c\8d\88\89\88\89\8c\8d\80\81\84\85\84\85\80\81\84\85\80\81\80\81\84\85\8c\8d\88\89\88\89\8c\8d\88\89\8c\8d\8c\8d\88\89\a0\a1\a4\a5\a4\a5\a0\a1\a4\a5\a0\a1\a0\a1\a4\a5\ac\ad\a8\a9\a8\a9\ac\ad\a8\a9\ac\ad\ac\ad\a8\a9\a4\a5\a0\a1\a0\a1\a4\a5\a0\a1\a4\a5\a4\a5\a0\a1\a8\a9\ac\ad\ac\ad\a8\a9\ac\ad\a8\a9\a8\a9\ac\ad")

  ;; 8-bit SRA operation flags table
  (global $SRA_FLAGS i32 (i32.const 0x1_1400))
  (data (i32.const 0x1_1400) "\44\45\00\01\00\01\04\05\00\01\04\05\04\05\00\01\08\09\0c\0d\0c\0d\08\09\0c\0d\08\09\08\09\0c\0d\00\01\04\05\04\05\00\01\04\05\00\01\00\01\04\05\0c\0d\08\09\08\09\0c\0d\08\09\0c\0d\0c\0d\08\09\20\21\24\25\24\25\20\21\24\25\20\21\20\21\24\25\2c\2d\28\29\28\29\2c\2d\28\29\2c\2d\2c\2d\28\29\24\25\20\21\20\21\24\25\20\21\24\25\24\25\20\21\28\29\2c\2d\2c\2d\28\29\2c\2d\28\29\28\29\2c\2d\84\85\80\81\80\81\84\85\80\81\84\85\84\85\80\81\88\89\8c\8d\8c\8d\88\89\8c\8d\88\89\88\89\8c\8d\80\81\84\85\84\85\80\81\84\85\80\81\80\81\84\85\8c\8d\88\89\88\89\8c\8d\88\89\8c\8d\8c\8d\88\89\a0\a1\a4\a5\a4\a5\a0\a1\a4\a5\a0\a1\a0\a1\a4\a5\ac\ad\a8\a9\a8\a9\ac\ad\a8\a9\ac\ad\ac\ad\a8\a9\a4\a5\a0\a1\a0\a1\a4\a5\a0\a1\a4\a5\a4\a5\a0\a1\a8\a9\ac\ad\ac\ad\a8\a9\ac\ad\a8\a9\a8\a9\ac\ad")

  ;; Next slot: 0x1_1500

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

  ;; Test machine I/O read operation; logs the I/O access
  ;; $addr: 16-bit port address
  ;; returns: Port value
  (func $testMachineIoRead (param $addr i32) (result i32)
    (local $value i32)
    (local $logAddr i32)

    ;; Read the next port value from the input buffer
    get_global $TEST_INPUT_OFFS
    get_global $nextTestInput
    i32.add
    i32.load8_u
    set_local $value

    ;; Move to the next input element
    get_global $nextTestInput
    i32.const 1
    i32.add
    set_global $nextTestInput
    get_global $nextTestInput
    get_global $testInputLength
    i32.ge_u
    if
     i32.const 0
     set_global $nextTestInput
    end

    ;; Calculate the address in the I/O log
    (i32.add (get_global $TEST_IO_LOG_OFFS)
      (i32.mul (get_global $ioLogLength) (i32.const 4))
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
    (i32.add (get_global $ioLogLength) (i32.const 1))
    set_global $ioLogLength

    ;; Done, return the memory value
    get_local $value
  )

  ;; Test machine memory write operation
  ;; $addr: 16-bit memory address
  ;; $v: 8-bit value to write
  ;; $suppCont: Suppress memory contention flag
  (func $testMachineIoWrite (param $addr i32) (param $v i32)
    (local $logAddr i32)

    ;; Calculate the address in the I/O log
    (i32.add (get_global $TEST_IO_LOG_OFFS)
      (i32.mul (get_global $ioLogLength) (i32.const 4))
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
    (i32.add (get_global $ioLogLength) (i32.const 1))
    set_global $ioLogLength
  )

  ;; Test machine TBBLUE register index write operation
  ;; $val: 8-bit index vlaue
  (func $testMachineTbBlueIndexWrite (param $val i32)
    (local $logAddr i32)

    ;; Calculate the address in the I/O log
    (i32.add (get_global $TEST_TBBLUE_LOG_OFFS)
      (i32.mul (get_global $tbBlueLogLength) (i32.const 2))
    )
    tee_local $logAddr

    ;; Store value in the log
    i32.const 1
    i32.store8 offset=0
    get_local $logAddr
    get_local $val
    i32.store8 offset=1

    ;; Increment log length
    (i32.add (get_global $tbBlueLogLength) (i32.const 1))
    set_global $tbBlueLogLength
  )

  ;; Test machine TBBLUE value write operation
  ;; $val: 8-bit index vlaue
  (func $testMachineTbBlueValueWrite (param $val i32)
    (local $logAddr i32)

    ;; Calculate the address in the I/O log
    (i32.add (get_global $TEST_TBBLUE_LOG_OFFS)
      (i32.mul (get_global $tbBlueLogLength) (i32.const 2))
    )
    tee_local $logAddr

    ;; Store value in the log
    i32.const 0
    i32.store8 offset=0
    get_local $logAddr
    get_local $val
    i32.store8 offset=1

    ;; Increment log length
    (i32.add (get_global $tbBlueLogLength) (i32.const 1))
    set_global $tbBlueLogLength
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
    $defaultIoRead
    $defaultIoWrite
    $NOOP
    $NOOP

    ;; Index 6: Machine type #1
    $defaultRead
    $defaultWrite
    $defaultIoRead
    $defaultIoWrite
    $NOOP
    $NOOP

    ;; Index 12: Machine type #2
    $defaultRead
    $defaultWrite
    $defaultIoRead
    $defaultIoWrite
    $NOOP
    $NOOP

    ;; Index 18: Machine type #3
    $defaultRead
    $defaultWrite
    $defaultIoRead
    $defaultIoWrite
    $NOOP
    $NOOP

    ;; Index 18: Test Z80 CPU Machine (type #4)
    $testMachineRead
    $testMachineWrite
    $testMachineIoRead
    $testMachineIoWrite
    $testMachineTbBlueIndexWrite
    $testMachineTbBlueValueWrite
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
    $JrZ      $AddHLQQ  $LdHLNNi  $DecQQ    $IncQ     $DecQ     $LdQN     $Cpl
    ;; 0x30-0x37
    $JrNc     $LdQQNN   $LdNNiA   $IncQQ    $IncHLi   $DecHLi   $LdHLiN   $Scf
    ;; 0x38-0x3f
    $JrC      $AddHLQQ  $LdANNi   $DecQQ    $IncQ     $DecQ     $LdQN     $Ccf
    ;; 0x40-0x47
    $NOOP     $LdQW     $LdQW     $LdQW     $LdQW     $LdQW     $LdQHLi   $LdQW
    ;; 0x48-0x4f
    $LdQW     $NOOP     $LdQW     $LdQW     $LdQW     $LdQW     $LdQHLi   $LdQW
    ;; 0x50-0x57
    $LdQW     $LdQW     $NOOP     $LdQW     $LdQW     $LdQW     $LdQHLi   $LdQW
    ;; 0x58-0x5f
    $LdQW     $LdQW     $LdQW     $NOOP     $LdQW     $LdQW     $LdQHLi   $LdQW
    ;; 0x60-0x67
    $LdQW     $LdQW     $LdQW     $LdQW     $NOOP     $LdQW     $LdQHLi   $LdQW
    ;; 0x68-0x6f
    $LdQW     $LdQW     $LdQW     $LdQW     $LdQW     $NOOP     $LdQHLi   $LdQW
    ;; 0x70-0x77
    $LdHLiQ   $LdHLiQ   $LdHLiQ   $LdHLiQ   $LdHLiQ   $LdHLiQ   $Halt     $LdHLiQ
    ;; 0x78-0x7f
    $LdQW     $LdQW     $LdQW     $LdQW     $LdQW     $LdQW     $LdQHLi   $NOOP
    ;; 0x80-0x87
    $AddAQ    $AddAQ    $AddAQ    $AddAQ    $AddAQ    $AddAQ    $AddAHLi  $AddAQ
    ;; 0x88-0x8f
    $AdcAQ    $AdcAQ    $AdcAQ    $AdcAQ    $AdcAQ    $AdcAQ    $AdcAHLi  $AdcAQ
    ;; 0x90-0x97
    $SubAQ    $SubAQ    $SubAQ    $SubAQ    $SubAQ    $SubAQ    $SubAHLi  $SubAQ
    ;; 0x98-0x9f
    $SbcAQ    $SbcAQ    $SbcAQ    $SbcAQ    $SbcAQ    $SbcAQ    $SbcAHLi  $SbcAQ
    ;; 0xa0-0xa7
    $AndAQ    $AndAQ    $AndAQ    $AndAQ    $AndAQ    $AndAQ    $AndAHLi  $AndAQ
    ;; 0xa8-0xaf
    $XorAQ    $XorAQ    $XorAQ    $XorAQ    $XorAQ    $XorAQ    $XorAHLi  $XorAQ
    ;; 0xb0-0xb7
    $OrAQ     $OrAQ     $OrAQ     $OrAQ     $OrAQ     $OrAQ     $OrAHLi   $OrAQ
    ;; 0xb8-0xbf
    $CpAQ     $CpAQ     $CpAQ     $CpAQ     $CpAQ     $CpAQ     $CpAHLi   $CpAQ
    ;; 0xc0-0xc7
    $RetNz    $PopBC    $JpNz     $Jp       $CallNz   $PushBC   $AddAN    $RstN
    ;; 0xc8-0xcf
    $RetZ     $Ret      $JpZ      $NOOP     $CallZ    $CallNN   $AdcAN    $RstN
    ;; 0xd0-0xd7
    $RetNc    $PopDE    $JpNc     $OutNA    $CallNc   $PushDE   $SubAN    $RstN
    ;; 0xd8-0xdf
    $RetC     $Exx      $JpC      $InAN     $CallC    $NOOP     $SbcAN    $RstN
    ;; 0xe0-0xe7
    $RetPo    $PopHL    $JpPo     $ExSPiHL  $CallPo   $PushHL   $AndAN    $RstN
    ;; 0xe8-0xef
    $RetPe    $JpHL     $JpPe     $ExDEHL   $CallPe   $NOOP     $XorAN    $RstN
    ;; 0xf0-0xf7
    $RetP     $PopAF    $JpP      $Di       $CallP    $PushAF   $OrAN     $RstN
    ;; 0xf8-0xff
    $RetM     $LdSPHL   $JpM      $Ei       $CallM    $NOOP     $CpAN     $RstN
  )

;; Table of indexed instructions
(elem (i32.const 286)
    ;; 0x00-0x07
    $NOOP     $LdQQNN   $LdBCiA   $IncQQ    $IncQ     $DecQ     $LdQN     $Rlca
    ;; 0x08-0x0f
    $ExAf     $AddIXQQ  $LdABCi   $DecQQ    $IncQ     $DecQ     $LdQN     $Rrca
    ;; 0x10-0x17
    $Djnz     $LdQQNN   $LdDEiA   $IncQQ    $IncQ     $DecQ     $LdQN     $Rla
    ;; 0x18-0x1f
    $JrE      $AddIXQQ  $LdADEi   $DecQQ    $IncQ     $DecQ     $LdQN     $Rra
    ;; 0x20-0x27
    $JrNz     $LdIXNN   $LdNNiIX  $IncIX    $IncXH    $DecXH    $LdXHN    $Daa
    ;; 0x28-0x2f
    $JrZ      $AddIXQQ  $LdIXNNi  $DecIX    $IncXL    $DecXL    $LdXLN    $Cpl
    ;; 0x30-0x37
    $JrNc     $LdQQNN   $LdNNiA   $IncQQ    $IncIXi   $DecIXi   $LdIXiN   $Scf
    ;; 0x38-0x3f
    $JrC      $AddIXQQ  $LdANNi   $DecQQ    $IncQ     $DecQ     $LdQN     $Ccf
    ;; 0x40-0x47
    $NOOP     $LdQW     $LdQW     $LdQW     $LdQXH    $LdQXL    $LdQIXi   $LdQW
    ;; 0x48-0x4f
    $LdQW     $NOOP     $LdQW     $LdQW     $LdQXH    $LdQXL    $LdQIXi   $LdQW
    ;; 0x50-0x57
    $LdQW     $LdQW     $NOOP     $LdQW     $LdQXH    $LdQXL    $LdQIXi   $LdQW
    ;; 0x58-0x5f
    $LdQW     $LdQW     $LdQW     $NOOP     $LdQXH    $LdQXL    $LdQIXi   $LdQW
    ;; 0x60-0x67
    $LdQW     $LdQW     $LdQW     $LdQW     $NOOP     $LdQXL    $LdQIXi   $LdQW
    ;; 0x68-0x6f
    $LdQW     $LdQW     $LdQW     $LdQW     $LdQXH    $NOOP     $LdQIXi   $LdQW
    ;; 0x70-0x77
    $LdIXiQ   $LdIXiQ   $LdIXiQ   $LdIXiQ   $LdIXiQ   $LdIXiQ   $Halt     $LdIXiQ
    ;; 0x78-0x7f
    $LdQW     $LdQW     $LdQW     $LdQW     $LdQXH    $LdQXL    $LdQIXi   $NOOP
    ;; 0x80-0x87
    $AddAQ    $AddAQ    $AddAQ    $AddAQ    $AddAXH   $AddAXL   $AddAIXi  $AddAQ
    ;; 0x88-0x8f
    $AdcAQ    $AdcAQ    $AdcAQ    $AdcAQ    $AdcAXH   $AdcAXL   $AdcAIXi  $AdcAQ
    ;; 0x90-0x97
    $SubAQ    $SubAQ    $SubAQ    $SubAQ    $SubAXH   $SubAXL   $SubAIXi  $SubAQ
    ;; 0x98-0x9f
    $SbcAQ    $SbcAQ    $SbcAQ    $SbcAQ    $SbcAXH   $SbcAXL   $SbcAIXi  $SbcAQ
    ;; 0xa0-0xa7
    $AndAQ    $AndAQ    $AndAQ    $AndAQ    $AndAXH   $AndAXL   $AndAIXi  $AndAQ
    ;; 0xa8-0xaf
    $XorAQ    $XorAQ    $XorAQ    $XorAQ    $XorAXH   $XorAXL   $XorAIXi  $XorAQ
    ;; 0xb0-0xb7
    $OrAQ     $OrAQ     $OrAQ     $OrAQ     $OrAXH    $OrAXL    $OrAIXi   $OrAQ
    ;; 0xb8-0xbf
    $CpAQ     $CpAQ     $CpAQ     $CpAQ     $CpAXH    $CpAXL    $CpAIXi   $CpAQ
    ;; 0xc0-0xc7
    $RetNz    $PopBC    $JpNz     $Jp       $CallNz   $PushBC   $AddAN    $RstN
    ;; 0xc8-0xcf
    $RetZ     $Ret      $JpZ      $NOOP     $CallZ    $CallNN   $AdcAN    $RstN
    ;; 0xd0-0xd7
    $RetNc    $PopDE    $JpNc     $OutNA    $CallNc   $PushDE   $SubAN    $RstN
    ;; 0xd8-0xdf
    $RetC     $Exx      $JpC      $InAN     $CallC    $NOOP     $SbcAN    $RstN
    ;; 0xe0-0xe7
    $RetPo    $PopIX    $JpPo     $ExSPiIX  $CallPo   $PushIX   $AndAN    $RstN
    ;; 0xe8-0xef
    $RetPe    $JpIX     $JpPe     $ExDEHL   $CallPe   $NOOP     $XorAN    $RstN
    ;; 0xf0-0xf7
    $RetP     $PopAF    $JpP      $Di       $CallP    $PushAF   $OrAN     $RstN
    ;; 0xf8-0xff
    $RetM     $LdSPIX   $JpM      $Ei       $CallM    $NOOP     $CpAN     $RstN
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
    $NOOP     $NOOP     $NOOP     $SwapNib  $Mirror   $NOOP     $NOOP     $TestN
    ;; 0x28-0x2f
    $Bsla     $Bsra     $Bsrl     $Bsrf     $Brlc     $NOOP     $NOOP     $NOOP
    ;; 0x30-0x37
    $Mul      $AddHLA   $AddDEA   $AddBCA   $AddHLNN  $AddDENN  $AddBCNN  $NOOP
    ;; 0x38-0x3f
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP
    ;; 0x40-0x47
    $InQC     $OutCQ    $SbcHLQQ  $LdNNiQQ  $Neg      $Retn     $ImN      $LdIA
    ;; 0x48-0x4f
    $InQC     $OutCQ    $AdcHLQQ  $LdQQNNi  $Neg      $Retn     $ImN      $LdRA
    ;; 0x50-0x57
    $InQC     $OutCQ    $SbcHLQQ  $LdNNiQQ  $Neg      $Retn     $ImN      $LdAXr
    ;; 0x58-0x5f
    $InQC     $OutCQ    $AdcHLQQ  $LdQQNNi  $Neg      $Retn     $ImN      $LdAXr
    ;; 0x60-0x67
    $InQC     $OutCQ    $SbcHLQQ  $LdNNiQQ  $Neg      $Retn     $ImN      $Rrd
    ;; 0x68-0x6f
    $InQC     $OutCQ    $AdcHLQQ  $LdQQNNi  $Neg      $Retn     $ImN      $Rld
    ;; 0x70-0x77
    $InQC     $OutCQ    $SbcHLQQ  $LdNNiQQ  $Neg      $Retn     $ImN      $NOOP
    ;; 0x78-0x7f
    $InQC     $OutCQ    $AdcHLQQ  $LdQQNNi  $Neg      $Retn     $ImN      $NOOP
    ;; 0x80-0x87
    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP
    ;; 0x88-0x8f
    $NOOP     $NOOP     $PushNN   $NOOP     $NOOP     $NOOP     $NOOP     $NOOP
    ;; 0x90-0x97
    $OutInB   $NextReg  $NextRegA $PixelDn  $PixelAd  $SetAE    $NOOP     $NOOP
    ;; 0x98-0x9f
    $JpInC    $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP     $NOOP
    ;; 0xa0-0xa7
    $Ldi      $Cpi      $Ini      $Outi     $Ldix     $Ldws     $NOOP     $NOOP
    ;; 0xa8-0xaf
    $Ldd      $Cpd      $Ind      $Outd     $Lddx     $NOOP     $NOOP     $NOOP
    ;; 0xb0-0xb7
    $Ldir     $Cpir     $Inir     $Otir     $Ldirx    $NOOP     $NOOP     $Ldpirx
    ;; 0xb8-0xbf
    $Lddr     $Cpdr     $Indr     $Otdr     $Lddrx    $NOOP     $NOOP     $NOOP
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
    $RlcQ     $RlcQ     $RlcQ     $RlcQ     $RlcQ     $RlcQ     $RlcHLi   $RlcQ
    ;; 0x08-0x0f
    $RrcQ     $RrcQ     $RrcQ     $RrcQ     $RrcQ     $RrcQ     $RrcHLi   $RrcQ
    ;; 0x10-0x17
    $RlQ      $RlQ      $RlQ      $RlQ      $RlQ      $RlQ      $RlHLi    $RlQ
    ;; 0x18-0x1f
    $RrQ      $RrQ      $RrQ      $RrQ      $RrQ      $RrQ      $RrHLi    $RrQ
    ;; 0x20-0x27
    $SlaQ     $SlaQ     $SlaQ     $SlaQ     $SlaQ     $SlaQ     $SlaHLi   $SlaQ
    ;; 0x28-0x2f
    $SraQ     $SraQ     $SraQ     $SraQ     $SraQ     $SraQ     $SraHLi   $SraQ
    ;; 0x30-0x37
    $SllQ     $SllQ     $SllQ     $SllQ     $SllQ     $SllQ     $SllHLi   $SllQ
    ;; 0x38-0x3f
    $SrlQ     $SrlQ     $SrlQ     $SrlQ     $SrlQ     $SrlQ     $SrlHLi   $SrlQ
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

  ;; Sets the value of AFC
  (func $setAF (param $v i32)
    get_global $REG_AREA_INDEX
    get_local $v
    i32.store16 offset=0
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

  ;; Default I/O read operation
  ;; $addr: 16-bit memory address
  ;; returns: Memory contents
  (func $defaultIoRead (param $addr i32) (result i32)
    i32.const 0xff
  )

  ;; Default I/O write operation
  ;; $addr: 16-bit memory address
  ;; $v: 8-bit value to write
  (func $defaultIoWrite (param $addr i32) (param $v i32)
    ;; This function in intentionally empty
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

  ;; Reads the specified I/O port of the current machine type
  ;; $addr: 16-bit port address
  ;; returns: Port value
  (func $readPort (param $addr i32) (result i32)
    get_local $addr
    (i32.add
      (i32.mul (get_global $MACHINE_TYPE) (get_global $MACHINE_FUNC_COUNT))
      (i32.const 2)
    )
    call_indirect (type $PortReadFunc)
    i32.const 4
    call $incTacts
  )

  ;; Writes the specified port of the current machine type
  ;; $addr: 16-bit port address
  ;; $v: 8-bit value to write
  (func $writePort (param $addr i32) (param $v i32)
    get_local $addr
    get_local $v
    (i32.add
      (i32.mul (get_global $MACHINE_TYPE) (get_global $MACHINE_FUNC_COUNT))
      (i32.const 3)
    )
    call_indirect (type $PortWriteFunc)
    i32.const 4
    call $incTacts
  )

  ;; Writes the specified TBBLUE index of the current machine type
  ;; $idx: 8-bit index register value
  (func $writeTbBlueIndex (param $idx i32)
    i32.const 0x243b
    get_local $idx
    (i32.add
      (i32.mul (get_global $MACHINE_TYPE) (get_global $MACHINE_FUNC_COUNT))
      (i32.const 3)
    )
    call_indirect (type $PortWriteFunc)
    i32.const 3
    call $incTacts

    ;; Allow to write the log
    get_local $idx
    (i32.add
      (i32.mul (get_global $MACHINE_TYPE) (get_global $MACHINE_FUNC_COUNT))
      (i32.const 4)
    )
    call_indirect (type $TbBlueWriteFunc)
  )

  ;; Writes the specified TBBLUE value of the current machine type
  ;; $idx: 8-bit index register value
  (func $writeTbBlueValue (param $idx i32)
    i32.const 0x253b
    get_local $idx
    (i32.add
      (i32.mul (get_global $MACHINE_TYPE) (get_global $MACHINE_FUNC_COUNT))
      (i32.const 3)
    )
    call_indirect (type $PortWriteFunc)
    i32.const 3
    call $incTacts

    get_local $idx
    (i32.add
      (i32.mul (get_global $MACHINE_TYPE) (get_global $MACHINE_FUNC_COUNT))
      (i32.const 5)
    )
    call_indirect (type $TbBlueWriteFunc)
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
  (func $processBitOperations
    get_global $BIT_JT
    get_global $opCode
    i32.add
    call_indirect (type $OpFunc)
  )

  ;; Processes extended operations
  (func $processExtendedOperations
    get_global $EXTENDED_JT
    get_global $opCode
    i32.add
    call_indirect (type $OpFunc)
  )

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

  ;; Increments the value of SP
  (func $incSP
    call $getSP
    i32.const 1
    i32.add
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
    call $decSP
    call $getSP
    get_local $v
    call $writeMemory
  )

  ;; Pops a value to the stack
  (func $popValue (result i32)
    call $getSP
    call $readMemory
    call $incSP
    call $getSP
    call $readMemory
    call $incSP
    i32.const 8
    i32.shl
    i32.or
  )

  ;; Reads the memory location at PC
  (func $readCodeMemory (result i32)
    (local $result i32)
    call $getPC
    call $readMemory
    call $incPC
  )

  ;; Add two 16-bit values following the add hl,NN logic
  (func $AluAddHL (param $regHL i32) (param $other i32) (result i32)
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

  ;; Add two 16-bit values following the sbc hl,NN logic
  (func $AluAdcHL (param $other i32)
    (local $res i32)
    (local $f i32)
    (local $signed i32)

    ;; Calculate result
    call $getHL
    get_local $other
    i32.add
    tee_local $res
    call $getF
    i32.const 0x01
    i32.and
    tee_local $f
    i32.add
    tee_local $res

    ;; Calculate Z
    i32.const 0xffff
    i32.and
    if (result i32)  ;; (Z)
      i32.const 0x00
    else
      i32.const 0x40
    end

    ;; Calculate H
    (i32.and (call $getHL) (i32.const 0x0fff))
    (i32.and (get_local $other) (i32.const 0x0fff))
    i32.add
    get_local $f
    i32.add
    i32.const 8
    i32.shr_u
    i32.const 0x10 ;; Mask for H
    i32.and ;; (Z, H)

    ;; Calculate C
    i32.const 0x01
    i32.const 0x00
    get_local $res
    i32.const 0x1_0000
    i32.and
    select ;; (Z, H, C)

    ;; Calculate PV
    call $getHL
    i32.const 16
    i32.shl
    i32.const 16
    i32.shr_s
    get_local $other
    i32.const 16
    i32.shl
    i32.const 16
    i32.shr_s
    i32.add
    get_local $f
    i32.add
    tee_local $signed
    i32.const -0x8000
    i32.lt_s
    get_local $signed
    i32.const 0x8000
    i32.ge_s
    i32.or
    if (result i32) ;; (Z, H, C, PV)
      i32.const 0x04
    else
      i32.const 0x00
    end

    ;; Store the result
    get_local $res
    call $setHL

    ;; Calculate S, R5, R3
    call $getH
    i32.const 0xA8 ;; Mask for S|R5|R3
    i32.and

    ;; Merge flags
    i32.or
    i32.or
    i32.or
    i32.or
    call $setF
  )

  ;; Subtract two 16-bit values following the sbc hl,NN logic
  (func $AluSbcHL (param $other i32)
    (local $res i32)
    (local $f i32)
    (local $signed i32)

    ;; Calculate result
    call $getHL
    get_local $other
    i32.sub
    tee_local $res
    call $getF
    i32.const 0x01
    i32.and
    tee_local $f
    i32.sub
    tee_local $res

    ;; Calculate Z
    i32.const 0xffff
    i32.and
    if (result i32)  ;; (Z)
      i32.const 0x00
    else
      i32.const 0x40
    end

    ;; Set N
    i32.const 0x02 ;; (Z, N)

    ;; Calculate H
    (i32.and (call $getHL) (i32.const 0x0fff))
    (i32.and (get_local $other) (i32.const 0x0fff))
    i32.sub
    get_local $f
    i32.sub
    i32.const 8
    i32.shr_u
    i32.const 0x10 ;; Mask for H
    i32.and ;; (Z, N, H)

    ;; Calculate C
    i32.const 0x01
    i32.const 0x00
    get_local $res
    i32.const 0x1_0000
    i32.and
    select ;; (Z, N, H, C)

    ;; Calculate PV
    call $getHL
    i32.const 16
    i32.shl
    i32.const 16
    i32.shr_s
    get_local $other
    i32.const 16
    i32.shl
    i32.const 16
    i32.shr_s
    i32.sub
    get_local $f
    i32.sub
    tee_local $signed
    i32.const -0x8000
    i32.lt_s
    get_local $signed
    i32.const 0x8000
    i32.ge_s
    i32.or
    if (result i32) ;; (Z, N, H, C, PV)
      i32.const 0x04
    else
      i32.const 0x00
    end

    ;; Store the result
    get_local $res
    call $setHL

    ;; Calculate S, R5, R3
    call $getH
    i32.const 0xA8 ;; Mask for S|R5|R3
    i32.and

    ;; Merge flags
    i32.or
    i32.or
    i32.or
    i32.or
    i32.or
    call $setF
  )

  ;; Carries out a relative jump
  ;; $e: 8-bit distance value
  (func $relativeJump (param $e i32)
    call $AdjustIXTact

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

  ;; Adjust tacts for IX-indirect addressing
  (func $AdjustIXTact
    call $getPC
    call $Adjust5Tacts
  )

  ;; Adjust tacts for IX-indirect addressing
  (func $Adjust5Tacts (param $addr i32)
    ;; Adjust tacts
    get_global $useGateArrayContention
    if
      i32.const 5
      call $incTacts
    else
      get_local $addr
      call $memoryDelay
      i32.const 1
      call $incTacts
      get_local $addr
      call $memoryDelay
      i32.const 1
      call $incTacts
      get_local $addr
      call $memoryDelay
      i32.const 1
      call $incTacts
      get_local $addr
      call $memoryDelay
      i32.const 1
      call $incTacts
      get_local $addr
      call $memoryDelay
      i32.const 1
      call $incTacts
    end
  )

  ;; Gets the index address for an operation
  (func $getIndexedAddress (result i32)
    call $getIndexReg
    call $readCodeMemory
    i32.const 24
    i32.shl
    i32.const 24
    i32.shr_s
    i32.add
  )

  ;; Executes ALU addition; sets A and F
  ;; $arg: other argument
  ;; $c: Value of the C flag
  (func $AluAdd (param $arg i32) (param $c i32)
    (local $a i32)
    (local $res i32)
    (local $pv i32)
    ;; Add values (+carry) and store in A
    call $getA
    tee_local $a
    get_local $arg
    i32.add
    get_local $c
    i32.add
    tee_local $res
    call $setA

    ;; Put Z on stack
    i32.const 0x00 ;; NZ
    i32.const 0x40 ;; Z
    get_local $res
    i32.const 0xff
    i32.and
    select         ;; Z

    ;; Get S, R5, and R3 from result
    get_local $res
    i32.const 0xa8
    i32.and        ;; Z, S|R5|R3

    ;; Get C flag
    get_local $res
    i32.const 0x100
    i32.and
    i32.const 8
    i32.shr_u      ;; Z, S|R5|R3, C

    ;; Calculate H flag
    i32.const 0x10
    i32.const 0x00
    (i32.and (get_local $a) (i32.const 0x0f))
    (i32.and (get_local $arg) (i32.const 0x0f))
    i32.add
    get_local $c
    i32.add
    i32.const 0x10
    i32.and
    select        ;; Z, S|R5|R3, C, H

    ;; <i32>$arg + <i32>$a + C
    get_local $a
    i32.const 24
    i32.shl
    i32.const 24
    i32.shr_s
    tee_local $pv
    get_local $arg
    i32.const 24
    i32.shl
    i32.const 24
    i32.shr_s
    i32.add
    get_local $c
    i32.add
    tee_local $pv

    ;; Calculate PV flag
    i32.const 0x80
    i32.ge_s
    if (result i32)
      i32.const 0x04
    else
      get_local $pv
      i32.const -0x81
      i32.le_s
      if (result i32)
        i32.const 0x04
      else
        i32.const 0x00
      end
    end

    ;; Merge flags
    i32.or
    i32.or
    i32.or
    i32.or
    call $setF
  )

  ;; Executes ALU subtraction; sets A and F
  ;; $arg: other argument
  ;; $c: Value of the C flag
  (func $AluSub (param $arg i32) (param $c i32)
    (local $a i32)
    (local $res i32)
    (local $pv i32)
    ;; Subtract values (-carry) and store in A
    call $getA
    tee_local $a
    get_local $arg
    i32.sub
    get_local $c
    i32.sub
    tee_local $res
    call $setA

    ;; Put Z on stack
    i32.const 0x00 ;; NZ
    i32.const 0x40 ;; Z
    get_local $res
    i32.const 0xff
    i32.and
    select         ;; Z

    ;; Get S, R5, and R3 from result
    get_local $res
    i32.const 0xa8
    i32.and        ;; Z, S|R5|R3

    ;; Get C flag
    get_local $res
    i32.const 0x100
    i32.and
    i32.const 8
    i32.shr_u      ;; Z, S|R5|R3, C

    ;; Calculate H flag
    i32.const 0x10
    i32.const 0x00
    (i32.and (get_local $a) (i32.const 0x0f))
    (i32.and (get_local $arg) (i32.const 0x0f))
    i32.sub
    get_local $c
    i32.sub
    i32.const 0x10
    i32.and
    select        ;; Z, S|R5|R3, C, H

    ;; <i32>$a - <i32>$arg - C
    get_local $a
    i32.const 24
    i32.shl
    i32.const 24
    i32.shr_s
    tee_local $pv
    get_local $arg
    i32.const 24
    i32.shl
    i32.const 24
    i32.shr_s
    i32.sub
    get_local $c
    i32.sub
    tee_local $pv

    ;; Calculate PV flag
    i32.const 0x80
    i32.ge_s
    if (result i32)
      i32.const 0x04
    else
      get_local $pv
      i32.const -0x81
      i32.le_s
      if (result i32)
        i32.const 0x04
      else
        i32.const 0x00
      end
    end

    ;; Merge flags
    i32.or
    i32.or
    i32.or
    i32.or

    ;; Set N
    i32.const 0x02 ;; N flag mask
    i32.or
    call $setF
  )

  ;; Executes ALU AND operations; sets A and F
  ;; $arg: other argument
  (func $AluAnd (param $arg i32)
    call $getA
    get_local $arg
    i32.and
    call $setA

    ;; Adjust flags
    get_global $LOG_FLAGS
    call $getA
    i32.add
    i32.load8_u

    ;; Set H
    i32.const 0x10 ;; H flag mask
    i32.or
    call $setF
  )

  ;; Executes ALU XOR operation; sets A and F
  ;; $arg: other argument
  (func $AluXor (param $arg i32)
    call $getA
    get_local $arg
    i32.xor
    call $setA

    ;; Adjust flags
    get_global $LOG_FLAGS
    call $getA
    i32.add
    i32.load8_u
    call $setF
  )

  ;; Executes ALU OOR operation; sets A and F
  ;; $arg: other argument
  (func $AluOr (param $arg i32)
    call $getA
    get_local $arg
    i32.or
    call $setA

    ;; Adjust flags
    get_global $LOG_FLAGS
    call $getA
    i32.add
    i32.load8_u
    call $setF
  )

  ;; Executes ALU 8-add compare; sets F
  ;; $arg: other argument
  (func $AluCp (param $arg i32)
    (local $a i32)
    (local $res i32)
    (local $pv i32)
    ;; Subtract values (-carry) and store in A
    call $getA
    tee_local $a
    get_local $arg
    i32.sub
    set_local $res

    ;; Put Z on stack
    i32.const 0x00 ;; NZ
    i32.const 0x40 ;; Z
    get_local $res
    i32.const 0xff
    i32.and
    select         ;; Z

    ;; Get S from result
    get_local $res
    i32.const 0x80
    i32.and        ;; Z, S

    ;; Get R5 and R3 from $arg
    get_local $arg
    i32.const 0x28
    i32.and

    ;; Get C flag
    get_local $res
    i32.const 0x100
    i32.and
    i32.const 8
    i32.shr_u      ;; Z, S|R5|R3, C

    ;; Calculate H flag
    i32.const 0x10
    i32.const 0x00
    (i32.and (get_local $a) (i32.const 0x0f))
    (i32.and (get_local $arg) (i32.const 0x0f))
    i32.sub
    i32.const 0x10
    i32.and
    select        ;; Z, S|R5|R3, C, H

    ;; <i32>$a - <i32>$arg - C
    get_local $a
    i32.const 24
    i32.shl
    i32.const 24
    i32.shr_s
    tee_local $pv
    get_local $arg
    i32.const 24
    i32.shl
    i32.const 24
    i32.shr_s
    i32.sub
    tee_local $pv

    ;; Calculate PV flag
    i32.const 0x80
    i32.ge_s
    if (result i32)
      i32.const 0x04
    else
      get_local $pv
      i32.const -0x81
      i32.le_s
      if (result i32)
        i32.const 0x04
      else
        i32.const 0x00
      end
    end

    ;; Merge flags
    i32.or
    i32.or
    i32.or
    i32.or
    i32.or

    ;; Set N
    i32.const 0x02 ;; N flag mask
    i32.or
    call $setF
  )

  ;; Tests the Z condition
  (func $testZ (result i32)
    call $getF
    i32.const 0x40 ;; Mask for Z flag
    i32.and
    i32.const 0
    i32.ne
  )

  ;; Tests the NZ condition
  (func $testNZ (result i32)
    call $getF
    i32.const 0x40 ;; Mask for Z flag
    i32.and
    i32.const 0
    i32.eq
  )

  ;; Tests the C condition
  (func $testC (result i32)
    call $getF
    i32.const 0x01 ;; Mask for C flag
    i32.and
    i32.const 0
    i32.ne
  )

  ;; Tests the NC condition
  (func $testNC (result i32)
    call $getF
    i32.const 0x01 ;; Mask for C flag
    i32.and
    i32.const 0
    i32.eq
  )

  ;; Tests the PE condition
  (func $testPE (result i32)
    call $getF
    i32.const 0x04 ;; Mask for PV flag
    i32.and
    i32.const 0
    i32.ne
  )

  ;; Tests the PO condition
  (func $testPO (result i32)
    call $getF
    i32.const 0x04 ;; Mask for PV flag
    i32.and
    i32.const 0
    i32.eq
  )

  ;; Tests the M condition
  (func $testM (result i32)
    call $getF
    i32.const 0x80 ;; Mask for S flag
    i32.and
    i32.const 0
    i32.ne
  )

  ;; Tests the P condition
  (func $testP (result i32)
    call $getF
    i32.const 0x80 ;; Mask for S flag
    i32.and
    i32.const 0
    i32.eq
  )

  ;; Read address to WZ
  (func $readAddrToWZ
    call $readCodeMemory
    call $readCodeMemory
    i32.const 8
    i32.shl
    i32.or
    call $setWZ
  )

  ;; Read address from code
  (func $readAddrFromCode (result i32)
    call $readCodeMemory
    call $readCodeMemory
    i32.const 8
    i32.shl
    i32.or
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
    call $readAddrFromCode

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
    call $setAF
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
    call $AluAddHL
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
    call $testZ
    if return end

    ;; Jump
    get_local $e
    call $relativeJump
  )

  ;; ld (NN),hl
  (func $LdNNiHL
    (local $addr i32)
    ;; Obtain the address to store HL
    call $readAddrFromCode
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
    get_local $a
    i32.const 0xff
    i32.and
    i32.popcnt
    i32.const 2
    i32.rem_u
    i32.const 2
    i32.shl
    i32.const 0x04 ;; PV flag mask
    i32.xor
    set_local $pvAfter

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
    call $testNZ
    if return end

    ;; Jump
    get_local $e
    call $relativeJump
  )

  ;; ld hl,(NN) (0x2a)
  (func $LdHLNNi
    (local $addr i32)
    ;; Read the address
    call $readAddrFromCode
    tee_local $addr

    ;; Set WZ to addr + 1
    i32.const 1
    i32.add
    call $setWZ

    ;; Read HL from memory
    get_local $addr
    call $readMemory
    call $setL
    call $getWZ
    call $readMemory
    call $setH
  )

  ;; cpl (0x2f)
  (func $Cpl
    ;; New value of A
    call $getA
    i32.const 0xff
    i32.xor
    call $setA

    ;; New F
    call $getF
    i32.const 0xed ;; Keep S, Z, R3, R3, PV, C
    i32.and
    i32.const 0x12 ;; Set H and N
    i32.or
    call $setF
  )

  ;; jr nc,NN (0x30)
  (func $JrNc
    (local $e i32)
    call $readCodeMemory
    set_local $e
    call $testC
    if return end

    ;; Jump
    get_local $e
    call $relativeJump
  )

  ;; ld (NN),a (0x32)
  (func $LdNNiA
    (local $addr i32)

    ;; Read the address
    call $readAddrFromCode
    tee_local $addr

    ;; Set WZ to addr + 1
    i32.const 1
    i32.add
    call $setWZ

    ;; Store A
    get_local $addr
    call $getA
    call $writeMemory
    call $getA
    call $setWH
  )

  ;; inc (hl) (0x34)
  (func $IncHLi
    (local $v i32)

    ;; Get the value from the memory
    call $getHL
    call $readMemory
    set_local $v

    ;; Adjust tacts
    get_global $useGateArrayContention
    i32.const 0
    i32.eq
    if
      call $getHL
      call $memoryDelay
    end
    i32.const 1
    call $incTacts

    ;; Increment value
    call $getHL
    get_local $v
    i32.const 1
    i32.add
    call $writeMemory

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

  ;; dec (hl) (0x35)
  (func $DecHLi
    (local $v i32)

    ;; Get the value from the memory
    call $getHL
    call $readMemory
    set_local $v

    ;; Adjust tacts
    get_global $useGateArrayContention
    i32.const 0
    i32.eq
    if
      call $getHL
      call $memoryDelay
    end
    i32.const 1
    call $incTacts

    ;; Increment value
    call $getHL
    get_local $v
    i32.const 1
    i32.sub
    call $writeMemory

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

  ;; ld (hl),n
  (func $LdHLiN
    (local $v i32)
    call $readCodeMemory
    set_local $v
    call $getHL
    get_local $v
    call $writeMemory
  )

  ;; scf (0x37)
  (func $Scf
    (i32.and (call $getA) (i32.const 0x28)) ;; Mask for R5, R3
    (i32.and (call $getF) (i32.const 0xc4)) ;; Mask for S, Z, PV
    i32.or
    i32.const 0x01 ;; Mask for C flag
    i32.or
    call $setF
  )

  ;; jr c,NN (0x38)
  (func $JrC
    (local $e i32)
    call $readCodeMemory
    set_local $e
    call $testNC
    if return end

    ;; Jump
    get_local $e
    call $relativeJump
  )

  ;; ld a,(NN) (0x3a)
  (func $LdANNi
    (local $addr i32)

    ;; Read the address
    call $readAddrFromCode
    tee_local $addr

    ;; Set WZ to addr + 1
    i32.const 1
    i32.add
    call $setWZ

    ;; Read A from memory
    get_local $addr
    call $readMemory
    call $setA
  )

  ;; ccf (0x3f)
  (func $Ccf
    (i32.and (call $getA) (i32.const 0x28)) ;; Mask for R5, R3
    (i32.and (call $getF) (i32.const 0xc4)) ;; Mask for S, Z, PV
    i32.or
    (i32.and (call $getF) (i32.const 0x01)) ;; Mask for C flag
    i32.const 0x01 ;; Complement C flag
    i32.xor
    i32.or
    call $setF
  )

  ;; ld Q,W
  ;; Q, W: B, C, D, E, H, L, A
  (func $LdQW
    ;; Get 8-bit Q reg index
    get_global $opCode
    i32.const 0x38
    i32.and
    i32.const 3
    i32.shr_u  ;; Stack: Q

    ;; Get 8-bit W reg index
    get_global $opCode
    i32.const 0x07
    i32.and    ;; Stack: Q, W

    ;; Get source value
    call $getReg8 ;; Stack W, regVal
    call $setReg8
  )

  ;; ld Q,(hl)
  ;; Q: B, C, D, E, H, L, A
  (func $LdQHLi
    ;; Get 8-bit Q reg index
    get_global $opCode
    i32.const 0x38
    i32.and
    i32.const 3
    i32.shr_u

    ;; Get data from memory and store it
    call $getHL
    call $readMemory
    call $setReg8
  )

  ;; ld (hl),Q
  ;; Q: B, C, D, E, H, L, A
  (func $LdHLiQ
    call $getHL
    ;; Get 8-bit Q reg index
    get_global $opCode
    i32.const 0x07
    i32.and

    ;; Get reg value and store it
    call $getReg8
    call $writeMemory
  )

  ;; halt (0x76)
  (func $Halt
    ;; Set the HLT flag
    get_global $stateFlags
    get_global $Z80_STATE_HLT
    i32.or
    set_global $stateFlags

    ;; Decrement PC
    call $getPC
    i32.const 1
    i32.sub
    call $setPC
  )

  ;; add a,Q (0x80, 0x81, 0x82, 0x83, 0x84, 0x85, 0x87)
  ;; Q: B, C, D, E, H, L, A
  (func $AddAQ
    get_global $opCode
    i32.const 0x07
    i32.and
    call $getReg8
    i32.const 0
    call $AluAdd
  )

  ;; add a,(hl) (0x86)
  (func $AddAHLi
    call $getHL
    call $readMemory
    i32.const 0
    call $AluAdd
  )

  ;; add a,Q (0x88, 0x89, 0x8a, 0x8b, 0x8c, 0x8d, 0x8f)
  ;; Q: B, C, D, E, H, L, A
  (func $AdcAQ
    get_global $opCode
    i32.const 0x07
    i32.and
    call $getReg8
    call $getF
    i32.const 0x01 ;; C flag mask
    i32.and
    call $AluAdd
  )

  ;; adc a,(hl) (0x8e)
  (func $AdcAHLi
    call $getHL
    call $readMemory
    call $getF
    i32.const 0x01 ;; C flag mask
    i32.and
    call $AluAdd
  )

  ;; sub Q (0x90, 0x91, 0x92, 0x93, 0x94, 0x95, 0x97)
  ;; Q: B, C, D, E, H, L, A
  (func $SubAQ
    get_global $opCode
    i32.const 0x07
    i32.and
    call $getReg8
    i32.const 0
    call $AluSub
  )

  ;; sub (hl) (0x96)
  (func $SubAHLi
    call $getHL
    call $readMemory
    i32.const 0
    call $AluSub
  )

  ;; sbc a,Q (0x98, 0x99, 0x9a, 0x9b, 0x9c, 0x9d, 0x9f)
  ;; Q: B, C, D, E, H, L, A
  (func $SbcAQ
    get_global $opCode
    i32.const 0x07
    i32.and
    call $getReg8
    call $getF
    i32.const 0x01 ;; C flag mask
    i32.and
    call $AluSub
  )

  ;; sbc a,(hl) (0x9e)
  (func $SbcAHLi
    call $getHL
    call $readMemory
    call $getF
    i32.const 0x01 ;; C flag mask
    i32.and
    call $AluSub
  )

  ;; and Q (0xa0, 0xa1, 0xa2, 0xa3, 0xa4, 0xa5, 0xa7)
  ;; Q: B, C, D, E, H, L, A
  (func $AndAQ
    get_global $opCode
    i32.const 0x07
    i32.and
    call $getReg8
    call $AluAnd
  )

  ;; and (hl) (0xa6)
  (func $AndAHLi
    call $getHL
    call $readMemory
    call $AluAnd
  )

  ;; xor Q (0xa8, 0xa9, 0xaa, 0xab, 0xac, 0xad, 0xaf)
  ;; Q: B, C, D, E, H, L, A
  (func $XorAQ
    get_global $opCode
    i32.const 0x07
    i32.and
    call $getReg8
    call $AluXor
  )

  ;; xor (hl) (0xae)
  (func $XorAHLi
    call $getHL
    call $readMemory
    call $AluXor
  )

  ;; or Q (0xb0, 0xb1, 0xb2, 0xb3, 0xb4, 0xb5, 0xb7)
  ;; Q: B, C, D, E, H, L, A
  (func $OrAQ
    get_global $opCode
    i32.const 0x07
    i32.and
    call $getReg8
    call $AluOr
  )

  ;; or (hl) (0xb6)
  (func $OrAHLi
    call $getHL
    call $readMemory
    call $AluOr
  )

  ;; cp Q (0xb8, 0xb9, 0xba, 0xbb, 0xbc, 0xbd, 0xbf)
  ;; Q: B, C, D, E, H, L, A
  (func $CpAQ
    get_global $opCode
    i32.const 0x07
    i32.and
    call $getReg8
    call $AluCp
  )

  ;; cp (hl) (0xbe)
  (func $CpAHLi
    call $getHL
    call $readMemory
    call $AluCp
  )

  ;; ret nz (0xc0)
  (func $RetNz
    ;; Adjust tacts
    i32.const 1
    call $incTacts
    call $testZ
    if return end

    call $popValue
    call $setWZ
    call $getWZ
    call $setPC
  )

  ;; pop bc (0xc1)
  (func $PopBC
    call $popValue
    call $setBC
  )

  ;; jp nz (0xc2)
  (func $JpNz
    call $readAddrToWZ
    call $testZ
    if return end

    call $getWZ
    call $setPC
  )

  ;; jp (0xc3)
  (func $Jp
    call $readAddrToWZ
    call $getWZ
    call $setPC
  )

  ;; call nz (0xc4)
  (func $CallNz
    call $readAddrToWZ
    call $testZ
    if return end

    ;; Adjust tacts
    get_global $useGateArrayContention
    i32.const 0
    i32.eq
    if
      call $getPC
      call $memoryDelay
    end

    call $getPC
    call $pushValue
    call $getWZ
    call $setPC
  )

  ;; push bc (0xc5)
  (func $PushBC
    call $getBC
    call $pushValue
  )

  ;; add a,N (0xc6)
  (func $AddAN
    call $readCodeMemory
    i32.const 0 ;; No carry
    call $AluAdd
  )

  ;; rst N (0xc7, 0xcf, 0xd7, 0xdf, 0xe7, 0xef, 0xf7, 0xff)
  (func $RstN
    call $getPC
    call $pushValue
    get_global $opCode
    i32.const 0x38
    i32.and
    call $setWZ
    call $getWZ
    call $setPC
  )

  ;; ret nz (0xc8)
  (func $RetZ
    ;; Adjust tacts
    i32.const 1
    call $incTacts

    call $testNZ
    if return end

    call $popValue
    call $setWZ
    call $getWZ
    call $setPC
  )

  ;; ret (0xc9)
  (func $Ret
    call $popValue
    call $setWZ
    call $getWZ
    call $setPC
  )

  ;; jp z (0xca)
  (func $JpZ
    call $readAddrToWZ
    call $testNZ
    if return end

    call $getWZ
    call $setPC
  )

  ;; call z (0xcc)
  (func $CallZ
    call $readAddrToWZ
    call $testNZ
    if return  end

    ;; Adjust tacts
    get_global $useGateArrayContention
    i32.const 0
    i32.eq
    if
      call $getPC
      call $memoryDelay
    end

    call $getPC
    call $pushValue
    call $getWZ
    call $setPC
  )

  ;; call (0xcd)
  (func $CallNN
    call $readAddrToWZ

    ;; Adjust tacts
    get_global $useGateArrayContention
    i32.const 0
    i32.eq
    if
      call $getPC
      call $memoryDelay
    end

    call $getPC
    call $pushValue
    call $getWZ
    call $setPC
  )

  ;; adc a,N (0xce)
  (func $AdcAN
    call $readCodeMemory
    call $getF
    i32.const 1  ;; Get C flag
    i32.and
    call $AluAdd
  )

  ;; ret nc (0xd0)
  (func $RetNc
    ;; Adjust tacts
    i32.const 1
    call $incTacts

    call $testC
    if return end

    call $popValue
    call $setWZ
    call $getWZ
    call $setPC
  )

  ;; pop de (0xd1)
  (func $PopDE
    call $popValue
    call $setDE
  )

  ;; jp nc (0xd2)
  (func $JpNc
    call $readAddrToWZ
    call $testC
    if return end

    call $getWZ
    call $setPC
  )

  ;; out (N),a (0xd3)
  (func $OutNA
    (local $port i32)
    call $readCodeMemory
    call $getA
    i32.const 8
    i32.shl
    i32.add
    tee_local $port
    call $getA
    call $writePort
    get_local $port
    i32.const 1
    i32.add
    call $setWZ
  )

  ;; call nc (0xd4)
  (func $CallNc
    call $readAddrToWZ
    call $testC
    if return end

    ;; Adjust tacts
    get_global $useGateArrayContention
    i32.const 0
    i32.eq
    if
      call $getPC
      call $memoryDelay
    end

    call $getPC
    call $pushValue
    call $getWZ
    call $setPC
  )

  ;; push de (0xd5)
  (func $PushDE
    call $getDE
    call $pushValue
  )

  ;;  sub N (0xd6)
  (func $SubAN
    call $readCodeMemory
    i32.const 0 ;; No carry
    call $AluSub
  )

  ;; ret c (0xd8)
  (func $RetC
    ;; Adjust tacts
    i32.const 1
    call $incTacts

    call $testNC
    if return  end

    call $popValue
    call $setWZ
    call $getWZ
    call $setPC
  )

  ;; exx (0xd9)
  (func $Exx
    (local $tmp i32)
    call $getAF
    set_local $tmp
    get_global $REG_AREA_INDEX
    i32.load16_u offset=8
    call $setAF
    get_global $REG_AREA_INDEX
    get_local $tmp
    i32.store16 offset=8

    call $getBC
    set_local $tmp
    get_global $REG_AREA_INDEX
    i32.load16_u offset=10
    call $setBC
    get_global $REG_AREA_INDEX
    get_local $tmp
    i32.store16 offset=10

    call $getDE
    set_local $tmp
    get_global $REG_AREA_INDEX
    i32.load16_u offset=12
    call $setDE
    get_global $REG_AREA_INDEX
    get_local $tmp
    i32.store16 offset=12

    call $getHL
    set_local $tmp
    get_global $REG_AREA_INDEX
    i32.load16_u offset=14
    call $setHL
    get_global $REG_AREA_INDEX
    get_local $tmp
    i32.store16 offset=14
  )

  ;; jp c (0xda)
  (func $JpC
    call $readAddrToWZ
    call $testNC
    if return end

    call $getWZ
    call $setPC
  )

  ;; in a,(N) (0xdb)
  (func $InAN
    (local $port i32)
    call $readCodeMemory
    call $getA
    i32.const 8
    i32.shl
    i32.add
    tee_local $port
    call $readPort
    call $setA

    get_local $port
    i32.const 1
    i32.add
    call $setWZ
  )

  ;; call c (0xdc)
  (func $CallC
    call $readAddrToWZ
    call $testNC
    if return end

    ;; Adjust tacts
    get_global $useGateArrayContention
    i32.const 0
    i32.eq
    if
      call $getPC
      call $memoryDelay
    end

    call $getPC
    call $pushValue
    call $getWZ
    call $setPC
  )

  ;;  sbc N (0xde)
  (func $SbcAN
    call $readCodeMemory
    call $getF
    i32.const 1  ;; Get C flag
    i32.and
    call $AluSub
  )

  ;; ret po (0xe0)
  (func $RetPo
    ;; Adjust tacts
    i32.const 1
    call $incTacts

    call $testPE
    if return end

    call $popValue
    call $setWZ
    call $getWZ
    call $setPC
  )

  ;; pop hl (0xe1)
  (func $PopHL
    call $popValue
    call $setHL
  )

  ;; jp po (0xe2)
  (func $JpPo
    call $readAddrToWZ
    call $testPE
    if return end

    call $getWZ
    call $setPC
  )

  ;; ex (sp),hl (0xe3)
  (func $ExSPiHL
    (local $tmpSp i32)
    call $getSP
    tee_local $tmpSp
    call $readMemory
    get_local $tmpSp
    i32.const 1
    i32.add
    tee_local $tmpSp
    call $readMemory
    i32.const 8
    i32.shl
    i32.add
    call $setWZ

    ;; Adjust tacts
    get_global $useGateArrayContention
    if
      i32.const 1
      call $incTacts
    else
      get_local $tmpSp
      call $memoryDelay
      i32.const 1
      call $incTacts
    end

    ;; Write H to stack
    get_local $tmpSp
    call $getH
    call $writeMemory

    ;; Write L to stack
    get_local $tmpSp
    i32.const 1
    i32.sub
    tee_local $tmpSp
    call $getL
    call $writeMemory

    ;; Adjust tacts
    get_global $useGateArrayContention
    if
      i32.const 2
      call $incTacts
    else
      get_local $tmpSp
      call $memoryDelay
      i32.const 1
      call $incTacts
      get_local $tmpSp
      call $memoryDelay
      i32.const 1
      call $incTacts
    end

    ;; Copy WZ to HL
    call $getWZ
    call $setHL
  )

  ;; call po (0xe4)
  (func $CallPo
    call $readAddrToWZ
    call $testPE
    if return end

    ;; Adjust tacts
    get_global $useGateArrayContention
    i32.const 0
    i32.eq
    if
      call $getPC
      call $memoryDelay
    end

    call $getPC
    call $pushValue
    call $getWZ
    call $setPC
  )

  ;; push hl (0xe5)
  (func $PushHL
    call $getHL
    call $pushValue
  )

  ;; and a,N (0xe6)
  (func $AndAN
    call $readCodeMemory
    call $AluAnd
  )

  ;; ret pe (0xe8)
  (func $RetPe
    ;; Adjust tacts
    i32.const 1
    call $incTacts

    call $testPO
    if return end

    call $popValue
    call $setWZ
    call $getWZ
    call $setPC
  )

  ;; jp (hl) (0xe9)
  (func $JpHL
    call $getHL
    call $setPC
  )

  ;; jp po (0xea)
  (func $JpPe
    call $readAddrToWZ
    call $testPO
    if return end

    call $getWZ
    call $setPC
  )

  ;; ex de,hl (0xeb)
  (func $ExDEHL
    (local $tmp i32)
    call $getDE
    set_local $tmp
    call $getHL
    call $setDE
    get_local $tmp
    call $setHL
  )

  ;; call pe (0xec)
  (func $CallPe
    call $readAddrToWZ
    call $testPO
    if return end

    ;; Adjust tacts
    get_global $useGateArrayContention
    i32.const 0
    i32.eq
    if
      call $getPC
      call $memoryDelay
    end

    call $getPC
    call $pushValue
    call $getWZ
    call $setPC
  )

  ;; xor a,N (0xee)
  (func $XorAN
    call $readCodeMemory
    call $AluXor
  )

  ;; ret p (0xf0)
  (func $RetP
    ;; Adjust tacts
    i32.const 1
    call $incTacts

    call $testM
    if return end

    call $popValue
    call $setWZ
    call $getWZ
    call $setPC
  )

  ;; pop af (0xf1)
  (func $PopAF
    call $popValue
    call $setAF
  )

  ;; jp p (0xf2)
  (func $JpP
    call $readAddrToWZ
    call $testM
    if return end

    call $getWZ
    call $setPC
  )

  ;; di (0xf3)
  (func $Di
    i32.const 0
    set_global $iff1
    i32.const 0
    set_global $iff2
  )

  ;; call p (0xf4)
  (func $CallP
    call $readAddrToWZ
    call $testM
    if return end

    ;; Adjust tacts
    get_global $useGateArrayContention
    i32.const 0
    i32.eq
    if
      call $getPC
      call $memoryDelay
    end

    call $getPC
    call $pushValue
    call $getWZ
    call $setPC
  )

  ;; push af (0xf5)
  (func $PushAF
    call $getAF
    call $pushValue
  )

  ;; or A,N (0xf6)
  (func $OrAN
    call $readCodeMemory
    call $AluOr
  )

  ;; ret m (0xf8)
  (func $RetM
    ;; Adjust tacts
    i32.const 1
    call $incTacts

    call $testP
    if return end

    call $popValue
    call $setWZ
    call $getWZ
    call $setPC
  )

  ;; ld sp,hl
  (func $LdSPHL
    call $getHL
    call $setSP
    i32.const 2
    call $incTacts
  )

  ;; jp m (0xfa)
  (func $JpM
    call $readAddrToWZ
    call $testP
    if return end

    call $getWZ
    call $setPC
  )

  ;; ei (0xfb)
  (func $Ei
    i32.const 1
    set_global $isInterruptBlocked
    i32.const 1
    set_global $iff1
    i32.const 1
    set_global $iff2
  )

  ;; call m (0xfc)
  (func $CallM
    call $readAddrToWZ
    call $testP
    if return end

    ;; Adjust tacts
    get_global $useGateArrayContention
    i32.const 0
    i32.eq
    if
      call $getPC
      call $memoryDelay
    end

    call $getPC
    call $pushValue
    call $getWZ
    call $setPC
  )

  ;; call cp N (0xfe)
  (func $CpAN
    call $readCodeMemory
    call $AluCp
  )

  ;; ==========================================================================
  ;; Standard operations

  ;; add ix,QQ (0x09)
  (func $AddIXQQ
    (local $qq i32)
    (local $indReg i32)

    ;; Get the IX value
    call $getIndexReg
    tee_local $indReg

    ;; Set WZ to IX + 1
    i32.const 1
    i32.add
    call $setWZ

    ;; IX to the stack
    get_local $indReg

    ;; Get second operand
    get_global $opCode
    i32.const 0x30
    i32.and
    i32.const 4
    i32.shr_u
    tee_local $qq
    i32.const 2
    i32.eq
    if (result i32)
      get_local $indReg
    else
      get_local $qq
      call $getReg16
    end

    ;; Add values
    call $AluAddHL
    call $setIndexReg

    ;; Adjust tacts
    i32.const 7
    call $incTacts
  )

  ;; ld ix,NN (0x21)
  (func $LdIXNN
    call $readAddrFromCode
    call $setIndexReg
  )

  (func $LdNNiIX
    (local $addr i32)
    (local $ix i32)
    ;; Obtain the address to store HL
    call $readAddrFromCode
    tee_local $addr

    ;; Set WZ to addr + 1
    i32.const 1
    i32.add
    call $setWZ

    ;; Store IX
    get_local $addr
    call $getIndexReg
    tee_local $ix
    call $writeMemory
    call $getWZ
    get_local $ix
    i32.const 8
    i32.shr_u
    call $writeMemory
  )

  ;; inc ix (0x23)
  (func $IncIX
    call $getIndexReg
    i32.const 1
    i32.add
    call $setIndexReg
    i32.const 2
    call $incTacts
  )

  ;; inc xh (0x24)
  (func $IncXH
    (local $ix i32)
    (local $v i32)
    ;; Get register value
    call $getIndexReg
    tee_local $ix
    i32.const 8
    i32.shr_u
    tee_local $v

    ;; Increment register value
    i32.const 1
    i32.add
    i32.const 8
    i32.shl
    get_local $ix
    i32.const 0xff
    i32.and
    i32.or
    call $setIndexReg

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

  ;; dec xh (0x25)
  (func $DecXH
    (local $ix i32)
    (local $v i32)
    ;; Get register value
    call $getIndexReg
    tee_local $ix
    i32.const 8
    i32.shr_u
    tee_local $v

    ;; Decrement register value
    i32.const 1
    i32.sub
    i32.const 8
    i32.shl
    get_local $ix
    i32.const 0xff
    i32.and
    i32.or
    call $setIndexReg

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

  ;; ld xh,N (0x26)
  (func $LdXHN
    call $getIndexReg
    i32.const 0xff
    i32.and
    call $readCodeMemory
    i32.const 8
    i32.shl
    i32.or
    call $setIndexReg
  )

  ;; ld ix,(NN) (0x2a)
  (func $LdIXNNi
    (local $addr i32)
    ;; Read the address
    call $readAddrFromCode
    tee_local $addr

    ;; Set WZ to addr + 1
    i32.const 1
    i32.add
    call $setWZ

    ;; Read HL from memory
    get_local $addr
    call $readMemory
    call $getWZ
    call $readMemory
    i32.const 8
    i32.shl
    i32.or
    call $setIndexReg
  )

  ;; dec ix (0x2b)
  (func $DecIX
    call $getIndexReg
    i32.const 1
    i32.sub
    call $setIndexReg
    i32.const 2
    call $incTacts
  )

  ;; inc xl (0x2c)
  (func $IncXL
    (local $ix i32)
    (local $v i32)
    ;; Get register value
    call $getIndexReg
    tee_local $ix
    i32.const 0xff
    i32.and
    tee_local $v

    ;; Increment register value
    i32.const 1
    i32.add
    get_local $ix
    i32.const 0xff00
    i32.and
    i32.or
    call $setIndexReg

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

  ;; dec xl (0x2d)
  (func $DecXL
    (local $ix i32)
    (local $v i32)
    ;; Get register value
    call $getIndexReg
    tee_local $ix
    i32.const 0xff
    i32.and
    tee_local $v

    ;; Increment register value
    i32.const 1
    i32.sub
    get_local $ix
    i32.const 0xff00
    i32.and
    i32.or
    call $setIndexReg

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

  ;; ld xl,N (0x2e)
  (func $LdXLN
    call $getIndexReg
    i32.const 0xff00
    i32.and
    call $readCodeMemory
    i32.or
    call $setIndexReg
  )

  ;; inc (ix+d) (0x34)
  (func $IncIXi
    (local $v i32)
    (local $addr i32)
    call $getIndexedAddress
    tee_local $addr
    call $readMemory
    set_local $v
    call $AdjustIXTact

    ;; Increment value
    get_local $addr
    get_local $v
    i32.const 1
    i32.add
    call $writeMemory
    i32.const 1
    call $incTacts

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

    ;; dec (ix+d) (0x35)
  (func $DecIXi
    (local $v i32)
    (local $addr i32)

    call $getIndexedAddress
    tee_local $addr
    call $readMemory
    set_local $v
    call $AdjustIXTact

    ;; Increment value
    get_local $addr
    get_local $v
    i32.const 1
    i32.sub
    call $writeMemory
    i32.const 1
    call $incTacts

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

  ;; ld (ix+d),B (0x36)
  (func $LdIXiN
    call $getIndexedAddress
    call $readCodeMemory

    ;; Adjust tacts
    get_global $useGateArrayContention
    if
      i32.const 2
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
    end

    ;; Store value
    call $writeMemory
  )

  ;; ld Q,xh (0x44)
  ;; Q, W: B, C, D, E, H, L, A
  (func $LdQXH
    ;; Get 8-bit Q reg index
    get_global $opCode
    i32.const 0x38
    i32.and
    i32.const 3
    i32.shr_u
    call $getIndexReg
    i32.const 8
    i32.shr_u
    call $setReg8
  )

  ;; ld Q,xl (0x45)
  ;; Q, W: B, C, D, E, H, L, A
  (func $LdQXL
    ;; Get 8-bit Q reg index
    get_global $opCode
    i32.const 0x38
    i32.and
    i32.const 3
    i32.shr_u
    call $getIndexReg
    i32.const 0xff
    i32.and
    call $setReg8
  )

  ;; ld Q,(ix+d)
  ;; Q: B, C, D, E, H, L, A
  (func $LdQIXi
    ;; Get 8-bit Q reg index
    get_global $opCode
    i32.const 0x38
    i32.and
    i32.const 3
    i32.shr_u

    ;; Get address
    call $getIndexedAddress
    call $AdjustIXTact

    ;; Get data from memory and store it
    call $readMemory
    call $setReg8
  )

  ;; ld (ix+d),Q
  ;; Q: B, C, D, E, H, L, A
  (func $LdIXiQ
    call $getIndexedAddress
    call $AdjustIXTact

    ;; Get 8-bit Q reg index
    get_global $opCode
    i32.const 0x07
    i32.and

    ;; Get reg value and store it
    call $getReg8
    call $writeMemory
  )

  ;; add a,xh (0x84)
  (func $AddAXH
    call $getIndexReg
    i32.const 8
    i32.shr_u
    i32.const 0
    call $AluAdd
  )

  ;; add a,xl (0x85)
  (func $AddAXL
    call $getIndexReg
    i32.const 0xff
    i32.and
    i32.const 0
    call $AluAdd
  )

  ;; add a,(ix+d) (0x86)
  (func $AddAIXi
    call $getIndexedAddress
    call $AdjustIXTact
    call $readMemory
    i32.const 0
    call $AluAdd
  )

  ;; adc a,xh (0x8c)
  (func $AdcAXH
    call $getIndexReg
    i32.const 8
    i32.shr_u
    call $getF
    i32.const 1
    i32.and
    call $AluAdd
  )

  ;; adc a,xl (0x8d)
  (func $AdcAXL
    call $getIndexReg
    i32.const 0xff
    i32.and
    call $getF
    i32.const 1
    i32.and
    call $AluAdd
  )

  ;; adc a,(ix+d) (0x8e)
  (func $AdcAIXi
    call $getIndexedAddress
    call $AdjustIXTact
    call $readMemory
    call $getF
    i32.const 1
    i32.and
    call $AluAdd
  )

  ;; sub a,xh (0x94)
  (func $SubAXH
    call $getIndexReg
    i32.const 8
    i32.shr_u
    i32.const 0
    call $AluSub
  )

  ;; sub a,xl (0x95)
  (func $SubAXL
    call $getIndexReg
    i32.const 0xff
    i32.and
    i32.const 0
    call $AluSub
  )

  ;; sub a,(ix+d) (0x96)
  (func $SubAIXi
    call $getIndexedAddress
    call $AdjustIXTact
    call $readMemory
    i32.const 0
    call $AluSub
  )

  ;; sbc a,xh (0x9c)
  (func $SbcAXH
    call $getIndexReg
    i32.const 8
    i32.shr_u
    call $getF
    i32.const 1
    i32.and
    call $AluSub
  )

  ;; sbc a,xl (0x9d)
  (func $SbcAXL
    call $getIndexReg
    i32.const 0xff
    i32.and
    call $getF
    i32.const 1
    i32.and
    call $AluSub
  )

  ;; sub a,(ix+d) (0x9e)
  (func $SbcAIXi
    call $getIndexedAddress
    call $AdjustIXTact
    call $readMemory
    call $getF
    i32.const 1
    i32.and
    call $AluSub
  )

  ;; and a,xh (0xa4)
  (func $AndAXH
    call $getIndexReg
    i32.const 8
    i32.shr_u
    call $AluAnd
  )

  ;; and a,xl (0xa5)
  (func $AndAXL
    call $getIndexReg
    i32.const 0xff
    i32.and
    call $AluAnd
  )

  ;; and a,(ix+d) (0x9e)
  (func $AndAIXi
    call $getIndexedAddress
    call $AdjustIXTact
    call $readMemory
    call $AluAnd
  )

  ;; xor a,xh (0xac)
  (func $XorAXH
    call $getIndexReg
    i32.const 8
    i32.shr_u
    call $AluXor
  )

  ;; xor a,xl (0xad)
  (func $XorAXL
    call $getIndexReg
    i32.const 0xff
    i32.and
    call $AluXor
  )

  ;; xor a,(ix+d) (0xae)
  (func $XorAIXi
    call $getIndexedAddress
    call $AdjustIXTact
    call $readMemory
    call $AluXor
  )

  ;; or a,xh (0xb4)
  (func $OrAXH
    call $getIndexReg
    i32.const 8
    i32.shr_u
    call $AluOr
  )

  ;; or a,xl (0xb5)
  (func $OrAXL
    call $getIndexReg
    i32.const 0xff
    i32.and
    call $AluOr
  )

  ;; or a,(ix+d) (0xb6)
  (func $OrAIXi
    call $getIndexedAddress
    call $AdjustIXTact
    call $readMemory
    call $AluOr
  )

  ;; cp xh (0xbc)
  (func $CpAXH
    call $getIndexReg
    i32.const 8
    i32.shr_u
    call $AluCp
  )

  ;; cp xl (0xbd)
  (func $CpAXL
    call $getIndexReg
    i32.const 0xff
    i32.and
    call $AluCp
  )

  ;; cp (ix+d) (0xbe)
  (func $CpAIXi
    call $getIndexedAddress
    call $AdjustIXTact
    call $readMemory
    call $AluCp
  )

  ;; pop ix (0xe1)
  (func $PopIX
    call $popValue
    call $setIndexReg
  )

    ;; ex (sp),ix (0xe3)
  (func $ExSPiIX
    (local $tmpSp i32)
    call $getSP
    tee_local $tmpSp
    call $readMemory
    get_local $tmpSp
    i32.const 1
    i32.add
    tee_local $tmpSp
    call $readMemory
    i32.const 8
    i32.shl
    i32.add
    call $setWZ

    ;; Adjust tacts
    get_global $useGateArrayContention
    if
      i32.const 1
      call $incTacts
    else
      get_local $tmpSp
      call $memoryDelay
      i32.const 1
      call $incTacts
    end

    ;; Write H to stack
    get_local $tmpSp
    call $getIndexReg
    i32.const 8
    i32.shr_u
    call $writeMemory

    ;; Write L to stack
    get_local $tmpSp
    i32.const 1
    i32.sub
    tee_local $tmpSp
    call $getIndexReg
    i32.const 0xff
    i32.and
    call $writeMemory

    ;; Adjust tacts
    get_global $useGateArrayContention
    if
      i32.const 2
      call $incTacts
    else
      get_local $tmpSp
      call $memoryDelay
      i32.const 1
      call $incTacts
      get_local $tmpSp
      call $memoryDelay
      i32.const 1
      call $incTacts
    end

    ;; Copy WZ to IX
    call $getWZ
    call $setIndexReg
  )

  ;; push ix (0xe5)
  (func $PushIX
    call $getIndexReg
    call $pushValue
  )

  ;; jp (ix) (0xe9)
  (func $JpIX
    call $getIndexReg
    call $setPC
  )

  ;; ld sp,ix (0xf9)
  (func $LdSPIX
    call $getIndexReg
    call $setSP
    i32.const 2
    call $incTacts
  )

  ;; ==========================================================================
  ;; Extended instructions

  ;; swapnib (0x23)
  (func $SwapNib
    get_global $allowExtendedSet
    i32.const 0
    i32.eq
    if return end    

    call $getA
    i32.const 4
    i32.shl
    call $getA
    i32.const 4
    i32.shr_u
    i32.or
    call $setA
  )

  ;; mirror (0x24)
  (func $Mirror
    (local $a i32)
    (local $newA i32)
    get_global $allowExtendedSet
    i32.const 0
    i32.eq
    if return end    

    i32.const 0
    set_local $newA
    call $getA
    i32.const 0xff00
    i32.or
    set_local $a
    loop $mirror_loop
      ;; Get the rightmost bit of A
      get_local $a
      i32.const 0x01
      i32.and

      ;; Pull it into new A from right
      get_local $newA
      i32.const 1
      i32.shl
      i32.or
      set_local $newA

      ;; Shift A
      get_local $a
      i32.const 1
      i32.shr_u
      tee_local $a

      ;; Test branch condition
      i32.const 0xff00
      i32.and
      br_if $mirror_loop
    end

    get_local $newA
    call $setA
  )

  ;; test N (0x27)
  (func $TestN
    (local $a i32)
    get_global $allowExtendedSet
    i32.const 0
    i32.eq
    if return end    

    call $getA
    set_local $a

    call $readCodeMemory
    call $AluAnd

    get_local $a
    call $setA
  )

  ;; bsla de,b (0x28)
  (func $Bsla
    get_global $allowExtendedSet
    i32.const 0
    i32.eq
    if return end    

    call $getDE
    call $getB
    i32.const 0x07
    i32.and
    i32.shl
    call $setDE
  )

  ;; bsra de,b (0x29)
  (func $Bsra
    get_global $allowExtendedSet
    i32.const 0
    i32.eq
    if return end    

    call $getDE
    i32.const 0x8000
    i32.and
    call $getDE
    call $getB
    i32.const 0x07
    i32.and
    i32.shr_u
    i32.or
    call $setDE
  )

  ;; bsrl de,b (0x2a)
  (func $Bsrl
    get_global $allowExtendedSet
    i32.const 0
    i32.eq
    if return end    

    call $getDE
    call $getB
    i32.const 0x07
    i32.and
    i32.shr_u
    call $setDE
  )

  ;; bsrf de,b (0x2b)
  (func $Bsrf
    get_global $allowExtendedSet
    i32.const 0
    i32.eq
    if return end    

    call $getDE
    i32.const 0xffff
    i32.xor
    call $getB
    i32.const 0x0f
    i32.and
    i32.shr_u
    i32.const 0xffff
    i32.xor
    call $setDE
  )

  ;; brlc de,b (0x2c)
  (func $Brlc
    get_global $allowExtendedSet
    i32.const 0
    i32.eq
    if return end    

    call $getDE
    call $getB
    i32.const 0x0f
    i32.and
    i32.shl

    call $getDE
    i32.const 16
    call $getB
    i32.const 0x0f
    i32.and
    i32.sub
    i32.shr_u
    i32.or
    call $setDE
  )

  ;; mul (0x30)
  (func $Mul
    get_global $allowExtendedSet
    i32.const 0
    i32.eq
    if return end    

    call $getD
    call $getE
    i32.mul
    call $setDE
  )

  ;; add hl,a (0x31)
  (func $AddHLA
    get_global $allowExtendedSet
    i32.const 0
    i32.eq
    if return end    

    call $getHL
    call $getA
    i32.add
    call $setHL
  )

  ;; add de,a (0x32)
  (func $AddDEA
    get_global $allowExtendedSet
    i32.const 0
    i32.eq
    if return end    

    call $getDE
    call $getA
    i32.add
    call $setDE
  )

  ;; add bc,a (0x33)
  (func $AddBCA
    get_global $allowExtendedSet
    i32.const 0
    i32.eq
    if return end    

    call $getBC
    call $getA
    i32.add
    call $setBC
  )

  ;; add hl,NN (0x34)
  (func $AddHLNN
    get_global $allowExtendedSet
    i32.const 0
    i32.eq
    if return end    

    call $getHL
    call $readAddrFromCode
    i32.add
    call $setHL
    i32.const 2
    call $incTacts
  )

  ;; add de,NN (0x35)
  (func $AddDENN
    get_global $allowExtendedSet
    i32.const 0
    i32.eq
    if return end    

    call $getDE
    call $readAddrFromCode
    i32.add
    call $setDE
    i32.const 2
    call $incTacts
  )

  ;; add bc,NN (0x36)
  (func $AddBCNN
    get_global $allowExtendedSet
    i32.const 0
    i32.eq
    if return end    

    call $getBC
    call $readAddrFromCode
    i32.add
    call $setBC
    i32.const 2
    call $incTacts
  )

  ;; in Q,(c) (0x40)
  (func $InQC
    (local $q i32)
    (local $pval i32)
    ;; WZ := BC +1
    call $getBC
    i32.const 1
    i32.add
    call $setWZ

    ;; Get reg index
    get_global $opCode
    i32.const 3
    i32.shr_u
    i32.const 0x07
    i32.and
    set_local $q

    ;; Read the port
    call $getBC
    call $readPort
    set_local $pval

    ;; Should store?
    get_local $q
    i32.const 6
    i32.ne
    if
      get_local $q
      get_local $pval
      call $setReg8
    end

    ;; Adjust flags
    get_global $LOG_FLAGS
    get_local $pval
    i32.add
    i32.load8_u
    call $getF
    i32.const 0x01 ;; Mask for C flag
    i32.and
    i32.or
    call $setF
  )

  ;; out (c),Q (0x41)
  (func $OutCQ
    (local $q i32)
    ;; WZ := BC +1
    call $getBC
    i32.const 1
    i32.add
    call $setWZ

    ;; Port number
    call $getBC

    ;; Get reg index
    get_global $opCode
    i32.const 3
    i32.shr_u
    i32.const 0x07
    i32.and
    tee_local $q

    ;; Should output?
    i32.const 6
    i32.eq
    if (result i32)
      i32.const 0
    else
      get_local $q
      call $getReg8
    end
    
    call $writePort
  )

  ;; sbc hl,QQ
  (func $SbcHLQQ
    ;; WZ := HL + 1
    call $getHL
    i32.const 1
    i32.add
    call $setWZ

    ;; Calculate HL
    get_global $opCode
    i32.const 0x30
    i32.and
    i32.const 4
    i32.shr_u
    call $getReg16
    call $AluSbcHL

    ;; Adjust tacts
    i32.const 7
    call $incTacts
  )

  ;; ld (NN),QQ 
  (func $LdNNiQQ
    (local $qq i32)
    (local $addr i32)

    ;; Obtain address
    call $readAddrFromCode
    tee_local $addr
    i32.const 1
    i32.add
    call $setWZ

    ;; Obtain reg value
    get_global $opCode
    i32.const 0x30
    i32.and
    i32.const 4
    i32.shr_u
    call $getReg16
    set_local $qq

    get_local $addr
    get_local $qq
    i32.const 0xff
    i32.and
    call $writeMemory
    call $getWZ
    get_local $qq
    i32.const 8
    i32.shr_u
    call $writeMemory
  )

  ;; neg
  (func $Neg
    (local $a i32)
    ;; Calc the new value of A
    i32.const 0
    call $getA
    i32.sub
    i32.const 0xff
    i32.and
    tee_local $a

    ;; Keep S, R5, R3
    i32.const 0xA8 ;; Mask for S|R5|R3
    i32.and ;; (S|R5|R3)
    ;; Set N
    i32.const 0x02 ;; (S|R5|R3, N)

    ;; Calculate Z
    i32.const 0x00
    i32.const 0x40
    get_local $a
    i32.const 0
    i32.ne
    select ;; (S|R5|R3, N, Z)

    ;; Calculate C
    i32.const 0x01
    i32.const 0x00
    get_local $a
    i32.const 0
    i32.ne
    select ;; (S|R5|R3, N, Z, C)

    ;; Calculate PV
    i32.const 0x04
    i32.const 0x00
    get_local $a
    i32.const 0x80
    i32.eq
    select ;; (S|R5|R3, N, Z, C, PV)

    ;; Calculate H
    i32.const 0
    call $getA
    i32.const 0x0f
    i32.and
    i32.const 24
    i32.shl
    i32.const 24
    i32.shr_s
    i32.sub
    i32.const 0x10
    i32.and ;; (S|R5|R3, N, Z, C, PV, H)

    ;; Merge flags
    i32.or
    i32.or
    i32.or
    i32.or
    i32.or
    call $setF

    ;; Store the result
    get_local $a
    call $setA
  )

  ;; retn/reti
  (func $Retn
    get_global $iff2
    set_global $iff1
    call $popValue
    call $setWZ
    call $getWZ
    call $setPC
  )

  ;; im N
  (func $ImN
    (local $mode i32)
    get_global $opCode
    i32.const 0x18
    i32.and
    i32.const 3
    i32.shr_u
    tee_local $mode
    i32.const 2
    i32.lt_u
    if (result i32)
      i32.const 1
    else
      get_local $mode
    end
    i32.const 1
    i32.sub
    set_global $interruptMode
  )

  ;; ld i,a 0x47
  (func $LdIA
    call $getA
    call $setI    
    i32.const 1
    call $incTacts
  )

  ;; adc hl,QQ
  (func $AdcHLQQ
    ;; WZ := HL + 1
    call $getHL
    i32.const 1
    i32.add
    call $setWZ

    ;; Calculate HL
    get_global $opCode
    i32.const 0x30
    i32.and
    i32.const 4
    i32.shr_u
    call $getReg16
    call $AluAdcHL

    ;; Adjust tacts
    i32.const 7
    call $incTacts
  )

  ;; ld bc,(NN) (0x4b)
  (func $LdQQNNi
    (local $addr i32)
    (local $reg i32)
    ;; Get the mamory address
    call $readAddrFromCode
    tee_local $addr

    ;; WZ := addr + 1
    i32.const 1
    i32.add
    call $setWZ

    ;; Get reg value
    get_global $opCode
    i32.const 0x30
    i32.and
    i32.const 4
    i32.shr_u ;; (16-bit reg_index)

    get_local $addr
    call $readMemory
    call $getWZ
    call $readMemory
    i32.const 8
    i32.shl
    i32.or

    ;; Store value
    call $setReg16
  )

  ;; ld r,a 0x4f
  (func $LdRA
    call $getA
    call $setR    
    i32.const 1
    call $incTacts
  )

  ;; ld a,i (0x57)
  (func $LdAXr
    (local $xr i32)
    get_global $opCode
    i32.const 0x08
    i32.and
    if (result i32)
      call $getR
    else
      call $getI
    end
    tee_local $xr
    call $setA

    ;; Set flags
    call $getF
    i32.const 0x01 ;; Mask for C
    i32.and ;; (C)

    get_local $xr
    i32.const 0xa8 ;; S|R5|R3
    i32.and  ;; (C, S|R5|R3)

    i32.const 0x04
    i32.const 0x00
    get_global $iff2
    select  ;; (C, S|R5|R3, PV)

    i32.const 0x00
    i32.const 0x40
    get_local $xr
    select  ;; (C, S|R5|R3, PV, Z)

    ;; Merge flags
    i32.or
    i32.or
    i32.or
    call $setF

    ;; Adjust tacts
    i32.const 1
    call $incTacts
  )

  ;; rrd (0x67)
  (func $Rrd
    (local $hl i32)
    (local $tmp i32)
    call $getHL
    tee_local $hl
    call $readMemory
    set_local $tmp

    ;; Adjust tacts
    get_global $useGateArrayContention
    if
      i32.const 4
      call $incTacts
    else
      get_local $hl
      call $memoryDelay
      i32.const 1
      call $incTacts
      get_local $hl
      call $memoryDelay
      i32.const 1
      call $incTacts
      get_local $hl
      call $memoryDelay
      i32.const 1
      call $incTacts
      get_local $hl
      call $memoryDelay
      i32.const 1
      call $incTacts
    end
  
    ;; WZ := HL + 1
    get_local $hl
    i32.const 1
    i32.add
    call $setWZ

    ;; Write back to memory
    call $getHL
    call $getA
    i32.const 4
    i32.shl
    get_local $tmp
    i32.const 4
    i32.shr_u
    i32.or
    call $writeMemory

    ;; Set A
    call $getA
    i32.const 0xf0
    i32.and
    get_local $tmp
    i32.const 0x0f
    i32.and
    i32.or
    call $setA

    ;; Adjust flags
    get_global $LOG_FLAGS
    call $getA
    i32.add
    i32.load8_u

    ;; Keep C
    call $getF
    i32.const 0x01 ;; C flag mask
    i32.and
    i32.or
    call $setF
  )

  ;; rld (0x6f)
  (func $Rld
    (local $hl i32)
    (local $tmp i32)
    call $getHL
    tee_local $hl
    call $readMemory
    set_local $tmp

    ;; Adjust tacts
    get_global $useGateArrayContention
    if
      i32.const 4
      call $incTacts
    else
      get_local $hl
      call $memoryDelay
      i32.const 1
      call $incTacts
      get_local $hl
      call $memoryDelay
      i32.const 1
      call $incTacts
      get_local $hl
      call $memoryDelay
      i32.const 1
      call $incTacts
      get_local $hl
      call $memoryDelay
      i32.const 1
      call $incTacts
    end
  
    ;; WZ := HL + 1
    get_local $hl
    i32.const 1
    i32.add
    call $setWZ

    ;; Write back to memory
    call $getHL
    call $getA
    i32.const 0x0f
    i32.and
    get_local $tmp
    i32.const 4
    i32.shl
    i32.or
    call $writeMemory

    ;; Set A
    call $getA
    i32.const 0xf0
    i32.and
    get_local $tmp
    i32.const 4
    i32.shr_u
    i32.or
    call $setA

    ;; Adjust flags
    get_global $LOG_FLAGS
    call $getA
    i32.add
    i32.load8_u

    ;; Keep C
    call $getF
    i32.const 0x01 ;; C flag mask
    i32.and
    i32.or
    call $setF
  )

  ;; push NN (0x8a)
  (func $PushNN
    (local $v i32)
    get_global $allowExtendedSet
    i32.const 0
    i32.eq
    if return end    

    call $readAddrFromCode
    set_local $v
    call $decSP
    call $getSP
    get_local $v
    i32.const 8
    i32.shr_u
    call $writeMemory
    call $decSP
    call $getSP
    get_local $v
    call $writeMemory
  )

  ;; outinb (0x90)
  (func $OutInB
    (local $hl i32)
    get_global $allowExtendedSet
    i32.const 0
    i32.eq
    if return end

    ;; Adjust tacts
    i32.const 1
    call $incTacts

    ;; Write (HL) to port BC
    call $getBC
    call $getHL
    tee_local $hl
    call $readMemory
    call $writePort

    ;; Increment HL
    get_local $hl
    i32.const 1
    i32.add
    call $setHL
  )

  ;; nextreg (0x91)
  (func $NextReg
    get_global $allowExtendedSet
    i32.const 0
    i32.eq
    if return end

    ;; Write TBBLUE index register
    call $readCodeMemory
    call $writeTbBlueIndex

    ;; Write TBBLUE value register
    call $readCodeMemory
    call $writeTbBlueValue
  )

  ;; nextreg A (0x92)
  (func $NextRegA
    get_global $allowExtendedSet
    i32.const 0
    i32.eq
    if return end

    ;; Write TBBLUE index register
    call $readCodeMemory
    call $writeTbBlueIndex

    ;; Write TBBLUE value register
    call $getA
    call $writeTbBlueValue
  )

  ;; pixeldn (0x93)
  (func $PixelDn
    (local $hl i32)
    get_global $allowExtendedSet
    i32.const 0
    i32.eq
    if return end

    call $getHL
    tee_local $hl
    i32.const 0x0700
    i32.and
    i32.const 0x0700
    i32.ne
    if (result i32)
      ;; Next pixel row within a character row
      get_local $hl
      i32.const 0x100
      i32.add
    else
     get_local $hl
     i32.const 0xe0
     i32.and
     i32.const 0xe0
     i32.ne
     if (result i32)
       ;; The start of next character row
       get_local $hl
       i32.const 0xf8ff
       i32.and
       i32.const 0x20
       i32.add
     else
       ;; The start of the next screen-third
       get_local $hl
       i32.const 0xf81f
       i32.and
       i32.const 0x0800
       i32.add
     end
    end

    ;; Done
    call $setHL
  )

  ;; pixelad (0x94)
  (func $PixelAd
    (local $d i32)
    get_global $allowExtendedSet
    i32.const 0
    i32.eq
    if return end

    call $getD

    ;; (D & 0xc0) << 5
    tee_local $d
    i32.const 0xc0
    i32.and
    i32.const 5
    i32.shl

    ;; (D & 0x07) << 8
    get_local $d
    i32.const 0x07
    i32.and
    i32.const 8
    i32.shl

    ;; (D & 0x38) << 2
    get_local $d
    i32.const 0x38
    i32.and
    i32.const 2
    i32.shl

    ;; E >> 3
    call $getE
    i32.const 3
    i32.shr_u

    ;; Calculate the address
    i32.const 0x4000
    i32.add
    i32.add
    i32.add
    i32.add
    call $setHL
  )

  ;; setae (0x96)
  (func $SetAE
    get_global $allowExtendedSet
    i32.const 0
    i32.eq
    if return end

    i32.const 0x80
    call $getE
    i32.const 0x07
    i32.and
    i32.shr_u
    call $setA
  )

  ;; jp (c) (0x98)
  (func $JpInC
    (local $bc i32)
    get_global $allowExtendedSet
    i32.const 0
    i32.eq
    if return end

    call $getBC
    tee_local $bc
    i32.const 1
    i32.add
    call $setWZ

    get_local $bc
    call $readPort
    i32.const 6
    i32.shl

    call $getPC
    i32.const 0xc000
    i32.and
    i32.add
    call $setPC

    i32.const 1
    call $incTacts
  )

  ;; Implements the core of the ldi/ldd/ldir/lddr operations
  ;; $step: direction (1 or -1)
  ;; result: the value of flags
  (func $LdBase (param $step i32) (result i32)
    (local $de i32)
    (local $hl i32)
    (local $memVal i32)
    
    ;; (DE) := (HL)
    call $getDE
    tee_local $de
    call $getHL
    tee_local $hl
    call $readMemory
    tee_local $memVal
    call $writeMemory

    ;; Increment/decrement HL
    get_local $hl
    get_local $step
    i32.add
    call $setHL

    ;; Adjust tacts
    get_global $useGateArrayContention
    if
      i32.const 2
      call $incTacts
    else
      get_local $de
      call $memoryDelay
      i32.const 1
      call $incTacts
      get_local $de
      call $memoryDelay
      i32.const 1
      call $incTacts
    end

    ;; Increment/decrement DE
    get_local $de
    get_local $step
    i32.add
    call $setDE

    ;; Keep S, Z, and C
    call $getF
    i32.const 0xc1 ;; Mask for S, Z, C
    i32.and ;; (S|Z|C)

    get_local $memVal
    call $getA
    i32.add
    tee_local $memVal
    i32.const 0x08 ;; Mask for R3
    i32.and
    get_local $memVal
    i32.const 4
    i32.shl
    i32.const 0x20 ;; Mask for R5
    i32.and
    i32.or ;; (S|Z|C, R5|R3)
    i32.or

    ;; Decrement BC
    call $getBC
    i32.const 1
    i32.sub
    call $setBC
  )

  ;; ldi (0xa0)
  (func $Ldi
    i32.const 1
    call $LdBase
    
    ;; Calc PV
    i32.const 0x04
    i32.const 0x00
    call $getBC
    i32.const 0
    i32.ne
    select

    ;; Merge flags
    i32.or
    call $setF
  )

  (func $CpBase (param $step i32) (result i32)
    (local $hl i32)
    (local $compRes i32)
    (local $r3r5 i32)
    call $getA
    call $getHL
    tee_local $hl
    call $readMemory

    ;; Calc compRes
    i32.sub
    tee_local $compRes
    set_local $r3r5
    
    ;; Keep C 
    call $getF
    i32.const 0x01
    i32.and ;; (C)

    ;; Set N
    i32.const 0x02 ;; (C, N)

    ;; Calculate H
    call $getA
    i32.const 0x0f
    i32.and
    get_local $compRes
    i32.const 0x0f
    i32.and
    i32.sub
    i32.const 0x10
    i32.and
    if (result i32) ;; (C, N, H)
      get_local $compRes
      i32.const 1
      i32.sub
      set_local $r3r5
      i32.const 0x10
    else
      i32.const 0x00
    end

    ;; Calculate Z
    i32.const 0x00
    i32.const 0x40
    get_local $compRes
    i32.const 0xff
    i32.and
    select ;; (C, N, H, Z)

    ;; Calculate S
    get_local $compRes
    i32.const 0x80
    i32.and ;; (C, N, H, Z, S)

    ;; Calc R3
    get_local $r3r5
    i32.const 0x08
    i32.and ;; (C, N, H, Z, S, R3)

    ;; Calc R5
    get_local $r3r5
    i32.const 4
    i32.shl
    i32.const 0x20
    i32.and ;; (C, N, H, Z, S, R3,R5)

    ;; Adjust tacts
    get_local $hl
    call $Adjust5Tacts

    ;; Increment/decrement HL
    get_local $hl
    get_local $step
    i32.add
    call $setHL

    ;; Decrement BC
    call $getBC
    i32.const 1
    i32.sub
    call $setBC

    ;; Merge flags
    i32.or
    i32.or
    i32.or
    i32.or
    i32.or
    i32.or
  )
  
  ;; cpi (0xa1)
  (func $Cpi
    i32.const 1
    call $CpBase

    ;; Calc PV
    i32.const 0x04
    i32.const 0x00
    call $getBC
    i32.const 0
    i32.ne
    select

    ;; Merge flags
    i32.or
    call $setF

    call $getHL
    call $setWZ
  )

  (func $InBase (param $step i32)
    (local $bc i32)
    (local $hl i32)
    i32.const 1
    call $incTacts
    call $getBC
    tee_local $bc
    i32.const 1
    i32.add
    call $setWZ

    ;; (HL) := in(BC)
    call $getHL
    tee_local $hl
    get_local $bc
    call $readPort
    call $writeMemory

    ;; Set N
    call $getF
    i32.const 0x02
    i32.or
    call $setF

    ;; Decrement B
    call $getB
    i32.const 1
    i32.sub
    tee_local $bc
    call $setB

    ;; Set or reset Z
    get_local $bc
    i32.const 0
    i32.eq
    if (result i32)
      call $getF
      i32.const 0x40
      i32.or
    else
      call $getF
      i32.const 0xbf
      i32.and
    end
    call $setF

    ;; Increment or decrement HL
    call $getHL
    get_local $step
    i32.add
    call $setHL
  )

  ;; ini (0xa2)
  (func $Ini
    i32.const 1
    call $InBase
  )

  (func $OutBase (param $step i32)
    (local $f i32)
    (local $b i32)
    (local $hl i32)
    i32.const 1
    call $incTacts

    ;; Set N
    call $getF
    tee_local $f
    i32.const 0x02
    i32.or
    set_local $f

    ;; Decrement B
    call $getB
    i32.const 1
    i32.sub
    tee_local $b
    call $setB
    get_local $b

    ;; Set or reset Z
    i32.const 0
    i32.eq
    if (result i32)
      get_local $f
      i32.const 0x40
      i32.or
    else
      get_local $f
      i32.const 0xbf
      i32.and
    end
    call $setF

    ;; Write port
    call $getBC
    tee_local $b
    call $getHL
    tee_local $hl
    call $readMemory
    call $writePort

    ;; Increment/decrement HL
    get_local $hl
    get_local $step
    i32.add
    call $setHL

    ;; WZ := BC + 1
    get_local $b
    i32.const 1
    i32.add
    call $setWZ
  )

  ;; outi (0xa3)
  (func $Outi
    i32.const 1
    call $OutBase
  )

  (func $LdxBase (param $step i32)
    (local $de i32)
    (local $hl i32)
    (local $memVal i32)

    ;; Obtain DE
    call $getDE
    set_local $de

    ;; Conditional copy from (HL) to (DE)
    call $getHL
    tee_local $hl
    call $readMemory
    tee_local $memVal
    call $getA
    i32.ne
    if
      get_local $de
      get_local $memVal
      call $writeMemory
      i32.const 2
      call $incTacts
    else
      i32.const 5
      call $incTacts
    end

    ;; Prepare for loop
    get_local $hl
    get_local $step
    i32.add
    call $setHL

    get_local $de
    get_local $step
    i32.add
    call $setDE

    call $getBC
    i32.const 1
    i32.sub
    call $setBC
  )

  ;; ldix (0x0a4)
  (func $Ldix
    get_global $allowExtendedSet
    i32.const 0
    i32.eq
    if return end

    i32.const 1
    call $LdxBase
  )

  ;; ldws
  (func $Ldws
    (local $v i32)
    get_global $allowExtendedSet
    i32.const 0
    i32.eq
    if return end

    ;; (HL) := (DE)
    call $getDE
    call $getHL
    call $readMemory
    call $writeMemory

    ;; Increment L
    call $getL
    i32.const 1
    i32.add
    call $setL

    ;; Increment D
    call $getD
    tee_local $v
    i32.const 1
    i32.add
    call $setD

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

  ;; ldd (0xa8)
  (func $Ldd
    i32.const -1
    call $LdBase
    
    ;; Calc PV
    i32.const 0x04
    i32.const 0x00
    call $getBC
    i32.const 0
    i32.ne
    select

    ;; Merge flags
    i32.or
    call $setF
  )

  ;; cpd (0xa9)
  (func $Cpd
    i32.const -1
    call $CpBase

    ;; Calc PV
    i32.const 0x04
    i32.const 0x00
    call $getBC
    i32.const 0
    i32.ne
    select

    ;; Merge flags
    i32.or
    call $setF

    call $getHL
    call $setWZ
  )

  ;; ind (0xaa)
  (func $Ind
    i32.const -1
    call $InBase
  )

  ;; outd (0xab)
  (func $Outd
    i32.const -1
    call $OutBase
  )

  ;; lddx (0x0ac)
  (func $Lddx
    get_global $allowExtendedSet
    i32.const 0
    i32.eq
    if return end

    i32.const -1
    call $LdxBase
  )

  (func $LdrTail
    (local $pc i32)

    ;; Test exit
    call $getBC
    i32.const 0
    i32.eq
    if return end

    ;; Set PV
    call $getF
    i32.const 0x04 ;; PV flag
    i32.or
    call $setF

    ;; PC := PC - 2
    call $getPC
    i32.const 2
    i32.sub
    tee_local $pc
    call $setPC

    ;; Adjust tacts
    call $getDE
    i32.const 1
    i32.sub
    call $Adjust5Tacts

    ;; WZ := PC + 1
    get_local $pc
    i32.const 1
    i32.add
    call $setWZ
  )

  ;; ldir (0xb0)
  (func $Ldir
    i32.const 1
    call $LdBase
    call $setF
    call $LdrTail
  )

  (func $CprTail
    (local $f i32)
    (local $pc i32)
    call $getBC
    if
      ;; Set PV
      call $getF
      tee_local $f
      i32.const 0x04
      i32.or
      call $setF
      get_local $f
      i32.const 0x40 ;; Mask for Z
      i32.and
      i32.const 0
      i32.eq
      if
        ;; Value not found yet
        ;; PC := PC - 2
        call $getPC
        i32.const 2
        i32.sub
        tee_local $pc
        call $setPC

        ;; Adjust tacts
        call $getHL
        i32.const 1
        i32.sub
        call $Adjust5Tacts

        ;; WZ := PC + 1
        get_local $pc
        i32.const 1
        i32.add
        call $setWZ
      end
    end
  )

  ;; cpir (0xb1)
  (func $Cpir
    i32.const 1
    call $CpBase
    call $setF
    call $CprTail
  )

  (func $IndTail
    call $getB
    i32.const 0
    i32.ne
    if
      ;; Set PV
      call $getF
      i32.const 0x04
      i32.or
      call $setF

      ;; PC := PC - 2
      call $getPC
      i32.const 2
      i32.sub
      call $setPC

      ;; Adjust tacts
      call $getHL
      i32.const 1
      i32.sub
      call $Adjust5Tacts
    else
      ;; Reset PV
      call $getF
      i32.const 0xfb
      i32.and
      call $setF
    end
  )

  ;; Inir (0xb2)
  (func $Inir
    i32.const 1
    call $InBase
    call $IndTail
  )

  (func $OutdTail
    call $getB
    i32.const 0
    i32.ne
    if
      ;; Set PV
      call $getF
      i32.const 0x04
      i32.or
      call $setF

      ;; PC := PC - 2
      call $getPC
      i32.const 2
      i32.sub
      call $setPC

      ;; Adjust tacts
      call $getBC
      call $Adjust5Tacts
    else
      ;; Reset PV
      call $getF
      i32.const 0xfb
      i32.and
      call $setF
    end
  )

  ;; Otir (0xb3)
  (func $Otir
    i32.const 1
    call $OutBase
    call $OutdTail
  )

  (func $LdrxTail
    call $getBC
    i32.const 0
    i32.eq
    if return end

    call $getPC
    i32.const 2
    i32.sub
    call $setPC

    i32.const 5
    call $incTacts
  )

  ;; ldirx
  (func $Ldirx
    get_global $allowExtendedSet
    i32.const 0
    i32.eq
    if return end

    i32.const 1
    call $LdxBase
    call $LdrxTail
  )

  ;; ldpirx
  (func $Ldpirx
    (local $memVal i32)
    get_global $allowExtendedSet
    i32.const 0
    i32.eq
    if return end

    ;; Read (HL & 0xfff8 + E & 0x07)
    call $getHL
    i32.const 0xfff8
    i32.and
    call $getE
    i32.const 0x07
    i32.and
    i32.add
    call $readMemory
    tee_local $memVal

    ;; Conditional copy
    call $getA
    i32.ne
    if
      call $getDE
      get_local $memVal
      call $writeMemory
      i32.const 2
      call $incTacts
    else
      i32.const 5
      call $incTacts
    end

    ;; Inc DE
    call $getDE
    i32.const 1
    i32.add
    call $setDE

    ;; Decrement BC
    call $getBC
    i32.const 1
    i32.sub
    call $setBC
    call $LdrxTail
  )

  ;; lddr (0xb8)
  (func $Lddr
    i32.const -1
    call $LdBase
    call $setF
    call $LdrTail
  )

  ;; cpdr (0xb9)
  (func $Cpdr
    i32.const -1
    call $CpBase
    call $setF
    call $CprTail
  )

  ;; Indr (0xba)
  (func $Indr
    i32.const -1
    call $InBase
    call $IndTail
  )

  ;; Otdr (0xbb)
  (func $Otdr
    i32.const -1
    call $OutBase
    call $OutdTail
  )

  ;; lddrx
  (func $Lddrx
    get_global $allowExtendedSet
    i32.const 0
    i32.eq
    if return end

    i32.const -1
    call $LdxBase
    call $LdrxTail
  )

  ;; ==========================================================================
  ;; Bit operation helpers

  ;; RLC logic - sets flags
  ;; $a: argument
  (func $Rlc (param $a i32) (result i32)
    (local $res i32)
    (i32.shl (get_local $a) (i32.const 1))
    (i32.shr_u (get_local $a) (i32.const 7))
    i32.or
    i32.const 0xff
    i32.and
    set_local $res
    (i32.load8_u (i32.add (get_global $RLC_FLAGS) (get_local $a)))
    call $setF
    get_local $res
  )

  ;; RRC logic - sets flags
  ;; $a: argument
  (func $Rrc (param $a i32) (result i32)
    (local $res i32)
    (i32.shl (get_local $a) (i32.const 7))
    (i32.shr_u (get_local $a) (i32.const 1))
    i32.or
    i32.const 0xff
    i32.and
    set_local $res
    (i32.load8_u (i32.add (get_global $RRC_FLAGS) (get_local $a)))
    call $setF
    get_local $res
  )

  ;; RL logic - sets flags
  ;; $a: argument
  (func $Rl (param $a i32) (result i32)
    (local $c i32)
    (i32.and (call $getF) (i32.const 0x01))
    tee_local $c
    if (result i32)
      get_global $RL1_FLAGS
    else
      get_global $RL0_FLAGS
    end
    get_local $a
    i32.add
    i32.load8_u
    call $setF
    get_local $a
    i32.const 1
    i32.shl
    get_local $c
    i32.or
  )

  ;; RR logic - sets flags
  ;; $a: argument
  (func $Rr (param $a i32) (result i32)
    (local $c i32)
    (i32.and (call $getF) (i32.const 0x01))
    i32.const 7
    i32.shl
    tee_local $c
    if (result i32)
      get_global $RR1_FLAGS
    else
      get_global $RR0_FLAGS
    end
    get_local $a
    i32.add
    i32.load8_u
    call $setF
    get_local $a
    i32.const 1
    i32.shr_u
    get_local $c
    i32.or
  )

  ;; SLA logic - sets flags
  ;; $a: argument
  (func $Sla (param $a i32) (result i32)
    get_global $RL0_FLAGS
    get_local $a
    i32.add
    i32.load8_u
    call $setF

    get_local $a
    i32.const 1
    i32.shl
  )

  ;; SRA logic - sets flags
  ;; $a: argument
  (func $Sra (param $a i32) (result i32)
    get_global $SRA_FLAGS
    get_local $a
    i32.add
    i32.load8_u
    call $setF

    get_local $a
    i32.const 1
    i32.shr_u
    get_local $a
    i32.const 0x80
    i32.and
    i32.or
  )

  ;; SLL logic - sets flags
  ;; $a: argument
  (func $Sll (param $a i32) (result i32)
    get_global $RL1_FLAGS
    get_local $a
    i32.add
    i32.load8_u
    call $setF

    get_local $a
    i32.const 1
    i32.shl
    i32.const 1
    i32.or
  )

  ;; SRL logic - sets flags
  ;; $a: argument
  (func $Srl (param $a i32) (result i32)
    get_global $RR0_FLAGS
    get_local $a
    i32.add
    i32.load8_u
    call $setF

    get_local $a
    i32.const 1
    i32.shr_u
  )

  ;; ==========================================================================
  ;; Bit operations

  ;; rlc Q (0x00-0x07)
  (func $RlcQ
    (local $q i32)
    (tee_local $q (i32.and (get_global $opCode) (i32.const 0x07)))
    get_local $q
    call $getReg8
    call $Rlc
    call $setReg8
  )

  ;; rlc (hl) (0x06)
  (func $RlcHLi
    call $getHL
    call $getHL
    call $readMemory
    get_global $useGateArrayContention
    if
      i32.const 1
      call $incTacts
    else
      call $getHL
      call $memoryDelay
      i32.const 1
      call $incTacts
    end
    call $Rlc
    call $writeMemory
  )

  ;; rrc Q (0x08-0x0f)
  (func $RrcQ
    (local $q i32)
    (tee_local $q (i32.and (get_global $opCode) (i32.const 0x07)))
    get_local $q
    call $getReg8
    call $Rrc
    call $setReg8
  )

  ;; rrc (hl) (0x0e)
  (func $RrcHLi
    call $getHL
    call $getHL
    call $readMemory
    get_global $useGateArrayContention
    if
      i32.const 1
      call $incTacts
    else
      call $getHL
      call $memoryDelay
      i32.const 1
      call $incTacts
    end
    call $Rrc
    call $writeMemory
  )

  ;; rl Q (0x10-0x17)
  (func $RlQ
    (local $q i32)
    (tee_local $q (i32.and (get_global $opCode) (i32.const 0x07)))
    get_local $q
    call $getReg8
    call $Rl
    call $setReg8
  )

  ;; rl (hl) (0x16)
  (func $RlHLi
    call $getHL
    call $getHL
    call $readMemory
    get_global $useGateArrayContention
    if
      i32.const 1
      call $incTacts
    else
      call $getHL
      call $memoryDelay
      i32.const 1
      call $incTacts
    end
    call $Rl
    call $writeMemory
  )

  ;; rr Q (0x18-0x1f)
  (func $RrQ
    (local $q i32)
    (tee_local $q (i32.and (get_global $opCode) (i32.const 0x07)))
    get_local $q
    call $getReg8
    call $Rr
    call $setReg8
  )

  ;; rr (hl) (0x1e)
  (func $RrHLi
    call $getHL
    call $getHL
    call $readMemory
    get_global $useGateArrayContention
    if
      i32.const 1
      call $incTacts
    else
      call $getHL
      call $memoryDelay
      i32.const 1
      call $incTacts
    end
    call $Rr
    call $writeMemory
  )

  ;; sla Q (0x20-0x27)
  (func $SlaQ
    (local $q i32)
    (tee_local $q (i32.and (get_global $opCode) (i32.const 0x07)))
    get_local $q
    call $getReg8
    call $Sla
    call $setReg8
  )

  ;; sla (hl) (0x26)
  (func $SlaHLi
    call $getHL
    call $getHL
    call $readMemory
    get_global $useGateArrayContention
    if
      i32.const 1
      call $incTacts
    else
      call $getHL
      call $memoryDelay
      i32.const 1
      call $incTacts
    end
    call $Sla
    call $writeMemory
  )

  ;; sra Q (0x28-0x2f)
  (func $SraQ
    (local $q i32)
    (tee_local $q (i32.and (get_global $opCode) (i32.const 0x07)))
    get_local $q
    call $getReg8
    call $Sra
    call $setReg8
  )

  ;; sra (hl) (0x2e)
  (func $SraHLi
    call $getHL
    call $getHL
    call $readMemory
    get_global $useGateArrayContention
    if
      i32.const 1
      call $incTacts
    else
      call $getHL
      call $memoryDelay
      i32.const 1
      call $incTacts
    end
    call $Sra
    call $writeMemory
  )

  ;; sll Q (0x30-0x37)
  (func $SllQ
    (local $q i32)
    (tee_local $q (i32.and (get_global $opCode) (i32.const 0x07)))
    get_local $q
    call $getReg8
    call $Sll
    call $setReg8
  )

  ;; sll (hl) (0x36)
  (func $SllHLi
    call $getHL
    call $getHL
    call $readMemory
    get_global $useGateArrayContention
    if
      i32.const 1
      call $incTacts
    else
      call $getHL
      call $memoryDelay
      i32.const 1
      call $incTacts
    end
    call $Sll
    call $writeMemory
  )

  ;; srl Q (0x38-0x3f)
  (func $SrlQ
    (local $q i32)
    (tee_local $q (i32.and (get_global $opCode) (i32.const 0x07)))
    get_local $q
    call $getReg8
    call $Srl
    call $setReg8
  )

  ;; srl (hl) (0x3e)
  (func $SrlHLi
    call $getHL
    call $getHL
    call $readMemory
    get_global $useGateArrayContention
    if
      i32.const 1
      call $incTacts
    else
      call $getHL
      call $memoryDelay
      i32.const 1
      call $incTacts
    end
    call $Srl
    call $writeMemory
  )
)
