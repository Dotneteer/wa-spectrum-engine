(module
 (type $i32_=>_i32 (func (param i32) (result i32)))
 (type $i32_i32_=>_none (func (param i32 i32)))
 (type $none_=>_i32 (func (result i32)))
 (type $i32_=>_none (func (param i32)))
 (type $i32_i32_=>_i32 (func (param i32 i32) (result i32)))
 (type $i32_i32_i32_=>_none (func (param i32 i32 i32)))
 (type $none_=>_none (func))
 (type $i32_i32_i32_=>_i32 (func (param i32 i32 i32) (result i32)))
 (type $i32_i32_i32_i32_=>_none (func (param i32 i32 i32 i32)))
 (type $i32_i64_=>_none (func (param i32 i64)))
 (type $i32_=>_i64 (func (param i32) (result i64)))
 (import "env" "abort" (func $~lib/builtins/abort (param i32 i32 i32 i32)))
 (memory $0 1)
 (data (i32.const 16) "\1e\00\00\00\01\00\00\00\01\00\00\00\1e\00\00\00~\00l\00i\00b\00/\00r\00t\00/\00t\00l\00s\00f\00.\00t\00s")
 (data (i32.const 64) "(\00\00\00\01\00\00\00\01\00\00\00(\00\00\00a\00l\00l\00o\00c\00a\00t\00i\00o\00n\00 \00t\00o\00o\00 \00l\00a\00r\00g\00e")
 (data (i32.const 128) "\1e\00\00\00\01\00\00\00\01\00\00\00\1e\00\00\00~\00l\00i\00b\00/\00r\00t\00/\00p\00u\00r\00e\00.\00t\00s")
 (data (i32.const 180) "\01")
 (data (i32.const 196) "\01")
 (data (i32.const 208) "$\00\00\00\01\00\00\00\01\00\00\00$\00\00\00I\00n\00d\00e\00x\00 \00o\00u\00t\00 \00o\00f\00 \00r\00a\00n\00g\00e")
 (data (i32.const 272) "\1a\00\00\00\01\00\00\00\01\00\00\00\1a\00\00\00~\00l\00i\00b\00/\00a\00r\00r\00a\00y\00.\00t\00s")
 (data (i32.const 320) "\1c\00\00\00\01\00\00\00\01\00\00\00\1c\00\00\00I\00n\00v\00a\00l\00i\00d\00 \00l\00e\00n\00g\00t\00h")
 (data (i32.const 368) "&\00\00\00\01\00\00\00\01\00\00\00&\00\00\00~\00l\00i\00b\00/\00a\00r\00r\00a\00y\00b\00u\00f\00f\00e\00r\00.\00t\00s")
 (data (i32.const 432) "$\00\00\00\01\00\00\00\01\00\00\00$\00\00\00~\00l\00i\00b\00/\00t\00y\00p\00e\00d\00a\00r\00r\00a\00y\00.\00t\00s")
 (data (i32.const 500) "\01")
 (data (i32.const 516) "\01")
 (data (i32.const 532) "\01")
 (data (i32.const 548) "\01")
 (data (i32.const 564) "\01")
 (data (i32.const 580) "\01")
 (data (i32.const 592) "\14\00\00\00\01\00\00\00\01\00\00\00\14\00\00\00~\00l\00i\00b\00/\00r\00t\00.\00t\00s")
 (data (i32.const 640) "\1c\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\001\04\00\00\02\00\00\001\00\00\00\02\00\00\00Q\04\00\00\02\00\00\00Q\00\00\00\02\00\00\00\91\04\00\00\02\00\00\00\91\00\00\00\02\00\00\00\91\0c\00\00\02\00\00\00\11\0d\00\00\02\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\003\00\00\00\02\00\00\00\930\00\00\02\00\00\00\93\04\00\00\02\00\00\00\10")
 (data (i32.const 792) "\0b\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\93 \00\00\02")
 (data (i32.const 828) "\10\00\00\00\00\00\00\00\93 \00\00\02\00\00\003\00\00\00\02\00\00\00\10\00\00\00\00\00\00\00\930\00\00\02")
 (table $0 5 funcref)
 (elem (i32.const 1) $start:src/assembly/index~anonymous|0 $start:src/assembly/index~anonymous|1 $src/assembly/ObjectPool/ObjectPool<src/assembly/Z80Cpu/Z80Cpu>#create~anonymous|0 $src/assembly/ObjectPool/ObjectPool<src/assembly/Z80Cpu/Z80Cpu>#create~anonymous|0)
 (global $~lib/rt/tlsf/ROOT (mut i32) (i32.const 0))
 (global $~lib/rt/tlsf/collectLock (mut i32) (i32.const 0))
 (global $node_modules/as-bind/lib/assembly/as-bind/__asbind_String_ID i32 (i32.const 1))
 (global $node_modules/as-bind/lib/assembly/as-bind/__asbind_ArrayBuffer_ID i32 (i32.const 0))
 (global $node_modules/as-bind/lib/assembly/as-bind/__asbind_ArrayBufferView_ID i32 (i32.const 2))
 (global $node_modules/as-bind/lib/assembly/as-bind/__asbind_Int8Array_ID i32 (i32.const 3))
 (global $node_modules/as-bind/lib/assembly/as-bind/__asbind_Uint8Array_ID i32 (i32.const 4))
 (global $node_modules/as-bind/lib/assembly/as-bind/__asbind_Int16Array_ID i32 (i32.const 5))
 (global $node_modules/as-bind/lib/assembly/as-bind/__asbind_Uint16Array_ID i32 (i32.const 6))
 (global $node_modules/as-bind/lib/assembly/as-bind/__asbind_Int32Array_ID i32 (i32.const 7))
 (global $node_modules/as-bind/lib/assembly/as-bind/__asbind_Uint32Array_ID i32 (i32.const 8))
 (global $node_modules/as-bind/lib/assembly/as-bind/__asbind_Float32Array_ID i32 (i32.const 9))
 (global $node_modules/as-bind/lib/assembly/as-bind/__asbind_Float64Array_ID i32 (i32.const 10))
 (global $src/assembly/index/cpuPool (mut i32) (i32.const 0))
 (global $~argumentsLength (mut i32) (i32.const 0))
 (global $src/assembly/index/testMachinePool (mut i32) (i32.const 0))
 (global $~lib/rt/pure/ROOTS (mut i32) (i32.const 0))
 (global $~lib/rt/pure/CUR (mut i32) (i32.const 0))
 (global $~lib/rt/pure/END (mut i32) (i32.const 0))
 (global $~lib/rt/__rtti_base i32 (i32.const 640))
 (global $src/assembly/Z80Cpu/Z80Cpu i32 (i32.const 11))
 (global $src/assembly/test-machine/TestZ80Machine/TestZ80Machine i32 (i32.const 17))
 (export "__setArgumentsLength" (func $~setArgumentsLength))
 (export "memory" (memory $0))
 (export "__alloc" (func $~lib/rt/tlsf/__alloc))
 (export "__retain" (func $~lib/rt/pure/__retain))
 (export "__release" (func $~lib/rt/pure/__release))
 (export "__collect" (func $~lib/rt/pure/__collect))
 (export "__rtti_base" (global $~lib/rt/__rtti_base))
 (export "__asbind_String_ID" (global $node_modules/as-bind/lib/assembly/as-bind/__asbind_String_ID))
 (export "__asbind_ArrayBuffer_ID" (global $node_modules/as-bind/lib/assembly/as-bind/__asbind_ArrayBuffer_ID))
 (export "__asbind_ArrayBufferView_ID" (global $node_modules/as-bind/lib/assembly/as-bind/__asbind_ArrayBufferView_ID))
 (export "__asbind_Int8Array_ID" (global $node_modules/as-bind/lib/assembly/as-bind/__asbind_Int8Array_ID))
 (export "__asbind_Uint8Array_ID" (global $node_modules/as-bind/lib/assembly/as-bind/__asbind_Uint8Array_ID))
 (export "__asbind_Int16Array_ID" (global $node_modules/as-bind/lib/assembly/as-bind/__asbind_Int16Array_ID))
 (export "__asbind_Uint16Array_ID" (global $node_modules/as-bind/lib/assembly/as-bind/__asbind_Uint16Array_ID))
 (export "__asbind_Int32Array_ID" (global $node_modules/as-bind/lib/assembly/as-bind/__asbind_Int32Array_ID))
 (export "__asbind_Uint32Array_ID" (global $node_modules/as-bind/lib/assembly/as-bind/__asbind_Uint32Array_ID))
 (export "__asbind_Float32Array_ID" (global $node_modules/as-bind/lib/assembly/as-bind/__asbind_Float32Array_ID))
 (export "__asbind_Float64Array_ID" (global $node_modules/as-bind/lib/assembly/as-bind/__asbind_Float64Array_ID))
 (export "getCpuPoolMaxSize" (func $src/assembly/index/getCpuPoolMaxSize))
 (export "resetCpuPool" (func $src/assembly/index/resetCpuPool))
 (export "createCpu" (func $src/assembly/index/createCpu))
 (export "releaseCpu" (func $src/assembly/index/releaseCpu))
 (export "getCpu" (func $src/assembly/index/getCpu))
 (export "longOp" (func $src/assembly/index/longOp))
 (export "getTestMachinePoolMaxSize" (func $src/assembly/index/getTestMachinePoolMaxSize))
 (export "resetTestMachinePool" (func $src/assembly/index/resetTestMachinePool))
 (export "createTestMachine" (func $src/assembly/index/createTestMachine))
 (export "releaseTestMachine" (func $src/assembly/index/releaseTestMachine))
 (export "getTestMachine" (func $src/assembly/index/getTestMachine))
 (export "getMemory" (func $src/assembly/index/getMemory))
 (export "Z80Cpu" (global $src/assembly/Z80Cpu/Z80Cpu))
 (export "Z80Cpu#get:tacts" (func $src/assembly/Z80Cpu/Z80Cpu#get:tacts))
 (export "Z80Cpu#set:tacts" (func $src/assembly/Z80Cpu/Z80Cpu#set:tacts))
 (export "Z80Cpu#get:stateFlags" (func $src/assembly/Z80Cpu/Z80Cpu#get:stateFlags))
 (export "Z80Cpu#set:stateFlags" (func $src/assembly/Z80Cpu/Z80Cpu#set:stateFlags))
 (export "Z80Cpu#get:useGateArrayContention" (func $src/assembly/Z80Cpu/Z80Cpu#get:useGateArrayContention))
 (export "Z80Cpu#set:useGateArrayContention" (func $src/assembly/Z80Cpu/Z80Cpu#set:useGateArrayContention))
 (export "Z80Cpu#get:iff1" (func $src/assembly/Z80Cpu/Z80Cpu#get:iff1))
 (export "Z80Cpu#set:iff1" (func $src/assembly/Z80Cpu/Z80Cpu#set:iff1))
 (export "Z80Cpu#get:iff2" (func $src/assembly/Z80Cpu/Z80Cpu#get:iff2))
 (export "Z80Cpu#set:iff2" (func $src/assembly/Z80Cpu/Z80Cpu#set:iff2))
 (export "Z80Cpu#get:interruptMode" (func $src/assembly/Z80Cpu/Z80Cpu#get:interruptMode))
 (export "Z80Cpu#set:interruptMode" (func $src/assembly/Z80Cpu/Z80Cpu#set:interruptMode))
 (export "Z80Cpu#get:isInterruptBlocked" (func $src/assembly/Z80Cpu/Z80Cpu#get:isInterruptBlocked))
 (export "Z80Cpu#set:isInterruptBlocked" (func $src/assembly/Z80Cpu/Z80Cpu#set:isInterruptBlocked))
 (export "Z80Cpu#get:isInOpExecution" (func $src/assembly/Z80Cpu/Z80Cpu#get:isInOpExecution))
 (export "Z80Cpu#set:isInOpExecution" (func $src/assembly/Z80Cpu/Z80Cpu#set:isInOpExecution))
 (export "Z80Cpu#get:executionFlowStatus" (func $src/assembly/Z80Cpu/Z80Cpu#get:executionFlowStatus))
 (export "Z80Cpu#get:memoryReadStatus" (func $src/assembly/Z80Cpu/Z80Cpu#get:memoryReadStatus))
 (export "Z80Cpu#get:memoryWriteStatus" (func $src/assembly/Z80Cpu/Z80Cpu#get:memoryWriteStatus))
 (export "Z80Cpu#get:prefixMode" (func $src/assembly/Z80Cpu/Z80Cpu#get:prefixMode))
 (export "Z80Cpu#set:prefixMode" (func $src/assembly/Z80Cpu/Z80Cpu#set:prefixMode))
 (export "Z80Cpu#get:indexMode" (func $src/assembly/Z80Cpu/Z80Cpu#get:indexMode))
 (export "Z80Cpu#set:indexMode" (func $src/assembly/Z80Cpu/Z80Cpu#set:indexMode))
 (export "Z80Cpu#get:maskableInterruptModeEntered" (func $src/assembly/Z80Cpu/Z80Cpu#get:maskableInterruptModeEntered))
 (export "Z80Cpu#set:maskableInterruptModeEntered" (func $src/assembly/Z80Cpu/Z80Cpu#set:maskableInterruptModeEntered))
 (export "Z80Cpu#get:allowExtendedInstructionSet" (func $src/assembly/Z80Cpu/Z80Cpu#get:allowExtendedInstructionSet))
 (export "Z80Cpu#set:allowExtendedInstructionSet" (func $src/assembly/Z80Cpu/Z80Cpu#set:allowExtendedInstructionSet))
 (export "Z80Cpu#constructor" (func $src/assembly/Z80Cpu/Z80Cpu#constructor|trampoline))
 (export "Z80Cpu#get:a" (func $src/assembly/Z80Cpu/Z80Cpu#get:_a))
 (export "Z80Cpu#set:a" (func $src/assembly/Z80Cpu/Z80Cpu#set:a))
 (export "Z80Cpu#get:f" (func $src/assembly/Z80Cpu/Z80Cpu#get:_f))
 (export "Z80Cpu#set:f" (func $src/assembly/Z80Cpu/Z80Cpu#set:f))
 (export "Z80Cpu#get:af" (func $src/assembly/Z80Cpu/Z80Cpu#get:af))
 (export "Z80Cpu#set:af" (func $src/assembly/Z80Cpu/Z80Cpu#set:af))
 (export "Z80Cpu#get:b" (func $src/assembly/Z80Cpu/Z80Cpu#get:_b))
 (export "Z80Cpu#set:b" (func $src/assembly/Z80Cpu/Z80Cpu#set:b))
 (export "Z80Cpu#get:c" (func $src/assembly/Z80Cpu/Z80Cpu#get:_c))
 (export "Z80Cpu#set:c" (func $src/assembly/Z80Cpu/Z80Cpu#set:c))
 (export "Z80Cpu#get:bc" (func $src/assembly/Z80Cpu/Z80Cpu#get:_bc))
 (export "Z80Cpu#set:bc" (func $src/assembly/Z80Cpu/Z80Cpu#set:bc))
 (export "Z80Cpu#get:d" (func $src/assembly/Z80Cpu/Z80Cpu#get:_d))
 (export "Z80Cpu#set:d" (func $src/assembly/Z80Cpu/Z80Cpu#set:d))
 (export "Z80Cpu#get:e" (func $src/assembly/Z80Cpu/Z80Cpu#get:_e))
 (export "Z80Cpu#set:e" (func $src/assembly/Z80Cpu/Z80Cpu#set:e))
 (export "Z80Cpu#get:de" (func $src/assembly/Z80Cpu/Z80Cpu#get:_de))
 (export "Z80Cpu#set:de" (func $src/assembly/Z80Cpu/Z80Cpu#set:de))
 (export "Z80Cpu#get:h" (func $src/assembly/Z80Cpu/Z80Cpu#get:_h))
 (export "Z80Cpu#set:h" (func $src/assembly/Z80Cpu/Z80Cpu#set:h))
 (export "Z80Cpu#get:l" (func $src/assembly/Z80Cpu/Z80Cpu#get:_l))
 (export "Z80Cpu#set:l" (func $src/assembly/Z80Cpu/Z80Cpu#set:l))
 (export "Z80Cpu#get:hl" (func $src/assembly/Z80Cpu/Z80Cpu#get:_hl))
 (export "Z80Cpu#set:hl" (func $src/assembly/Z80Cpu/Z80Cpu#set:hl))
 (export "Z80Cpu#get:_af_" (func $src/assembly/Z80Cpu/Z80Cpu#get:_af_sec))
 (export "Z80Cpu#get:_bc_" (func $src/assembly/Z80Cpu/Z80Cpu#get:_bc_sec))
 (export "Z80Cpu#get:_de_" (func $src/assembly/Z80Cpu/Z80Cpu#get:_de_sec))
 (export "Z80Cpu#get:_hl_" (func $src/assembly/Z80Cpu/Z80Cpu#get:_hl_sec))
 (export "Z80Cpu#get:i" (func $src/assembly/Z80Cpu/Z80Cpu#get:_i))
 (export "Z80Cpu#set:i" (func $src/assembly/Z80Cpu/Z80Cpu#set:_i))
 (export "Z80Cpu#get:r" (func $src/assembly/Z80Cpu/Z80Cpu#get:_r))
 (export "Z80Cpu#set:r" (func $src/assembly/Z80Cpu/Z80Cpu#set:_r))
 (export "Z80Cpu#get:pc" (func $src/assembly/Z80Cpu/Z80Cpu#get:_pc))
 (export "Z80Cpu#set:pc" (func $src/assembly/Z80Cpu/Z80Cpu#set:_pc))
 (export "Z80Cpu#get:sp" (func $src/assembly/Z80Cpu/Z80Cpu#get:_sp))
 (export "Z80Cpu#set:sp" (func $src/assembly/Z80Cpu/Z80Cpu#set:_sp))
 (export "Z80Cpu#get:xh" (func $src/assembly/Z80Cpu/Z80Cpu#get:_xh))
 (export "Z80Cpu#set:xh" (func $src/assembly/Z80Cpu/Z80Cpu#set:xh))
 (export "Z80Cpu#get:xl" (func $src/assembly/Z80Cpu/Z80Cpu#get:_xl))
 (export "Z80Cpu#set:xl" (func $src/assembly/Z80Cpu/Z80Cpu#set:xl))
 (export "Z80Cpu#get:ix" (func $src/assembly/Z80Cpu/Z80Cpu#get:_ix))
 (export "Z80Cpu#set:ix" (func $src/assembly/Z80Cpu/Z80Cpu#set:ix))
 (export "Z80Cpu#get:yh" (func $src/assembly/Z80Cpu/Z80Cpu#get:_yh))
 (export "Z80Cpu#set:yh" (func $src/assembly/Z80Cpu/Z80Cpu#set:yh))
 (export "Z80Cpu#get:yl" (func $src/assembly/Z80Cpu/Z80Cpu#get:_yl))
 (export "Z80Cpu#set:yl" (func $src/assembly/Z80Cpu/Z80Cpu#set:yl))
 (export "Z80Cpu#get:iy" (func $src/assembly/Z80Cpu/Z80Cpu#get:_iy))
 (export "Z80Cpu#set:iy" (func $src/assembly/Z80Cpu/Z80Cpu#set:iy))
 (export "Z80Cpu#get:wh" (func $src/assembly/Z80Cpu/Z80Cpu#get:_wh))
 (export "Z80Cpu#set:wh" (func $src/assembly/Z80Cpu/Z80Cpu#set:wh))
 (export "Z80Cpu#get:wl" (func $src/assembly/Z80Cpu/Z80Cpu#get:_wl))
 (export "Z80Cpu#set:wl" (func $src/assembly/Z80Cpu/Z80Cpu#set:wl))
 (export "Z80Cpu#get:wz" (func $src/assembly/Z80Cpu/Z80Cpu#get:_wz))
 (export "Z80Cpu#set:wz" (func $src/assembly/Z80Cpu/Z80Cpu#set:wz))
 (export "Z80Cpu#readMemory" (func $src/assembly/Z80Cpu/Z80Cpu#readMemory))
 (export "Z80Cpu#writeMemory" (func $src/assembly/Z80Cpu/Z80Cpu#writeMemory))
 (export "Z80Cpu#readPort" (func $src/assembly/Z80Cpu/Z80Cpu#readMemory))
 (export "Z80Cpu#writePort" (func $src/assembly/Z80Cpu/Z80Cpu#writeMemory))
 (export "Z80Cpu#delay" (func $src/assembly/Z80Cpu/Z80Cpu#delay))
 (export "Z80Cpu#longOp" (func $src/assembly/Z80Cpu/Z80Cpu#longOp))
 (export "TestZ80Machine" (global $src/assembly/test-machine/TestZ80Machine/TestZ80Machine))
 (export "TestZ80Machine#get:cpu" (func $src/assembly/test-machine/TestZ80Machine/TestZ80Machine#get:cpu))
 (export "TestZ80Machine#constructor" (func $src/assembly/test-machine/TestZ80Machine/TestZ80Machine#constructor))
 (export "TestZ80Machine#get:memoryAccessLog" (func $src/assembly/test-machine/TestZ80Machine/TestZ80Machine#get:memoryAccessLog))
 (export "TestZ80Machine#get:ioAccessLog" (func $src/assembly/test-machine/TestZ80Machine/TestZ80Machine#get:ioAccessLog))
 (export "TestZ80Machine#get:memory" (func $src/assembly/test-machine/TestZ80Machine/TestZ80Machine#get:memory))
 (start $~start)
 (func $~lib/rt/tlsf/removeBlock (; 1 ;) (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $1
  i32.load
  local.tee $3
  i32.const 1
  i32.and
  i32.eqz
  if
   i32.const 0
   i32.const 32
   i32.const 277
   i32.const 13
   call $~lib/builtins/abort
   unreachable
  end
  local.get $3
  i32.const -4
  i32.and
  local.tee $2
  i32.const 16
  i32.ge_u
  if (result i32)
   local.get $2
   i32.const 1073741808
   i32.lt_u
  else
   i32.const 0
  end
  i32.eqz
  if
   i32.const 0
   i32.const 32
   i32.const 279
   i32.const 13
   call $~lib/builtins/abort
   unreachable
  end
  local.get $2
  i32.const 256
  i32.lt_u
  if (result i32)
   local.get $2
   i32.const 4
   i32.shr_u
   local.set $2
   i32.const 0
  else
   local.get $2
   i32.const 31
   local.get $2
   i32.clz
   i32.sub
   local.tee $3
   i32.const 4
   i32.sub
   i32.shr_u
   i32.const 16
   i32.xor
   local.set $2
   local.get $3
   i32.const 7
   i32.sub
  end
  local.tee $3
  i32.const 23
  i32.lt_u
  if (result i32)
   local.get $2
   i32.const 16
   i32.lt_u
  else
   i32.const 0
  end
  i32.eqz
  if
   i32.const 0
   i32.const 32
   i32.const 292
   i32.const 13
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  i32.load offset=20
  local.set $4
  local.get $1
  i32.load offset=16
  local.tee $5
  if
   local.get $5
   local.get $4
   i32.store offset=20
  end
  local.get $4
  if
   local.get $4
   local.get $5
   i32.store offset=16
  end
  local.get $1
  local.get $0
  local.get $2
  local.get $3
  i32.const 4
  i32.shl
  i32.add
  i32.const 2
  i32.shl
  i32.add
  i32.load offset=96
  i32.eq
  if
   local.get $0
   local.get $2
   local.get $3
   i32.const 4
   i32.shl
   i32.add
   i32.const 2
   i32.shl
   i32.add
   local.get $4
   i32.store offset=96
   local.get $4
   i32.eqz
   if
    local.get $0
    local.get $3
    i32.const 2
    i32.shl
    i32.add
    local.get $0
    local.get $3
    i32.const 2
    i32.shl
    i32.add
    i32.load offset=4
    i32.const 1
    local.get $2
    i32.shl
    i32.const -1
    i32.xor
    i32.and
    local.tee $1
    i32.store offset=4
    local.get $1
    i32.eqz
    if
     local.get $0
     local.get $0
     i32.load
     i32.const 1
     local.get $3
     i32.shl
     i32.const -1
     i32.xor
     i32.and
     i32.store
    end
   end
  end
 )
 (func $~lib/rt/tlsf/insertBlock (; 2 ;) (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  local.get $1
  i32.eqz
  if
   i32.const 0
   i32.const 32
   i32.const 205
   i32.const 13
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  i32.load
  local.tee $3
  i32.const 1
  i32.and
  i32.eqz
  if
   i32.const 0
   i32.const 32
   i32.const 207
   i32.const 13
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  i32.const 16
  i32.add
  local.get $1
  i32.load
  i32.const -4
  i32.and
  i32.add
  local.tee $4
  i32.load
  local.tee $5
  i32.const 1
  i32.and
  if
   local.get $3
   i32.const -4
   i32.and
   i32.const 16
   i32.add
   local.get $5
   i32.const -4
   i32.and
   i32.add
   local.tee $2
   i32.const 1073741808
   i32.lt_u
   if
    local.get $0
    local.get $4
    call $~lib/rt/tlsf/removeBlock
    local.get $1
    local.get $2
    local.get $3
    i32.const 3
    i32.and
    i32.or
    local.tee $3
    i32.store
    local.get $1
    i32.const 16
    i32.add
    local.get $1
    i32.load
    i32.const -4
    i32.and
    i32.add
    local.tee $4
    i32.load
    local.set $5
   end
  end
  local.get $3
  i32.const 2
  i32.and
  if
   local.get $1
   i32.const 4
   i32.sub
   i32.load
   local.tee $2
   i32.load
   local.tee $6
   i32.const 1
   i32.and
   i32.eqz
   if
    i32.const 0
    i32.const 32
    i32.const 228
    i32.const 15
    call $~lib/builtins/abort
    unreachable
   end
   local.get $6
   i32.const -4
   i32.and
   i32.const 16
   i32.add
   local.get $3
   i32.const -4
   i32.and
   i32.add
   local.tee $7
   i32.const 1073741808
   i32.lt_u
   if
    local.get $0
    local.get $2
    call $~lib/rt/tlsf/removeBlock
    local.get $2
    local.get $7
    local.get $6
    i32.const 3
    i32.and
    i32.or
    local.tee $3
    i32.store
    local.get $2
    local.set $1
   end
  end
  local.get $4
  local.get $5
  i32.const 2
  i32.or
  i32.store
  local.get $3
  i32.const -4
  i32.and
  local.tee $2
  i32.const 16
  i32.ge_u
  if (result i32)
   local.get $2
   i32.const 1073741808
   i32.lt_u
  else
   i32.const 0
  end
  i32.eqz
  if
   i32.const 0
   i32.const 32
   i32.const 243
   i32.const 13
   call $~lib/builtins/abort
   unreachable
  end
  local.get $2
  local.get $1
  i32.const 16
  i32.add
  i32.add
  local.get $4
  i32.ne
  if
   i32.const 0
   i32.const 32
   i32.const 244
   i32.const 13
   call $~lib/builtins/abort
   unreachable
  end
  local.get $4
  i32.const 4
  i32.sub
  local.get $1
  i32.store
  local.get $2
  i32.const 256
  i32.lt_u
  if (result i32)
   local.get $2
   i32.const 4
   i32.shr_u
   local.set $4
   i32.const 0
  else
   local.get $2
   i32.const 31
   local.get $2
   i32.clz
   i32.sub
   local.tee $2
   i32.const 4
   i32.sub
   i32.shr_u
   i32.const 16
   i32.xor
   local.set $4
   local.get $2
   i32.const 7
   i32.sub
  end
  local.tee $3
  i32.const 23
  i32.lt_u
  if (result i32)
   local.get $4
   i32.const 16
   i32.lt_u
  else
   i32.const 0
  end
  i32.eqz
  if
   i32.const 0
   i32.const 32
   i32.const 260
   i32.const 13
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  local.get $4
  local.get $3
  i32.const 4
  i32.shl
  i32.add
  i32.const 2
  i32.shl
  i32.add
  i32.load offset=96
  local.set $2
  local.get $1
  i32.const 0
  i32.store offset=16
  local.get $1
  local.get $2
  i32.store offset=20
  local.get $2
  if
   local.get $2
   local.get $1
   i32.store offset=16
  end
  local.get $0
  local.get $4
  local.get $3
  i32.const 4
  i32.shl
  i32.add
  i32.const 2
  i32.shl
  i32.add
  local.get $1
  i32.store offset=96
  local.get $0
  local.get $0
  i32.load
  i32.const 1
  local.get $3
  i32.shl
  i32.or
  i32.store
  local.get $0
  local.get $3
  i32.const 2
  i32.shl
  i32.add
  local.get $0
  local.get $3
  i32.const 2
  i32.shl
  i32.add
  i32.load offset=4
  i32.const 1
  local.get $4
  i32.shl
  i32.or
  i32.store offset=4
 )
 (func $~lib/rt/tlsf/addMemory (; 3 ;) (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  local.get $2
  i32.const 15
  i32.and
  i32.eqz
  i32.const 0
  local.get $1
  i32.const 15
  i32.and
  i32.eqz
  i32.const 0
  local.get $1
  local.get $2
  i32.le_u
  select
  select
  i32.eqz
  if
   i32.const 0
   i32.const 32
   i32.const 386
   i32.const 4
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  i32.load offset=1568
  local.tee $3
  if
   local.get $1
   local.get $3
   i32.const 16
   i32.add
   i32.lt_u
   if
    i32.const 0
    i32.const 32
    i32.const 396
    i32.const 15
    call $~lib/builtins/abort
    unreachable
   end
   local.get $3
   local.get $1
   i32.const 16
   i32.sub
   i32.eq
   if
    local.get $3
    i32.load
    local.set $4
    local.get $1
    i32.const 16
    i32.sub
    local.set $1
   end
  else
   local.get $1
   local.get $0
   i32.const 1572
   i32.add
   i32.lt_u
   if
    i32.const 0
    i32.const 32
    i32.const 408
    i32.const 4
    call $~lib/builtins/abort
    unreachable
   end
  end
  local.get $2
  local.get $1
  i32.sub
  local.tee $2
  i32.const 48
  i32.lt_u
  if
   return
  end
  local.get $1
  local.get $4
  i32.const 2
  i32.and
  local.get $2
  i32.const 32
  i32.sub
  i32.const 1
  i32.or
  i32.or
  i32.store
  local.get $1
  i32.const 0
  i32.store offset=16
  local.get $1
  i32.const 0
  i32.store offset=20
  local.get $1
  local.get $2
  i32.add
  i32.const 16
  i32.sub
  local.tee $2
  i32.const 2
  i32.store
  local.get $0
  local.get $2
  i32.store offset=1568
  local.get $0
  local.get $1
  call $~lib/rt/tlsf/insertBlock
 )
 (func $~lib/rt/tlsf/maybeInitialize (; 4 ;) (result i32)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  global.get $~lib/rt/tlsf/ROOT
  local.tee $0
  i32.eqz
  if
   i32.const 1
   memory.size
   local.tee $0
   i32.gt_s
   if (result i32)
    i32.const 1
    local.get $0
    i32.sub
    memory.grow
    i32.const 0
    i32.lt_s
   else
    i32.const 0
   end
   if
    unreachable
   end
   i32.const 880
   local.tee $0
   i32.const 0
   i32.store
   i32.const 2448
   i32.const 0
   i32.store
   loop $for-loop|0
    local.get $1
    i32.const 23
    i32.lt_u
    if
     local.get $1
     i32.const 2
     i32.shl
     i32.const 880
     i32.add
     i32.const 0
     i32.store offset=4
     i32.const 0
     local.set $2
     loop $for-loop|1
      local.get $2
      i32.const 16
      i32.lt_u
      if
       local.get $1
       i32.const 4
       i32.shl
       local.get $2
       i32.add
       i32.const 2
       i32.shl
       i32.const 880
       i32.add
       i32.const 0
       i32.store offset=96
       local.get $2
       i32.const 1
       i32.add
       local.set $2
       br $for-loop|1
      end
     end
     local.get $1
     i32.const 1
     i32.add
     local.set $1
     br $for-loop|0
    end
   end
   i32.const 880
   i32.const 2464
   memory.size
   i32.const 16
   i32.shl
   call $~lib/rt/tlsf/addMemory
   i32.const 880
   global.set $~lib/rt/tlsf/ROOT
  end
  local.get $0
 )
 (func $~lib/rt/tlsf/prepareSize (; 5 ;) (param $0 i32) (result i32)
  local.get $0
  i32.const 1073741808
  i32.ge_u
  if
   i32.const 80
   i32.const 32
   i32.const 457
   i32.const 29
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  i32.const 15
  i32.add
  i32.const -16
  i32.and
  local.tee $0
  i32.const 16
  local.get $0
  i32.const 16
  i32.gt_u
  select
 )
 (func $~lib/rt/tlsf/searchBlock (; 6 ;) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $1
  i32.const 256
  i32.lt_u
  if (result i32)
   local.get $1
   i32.const 4
   i32.shr_u
   local.set $1
   i32.const 0
  else
   local.get $1
   i32.const 536870904
   i32.lt_u
   if
    local.get $1
    i32.const 1
    i32.const 27
    local.get $1
    i32.clz
    i32.sub
    i32.shl
    i32.add
    i32.const 1
    i32.sub
    local.set $1
   end
   local.get $1
   i32.const 31
   local.get $1
   i32.clz
   i32.sub
   local.tee $2
   i32.const 4
   i32.sub
   i32.shr_u
   i32.const 16
   i32.xor
   local.set $1
   local.get $2
   i32.const 7
   i32.sub
  end
  local.tee $2
  i32.const 23
  i32.lt_u
  if (result i32)
   local.get $1
   i32.const 16
   i32.lt_u
  else
   i32.const 0
  end
  i32.eqz
  if
   i32.const 0
   i32.const 32
   i32.const 338
   i32.const 13
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  local.get $2
  i32.const 2
  i32.shl
  i32.add
  i32.load offset=4
  i32.const -1
  local.get $1
  i32.shl
  i32.and
  local.tee $1
  if (result i32)
   local.get $0
   local.get $1
   i32.ctz
   local.get $2
   i32.const 4
   i32.shl
   i32.add
   i32.const 2
   i32.shl
   i32.add
   i32.load offset=96
  else
   local.get $0
   i32.load
   i32.const -1
   local.get $2
   i32.const 1
   i32.add
   i32.shl
   i32.and
   local.tee $1
   if (result i32)
    local.get $0
    local.get $1
    i32.ctz
    local.tee $1
    i32.const 2
    i32.shl
    i32.add
    i32.load offset=4
    local.tee $2
    i32.eqz
    if
     i32.const 0
     i32.const 32
     i32.const 351
     i32.const 17
     call $~lib/builtins/abort
     unreachable
    end
    local.get $0
    local.get $2
    i32.ctz
    local.get $1
    i32.const 4
    i32.shl
    i32.add
    i32.const 2
    i32.shl
    i32.add
    i32.load offset=96
   else
    i32.const 0
   end
  end
 )
 (func $~lib/rt/tlsf/growMemory (; 7 ;) (param $0 i32) (param $1 i32)
  (local $2 i32)
  memory.size
  local.tee $2
  i32.const 16
  local.get $0
  i32.load offset=1568
  local.get $2
  i32.const 16
  i32.shl
  i32.const 16
  i32.sub
  i32.ne
  i32.shl
  local.get $1
  i32.const 1
  i32.const 27
  local.get $1
  i32.clz
  i32.sub
  i32.shl
  i32.const 1
  i32.sub
  i32.add
  local.get $1
  local.get $1
  i32.const 536870904
  i32.lt_u
  select
  i32.add
  i32.const 65535
  i32.add
  i32.const -65536
  i32.and
  i32.const 16
  i32.shr_u
  local.tee $1
  local.get $2
  local.get $1
  i32.gt_s
  select
  memory.grow
  i32.const 0
  i32.lt_s
  if
   local.get $1
   memory.grow
   i32.const 0
   i32.lt_s
   if
    unreachable
   end
  end
  local.get $0
  local.get $2
  i32.const 16
  i32.shl
  memory.size
  i32.const 16
  i32.shl
  call $~lib/rt/tlsf/addMemory
 )
 (func $~lib/rt/tlsf/prepareBlock (; 8 ;) (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  local.get $1
  i32.load
  local.set $3
  local.get $2
  i32.const 15
  i32.and
  if
   i32.const 0
   i32.const 32
   i32.const 365
   i32.const 13
   call $~lib/builtins/abort
   unreachable
  end
  local.get $3
  i32.const -4
  i32.and
  local.get $2
  i32.sub
  local.tee $4
  i32.const 32
  i32.ge_u
  if
   local.get $1
   local.get $2
   local.get $3
   i32.const 2
   i32.and
   i32.or
   i32.store
   local.get $2
   local.get $1
   i32.const 16
   i32.add
   i32.add
   local.tee $1
   local.get $4
   i32.const 16
   i32.sub
   i32.const 1
   i32.or
   i32.store
   local.get $0
   local.get $1
   call $~lib/rt/tlsf/insertBlock
  else
   local.get $1
   local.get $3
   i32.const -2
   i32.and
   i32.store
   local.get $1
   i32.const 16
   i32.add
   local.get $1
   i32.load
   i32.const -4
   i32.and
   i32.add
   local.get $1
   i32.const 16
   i32.add
   local.get $1
   i32.load
   i32.const -4
   i32.and
   i32.add
   i32.load
   i32.const -3
   i32.and
   i32.store
  end
 )
 (func $~lib/rt/tlsf/allocateBlock (; 9 ;) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/rt/tlsf/collectLock
  if
   i32.const 0
   i32.const 32
   i32.const 490
   i32.const 13
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  local.get $1
  call $~lib/rt/tlsf/prepareSize
  local.tee $4
  call $~lib/rt/tlsf/searchBlock
  local.tee $3
  i32.eqz
  if
   i32.const 1
   global.set $~lib/rt/tlsf/collectLock
   call $~lib/rt/pure/__collect
   i32.const 0
   global.set $~lib/rt/tlsf/collectLock
   local.get $0
   local.get $4
   call $~lib/rt/tlsf/searchBlock
   local.tee $3
   i32.eqz
   if
    local.get $0
    local.get $4
    call $~lib/rt/tlsf/growMemory
    local.get $0
    local.get $4
    call $~lib/rt/tlsf/searchBlock
    local.tee $3
    i32.eqz
    if
     i32.const 0
     i32.const 32
     i32.const 502
     i32.const 19
     call $~lib/builtins/abort
     unreachable
    end
   end
  end
  local.get $3
  i32.load
  i32.const -4
  i32.and
  local.get $4
  i32.lt_u
  if
   i32.const 0
   i32.const 32
   i32.const 510
   i32.const 13
   call $~lib/builtins/abort
   unreachable
  end
  local.get $3
  i32.const 0
  i32.store offset=4
  local.get $3
  local.get $2
  i32.store offset=8
  local.get $3
  local.get $1
  i32.store offset=12
  local.get $0
  local.get $3
  call $~lib/rt/tlsf/removeBlock
  local.get $0
  local.get $3
  local.get $4
  call $~lib/rt/tlsf/prepareBlock
  local.get $3
 )
 (func $~lib/rt/tlsf/__alloc (; 10 ;) (param $0 i32) (param $1 i32) (result i32)
  call $~lib/rt/tlsf/maybeInitialize
  local.get $0
  local.get $1
  call $~lib/rt/tlsf/allocateBlock
  i32.const 16
  i32.add
 )
 (func $~lib/rt/pure/increment (; 11 ;) (param $0 i32)
  (local $1 i32)
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.const -268435456
  i32.and
  local.get $1
  i32.const 1
  i32.add
  i32.const -268435456
  i32.and
  i32.ne
  if
   i32.const 0
   i32.const 144
   i32.const 109
   i32.const 2
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  local.get $1
  i32.const 1
  i32.add
  i32.store offset=4
  local.get $0
  i32.load
  i32.const 1
  i32.and
  if
   i32.const 0
   i32.const 144
   i32.const 112
   i32.const 13
   call $~lib/builtins/abort
   unreachable
  end
 )
 (func $~lib/rt/pure/__retain (; 12 ;) (param $0 i32) (result i32)
  local.get $0
  i32.const 868
  i32.gt_u
  if
   local.get $0
   i32.const 16
   i32.sub
   call $~lib/rt/pure/increment
  end
  local.get $0
 )
 (func $~lib/rt/pure/__release (; 13 ;) (param $0 i32)
  local.get $0
  i32.const 868
  i32.gt_u
  if
   local.get $0
   i32.const 16
   i32.sub
   call $~lib/rt/pure/decrement
  end
 )
 (func $~lib/memory/memory.copy (; 14 ;) (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  block $~lib/util/memory/memmove|inlined.0
   local.get $2
   local.set $3
   local.get $0
   local.get $1
   i32.eq
   br_if $~lib/util/memory/memmove|inlined.0
   local.get $0
   local.get $1
   i32.lt_u
   if
    local.get $1
    i32.const 7
    i32.and
    local.get $0
    i32.const 7
    i32.and
    i32.eq
    if
     loop $while-continue|0
      local.get $0
      i32.const 7
      i32.and
      if
       local.get $3
       i32.eqz
       br_if $~lib/util/memory/memmove|inlined.0
       local.get $3
       i32.const 1
       i32.sub
       local.set $3
       local.get $0
       local.tee $2
       i32.const 1
       i32.add
       local.set $0
       local.get $1
       local.tee $4
       i32.const 1
       i32.add
       local.set $1
       local.get $2
       local.get $4
       i32.load8_u
       i32.store8
       br $while-continue|0
      end
     end
     loop $while-continue|1
      local.get $3
      i32.const 8
      i32.ge_u
      if
       local.get $0
       local.get $1
       i64.load
       i64.store
       local.get $3
       i32.const 8
       i32.sub
       local.set $3
       local.get $0
       i32.const 8
       i32.add
       local.set $0
       local.get $1
       i32.const 8
       i32.add
       local.set $1
       br $while-continue|1
      end
     end
    end
    loop $while-continue|2
     local.get $3
     if
      local.get $0
      local.tee $2
      i32.const 1
      i32.add
      local.set $0
      local.get $1
      local.tee $4
      i32.const 1
      i32.add
      local.set $1
      local.get $2
      local.get $4
      i32.load8_u
      i32.store8
      local.get $3
      i32.const 1
      i32.sub
      local.set $3
      br $while-continue|2
     end
    end
   else
    local.get $1
    i32.const 7
    i32.and
    local.get $0
    i32.const 7
    i32.and
    i32.eq
    if
     loop $while-continue|3
      local.get $0
      local.get $3
      i32.add
      i32.const 7
      i32.and
      if
       local.get $3
       i32.eqz
       br_if $~lib/util/memory/memmove|inlined.0
       local.get $3
       i32.const 1
       i32.sub
       local.tee $3
       local.get $0
       i32.add
       local.get $1
       local.get $3
       i32.add
       i32.load8_u
       i32.store8
       br $while-continue|3
      end
     end
     loop $while-continue|4
      local.get $3
      i32.const 8
      i32.ge_u
      if
       local.get $3
       i32.const 8
       i32.sub
       local.tee $3
       local.get $0
       i32.add
       local.get $1
       local.get $3
       i32.add
       i64.load
       i64.store
       br $while-continue|4
      end
     end
    end
    loop $while-continue|5
     local.get $3
     if
      local.get $3
      i32.const 1
      i32.sub
      local.tee $3
      local.get $0
      i32.add
      local.get $1
      local.get $3
      i32.add
      i32.load8_u
      i32.store8
      br $while-continue|5
     end
    end
   end
  end
 )
 (func $~lib/rt/__allocArray (; 15 ;) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  i32.const 16
  local.get $0
  call $~lib/rt/tlsf/__alloc
  local.tee $0
  i32.const 0
  i32.const 0
  call $~lib/rt/tlsf/__alloc
  local.set $2
  local.get $1
  if
   local.get $2
   local.get $1
   i32.const 0
   call $~lib/memory/memory.copy
  end
  local.get $2
  call $~lib/rt/pure/__retain
  i32.store
  local.get $0
  local.get $2
  i32.store offset=4
  local.get $0
  i32.const 0
  i32.store offset=8
  local.get $0
  i32.const 0
  i32.store offset=12
  local.get $0
 )
 (func $~lib/rt/tlsf/checkUsedBlock (; 16 ;) (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  i32.const 16
  i32.sub
  local.set $1
  local.get $0
  i32.const 15
  i32.and
  i32.eqz
  i32.const 0
  local.get $0
  select
  if (result i32)
   local.get $1
   i32.load
   i32.const 1
   i32.and
   i32.eqz
  else
   i32.const 0
  end
  if (result i32)
   local.get $1
   i32.load offset=4
   i32.const -268435456
   i32.and
   i32.eqz
  else
   i32.const 0
  end
  i32.eqz
  if
   i32.const 0
   i32.const 32
   i32.const 570
   i32.const 2
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
 )
 (func $~lib/rt/tlsf/freeBlock (; 17 ;) (param $0 i32) (param $1 i32)
  local.get $1
  local.get $1
  i32.load
  i32.const 1
  i32.or
  i32.store
  local.get $0
  local.get $1
  call $~lib/rt/tlsf/insertBlock
 )
 (func $~lib/rt/tlsf/reallocateBlock (; 18 ;) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  local.get $2
  call $~lib/rt/tlsf/prepareSize
  local.tee $3
  local.get $1
  i32.load
  local.tee $5
  i32.const -4
  i32.and
  i32.le_u
  if
   local.get $0
   local.get $1
   local.get $3
   call $~lib/rt/tlsf/prepareBlock
   local.get $1
   local.get $2
   i32.store offset=12
   local.get $1
   return
  end
  local.get $1
  i32.const 16
  i32.add
  local.get $1
  i32.load
  i32.const -4
  i32.and
  i32.add
  local.tee $6
  i32.load
  local.tee $4
  i32.const 1
  i32.and
  if
   local.get $5
   i32.const -4
   i32.and
   i32.const 16
   i32.add
   local.get $4
   i32.const -4
   i32.and
   i32.add
   local.tee $4
   local.get $3
   i32.ge_u
   if
    local.get $0
    local.get $6
    call $~lib/rt/tlsf/removeBlock
    local.get $1
    local.get $5
    i32.const 3
    i32.and
    local.get $4
    i32.or
    i32.store
    local.get $1
    local.get $2
    i32.store offset=12
    local.get $0
    local.get $1
    local.get $3
    call $~lib/rt/tlsf/prepareBlock
    local.get $1
    return
   end
  end
  local.get $0
  local.get $2
  local.get $1
  i32.load offset=8
  call $~lib/rt/tlsf/allocateBlock
  local.tee $3
  local.get $1
  i32.load offset=4
  i32.store offset=4
  local.get $3
  i32.const 16
  i32.add
  local.get $1
  i32.const 16
  i32.add
  local.get $2
  call $~lib/memory/memory.copy
  local.get $1
  i32.const 868
  i32.ge_u
  if
   local.get $0
   local.get $1
   call $~lib/rt/tlsf/freeBlock
  end
  local.get $3
 )
 (func $~lib/memory/memory.fill (; 19 ;) (param $0 i32) (param $1 i32)
  (local $2 i32)
  block $~lib/util/memory/memset|inlined.0
   local.get $1
   i32.eqz
   br_if $~lib/util/memory/memset|inlined.0
   local.get $0
   i32.const 0
   i32.store8
   local.get $0
   local.get $1
   i32.add
   i32.const 1
   i32.sub
   i32.const 0
   i32.store8
   local.get $1
   i32.const 2
   i32.le_u
   br_if $~lib/util/memory/memset|inlined.0
   local.get $0
   i32.const 1
   i32.add
   i32.const 0
   i32.store8
   local.get $0
   i32.const 2
   i32.add
   i32.const 0
   i32.store8
   local.get $0
   local.get $1
   i32.add
   local.tee $2
   i32.const 2
   i32.sub
   i32.const 0
   i32.store8
   local.get $2
   i32.const 3
   i32.sub
   i32.const 0
   i32.store8
   local.get $1
   i32.const 6
   i32.le_u
   br_if $~lib/util/memory/memset|inlined.0
   local.get $0
   i32.const 3
   i32.add
   i32.const 0
   i32.store8
   local.get $0
   local.get $1
   i32.add
   i32.const 4
   i32.sub
   i32.const 0
   i32.store8
   local.get $1
   i32.const 8
   i32.le_u
   br_if $~lib/util/memory/memset|inlined.0
   local.get $1
   i32.const 0
   local.get $0
   i32.sub
   i32.const 3
   i32.and
   local.tee $1
   i32.sub
   local.set $2
   local.get $0
   local.get $1
   i32.add
   local.tee $0
   i32.const 0
   i32.store
   local.get $0
   local.get $2
   i32.const -4
   i32.and
   local.tee $1
   i32.add
   i32.const 4
   i32.sub
   i32.const 0
   i32.store
   local.get $1
   i32.const 8
   i32.le_u
   br_if $~lib/util/memory/memset|inlined.0
   local.get $0
   i32.const 4
   i32.add
   i32.const 0
   i32.store
   local.get $0
   i32.const 8
   i32.add
   i32.const 0
   i32.store
   local.get $0
   local.get $1
   i32.add
   local.tee $2
   i32.const 12
   i32.sub
   i32.const 0
   i32.store
   local.get $2
   i32.const 8
   i32.sub
   i32.const 0
   i32.store
   local.get $1
   i32.const 24
   i32.le_u
   br_if $~lib/util/memory/memset|inlined.0
   local.get $0
   i32.const 12
   i32.add
   i32.const 0
   i32.store
   local.get $0
   i32.const 16
   i32.add
   i32.const 0
   i32.store
   local.get $0
   i32.const 20
   i32.add
   i32.const 0
   i32.store
   local.get $0
   i32.const 24
   i32.add
   i32.const 0
   i32.store
   local.get $0
   local.get $1
   i32.add
   local.tee $2
   i32.const 28
   i32.sub
   i32.const 0
   i32.store
   local.get $2
   i32.const 24
   i32.sub
   i32.const 0
   i32.store
   local.get $2
   i32.const 20
   i32.sub
   i32.const 0
   i32.store
   local.get $2
   i32.const 16
   i32.sub
   i32.const 0
   i32.store
   local.get $0
   local.get $0
   i32.const 4
   i32.and
   i32.const 24
   i32.add
   local.tee $2
   i32.add
   local.set $0
   local.get $1
   local.get $2
   i32.sub
   local.set $1
   loop $while-continue|0
    local.get $1
    i32.const 32
    i32.ge_u
    if
     local.get $0
     i64.const 0
     i64.store
     local.get $0
     i32.const 8
     i32.add
     i64.const 0
     i64.store
     local.get $0
     i32.const 16
     i32.add
     i64.const 0
     i64.store
     local.get $0
     i32.const 24
     i32.add
     i64.const 0
     i64.store
     local.get $1
     i32.const 32
     i32.sub
     local.set $1
     local.get $0
     i32.const 32
     i32.add
     local.set $0
     br $while-continue|0
    end
   end
  end
 )
 (func $~lib/array/ensureSize (; 20 ;) (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  local.get $1
  local.get $0
  i32.load offset=8
  local.tee $3
  local.get $2
  i32.shr_u
  i32.gt_u
  if
   local.get $1
   i32.const 1073741808
   local.get $2
   i32.shr_u
   i32.gt_u
   if
    i32.const 336
    i32.const 288
    i32.const 14
    i32.const 47
    call $~lib/builtins/abort
    unreachable
   end
   local.get $0
   i32.load
   local.set $4
   local.get $3
   call $~lib/rt/tlsf/maybeInitialize
   local.get $4
   call $~lib/rt/tlsf/checkUsedBlock
   local.get $1
   local.get $2
   i32.shl
   local.tee $2
   call $~lib/rt/tlsf/reallocateBlock
   i32.const 16
   i32.add
   local.tee $1
   i32.add
   local.get $2
   local.get $3
   i32.sub
   call $~lib/memory/memory.fill
   local.get $1
   local.get $4
   i32.ne
   if
    local.get $0
    local.get $1
    i32.store
    local.get $0
    local.get $1
    i32.store offset=4
   end
   local.get $0
   local.get $2
   i32.store offset=8
  end
 )
 (func $~lib/array/Array<bool>#__set (; 21 ;) (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  local.get $1
  local.get $0
  i32.load offset=12
  i32.ge_u
  if
   local.get $1
   i32.const 0
   i32.lt_s
   if
    i32.const 224
    i32.const 288
    i32.const 109
    i32.const 21
    call $~lib/builtins/abort
    unreachable
   end
   local.get $0
   local.get $1
   i32.const 1
   i32.add
   local.tee $3
   i32.const 0
   call $~lib/array/ensureSize
   local.get $0
   local.get $3
   i32.store offset=12
  end
  local.get $1
  local.get $0
  i32.load offset=4
  i32.add
  local.get $2
  i32.store8
 )
 (func $~lib/array/Array<src/assembly/Z80Cpu/Z80Cpu | null>#__unchecked_set (; 22 ;) (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 2
  i32.shl
  i32.add
  local.tee $0
  i32.load
  local.tee $1
  local.get $2
  i32.ne
  if
   local.get $0
   local.get $2
   call $~lib/rt/pure/__retain
   i32.store
   local.get $1
   call $~lib/rt/pure/__release
  end
 )
 (func $~lib/array/Array<src/assembly/Z80Cpu/Z80Cpu | null>#__set (; 23 ;) (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  local.get $1
  local.get $0
  i32.load offset=12
  i32.ge_u
  if
   local.get $1
   i32.const 0
   i32.lt_s
   if
    i32.const 224
    i32.const 288
    i32.const 109
    i32.const 21
    call $~lib/builtins/abort
    unreachable
   end
   local.get $0
   local.get $1
   i32.const 1
   i32.add
   local.tee $3
   i32.const 2
   call $~lib/array/ensureSize
   local.get $0
   local.get $3
   i32.store offset=12
  end
  local.get $0
  local.get $1
  local.get $2
  call $~lib/array/Array<src/assembly/Z80Cpu/Z80Cpu | null>#__unchecked_set
 )
 (func $src/assembly/ObjectPool/ObjectPool<src/assembly/Z80Cpu/Z80Cpu>#reset (; 24 ;) (param $0 i32)
  (local $1 i32)
  loop $for-loop|0
   local.get $1
   local.get $0
   i32.load offset=8
   i32.lt_s
   if
    local.get $0
    i32.load
    local.get $1
    i32.const 0
    call $~lib/array/Array<bool>#__set
    local.get $0
    i32.load offset=4
    local.get $1
    i32.const 0
    call $~lib/array/Array<src/assembly/Z80Cpu/Z80Cpu | null>#__set
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
 )
 (func $src/assembly/ObjectPool/ObjectPool<src/assembly/Z80Cpu/Z80Cpu>#constructor (; 25 ;) (result i32)
  (local $0 i32)
  i32.const 16
  i32.const 13
  call $~lib/rt/tlsf/__alloc
  call $~lib/rt/pure/__retain
  local.tee $0
  i32.const 14
  i32.const 192
  call $~lib/rt/__allocArray
  call $~lib/rt/pure/__retain
  i32.store
  local.get $0
  i32.const 15
  i32.const 208
  call $~lib/rt/__allocArray
  call $~lib/rt/pure/__retain
  i32.store offset=4
  local.get $0
  i32.const 100
  i32.store offset=8
  local.get $0
  i32.const 1
  i32.store offset=12
  local.get $0
  call $src/assembly/ObjectPool/ObjectPool<src/assembly/Z80Cpu/Z80Cpu>#reset
  local.get $0
 )
 (func $~lib/arraybuffer/ArrayBufferView#constructor (; 26 ;) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  local.get $1
  i32.const 1073741808
  local.get $2
  i32.shr_u
  i32.gt_u
  if
   i32.const 336
   i32.const 384
   i32.const 23
   i32.const 56
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  local.get $2
  i32.shl
  local.tee $3
  i32.const 0
  call $~lib/rt/tlsf/__alloc
  local.tee $2
  local.get $3
  call $~lib/memory/memory.fill
  local.get $0
  i32.eqz
  if
   i32.const 12
   i32.const 2
   call $~lib/rt/tlsf/__alloc
   call $~lib/rt/pure/__retain
   local.set $0
  end
  local.get $0
  i32.const 0
  i32.store
  local.get $0
  i32.const 0
  i32.store offset=4
  local.get $0
  i32.const 0
  i32.store offset=8
  local.get $2
  local.set $1
  local.get $2
  local.get $0
  i32.load
  local.tee $4
  i32.ne
  if
   local.get $1
   call $~lib/rt/pure/__retain
   local.set $1
   local.get $4
   call $~lib/rt/pure/__release
  end
  local.get $0
  local.get $1
  i32.store
  local.get $0
  local.get $2
  i32.store offset=4
  local.get $0
  local.get $3
  i32.store offset=8
  local.get $0
 )
 (func $~lib/typedarray/Uint32Array#__set (; 27 ;) (param $0 i32) (param $1 i32)
  local.get $1
  local.get $0
  i32.load offset=8
  i32.const 2
  i32.shr_u
  i32.ge_u
  if
   i32.const 224
   i32.const 448
   i32.const 803
   i32.const 63
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 2
  i32.shl
  i32.add
  i32.const 0
  i32.store
 )
 (func $src/assembly/MemoryStatusArray/MemoryStatusArray#constructor (; 28 ;) (result i32)
  (local $0 i32)
  (local $1 i32)
  i32.const 4
  i32.const 12
  call $~lib/rt/tlsf/__alloc
  call $~lib/rt/pure/__retain
  local.tee $1
  i32.const 12
  i32.const 8
  call $~lib/rt/tlsf/__alloc
  call $~lib/rt/pure/__retain
  i32.const 2048
  i32.const 2
  call $~lib/arraybuffer/ArrayBufferView#constructor
  i32.store
  loop $for-loop|0
   local.get $0
   i32.const 2048
   i32.lt_s
   if
    local.get $1
    i32.load
    local.get $0
    call $~lib/typedarray/Uint32Array#__set
    local.get $0
    i32.const 1
    i32.add
    local.set $0
    br $for-loop|0
   end
  end
  local.get $1
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#constructor (; 29 ;) (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  i32.eqz
  if
   i32.const 90
   i32.const 11
   call $~lib/rt/tlsf/__alloc
   call $~lib/rt/pure/__retain
   local.set $0
  end
  local.get $0
  i32.const 255
  i32.store8
  local.get $0
  i32.const 255
  i32.store8 offset=1
  local.get $0
  i32.const 65535
  i32.store16 offset=2
  local.get $0
  i32.const 255
  i32.store8 offset=4
  local.get $0
  i32.const 255
  i32.store8 offset=5
  local.get $0
  i32.const 65535
  i32.store16 offset=6
  local.get $0
  i32.const 255
  i32.store8 offset=8
  local.get $0
  i32.const 255
  i32.store8 offset=9
  local.get $0
  i32.const 65535
  i32.store16 offset=10
  local.get $0
  i32.const 255
  i32.store8 offset=12
  local.get $0
  i32.const 255
  i32.store8 offset=13
  local.get $0
  i32.const 65535
  i32.store16 offset=14
  local.get $0
  i32.const 65535
  i32.store16 offset=16
  local.get $0
  i32.const 65535
  i32.store16 offset=18
  local.get $0
  i32.const 65535
  i32.store16 offset=20
  local.get $0
  i32.const 65535
  i32.store16 offset=22
  local.get $0
  i32.const 255
  i32.store8 offset=24
  local.get $0
  i32.const 255
  i32.store8 offset=25
  local.get $0
  i32.const 65535
  i32.store16 offset=26
  local.get $0
  i32.const 65535
  i32.store16 offset=28
  local.get $0
  i32.const 255
  i32.store8 offset=30
  local.get $0
  i32.const 255
  i32.store8 offset=31
  local.get $0
  i32.const 255
  i32.store16 offset=32
  local.get $0
  i32.const 255
  i32.store8 offset=34
  local.get $0
  i32.const 255
  i32.store8 offset=35
  local.get $0
  i32.const 255
  i32.store16 offset=36
  local.get $0
  i32.const 255
  i32.store8 offset=38
  local.get $0
  i32.const 255
  i32.store8 offset=39
  local.get $0
  i32.const 255
  i32.store16 offset=40
  local.get $0
  i64.const 0
  i64.store offset=48
  local.get $0
  i32.const 0
  i32.store offset=56
  local.get $0
  i32.const 0
  i32.store8 offset=60
  local.get $0
  i32.const 0
  i32.store8 offset=61
  local.get $0
  i32.const 0
  i32.store8 offset=62
  local.get $0
  i32.const 0
  i32.store8 offset=63
  local.get $0
  i32.const 0
  i32.store8 offset=64
  local.get $0
  i32.const 0
  i32.store8 offset=65
  local.get $0
  call $src/assembly/MemoryStatusArray/MemoryStatusArray#constructor
  i32.store offset=68
  local.get $0
  call $src/assembly/MemoryStatusArray/MemoryStatusArray#constructor
  i32.store offset=72
  local.get $0
  call $src/assembly/MemoryStatusArray/MemoryStatusArray#constructor
  i32.store offset=76
  local.get $0
  i32.const 0
  i32.store offset=80
  local.get $0
  i32.const 0
  i32.store offset=84
  local.get $0
  i32.const 0
  i32.store8 offset=88
  local.get $0
  local.get $1
  i32.store8 offset=89
  local.get $0
 )
 (func $start:src/assembly/index~anonymous|0 (; 30 ;) (result i32)
  i32.const 0
  i32.const 0
  call $src/assembly/Z80Cpu/Z80Cpu#constructor
 )
 (func $src/assembly/ObjectPool/ObjectPool<src/assembly/test-machine/TestZ80Machine/TestZ80Machine>#constructor (; 31 ;) (result i32)
  (local $0 i32)
  i32.const 16
  i32.const 26
  call $~lib/rt/tlsf/__alloc
  call $~lib/rt/pure/__retain
  local.tee $0
  i32.const 14
  i32.const 512
  call $~lib/rt/__allocArray
  call $~lib/rt/pure/__retain
  i32.store
  local.get $0
  i32.const 27
  i32.const 528
  call $~lib/rt/__allocArray
  call $~lib/rt/pure/__retain
  i32.store offset=4
  local.get $0
  i32.const 10
  i32.store offset=8
  local.get $0
  i32.const 2
  i32.store offset=12
  local.get $0
  call $src/assembly/ObjectPool/ObjectPool<src/assembly/Z80Cpu/Z80Cpu>#reset
  local.get $0
 )
 (func $~lib/typedarray/Uint8Array#constructor (; 32 ;) (param $0 i32) (result i32)
  i32.const 12
  i32.const 4
  call $~lib/rt/tlsf/__alloc
  call $~lib/rt/pure/__retain
  local.get $0
  i32.const 0
  call $~lib/arraybuffer/ArrayBufferView#constructor
 )
 (func $~lib/typedarray/Uint8Array#__set (; 33 ;) (param $0 i32) (param $1 i32)
  local.get $1
  local.get $0
  i32.load offset=8
  i32.ge_u
  if
   i32.const 224
   i32.const 448
   i32.const 163
   i32.const 44
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  local.get $0
  i32.load offset=4
  i32.add
  i32.const 255
  i32.store8
 )
 (func $src/assembly/test-machine/TestZ80Cpu/TestMemoryDevice#reset (; 34 ;) (param $0 i32)
  (local $1 i32)
  loop $for-loop|0
   local.get $1
   i32.const 4096
   i32.lt_s
   if
    local.get $0
    i32.load
    local.get $1
    call $~lib/typedarray/Uint8Array#__set
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
  i32.const 21
  i32.const 560
  call $~lib/rt/__allocArray
  call $~lib/rt/pure/__retain
  local.set $1
  local.get $0
  i32.load offset=4
  call $~lib/rt/pure/__release
  local.get $0
  local.get $1
  i32.store offset=4
 )
 (func $src/assembly/test-machine/TestZ80Cpu/TestMemoryDevice#constructor (; 35 ;) (result i32)
  (local $0 i32)
  i32.const 8
  i32.const 19
  call $~lib/rt/tlsf/__alloc
  call $~lib/rt/pure/__retain
  local.tee $0
  i32.const 65536
  call $~lib/typedarray/Uint8Array#constructor
  i32.store
  local.get $0
  i32.const 21
  i32.const 544
  call $~lib/rt/__allocArray
  call $~lib/rt/pure/__retain
  i32.store offset=4
  local.get $0
  call $src/assembly/test-machine/TestZ80Cpu/TestMemoryDevice#reset
  local.get $0
 )
 (func $src/assembly/test-machine/TestZ80Cpu/TestPortDevice#constructor (; 36 ;) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  i32.const 16
  i32.const 22
  call $~lib/rt/tlsf/__alloc
  call $~lib/rt/pure/__retain
  local.tee $2
  i32.const 0
  i32.store
  local.get $2
  i32.const 24
  i32.const 576
  call $~lib/rt/__allocArray
  call $~lib/rt/pure/__retain
  i32.store offset=4
  local.get $2
  local.get $0
  call $~lib/rt/pure/__retain
  i32.store offset=8
  local.get $2
  local.get $1
  call $~lib/rt/pure/__retain
  i32.store offset=12
  local.get $2
  i32.const 0
  i32.store
  local.get $2
 )
 (func $src/assembly/test-machine/TestZ80Cpu/TestPortDevice#constructor|trampoline (; 37 ;) (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  block $1of1
   block $0of1
    block $outOfRange
     global.get $~argumentsLength
     i32.const 1
     i32.sub
     br_table $0of1 $1of1 $outOfRange
    end
    unreachable
   end
   i32.const 25
   i32.const 592
   call $~lib/rt/__allocArray
   call $~lib/rt/pure/__retain
   local.tee $1
   local.set $2
  end
  local.get $0
  local.get $2
  call $src/assembly/test-machine/TestZ80Cpu/TestPortDevice#constructor
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $~setArgumentsLength (; 38 ;) (param $0 i32)
  local.get $0
  global.set $~argumentsLength
 )
 (func $src/assembly/test-machine/TestZ80Cpu/TestZ80Cpu#constructor (; 39 ;) (result i32)
  (local $0 i32)
  (local $1 i32)
  i32.const 100
  i32.const 18
  call $~lib/rt/tlsf/__alloc
  call $~lib/rt/pure/__retain
  i32.const 0
  call $src/assembly/Z80Cpu/Z80Cpu#constructor
  local.tee $0
  i32.const 0
  i32.store offset=92
  local.get $0
  i32.const 0
  i32.store offset=96
  call $src/assembly/test-machine/TestZ80Cpu/TestMemoryDevice#constructor
  local.set $1
  local.get $0
  i32.load offset=92
  call $~lib/rt/pure/__release
  local.get $0
  local.get $1
  i32.store offset=92
  i32.const 1
  global.set $~argumentsLength
  local.get $0
  call $src/assembly/test-machine/TestZ80Cpu/TestPortDevice#constructor|trampoline
  local.set $1
  local.get $0
  i32.load offset=96
  call $~lib/rt/pure/__release
  local.get $0
  local.get $1
  i32.store offset=96
  local.get $0
 )
 (func $src/assembly/test-machine/TestZ80Machine/TestZ80Machine#constructor (; 40 ;) (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  i32.eqz
  if
   i32.const 4
   i32.const 17
   call $~lib/rt/tlsf/__alloc
   call $~lib/rt/pure/__retain
   local.set $0
  end
  local.get $0
  i32.const 0
  i32.store
  call $src/assembly/test-machine/TestZ80Cpu/TestZ80Cpu#constructor
  local.set $1
  local.get $0
  i32.load
  call $~lib/rt/pure/__release
  local.get $0
  local.get $1
  i32.store
  local.get $0
 )
 (func $start:src/assembly/index~anonymous|1 (; 41 ;) (result i32)
  i32.const 0
  call $src/assembly/test-machine/TestZ80Machine/TestZ80Machine#constructor
 )
 (func $src/assembly/index/getCpuPoolMaxSize (; 42 ;) (result i32)
  global.get $src/assembly/index/cpuPool
  i32.load offset=8
 )
 (func $src/assembly/index/resetCpuPool (; 43 ;)
  global.get $src/assembly/index/cpuPool
  call $src/assembly/ObjectPool/ObjectPool<src/assembly/Z80Cpu/Z80Cpu>#reset
 )
 (func $src/assembly/ObjectPool/ObjectPool<src/assembly/Z80Cpu/Z80Cpu>#create~anonymous|0 (; 44 ;) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  local.get $0
  i32.eqz
 )
 (func $~lib/array/Array<bool>#findIndex (; 45 ;) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  local.get $0
  i32.load offset=12
  local.set $3
  loop $for-loop|0
   local.get $2
   local.get $3
   local.get $0
   i32.load offset=12
   local.tee $4
   local.get $3
   local.get $4
   i32.lt_s
   select
   i32.lt_s
   if
    i32.const 3
    global.set $~argumentsLength
    local.get $0
    i32.load offset=4
    local.get $2
    i32.add
    i32.load8_u
    local.get $2
    local.get $0
    local.get $1
    call_indirect (type $i32_i32_i32_=>_i32)
    if
     local.get $2
     return
    end
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|0
   end
  end
  i32.const -1
 )
 (func $src/assembly/ObjectPool/ObjectPool<src/assembly/Z80Cpu/Z80Cpu>#create (; 46 ;) (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  local.get $0
  i32.load
  i32.const 3
  call $~lib/array/Array<bool>#findIndex
  local.tee $1
  i32.const 0
  i32.lt_s
  if
   i32.const -1
   return
  end
  local.get $0
  i32.load offset=4
  i32.const 0
  global.set $~argumentsLength
  local.get $1
  local.get $0
  i32.load offset=12
  call_indirect (type $none_=>_i32)
  local.tee $2
  call $~lib/array/Array<src/assembly/Z80Cpu/Z80Cpu | null>#__set
  local.get $0
  i32.load
  local.get $1
  i32.const 1
  call $~lib/array/Array<bool>#__set
  local.get $2
  call $~lib/rt/pure/__release
  local.get $1
 )
 (func $src/assembly/index/createCpu (; 47 ;) (result i32)
  global.get $src/assembly/index/cpuPool
  call $src/assembly/ObjectPool/ObjectPool<src/assembly/Z80Cpu/Z80Cpu>#create
 )
 (func $~lib/array/Array<bool>#__get (; 48 ;) (param $0 i32) (param $1 i32) (result i32)
  local.get $1
  local.get $0
  i32.load offset=12
  i32.ge_u
  if
   i32.const 224
   i32.const 288
   i32.const 93
   i32.const 41
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  local.get $0
  i32.load offset=4
  i32.add
  i32.load8_u
 )
 (func $src/assembly/ObjectPool/ObjectPool<src/assembly/Z80Cpu/Z80Cpu>#release (; 49 ;) (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  i32.load
  local.get $1
  call $~lib/array/Array<bool>#__get
  i32.eqz
  if
   i32.const 0
   return
  end
  local.get $0
  i32.load
  local.get $1
  i32.const 0
  call $~lib/array/Array<bool>#__set
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 0
  call $~lib/array/Array<src/assembly/Z80Cpu/Z80Cpu | null>#__set
  i32.const 1
 )
 (func $src/assembly/index/releaseCpu (; 50 ;) (param $0 i32) (result i32)
  global.get $src/assembly/index/cpuPool
  local.get $0
  call $src/assembly/ObjectPool/ObjectPool<src/assembly/Z80Cpu/Z80Cpu>#release
 )
 (func $~lib/array/Array<src/assembly/Z80Cpu/Z80Cpu | null>#__get (; 51 ;) (param $0 i32) (param $1 i32) (result i32)
  local.get $1
  local.get $0
  i32.load offset=12
  i32.ge_u
  if
   i32.const 224
   i32.const 288
   i32.const 93
   i32.const 41
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 2
  i32.shl
  i32.add
  i32.load
  call $~lib/rt/pure/__retain
 )
 (func $src/assembly/ObjectPool/ObjectPool<src/assembly/Z80Cpu/Z80Cpu>#get (; 52 ;) (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  i32.load offset=4
  local.get $1
  call $~lib/array/Array<src/assembly/Z80Cpu/Z80Cpu | null>#__get
 )
 (func $src/assembly/index/getCpu (; 53 ;) (param $0 i32) (result i32)
  global.get $src/assembly/index/cpuPool
  local.get $0
  call $src/assembly/ObjectPool/ObjectPool<src/assembly/Z80Cpu/Z80Cpu>#get
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#longOp (; 54 ;) (param $0 i32)
  (local $1 i32)
  loop $for-loop|0
   local.get $1
   i32.const 100000000
   i32.lt_s
   if
    local.get $0
    local.get $1
    i32.store16 offset=2
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:af (; 55 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=2
 )
 (func $src/assembly/index/longOp (; 56 ;) (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  call $src/assembly/index/getCpu
  local.tee $0
  i32.eqz
  if
   local.get $0
   call $~lib/rt/pure/__release
   i32.const -1
   return
  end
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#longOp
  local.get $0
  i32.load16_u offset=2
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $src/assembly/index/getTestMachinePoolMaxSize (; 57 ;) (result i32)
  global.get $src/assembly/index/testMachinePool
  i32.load offset=8
 )
 (func $src/assembly/index/resetTestMachinePool (; 58 ;)
  global.get $src/assembly/index/testMachinePool
  call $src/assembly/ObjectPool/ObjectPool<src/assembly/Z80Cpu/Z80Cpu>#reset
 )
 (func $src/assembly/ObjectPool/ObjectPool<src/assembly/test-machine/TestZ80Machine/TestZ80Machine>#create (; 59 ;) (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  local.get $0
  i32.load
  i32.const 4
  call $~lib/array/Array<bool>#findIndex
  local.tee $1
  i32.const 0
  i32.lt_s
  if
   i32.const -1
   return
  end
  local.get $0
  i32.load offset=4
  i32.const 0
  global.set $~argumentsLength
  local.get $1
  local.get $0
  i32.load offset=12
  call_indirect (type $none_=>_i32)
  local.tee $2
  call $~lib/array/Array<src/assembly/Z80Cpu/Z80Cpu | null>#__set
  local.get $0
  i32.load
  local.get $1
  i32.const 1
  call $~lib/array/Array<bool>#__set
  local.get $2
  call $~lib/rt/pure/__release
  local.get $1
 )
 (func $src/assembly/index/createTestMachine (; 60 ;) (result i32)
  global.get $src/assembly/index/testMachinePool
  call $src/assembly/ObjectPool/ObjectPool<src/assembly/test-machine/TestZ80Machine/TestZ80Machine>#create
 )
 (func $src/assembly/index/releaseTestMachine (; 61 ;) (param $0 i32) (result i32)
  global.get $src/assembly/index/testMachinePool
  local.get $0
  call $src/assembly/ObjectPool/ObjectPool<src/assembly/Z80Cpu/Z80Cpu>#release
 )
 (func $src/assembly/index/getTestMachine (; 62 ;) (param $0 i32) (result i32)
  global.get $src/assembly/index/testMachinePool
  local.get $0
  call $src/assembly/ObjectPool/ObjectPool<src/assembly/Z80Cpu/Z80Cpu>#get
 )
 (func $src/assembly/test-machine/TestZ80Machine/TestZ80Machine#get:memory (; 63 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load
  i32.load offset=92
  i32.load
  call $~lib/rt/pure/__retain
 )
 (func $src/assembly/index/getMemory (; 64 ;) (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  call $src/assembly/index/getTestMachine
  local.tee $0
  if
   local.get $0
   call $src/assembly/test-machine/TestZ80Machine/TestZ80Machine#get:memory
   local.get $0
   call $~lib/rt/pure/__release
   return
  end
  i32.const 5
  call $~lib/typedarray/Uint8Array#constructor
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_a (; 65 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_f (; 66 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=1
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_b (; 67 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=4
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_c (; 68 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=5
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_bc (; 69 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=6
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_d (; 70 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=8
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_e (; 71 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=9
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_de (; 72 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=10
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_h (; 73 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=12
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_l (; 74 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=13
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_hl (; 75 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=14
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_af_sec (; 76 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=16
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_bc_sec (; 77 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=18
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_de_sec (; 78 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=20
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_hl_sec (; 79 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=22
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_i (; 80 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=24
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:_i (; 81 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=24
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_r (; 82 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=25
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:_r (; 83 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=25
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_pc (; 84 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=26
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:_pc (; 85 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=26
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_sp (; 86 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=28
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:_sp (; 87 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=28
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_xh (; 88 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=30
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_xl (; 89 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=31
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_ix (; 90 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=32
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_yh (; 91 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=34
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_yl (; 92 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=35
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_iy (; 93 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=36
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_wh (; 94 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=38
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_wl (; 95 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=39
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_wz (; 96 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=40
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:tacts (; 97 ;) (param $0 i32) (result i64)
  local.get $0
  i64.load offset=48
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:tacts (; 98 ;) (param $0 i32) (param $1 i64)
  local.get $0
  local.get $1
  i64.store offset=48
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:stateFlags (; 99 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=56
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:stateFlags (; 100 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store offset=56
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:useGateArrayContention (; 101 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=60
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:useGateArrayContention (; 102 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=60
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:iff1 (; 103 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=61
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:iff1 (; 104 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=61
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:iff2 (; 105 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=62
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:iff2 (; 106 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=62
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:interruptMode (; 107 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=63
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:interruptMode (; 108 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=63
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:isInterruptBlocked (; 109 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=64
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:isInterruptBlocked (; 110 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=64
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:isInOpExecution (; 111 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=65
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:isInOpExecution (; 112 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=65
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:executionFlowStatus (; 113 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=68
  call $~lib/rt/pure/__retain
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:memoryReadStatus (; 114 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=72
  call $~lib/rt/pure/__retain
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:memoryWriteStatus (; 115 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=76
  call $~lib/rt/pure/__retain
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:prefixMode (; 116 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=80
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:prefixMode (; 117 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store offset=80
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:indexMode (; 118 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=84
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:indexMode (; 119 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store offset=84
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:maskableInterruptModeEntered (; 120 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=88
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:maskableInterruptModeEntered (; 121 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=88
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:allowExtendedInstructionSet (; 122 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=89
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:allowExtendedInstructionSet (; 123 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=89
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:a (; 124 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8
  local.get $0
  local.get $0
  i32.load8_u offset=1
  local.get $0
  i32.load8_u
  i32.const 8
  i32.shl
  i32.or
  i32.const 255
  i32.and
  i32.store16 offset=2
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:f (; 125 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=1
  local.get $0
  local.get $0
  i32.load8_u offset=1
  local.get $0
  i32.load8_u
  i32.const 8
  i32.shl
  i32.or
  i32.const 255
  i32.and
  i32.store16 offset=2
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:af (; 126 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=2
  local.get $0
  local.get $1
  i32.const 65535
  i32.and
  i32.const 8
  i32.shr_u
  i32.store8
  local.get $0
  local.get $1
  i32.store8 offset=1
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:b (; 127 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=4
  local.get $0
  local.get $0
  i32.load8_u offset=5
  local.get $0
  i32.load8_u offset=4
  i32.const 8
  i32.shl
  i32.or
  i32.const 255
  i32.and
  i32.store16 offset=6
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:c (; 128 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=5
  local.get $0
  local.get $0
  i32.load8_u offset=4
  local.get $0
  i32.load8_u offset=4
  i32.const 8
  i32.shl
  i32.or
  i32.const 255
  i32.and
  i32.store16 offset=6
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:bc (; 129 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=6
  local.get $0
  local.get $1
  i32.const 65535
  i32.and
  i32.const 8
  i32.shr_u
  i32.store8 offset=4
  local.get $0
  local.get $1
  i32.store8 offset=5
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:d (; 130 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=8
  local.get $0
  local.get $0
  i32.load8_u offset=9
  local.get $0
  i32.load8_u offset=8
  i32.const 8
  i32.shl
  i32.or
  i32.const 255
  i32.and
  i32.store16 offset=10
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:e (; 131 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=9
  local.get $0
  local.get $0
  i32.load8_u offset=9
  local.get $0
  i32.load8_u offset=8
  i32.const 8
  i32.shl
  i32.or
  i32.const 255
  i32.and
  i32.store16 offset=10
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:de (; 132 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=10
  local.get $0
  local.get $1
  i32.const 65535
  i32.and
  i32.const 8
  i32.shr_u
  i32.store8 offset=8
  local.get $0
  local.get $1
  i32.store8 offset=9
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:h (; 133 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=12
  local.get $0
  local.get $0
  i32.load8_u offset=13
  local.get $0
  i32.load8_u offset=12
  i32.const 8
  i32.shl
  i32.or
  i32.const 255
  i32.and
  i32.store16 offset=14
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:l (; 134 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=13
  local.get $0
  local.get $0
  i32.load8_u offset=13
  local.get $0
  i32.load8_u offset=12
  i32.const 8
  i32.shl
  i32.or
  i32.const 255
  i32.and
  i32.store16 offset=14
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:hl (; 135 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=14
  local.get $0
  local.get $1
  i32.const 65535
  i32.and
  i32.const 8
  i32.shr_u
  i32.store8 offset=12
  local.get $0
  local.get $1
  i32.store8 offset=13
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:xh (; 136 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=30
  local.get $0
  local.get $0
  i32.load8_u offset=31
  local.get $0
  i32.load8_u offset=30
  i32.const 8
  i32.shl
  i32.or
  i32.const 255
  i32.and
  i32.store16 offset=32
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:xl (; 137 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=31
  local.get $0
  local.get $0
  i32.load8_u offset=31
  local.get $0
  i32.load8_u offset=30
  i32.const 8
  i32.shl
  i32.or
  i32.const 255
  i32.and
  i32.store16 offset=32
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:ix (; 138 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=32
  local.get $0
  local.get $1
  i32.const 65535
  i32.and
  i32.const 8
  i32.shr_u
  i32.store8 offset=30
  local.get $0
  local.get $1
  i32.store8 offset=31
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:yh (; 139 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=34
  local.get $0
  local.get $0
  i32.load8_u offset=35
  local.get $0
  i32.load8_u offset=34
  i32.const 8
  i32.shl
  i32.or
  i32.const 255
  i32.and
  i32.store16 offset=36
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:yl (; 140 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=35
  local.get $0
  local.get $0
  i32.load8_u offset=35
  local.get $0
  i32.load8_u offset=34
  i32.const 8
  i32.shl
  i32.or
  i32.const 255
  i32.and
  i32.store16 offset=36
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:iy (; 141 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=36
  local.get $0
  local.get $1
  i32.const 65535
  i32.and
  i32.const 8
  i32.shr_u
  i32.store8 offset=34
  local.get $0
  local.get $1
  i32.store8 offset=35
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:wh (; 142 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=38
  local.get $0
  local.get $0
  i32.load8_u offset=39
  local.get $0
  i32.load8_u offset=38
  i32.const 8
  i32.shl
  i32.or
  i32.const 255
  i32.and
  i32.store16 offset=40
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:wl (; 143 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=39
  local.get $0
  local.get $0
  i32.load8_u offset=39
  local.get $0
  i32.load8_u offset=38
  i32.const 8
  i32.shl
  i32.or
  i32.store8 offset=38
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:wz (; 144 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=40
  local.get $0
  local.get $1
  i32.const 65535
  i32.and
  i32.const 8
  i32.shr_u
  i32.store8 offset=38
  local.get $0
  local.get $1
  i32.store8 offset=39
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#readMemory (; 145 ;) (param $0 i32) (param $1 i32) (result i32)
  i32.const 255
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#writeMemory (; 146 ;) (param $0 i32) (param $1 i32) (param $2 i32)
  nop
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#delay (; 147 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $0
  i64.load offset=48
  local.get $1
  i64.extend_i32_s
  i64.add
  i64.store offset=48
 )
 (func $src/assembly/test-machine/TestZ80Machine/TestZ80Machine#get:cpu (; 148 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load
  call $~lib/rt/pure/__retain
 )
 (func $src/assembly/test-machine/TestZ80Cpu/TestMemoryDevice#get:log (; 149 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=4
  call $~lib/rt/pure/__retain
 )
 (func $src/assembly/test-machine/TestZ80Machine/TestZ80Machine#get:memoryAccessLog (; 150 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load
  i32.load offset=92
  call $src/assembly/test-machine/TestZ80Cpu/TestMemoryDevice#get:log
 )
 (func $src/assembly/test-machine/TestZ80Machine/TestZ80Machine#get:ioAccessLog (; 151 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load
  i32.load offset=96
  call $src/assembly/test-machine/TestZ80Cpu/TestMemoryDevice#get:log
 )
 (func $~start (; 152 ;)
  call $src/assembly/ObjectPool/ObjectPool<src/assembly/Z80Cpu/Z80Cpu>#constructor
  global.set $src/assembly/index/cpuPool
  call $src/assembly/ObjectPool/ObjectPool<src/assembly/test-machine/TestZ80Machine/TestZ80Machine>#constructor
  global.set $src/assembly/index/testMachinePool
 )
 (func $~lib/rt/pure/markGray (; 153 ;) (param $0 i32)
  (local $1 i32)
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.const 1879048192
  i32.and
  i32.const 268435456
  i32.ne
  if
   local.get $0
   local.get $1
   i32.const -1879048193
   i32.and
   i32.const 268435456
   i32.or
   i32.store offset=4
   local.get $0
   i32.const 16
   i32.add
   i32.const 2
   call $~lib/rt/__visit_members
  end
 )
 (func $~lib/rt/pure/scanBlack (; 154 ;) (param $0 i32)
  local.get $0
  local.get $0
  i32.load offset=4
  i32.const -1879048193
  i32.and
  i32.store offset=4
  local.get $0
  i32.const 16
  i32.add
  i32.const 4
  call $~lib/rt/__visit_members
 )
 (func $~lib/rt/pure/scan (; 155 ;) (param $0 i32)
  (local $1 i32)
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.const 1879048192
  i32.and
  i32.const 268435456
  i32.eq
  if
   local.get $1
   i32.const 268435455
   i32.and
   i32.const 0
   i32.gt_u
   if
    local.get $0
    call $~lib/rt/pure/scanBlack
   else
    local.get $0
    local.get $1
    i32.const -1879048193
    i32.and
    i32.const 536870912
    i32.or
    i32.store offset=4
    local.get $0
    i32.const 16
    i32.add
    i32.const 3
    call $~lib/rt/__visit_members
   end
  end
 )
 (func $~lib/rt/pure/collectWhite (; 156 ;) (param $0 i32)
  (local $1 i32)
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.const 1879048192
  i32.and
  i32.const 536870912
  i32.eq
  if (result i32)
   local.get $1
   i32.const -2147483648
   i32.and
   i32.eqz
  else
   i32.const 0
  end
  if
   local.get $0
   local.get $1
   i32.const -1879048193
   i32.and
   i32.store offset=4
   local.get $0
   i32.const 16
   i32.add
   i32.const 5
   call $~lib/rt/__visit_members
   global.get $~lib/rt/tlsf/ROOT
   local.get $0
   call $~lib/rt/tlsf/freeBlock
  end
 )
 (func $~lib/rt/pure/__collect (; 157 ;)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  global.get $~lib/rt/pure/ROOTS
  local.tee $5
  local.tee $2
  local.set $3
  global.get $~lib/rt/pure/CUR
  local.set $0
  loop $for-loop|0
   local.get $3
   local.get $0
   i32.lt_u
   if
    local.get $3
    i32.load
    local.tee $4
    i32.load offset=4
    local.tee $1
    i32.const 1879048192
    i32.and
    i32.const 805306368
    i32.eq
    if (result i32)
     local.get $1
     i32.const 268435455
     i32.and
     i32.const 0
     i32.gt_u
    else
     i32.const 0
    end
    if
     local.get $4
     call $~lib/rt/pure/markGray
     local.get $2
     local.get $4
     i32.store
     local.get $2
     i32.const 4
     i32.add
     local.set $2
    else
     i32.const 0
     local.get $1
     i32.const 268435455
     i32.and
     i32.eqz
     local.get $1
     i32.const 1879048192
     i32.and
     select
     if
      global.get $~lib/rt/tlsf/ROOT
      local.get $4
      call $~lib/rt/tlsf/freeBlock
     else
      local.get $4
      local.get $1
      i32.const 2147483647
      i32.and
      i32.store offset=4
     end
    end
    local.get $3
    i32.const 4
    i32.add
    local.set $3
    br $for-loop|0
   end
  end
  local.get $2
  global.set $~lib/rt/pure/CUR
  local.get $5
  local.set $0
  loop $for-loop|1
   local.get $0
   local.get $2
   i32.lt_u
   if
    local.get $0
    i32.load
    call $~lib/rt/pure/scan
    local.get $0
    i32.const 4
    i32.add
    local.set $0
    br $for-loop|1
   end
  end
  local.get $5
  local.set $0
  loop $for-loop|2
   local.get $0
   local.get $2
   i32.lt_u
   if
    local.get $0
    i32.load
    local.tee $1
    local.get $1
    i32.load offset=4
    i32.const 2147483647
    i32.and
    i32.store offset=4
    local.get $1
    call $~lib/rt/pure/collectWhite
    local.get $0
    i32.const 4
    i32.add
    local.set $0
    br $for-loop|2
   end
  end
  local.get $5
  global.set $~lib/rt/pure/CUR
 )
 (func $~lib/rt/__typeinfo (; 158 ;) (param $0 i32) (result i32)
  local.get $0
  i32.const 640
  i32.load
  i32.gt_u
  if
   i32.const 224
   i32.const 608
   i32.const 22
   i32.const 27
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  i32.const 3
  i32.shl
  i32.const 644
  i32.add
  i32.load
 )
 (func $~lib/rt/pure/growRoots (; 159 ;)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/rt/pure/CUR
  global.get $~lib/rt/pure/ROOTS
  local.tee $1
  i32.sub
  local.tee $2
  i32.const 1
  i32.shl
  local.tee $0
  i32.const 256
  local.get $0
  i32.const 256
  i32.gt_u
  select
  local.tee $3
  i32.const 0
  call $~lib/rt/tlsf/__alloc
  local.tee $0
  local.get $1
  local.get $2
  call $~lib/memory/memory.copy
  local.get $1
  if
   call $~lib/rt/tlsf/maybeInitialize
   local.get $1
   call $~lib/rt/tlsf/checkUsedBlock
   call $~lib/rt/tlsf/freeBlock
  end
  local.get $0
  global.set $~lib/rt/pure/ROOTS
  local.get $0
  local.get $2
  i32.add
  global.set $~lib/rt/pure/CUR
  local.get $0
  local.get $3
  i32.add
  global.set $~lib/rt/pure/END
 )
 (func $~lib/rt/pure/appendRoot (; 160 ;) (param $0 i32)
  (local $1 i32)
  global.get $~lib/rt/pure/CUR
  local.tee $1
  global.get $~lib/rt/pure/END
  i32.ge_u
  if
   call $~lib/rt/pure/growRoots
   global.get $~lib/rt/pure/CUR
   local.set $1
  end
  local.get $1
  local.get $0
  i32.store
  local.get $1
  i32.const 4
  i32.add
  global.set $~lib/rt/pure/CUR
 )
 (func $~lib/rt/pure/decrement (; 161 ;) (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  local.get $0
  i32.load offset=4
  local.tee $2
  i32.const 268435455
  i32.and
  local.set $1
  local.get $0
  i32.load
  i32.const 1
  i32.and
  if
   i32.const 0
   i32.const 144
   i32.const 122
   i32.const 13
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  i32.const 1
  i32.eq
  if
   local.get $0
   i32.const 16
   i32.add
   i32.const 1
   call $~lib/rt/__visit_members
   local.get $2
   i32.const -2147483648
   i32.and
   if
    local.get $0
    i32.const -2147483648
    i32.store offset=4
   else
    global.get $~lib/rt/tlsf/ROOT
    local.get $0
    call $~lib/rt/tlsf/freeBlock
   end
  else
   local.get $1
   i32.const 0
   i32.le_u
   if
    i32.const 0
    i32.const 144
    i32.const 136
    i32.const 15
    call $~lib/builtins/abort
    unreachable
   end
   local.get $0
   i32.load offset=8
   call $~lib/rt/__typeinfo
   i32.const 16
   i32.and
   if
    local.get $0
    local.get $1
    i32.const 1
    i32.sub
    local.get $2
    i32.const -268435456
    i32.and
    i32.or
    i32.store offset=4
   else
    local.get $0
    local.get $1
    i32.const 1
    i32.sub
    i32.const -1342177280
    i32.or
    i32.store offset=4
    local.get $2
    i32.const -2147483648
    i32.and
    i32.eqz
    if
     local.get $0
     call $~lib/rt/pure/appendRoot
    end
   end
  end
 )
 (func $~lib/rt/pure/__visit (; 162 ;) (param $0 i32) (param $1 i32)
  local.get $0
  i32.const 868
  i32.lt_u
  if
   return
  end
  local.get $0
  i32.const 16
  i32.sub
  local.set $0
  block $break|0
   block $case5|0
    block $case4|0
     block $case3|0
      block $case2|0
       block $case1|0
        local.get $1
        i32.const 1
        i32.ne
        if
         local.get $1
         i32.const 2
         i32.sub
         br_table $case1|0 $case2|0 $case3|0 $case4|0 $case5|0
        end
        local.get $0
        call $~lib/rt/pure/decrement
        br $break|0
       end
       local.get $0
       i32.load offset=4
       i32.const 268435455
       i32.and
       i32.const 0
       i32.le_u
       if
        i32.const 0
        i32.const 144
        i32.const 79
        i32.const 19
        call $~lib/builtins/abort
        unreachable
       end
       local.get $0
       local.get $0
       i32.load offset=4
       i32.const 1
       i32.sub
       i32.store offset=4
       local.get $0
       call $~lib/rt/pure/markGray
       br $break|0
      end
      local.get $0
      call $~lib/rt/pure/scan
      br $break|0
     end
     local.get $0
     i32.load offset=4
     local.tee $1
     i32.const -268435456
     i32.and
     local.get $1
     i32.const 1
     i32.add
     i32.const -268435456
     i32.and
     i32.ne
     if
      i32.const 0
      i32.const 144
      i32.const 90
      i32.const 8
      call $~lib/builtins/abort
      unreachable
     end
     local.get $0
     local.get $1
     i32.const 1
     i32.add
     i32.store offset=4
     local.get $1
     i32.const 1879048192
     i32.and
     if
      local.get $0
      call $~lib/rt/pure/scanBlack
     end
     br $break|0
    end
    local.get $0
    call $~lib/rt/pure/collectWhite
    br $break|0
   end
   i32.const 0
   i32.const 144
   i32.const 101
   i32.const 26
   call $~lib/builtins/abort
   unreachable
  end
 )
 (func $~lib/array/Array<src/assembly/Z80Cpu/Z80Cpu | null>#__visit_impl (; 163 ;) (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  local.get $0
  i32.load offset=4
  local.tee $2
  local.get $0
  i32.load offset=12
  i32.const 2
  i32.shl
  i32.add
  local.set $0
  loop $while-continue|0
   local.get $2
   local.get $0
   i32.lt_u
   if
    local.get $2
    i32.load
    local.tee $3
    if
     local.get $3
     local.get $1
     call $~lib/rt/pure/__visit
    end
    local.get $2
    i32.const 4
    i32.add
    local.set $2
    br $while-continue|0
   end
  end
 )
 (func $~lib/rt/__visit_members (; 164 ;) (param $0 i32) (param $1 i32)
  (local $2 i32)
  block $block$13$break
   block $block$4$break
    block $switch$1$default
     block $switch$1$case$29
      block $switch$1$case$26
       block $switch$1$case$24
        block $switch$1$case$23
         block $switch$1$case$20
          block $switch$1$case$17
           block $switch$1$case$15
            block $switch$1$case$2
             local.get $0
             i32.const 8
             i32.sub
             i32.load
             br_table $switch$1$case$2 $switch$1$case$2 $block$4$break $block$4$break $block$4$break $block$4$break $block$4$break $block$4$break $block$4$break $block$4$break $block$4$break $block$13$break $block$4$break $switch$1$case$15 $block$4$break $switch$1$case$17 $block$4$break $block$4$break $switch$1$case$20 $switch$1$case$15 $switch$1$case$2 $switch$1$case$23 $switch$1$case$24 $switch$1$case$2 $switch$1$case$26 $block$4$break $switch$1$case$15 $switch$1$case$29 $switch$1$default
            end
            return
           end
           local.get $0
           i32.load
           local.tee $2
           if
            local.get $2
            local.get $1
            call $~lib/rt/pure/__visit
           end
           local.get $0
           i32.load offset=4
           local.tee $0
           if
            local.get $0
            local.get $1
            call $~lib/rt/pure/__visit
           end
           return
          end
          local.get $0
          local.get $1
          call $~lib/array/Array<src/assembly/Z80Cpu/Z80Cpu | null>#__visit_impl
          br $block$4$break
         end
         local.get $0
         i32.load offset=92
         local.tee $2
         if
          local.get $2
          local.get $1
          call $~lib/rt/pure/__visit
         end
         local.get $0
         i32.load offset=96
         local.tee $2
         if
          local.get $2
          local.get $1
          call $~lib/rt/pure/__visit
         end
         br $block$13$break
        end
        local.get $0
        local.get $1
        call $~lib/array/Array<src/assembly/Z80Cpu/Z80Cpu | null>#__visit_impl
        br $block$4$break
       end
       local.get $0
       i32.load offset=4
       local.tee $2
       if
        local.get $2
        local.get $1
        call $~lib/rt/pure/__visit
       end
       local.get $0
       i32.load offset=8
       local.tee $2
       if
        local.get $2
        local.get $1
        call $~lib/rt/pure/__visit
       end
       local.get $0
       i32.load offset=12
       local.tee $0
       if
        local.get $0
        local.get $1
        call $~lib/rt/pure/__visit
       end
       return
      end
      local.get $0
      local.get $1
      call $~lib/array/Array<src/assembly/Z80Cpu/Z80Cpu | null>#__visit_impl
      br $block$4$break
     end
     local.get $0
     local.get $1
     call $~lib/array/Array<src/assembly/Z80Cpu/Z80Cpu | null>#__visit_impl
     br $block$4$break
    end
    unreachable
   end
   local.get $0
   i32.load
   local.tee $0
   if
    local.get $0
    local.get $1
    call $~lib/rt/pure/__visit
   end
   return
  end
  local.get $0
  i32.load offset=68
  local.tee $2
  if
   local.get $2
   local.get $1
   call $~lib/rt/pure/__visit
  end
  local.get $0
  i32.load offset=72
  local.tee $2
  if
   local.get $2
   local.get $1
   call $~lib/rt/pure/__visit
  end
  local.get $0
  i32.load offset=76
  local.tee $0
  if
   local.get $0
   local.get $1
   call $~lib/rt/pure/__visit
  end
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#constructor|trampoline (; 165 ;) (param $0 i32) (param $1 i32) (result i32)
  block $1of1
   block $0of1
    block $outOfRange
     global.get $~argumentsLength
     br_table $0of1 $1of1 $outOfRange
    end
    unreachable
   end
   i32.const 0
   local.set $1
  end
  local.get $0
  local.get $1
  call $src/assembly/Z80Cpu/Z80Cpu#constructor
 )
)
