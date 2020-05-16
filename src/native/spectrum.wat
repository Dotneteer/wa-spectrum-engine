(module
  ;; We keep 512 KB of memory 
  (memory (export "memory") 8)

  ;; ==========================================================================
  ;; CPU API

  (export "turnOnCpu" (func $turnOnCpu))
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
  (export "getR" (func $getI))
  (export "setR" (func $setI))
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

  ;; ==========================================================================
  ;; Constant values

  ;; The index of the first byte of the ZX Spectrum 48 memory
  ;; Block lenght: 0x1_0000
  (global $SP_MEM_INDEX i32 (i32.const 0))

  ;; The index of the execution flow status map (length: 0x1000)
  (global $EXEC_FLOW_STAT_INDEX i32 (i32.const 0x1_0000))
  
  ;; The index of the memory read status map (length: 0x1000)
  (global $MEM_READ_STAT_INDEX i32 (i32.const 0x1_1000))

  ;; The index of the memory write status map (length: 0x1000)
  (global $MEM_WRITE_STAT_INDEX i32 (i32.const 0x1_2000))

  ;; ==========================================================================
  ;; Z80 CPU registers

  ;; The index of the register area (length: 0x1c)
  (global $REG_AREA_INDEX i32 (i32.const 0x1_3000))

  ;; Next available slot: 0x1_3020

  ;; Z80 State flags
  (global $Z80_STATE_INT i32 (i32.const 0x01))
  (global $Z80_STATE_INT_INV i32 (i32.const 0xfe))
  (global $Z80_STATE_NMI i32 (i32.const 0x02))
  (global $Z80_STATE_NMI_INV i32 (i32.const 0xfd))
  (global $Z80_STATE_RES i32 (i32.const 0x04))
  (global $Z80_STATE_RES_INV i32 (i32.const 0xfb))
  (global $Z80_STATE_HLT i32 (i32.const 0x04))
  (global $Z80_STATE_HLT_INV i32 (i32.const 0xf7))

  ;; Operation prefix modes
  (global $OP_PREP_EXT i32 (i32.const 0x01))
  (global $OP_PREF_BIT i32 (i32.const 0x02))

  ;; Operation index modes
  (global $OP_IDX_IX i32 (i32.const 0x01))
  (global $OP_IDX_IY i32 (i32.const 0x02))

  ;; ==========================================================================
  ;; Z80 CPU state

  ;; Once-set
  (global $tactsInFrame (mut i32) (i32.const 1_000_000))

  ;; Mutable
  (global $frameCount (mut i32) (i32.const 0x0000)) ;; Number of frames from start
  (global $frameTacts (mut i32) (i32.const 0x0000)) ;; Number of tacts in the current frame
  (global $stateFlags (mut i32) (i32.const 0x00)) ;; Z80 state flags
  (global $useGateArrayContention (mut i32) (i32.const 0x0000)) ;; Should use gate array contention?
  (global $iff1 (mut i32) (i32.const 0x00)) ;; Interrupt flip-flop #1
  (global $iff2 (mut i32) (i32.const 0x00)) ;; Interrupt flip-flop #2
  (global $interruptMode (mut i32) (i32.const 0x00)) ;; Current interrupt mode
  (global $prefixMode (mut i32) (i32.const 0x00)) ;; Current operation prefix mode
  (global $indexMode (mut i32) (i32.const 0x00)) ;; Current operation index mode
  (global $maskableInterruptModeEntered (mut i32) (i32.const 0x00)) ;; Signs that CPU entered into maskable interrupt mode
  (global $opCode (mut i32) (i32.const 0x00)) ;; Operation code being processed

  ;; Memory access jump tables
  (table $memoryRead 1 anyfunc)
  (elem (i32.const 0) $defaultRead)

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

  ;; ==========================================================================
  ;; Z80 CPU Implementation

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
    set_global $prefixMode
    i32.const 0x0000
    set_global $indexMode
    i32.const 0x0000
    set_global $maskableInterruptModeEntered
    i32.const 0x0000
    set_global $opCode
  )

  ;; ==========================================================================
  ;; Z80 Memory access

  ;; Default memory read operation
  ;; $addr: 16-bit memory address
  ;; $suppCont: Suppress memory contention flag
  ;; returns: Memory contents
  (func $defaultRead (param $addr i32) (param $suppCont i32) (result i32)
    (i32.add (get_local $addr) (get_global $SP_MEM_INDEX))
    i32.load8_u
  )

  ;; Default memory write operation
  ;; $addr: 16-bit memory address
  ;; $v: 8-bit value to write
  ;; $suppCont: Suppress memory contention flag
  (func $defaultWrite (param $addr i32) (param $v i32) (param $suppCont i32)
    (i32.add (get_local $addr) (get_global $SP_MEM_INDEX))
    get_local $v
    i32.store8
  )
)