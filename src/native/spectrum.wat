(module
  ;; We keep 512 KB of memory 
  (memory (export "memory") 8)

  ;; ==========================================================================
  ;; CPU API

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
  (export "resetCpu" (func $resetCpu))

  ;; ==========================================================================
  ;; Constant values

  ;; The index of the first byte of the ZX Spectrum 48 memory
  (global $SP_MEM_INDEX i32 (i32.const 0))

  ;; ==========================================================================
  ;; Z80 CPU registers

  ;; Z80 registers storage
  (global $regAF (mut i32) (i32.const 0xffff))
  (global $regBC (mut i32) (i32.const 0xffff))
  (global $regDE (mut i32) (i32.const 0xffff))
  (global $regHL (mut i32) (i32.const 0xffff))
  (global $regAFsec (mut i32) (i32.const 0xffff))
  (global $regBCsec (mut i32) (i32.const 0xffff))
  (global $regDEsec (mut i32) (i32.const 0xffff))
  (global $regHLsec (mut i32) (i32.const 0xffff))
  (global $regI (mut i32) (i32.const 0xff))
  (global $regR (mut i32) (i32.const 0xff))
  (global $regPC (mut i32) (i32.const 0xffff))
  (global $regSP (mut i32) (i32.const 0xffff))
  (global $regIX (mut i32) (i32.const 0xffff))
  (global $regIY (mut i32) (i32.const 0xffff))
  (global $regWZ (mut i32) (i32.const 0xffff))

  ;; Gets the value of A
  (func $getA (result i32)
    (i32.shr_u (i32.and (get_global $regAF) (i32.const 0xff00)) (i32.const 8))
  )

  ;; Sets the value of A
  (func $setA (param $v i32) 
    (i32.shl (i32.and (get_local $v) (i32.const 0xff)) (i32.const 8))
    (i32.and (get_global $regAF) (i32.const 0x00ff))
    i32.or
    set_global $regAF
  )
 
  ;; Gets the value of F
  (func $getF (result i32)
    (i32.and (get_global $regAF) (i32.const 0xff))
  )

  ;; Sets the value of F
  (func $setF (param $v i32) 
    (i32.and (get_local $v) (i32.const 0xff))
    (i32.and (get_global $regAF) (i32.const 0xff00))
    i32.or
    set_global $regAF
  )

  ;; Gets the value of AF
  (func $getAF (result i32)
    get_global $regAF
  )

  ;; Gets the value of B
  (func $getB (result i32)
    (i32.shr_u (i32.and (get_global $regBC) (i32.const 0xff00)) (i32.const 8))
  )

  ;; Sets the value of B
  (func $setB (param $v i32) 
    (i32.shl (i32.and (get_local $v) (i32.const 0xff)) (i32.const 8))
    (i32.and (get_global $regBC) (i32.const 0x00ff))
    i32.or
    set_global $regBC
  )
 
  ;; Gets the value of C
  (func $getC (result i32)
    (i32.and (get_global $regBC) (i32.const 0xff))
  )

  ;; Sets the value of C
  (func $setC (param $v i32) 
    (i32.and (get_local $v) (i32.const 0xff))
    (i32.and (get_global $regBC) (i32.const 0xff00))
    i32.or
    set_global $regBC
  )

  ;; Gets the value of BC
  (func $getBC (result i32)
    get_global $regBC
  )

  ;; Sets the value of BC
  (func $setBC (param $v i32)
    (i32.and (get_local $v) (i32.const 0xffff))
    set_global $regBC
  )

  ;; Gets the value of D
  (func $getD (result i32)
    (i32.shr_u (i32.and (get_global $regDE) (i32.const 0xff00)) (i32.const 8))
  )

  ;; Sets the value of D
  (func $setD (param $v i32) 
    (i32.shl (i32.and (get_local $v) (i32.const 0xff)) (i32.const 8))
    (i32.and (get_global $regDE) (i32.const 0x00ff))
    i32.or
    set_global $regDE
  )
 
  ;; Gets the value of E
  (func $getE (result i32)
    (i32.and (get_global $regDE) (i32.const 0xff))
  )

  ;; Sets the value of E
  (func $setE (param $v i32) 
    (i32.and (get_local $v) (i32.const 0xff))
    (i32.and (get_global $regDE) (i32.const 0xff00))
    i32.or
    set_global $regDE
  )

  ;; Gets the value of DE
  (func $getDE (result i32)
    get_global $regDE
  )

  ;; Sets the value of DE
  (func $setDE (param $v i32)
    (i32.and (get_local $v) (i32.const 0xffff))
    set_global $regDE
  )

  ;; Gets the value of H
  (func $getH (result i32)
    (i32.shr_u (i32.and (get_global $regHL) (i32.const 0xff00)) (i32.const 8))
  )

  ;; Sets the value of H
  (func $setH (param $v i32) 
    (i32.shl (i32.and (get_local $v) (i32.const 0xff)) (i32.const 8))
    (i32.and (get_global $regHL) (i32.const 0x00ff))
    i32.or
    set_global $regHL
  )
 
  ;; Gets the value of L
  (func $getL (result i32)
    (i32.and (get_global $regHL) (i32.const 0xff))
  )

  ;; Sets the value of L
  (func $setL (param $v i32) 
    (i32.and (get_local $v) (i32.const 0xff))
    (i32.and (get_global $regHL) (i32.const 0xff00))
    i32.or
    set_global $regHL
  )

  ;; Gets the value of HL
  (func $getHL (result i32)
    get_global $regHL
  )

  ;; Sets the value of HL
  (func $setHL (param $v i32)
    (i32.and (get_local $v) (i32.const 0xffff))
    set_global $regHL
  )

  ;; Gets the value of I
  (func $getI (result i32)
    get_global $regI
  )

  ;; Sets the value of I
  (func $setI (param $v i32) 
    (i32.and (get_local $v) (i32.const 0xff))
    set_global $regI
  )

  ;; Gets the value of R
  (func $getR (result i32)
    get_global $regR
  )

  ;; Sets the value of R
  (func $setR (param $v i32) 
    (i32.and (get_local $v) (i32.const 0xff))
    set_global $regR
  )

  ;; Gets the value of PC
  (func $getPC (result i32)
    get_global $regPC
  )

  ;; Gets the value of PC
  (func $setPC (param $v i32) 
    (i32.and (get_local $v) (i32.const 0xffff))
    set_global $regPC
  )

  ;; Gets the value of SP
  (func $getSP (result i32)
    get_global $regSP
  )

  ;; Gets the value of PC
  (func $setSP (param $v i32) 
    (i32.and (get_local $v) (i32.const 0xffff))
    set_global $regSP
  )

  ;; Gets the value of XH
  (func $getXH (result i32)
    (i32.shr_u (i32.and (get_global $regIX) (i32.const 0xff00)) (i32.const 8))
  )

  ;; Sets the value of XH
  (func $setXH (param $v i32) 
    (i32.shl (i32.and (get_local $v) (i32.const 0xff)) (i32.const 8))
    (i32.and (get_global $regIX) (i32.const 0x00ff))
    i32.or
    set_global $regIX
  )
 
  ;; Gets the value of XL
  (func $getXL (result i32)
    (i32.and (get_global $regIX) (i32.const 0xff))
  )

  ;; Sets the value of XL
  (func $setXL (param $v i32) 
    (i32.and (get_local $v) (i32.const 0xff))
    (i32.and (get_global $regIX) (i32.const 0xff00))
    i32.or
    set_global $regIX
  )

  ;; Gets the value of IX
  (func $getIX (result i32)
    get_global $regIX
  )

  ;; Sets the value of IX
  (func $setIX (param $v i32)
    (i32.and (get_local $v) (i32.const 0xffff))
    set_global $regIX
  )

  ;; Gets the value of YH
  (func $getYH (result i32)
    (i32.shr_u (i32.and (get_global $regIY) (i32.const 0xff00)) (i32.const 8))
  )

  ;; Sets the value of YH
  (func $setYH (param $v i32) 
    (i32.shl (i32.and (get_local $v) (i32.const 0xff)) (i32.const 8))
    (i32.and (get_global $regIY) (i32.const 0x00ff))
    i32.or
    set_global $regIY
  )
 
  ;; Gets the value of YL
  (func $getYL (result i32)
    (i32.and (get_global $regIY) (i32.const 0xff))
  )

  ;; Sets the value of YL
  (func $setYL (param $v i32) 
    (i32.and (get_local $v) (i32.const 0xff))
    (i32.and (get_global $regIY) (i32.const 0xff00))
    i32.or
    set_global $regIY
  )

  ;; Gets the value of IX
  (func $getIY (result i32)
    get_global $regIY
  )

  ;; Sets the value of IY
  (func $setIY (param $v i32)
    (i32.and (get_local $v) (i32.const 0xffff))
    set_global $regIY
  )

  ;; Gets the value of WH
  (func $getWH (result i32)
    (i32.shr_u (i32.and (get_global $regWZ) (i32.const 0xff00)) (i32.const 8))
  )

  ;; Sets the value of WH
  (func $setWH (param $v i32) 
    (i32.shl (i32.and (get_local $v) (i32.const 0xff)) (i32.const 8))
    (i32.and (get_global $regWZ) (i32.const 0x00ff))
    i32.or
    set_global $regWZ
  )
 
  ;; Gets the value of WL
  (func $getWL (result i32)
    (i32.and (get_global $regWZ) (i32.const 0xff))
  )

  ;; Sets the value of WL
  (func $setWL (param $v i32) 
    (i32.and (get_local $v) (i32.const 0xff))
    (i32.and (get_global $regWZ) (i32.const 0xff00))
    i32.or
    set_global $regWZ
  )

  ;; Gets the value of WZ
  (func $getWZ (result i32)
    get_global $regWZ
  )

  ;; Sets the value of WZ
  (func $setWZ (param $v i32)
    (i32.and (get_local $v) (i32.const 0xffff))
    set_global $regWZ
  )

  ;; ==========================================================================
  ;; Z80 CPU Implementation

  ;; Reset register values
  (func $resetCpu
    i32.const 0xffff
    set_global $regAF
    i32.const 0xffff
    set_global $regBC
    i32.const 0xffff
    set_global $regDE
    i32.const 0xffff
    set_global $regHL
    i32.const 0xffff
    set_global $regAFsec
    i32.const 0xffff
    set_global $regBCsec
    i32.const 0xffff
    set_global $regDEsec
    i32.const 0xffff
    set_global $regHLsec
    i32.const 0xff
    set_global $regI
    i32.const 0xff
    set_global $regR
    i32.const 0xffff
    set_global $regPC
    i32.const 0xffff
    set_global $regSP
    i32.const 0xffff
    set_global $regIX
    i32.const 0xffff
    set_global $regIY
    i32.const 0xffff
    set_global $regWZ
  )
)