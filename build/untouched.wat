(module
 (type $i32_=>_i32 (func (param i32) (result i32)))
 (type $i32_i32_=>_none (func (param i32 i32)))
 (type $i32_i32_=>_i32 (func (param i32 i32) (result i32)))
 (type $i32_=>_none (func (param i32)))
 (type $i32_i32_i32_=>_none (func (param i32 i32 i32)))
 (type $i32_i32_i32_=>_i32 (func (param i32 i32 i32) (result i32)))
 (type $none_=>_i32 (func (result i32)))
 (type $none_=>_none (func))
 (type $i32_i32_i32_i32_=>_none (func (param i32 i32 i32 i32)))
 (type $i32_i64_=>_none (func (param i32 i64)))
 (type $i32_i32_i32_i32_=>_i32 (func (param i32 i32 i32 i32) (result i32)))
 (type $i32_=>_i64 (func (param i32) (result i64)))
 (import "env" "abort" (func $~lib/builtins/abort (param i32 i32 i32 i32)))
 (memory $0 1)
 (data (i32.const 16) "\1e\00\00\00\01\00\00\00\01\00\00\00\1e\00\00\00~\00l\00i\00b\00/\00r\00t\00/\00t\00l\00s\00f\00.\00t\00s\00")
 (data (i32.const 64) "(\00\00\00\01\00\00\00\01\00\00\00(\00\00\00a\00l\00l\00o\00c\00a\00t\00i\00o\00n\00 \00t\00o\00o\00 \00l\00a\00r\00g\00e\00")
 (data (i32.const 128) "\1e\00\00\00\01\00\00\00\01\00\00\00\1e\00\00\00~\00l\00i\00b\00/\00r\00t\00/\00p\00u\00r\00e\00.\00t\00s\00")
 (data (i32.const 176) "\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00")
 (data (i32.const 192) "\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00")
 (data (i32.const 208) "$\00\00\00\01\00\00\00\01\00\00\00$\00\00\00I\00n\00d\00e\00x\00 \00o\00u\00t\00 \00o\00f\00 \00r\00a\00n\00g\00e\00")
 (data (i32.const 272) "\1a\00\00\00\01\00\00\00\01\00\00\00\1a\00\00\00~\00l\00i\00b\00/\00a\00r\00r\00a\00y\00.\00t\00s\00")
 (data (i32.const 320) "\1c\00\00\00\01\00\00\00\01\00\00\00\1c\00\00\00I\00n\00v\00a\00l\00i\00d\00 \00l\00e\00n\00g\00t\00h\00")
 (data (i32.const 368) "&\00\00\00\01\00\00\00\01\00\00\00&\00\00\00~\00l\00i\00b\00/\00a\00r\00r\00a\00y\00b\00u\00f\00f\00e\00r\00.\00t\00s\00")
 (data (i32.const 432) "$\00\00\00\01\00\00\00\01\00\00\00$\00\00\00~\00l\00i\00b\00/\00t\00y\00p\00e\00d\00a\00r\00r\00a\00y\00.\00t\00s\00")
 (data (i32.const 496) "\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00")
 (data (i32.const 512) "\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00")
 (data (i32.const 528) "\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00")
 (data (i32.const 544) "\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00")
 (data (i32.const 560) "\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00")
 (data (i32.const 576) "\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00")
 (data (i32.const 592) "\14\00\00\00\01\00\00\00\01\00\00\00\14\00\00\00~\00l\00i\00b\00/\00r\00t\00.\00t\00s\00")
 (data (i32.const 640) "\1c\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\001\04\00\00\02\00\00\001\00\00\00\02\00\00\00Q\04\00\00\02\00\00\00Q\00\00\00\02\00\00\00\91\04\00\00\02\00\00\00\91\00\00\00\02\00\00\00\91\0c\00\00\02\00\00\00\11\0d\00\00\02\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\003\00\00\00\02\00\00\00\930\00\00\02\00\00\00\93\04\00\00\02\00\00\00\10\00\00\00\00\00\00\00\00\00\00\00\0b\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\93 \00\00\02\00\00\00\00\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\93 \00\00\02\00\00\003\00\00\00\02\00\00\00\10\00\00\00\00\00\00\00\930\00\00\02\00\00\00")
 (table $0 5 funcref)
 (elem (i32.const 1) $start:src/assembly/index~anonymous|0 $start:src/assembly/index~anonymous|1 $src/assembly/ObjectPool/ObjectPool<src/assembly/Z80Cpu/Z80Cpu>#create~anonymous|0 $src/assembly/ObjectPool/ObjectPool<src/assembly/test-machine/TestZ80Machine/TestZ80Machine>#create~anonymous|0)
 (global $~lib/rt/tlsf/ROOT (mut i32) (i32.const 0))
 (global $~lib/rt/tlsf/collectLock (mut i32) (i32.const 0))
 (global $~lib/gc/gc.auto (mut i32) (i32.const 1))
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
 (global $src/assembly/Z80Cpu/Z80StateFlags.None i32 (i32.const 0))
 (global $src/assembly/Z80Cpu/Z80StateFlags.Int i32 (i32.const 1))
 (global $src/assembly/Z80Cpu/Z80StateFlags.Nmi i32 (i32.const 2))
 (global $src/assembly/Z80Cpu/Z80StateFlags.Reset i32 (i32.const 4))
 (global $src/assembly/Z80Cpu/Z80StateFlags.Halted i32 (i32.const 8))
 (global $src/assembly/Z80Cpu/Z80StateFlags.InvInt i32 (i32.const 254))
 (global $src/assembly/Z80Cpu/Z80StateFlags.InvNmi i32 (i32.const 253))
 (global $src/assembly/Z80Cpu/Z80StateFlags.InvReset i32 (i32.const 251))
 (global $src/assembly/Z80Cpu/Z80StateFlags.InvHalted i32 (i32.const 247))
 (global $src/assembly/Z80Cpu/OpPrefixMode.None i32 (i32.const 0))
 (global $src/assembly/Z80Cpu/OpPrefixMode.Extended i32 (i32.const 1))
 (global $src/assembly/Z80Cpu/OpPrefixMode.Bit i32 (i32.const 2))
 (global $src/assembly/Z80Cpu/OpIndexMode.None i32 (i32.const 0))
 (global $src/assembly/Z80Cpu/OpIndexMode.IX i32 (i32.const 1))
 (global $src/assembly/Z80Cpu/OpIndexMode.IY i32 (i32.const 2))
 (global $src/assembly/test-machine/TestZ80Machine/RunMode.Normal i32 (i32.const 0))
 (global $src/assembly/test-machine/TestZ80Machine/RunMode.OneCycle i32 (i32.const 1))
 (global $src/assembly/test-machine/TestZ80Machine/RunMode.OneInstruction i32 (i32.const 2))
 (global $src/assembly/test-machine/TestZ80Machine/RunMode.UntilHalt i32 (i32.const 3))
 (global $src/assembly/test-machine/TestZ80Machine/RunMode.UntilBreak i32 (i32.const 4))
 (global $src/assembly/test-machine/TestZ80Machine/RunMode.UntilEnd i32 (i32.const 5))
 (global $src/assembly/index/CPU_POOL i32 (i32.const 100))
 (global $src/assembly/index/TEST_MACHINE_POOL_SIZE i32 (i32.const 10))
 (global $~lib/ASC_SHRINK_LEVEL i32 (i32.const 0))
 (global $src/assembly/index/cpuPool (mut i32) (i32.const 0))
 (global $~argumentsLength (mut i32) (i32.const 0))
 (global $src/assembly/index/testMachinePool (mut i32) (i32.const 0))
 (global $~lib/rt/pure/ROOTS (mut i32) (i32.const 0))
 (global $~lib/rt/pure/CUR (mut i32) (i32.const 0))
 (global $~lib/rt/pure/END (mut i32) (i32.const 0))
 (global $~lib/rt/__rtti_base i32 (i32.const 640))
 (global $~lib/heap/__heap_base i32 (i32.const 868))
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
 (export "Z80Cpu#get:a" (func $src/assembly/Z80Cpu/Z80Cpu#get:a))
 (export "Z80Cpu#set:a" (func $src/assembly/Z80Cpu/Z80Cpu#set:a))
 (export "Z80Cpu#get:f" (func $src/assembly/Z80Cpu/Z80Cpu#get:f))
 (export "Z80Cpu#set:f" (func $src/assembly/Z80Cpu/Z80Cpu#set:f))
 (export "Z80Cpu#get:af" (func $src/assembly/Z80Cpu/Z80Cpu#get:af))
 (export "Z80Cpu#set:af" (func $src/assembly/Z80Cpu/Z80Cpu#set:af))
 (export "Z80Cpu#get:b" (func $src/assembly/Z80Cpu/Z80Cpu#get:b))
 (export "Z80Cpu#set:b" (func $src/assembly/Z80Cpu/Z80Cpu#set:b))
 (export "Z80Cpu#get:c" (func $src/assembly/Z80Cpu/Z80Cpu#get:c))
 (export "Z80Cpu#set:c" (func $src/assembly/Z80Cpu/Z80Cpu#set:c))
 (export "Z80Cpu#get:bc" (func $src/assembly/Z80Cpu/Z80Cpu#get:bc))
 (export "Z80Cpu#set:bc" (func $src/assembly/Z80Cpu/Z80Cpu#set:bc))
 (export "Z80Cpu#get:d" (func $src/assembly/Z80Cpu/Z80Cpu#get:d))
 (export "Z80Cpu#set:d" (func $src/assembly/Z80Cpu/Z80Cpu#set:d))
 (export "Z80Cpu#get:e" (func $src/assembly/Z80Cpu/Z80Cpu#get:e))
 (export "Z80Cpu#set:e" (func $src/assembly/Z80Cpu/Z80Cpu#set:e))
 (export "Z80Cpu#get:de" (func $src/assembly/Z80Cpu/Z80Cpu#get:de))
 (export "Z80Cpu#set:de" (func $src/assembly/Z80Cpu/Z80Cpu#set:de))
 (export "Z80Cpu#get:h" (func $src/assembly/Z80Cpu/Z80Cpu#get:h))
 (export "Z80Cpu#set:h" (func $src/assembly/Z80Cpu/Z80Cpu#set:h))
 (export "Z80Cpu#get:l" (func $src/assembly/Z80Cpu/Z80Cpu#get:l))
 (export "Z80Cpu#set:l" (func $src/assembly/Z80Cpu/Z80Cpu#set:l))
 (export "Z80Cpu#get:hl" (func $src/assembly/Z80Cpu/Z80Cpu#get:hl))
 (export "Z80Cpu#set:hl" (func $src/assembly/Z80Cpu/Z80Cpu#set:hl))
 (export "Z80Cpu#get:_af_" (func $src/assembly/Z80Cpu/Z80Cpu#get:_af_))
 (export "Z80Cpu#get:_bc_" (func $src/assembly/Z80Cpu/Z80Cpu#get:_bc_))
 (export "Z80Cpu#get:_de_" (func $src/assembly/Z80Cpu/Z80Cpu#get:_de_))
 (export "Z80Cpu#get:_hl_" (func $src/assembly/Z80Cpu/Z80Cpu#get:_hl_))
 (export "Z80Cpu#get:i" (func $src/assembly/Z80Cpu/Z80Cpu#get:i))
 (export "Z80Cpu#set:i" (func $src/assembly/Z80Cpu/Z80Cpu#set:i))
 (export "Z80Cpu#get:r" (func $src/assembly/Z80Cpu/Z80Cpu#get:r))
 (export "Z80Cpu#set:r" (func $src/assembly/Z80Cpu/Z80Cpu#set:r))
 (export "Z80Cpu#get:pc" (func $src/assembly/Z80Cpu/Z80Cpu#get:pc))
 (export "Z80Cpu#set:pc" (func $src/assembly/Z80Cpu/Z80Cpu#set:pc))
 (export "Z80Cpu#get:sp" (func $src/assembly/Z80Cpu/Z80Cpu#get:sp))
 (export "Z80Cpu#set:sp" (func $src/assembly/Z80Cpu/Z80Cpu#set:sp))
 (export "Z80Cpu#get:xh" (func $src/assembly/Z80Cpu/Z80Cpu#get:xh))
 (export "Z80Cpu#set:xh" (func $src/assembly/Z80Cpu/Z80Cpu#set:xh))
 (export "Z80Cpu#get:xl" (func $src/assembly/Z80Cpu/Z80Cpu#get:xl))
 (export "Z80Cpu#set:xl" (func $src/assembly/Z80Cpu/Z80Cpu#set:xl))
 (export "Z80Cpu#get:ix" (func $src/assembly/Z80Cpu/Z80Cpu#get:ix))
 (export "Z80Cpu#set:ix" (func $src/assembly/Z80Cpu/Z80Cpu#set:ix))
 (export "Z80Cpu#get:yh" (func $src/assembly/Z80Cpu/Z80Cpu#get:yh))
 (export "Z80Cpu#set:yh" (func $src/assembly/Z80Cpu/Z80Cpu#set:yh))
 (export "Z80Cpu#get:yl" (func $src/assembly/Z80Cpu/Z80Cpu#get:yl))
 (export "Z80Cpu#set:yl" (func $src/assembly/Z80Cpu/Z80Cpu#set:yl))
 (export "Z80Cpu#get:iy" (func $src/assembly/Z80Cpu/Z80Cpu#get:iy))
 (export "Z80Cpu#set:iy" (func $src/assembly/Z80Cpu/Z80Cpu#set:iy))
 (export "Z80Cpu#get:wh" (func $src/assembly/Z80Cpu/Z80Cpu#get:wh))
 (export "Z80Cpu#set:wh" (func $src/assembly/Z80Cpu/Z80Cpu#set:wh))
 (export "Z80Cpu#get:wl" (func $src/assembly/Z80Cpu/Z80Cpu#get:wl))
 (export "Z80Cpu#set:wl" (func $src/assembly/Z80Cpu/Z80Cpu#set:wl))
 (export "Z80Cpu#get:wz" (func $src/assembly/Z80Cpu/Z80Cpu#get:wz))
 (export "Z80Cpu#set:wz" (func $src/assembly/Z80Cpu/Z80Cpu#set:wz))
 (export "Z80Cpu#readMemory" (func $src/assembly/Z80Cpu/Z80Cpu#readMemory))
 (export "Z80Cpu#writeMemory" (func $src/assembly/Z80Cpu/Z80Cpu#writeMemory))
 (export "Z80Cpu#readPort" (func $src/assembly/Z80Cpu/Z80Cpu#readPort))
 (export "Z80Cpu#writePort" (func $src/assembly/Z80Cpu/Z80Cpu#writePort))
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
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  local.get $1
  i32.load
  local.set $2
  local.get $2
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
  local.get $2
  i32.const 3
  i32.const -1
  i32.xor
  i32.and
  local.set $3
  local.get $3
  i32.const 16
  i32.ge_u
  if (result i32)
   local.get $3
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
  local.get $3
  i32.const 256
  i32.lt_u
  if
   i32.const 0
   local.set $4
   local.get $3
   i32.const 4
   i32.shr_u
   local.set $5
  else
   i32.const 31
   local.get $3
   i32.clz
   i32.sub
   local.set $4
   local.get $3
   local.get $4
   i32.const 4
   i32.sub
   i32.shr_u
   i32.const 1
   i32.const 4
   i32.shl
   i32.xor
   local.set $5
   local.get $4
   i32.const 8
   i32.const 1
   i32.sub
   i32.sub
   local.set $4
  end
  local.get $4
  i32.const 23
  i32.lt_u
  if (result i32)
   local.get $5
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
  i32.load offset=16
  local.set $6
  local.get $1
  i32.load offset=20
  local.set $7
  local.get $6
  if
   local.get $6
   local.get $7
   i32.store offset=20
  end
  local.get $7
  if
   local.get $7
   local.get $6
   i32.store offset=16
  end
  local.get $1
  local.get $0
  local.set $10
  local.get $4
  local.set $9
  local.get $5
  local.set $8
  local.get $10
  local.get $9
  i32.const 4
  i32.shl
  local.get $8
  i32.add
  i32.const 2
  i32.shl
  i32.add
  i32.load offset=96
  i32.eq
  if
   local.get $0
   local.set $11
   local.get $4
   local.set $10
   local.get $5
   local.set $9
   local.get $7
   local.set $8
   local.get $11
   local.get $10
   i32.const 4
   i32.shl
   local.get $9
   i32.add
   i32.const 2
   i32.shl
   i32.add
   local.get $8
   i32.store offset=96
   local.get $7
   i32.eqz
   if
    local.get $0
    local.set $9
    local.get $4
    local.set $8
    local.get $9
    local.get $8
    i32.const 2
    i32.shl
    i32.add
    i32.load offset=4
    local.set $9
    local.get $0
    local.set $8
    local.get $4
    local.set $11
    local.get $9
    i32.const 1
    local.get $5
    i32.shl
    i32.const -1
    i32.xor
    i32.and
    local.tee $9
    local.set $10
    local.get $8
    local.get $11
    i32.const 2
    i32.shl
    i32.add
    local.get $10
    i32.store offset=4
    local.get $9
    i32.eqz
    if
     local.get $0
     local.get $0
     i32.load
     i32.const 1
     local.get $4
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
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
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
  local.set $2
  local.get $2
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
  local.set $3
  local.get $3
  i32.const 16
  i32.add
  local.get $3
  i32.load
  i32.const 3
  i32.const -1
  i32.xor
  i32.and
  i32.add
  local.set $4
  local.get $4
  i32.load
  local.set $5
  local.get $5
  i32.const 1
  i32.and
  if
   local.get $2
   i32.const 3
   i32.const -1
   i32.xor
   i32.and
   i32.const 16
   i32.add
   local.get $5
   i32.const 3
   i32.const -1
   i32.xor
   i32.and
   i32.add
   local.set $3
   local.get $3
   i32.const 1073741808
   i32.lt_u
   if
    local.get $0
    local.get $4
    call $~lib/rt/tlsf/removeBlock
    local.get $1
    local.get $2
    i32.const 3
    i32.and
    local.get $3
    i32.or
    local.tee $2
    i32.store
    local.get $1
    local.set $6
    local.get $6
    i32.const 16
    i32.add
    local.get $6
    i32.load
    i32.const 3
    i32.const -1
    i32.xor
    i32.and
    i32.add
    local.set $4
    local.get $4
    i32.load
    local.set $5
   end
  end
  local.get $2
  i32.const 2
  i32.and
  if
   local.get $1
   local.set $6
   local.get $6
   i32.const 4
   i32.sub
   i32.load
   local.set $6
   local.get $6
   i32.load
   local.set $3
   local.get $3
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
   local.get $3
   i32.const 3
   i32.const -1
   i32.xor
   i32.and
   i32.const 16
   i32.add
   local.get $2
   i32.const 3
   i32.const -1
   i32.xor
   i32.and
   i32.add
   local.set $7
   local.get $7
   i32.const 1073741808
   i32.lt_u
   if
    local.get $0
    local.get $6
    call $~lib/rt/tlsf/removeBlock
    local.get $6
    local.get $3
    i32.const 3
    i32.and
    local.get $7
    i32.or
    local.tee $2
    i32.store
    local.get $6
    local.set $1
   end
  end
  local.get $4
  local.get $5
  i32.const 2
  i32.or
  i32.store
  local.get $2
  i32.const 3
  i32.const -1
  i32.xor
  i32.and
  local.set $8
  local.get $8
  i32.const 16
  i32.ge_u
  if (result i32)
   local.get $8
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
  local.get $1
  i32.const 16
  i32.add
  local.get $8
  i32.add
  local.get $4
  i32.eq
  i32.eqz
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
  local.get $8
  i32.const 256
  i32.lt_u
  if
   i32.const 0
   local.set $9
   local.get $8
   i32.const 4
   i32.shr_u
   local.set $10
  else
   i32.const 31
   local.get $8
   i32.clz
   i32.sub
   local.set $9
   local.get $8
   local.get $9
   i32.const 4
   i32.sub
   i32.shr_u
   i32.const 1
   i32.const 4
   i32.shl
   i32.xor
   local.set $10
   local.get $9
   i32.const 8
   i32.const 1
   i32.sub
   i32.sub
   local.set $9
  end
  local.get $9
  i32.const 23
  i32.lt_u
  if (result i32)
   local.get $10
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
  local.set $7
  local.get $9
  local.set $3
  local.get $10
  local.set $6
  local.get $7
  local.get $3
  i32.const 4
  i32.shl
  local.get $6
  i32.add
  i32.const 2
  i32.shl
  i32.add
  i32.load offset=96
  local.set $11
  local.get $1
  i32.const 0
  i32.store offset=16
  local.get $1
  local.get $11
  i32.store offset=20
  local.get $11
  if
   local.get $11
   local.get $1
   i32.store offset=16
  end
  local.get $0
  local.set $12
  local.get $9
  local.set $7
  local.get $10
  local.set $3
  local.get $1
  local.set $6
  local.get $12
  local.get $7
  i32.const 4
  i32.shl
  local.get $3
  i32.add
  i32.const 2
  i32.shl
  i32.add
  local.get $6
  i32.store offset=96
  local.get $0
  local.get $0
  i32.load
  i32.const 1
  local.get $9
  i32.shl
  i32.or
  i32.store
  local.get $0
  local.set $13
  local.get $9
  local.set $12
  local.get $0
  local.set $3
  local.get $9
  local.set $6
  local.get $3
  local.get $6
  i32.const 2
  i32.shl
  i32.add
  i32.load offset=4
  i32.const 1
  local.get $10
  i32.shl
  i32.or
  local.set $7
  local.get $13
  local.get $12
  i32.const 2
  i32.shl
  i32.add
  local.get $7
  i32.store offset=4
 )
 (func $~lib/rt/tlsf/addMemory (; 3 ;) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  local.get $1
  local.get $2
  i32.le_u
  if (result i32)
   local.get $1
   i32.const 15
   i32.and
   i32.eqz
  else
   i32.const 0
  end
  if (result i32)
   local.get $2
   i32.const 15
   i32.and
   i32.eqz
  else
   i32.const 0
  end
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
  local.set $3
  local.get $3
  i32.load offset=1568
  local.set $4
  i32.const 0
  local.set $5
  local.get $4
  if
   local.get $1
   local.get $4
   i32.const 16
   i32.add
   i32.ge_u
   i32.eqz
   if
    i32.const 0
    i32.const 32
    i32.const 396
    i32.const 15
    call $~lib/builtins/abort
    unreachable
   end
   local.get $1
   i32.const 16
   i32.sub
   local.get $4
   i32.eq
   if
    local.get $1
    i32.const 16
    i32.sub
    local.set $1
    local.get $4
    i32.load
    local.set $5
   else
    nop
   end
  else
   local.get $1
   local.get $0
   i32.const 1572
   i32.add
   i32.ge_u
   i32.eqz
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
  local.set $6
  local.get $6
  i32.const 48
  i32.lt_u
  if
   i32.const 0
   return
  end
  local.get $6
  i32.const 16
  i32.const 1
  i32.shl
  i32.sub
  local.set $7
  local.get $1
  local.set $8
  local.get $8
  local.get $7
  i32.const 1
  i32.or
  local.get $5
  i32.const 2
  i32.and
  i32.or
  i32.store
  local.get $8
  i32.const 0
  i32.store offset=16
  local.get $8
  i32.const 0
  i32.store offset=20
  local.get $1
  local.get $6
  i32.add
  i32.const 16
  i32.sub
  local.set $4
  local.get $4
  i32.const 0
  i32.const 2
  i32.or
  i32.store
  local.get $0
  local.set $9
  local.get $4
  local.set $3
  local.get $9
  local.get $3
  i32.store offset=1568
  local.get $0
  local.get $8
  call $~lib/rt/tlsf/insertBlock
  i32.const 1
 )
 (func $~lib/rt/tlsf/maybeInitialize (; 4 ;) (result i32)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  global.get $~lib/rt/tlsf/ROOT
  local.set $0
  local.get $0
  i32.eqz
  if
   global.get $~lib/heap/__heap_base
   i32.const 15
   i32.add
   i32.const -16
   i32.and
   local.set $1
   memory.size
   local.set $2
   local.get $1
   i32.const 1572
   i32.add
   i32.const 65535
   i32.add
   i32.const 65535
   i32.const -1
   i32.xor
   i32.and
   i32.const 16
   i32.shr_u
   local.set $3
   local.get $3
   local.get $2
   i32.gt_s
   if (result i32)
    local.get $3
    local.get $2
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
   local.get $1
   local.set $0
   local.get $0
   i32.const 0
   i32.store
   local.get $0
   local.set $5
   i32.const 0
   local.set $4
   local.get $5
   local.get $4
   i32.store offset=1568
   i32.const 0
   local.set $5
   loop $for-loop|0
    local.get $5
    i32.const 23
    i32.lt_u
    local.set $4
    local.get $4
    if
     local.get $0
     local.set $8
     local.get $5
     local.set $7
     i32.const 0
     local.set $6
     local.get $8
     local.get $7
     i32.const 2
     i32.shl
     i32.add
     local.get $6
     i32.store offset=4
     i32.const 0
     local.set $8
     loop $for-loop|1
      local.get $8
      i32.const 16
      i32.lt_u
      local.set $7
      local.get $7
      if
       local.get $0
       local.set $11
       local.get $5
       local.set $10
       local.get $8
       local.set $9
       i32.const 0
       local.set $6
       local.get $11
       local.get $10
       i32.const 4
       i32.shl
       local.get $9
       i32.add
       i32.const 2
       i32.shl
       i32.add
       local.get $6
       i32.store offset=96
       local.get $8
       i32.const 1
       i32.add
       local.set $8
       br $for-loop|1
      end
     end
     local.get $5
     i32.const 1
     i32.add
     local.set $5
     br $for-loop|0
    end
   end
   local.get $0
   local.get $1
   i32.const 1572
   i32.add
   i32.const 15
   i32.add
   i32.const 15
   i32.const -1
   i32.xor
   i32.and
   memory.size
   i32.const 16
   i32.shl
   call $~lib/rt/tlsf/addMemory
   drop
   local.get $0
   global.set $~lib/rt/tlsf/ROOT
  end
  local.get $0
 )
 (func $~lib/rt/tlsf/prepareSize (; 5 ;) (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
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
  i32.const 15
  i32.const -1
  i32.xor
  i32.and
  local.tee $1
  i32.const 16
  local.tee $2
  local.get $1
  local.get $2
  i32.gt_u
  select
 )
 (func $~lib/rt/tlsf/searchBlock (; 6 ;) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  local.get $1
  i32.const 256
  i32.lt_u
  if
   i32.const 0
   local.set $2
   local.get $1
   i32.const 4
   i32.shr_u
   local.set $3
  else
   local.get $1
   i32.const 536870904
   i32.lt_u
   if (result i32)
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
   else
    local.get $1
   end
   local.set $4
   i32.const 31
   local.get $4
   i32.clz
   i32.sub
   local.set $2
   local.get $4
   local.get $2
   i32.const 4
   i32.sub
   i32.shr_u
   i32.const 1
   i32.const 4
   i32.shl
   i32.xor
   local.set $3
   local.get $2
   i32.const 8
   i32.const 1
   i32.sub
   i32.sub
   local.set $2
  end
  local.get $2
  i32.const 23
  i32.lt_u
  if (result i32)
   local.get $3
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
  local.set $5
  local.get $2
  local.set $4
  local.get $5
  local.get $4
  i32.const 2
  i32.shl
  i32.add
  i32.load offset=4
  i32.const 0
  i32.const -1
  i32.xor
  local.get $3
  i32.shl
  i32.and
  local.set $6
  i32.const 0
  local.set $7
  local.get $6
  i32.eqz
  if
   local.get $0
   i32.load
   i32.const 0
   i32.const -1
   i32.xor
   local.get $2
   i32.const 1
   i32.add
   i32.shl
   i32.and
   local.set $5
   local.get $5
   i32.eqz
   if
    i32.const 0
    local.set $7
   else
    local.get $5
    i32.ctz
    local.set $2
    local.get $0
    local.set $8
    local.get $2
    local.set $4
    local.get $8
    local.get $4
    i32.const 2
    i32.shl
    i32.add
    i32.load offset=4
    local.set $6
    local.get $6
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
    local.set $9
    local.get $2
    local.set $8
    local.get $6
    i32.ctz
    local.set $4
    local.get $9
    local.get $8
    i32.const 4
    i32.shl
    local.get $4
    i32.add
    i32.const 2
    i32.shl
    i32.add
    i32.load offset=96
    local.set $7
   end
  else
   local.get $0
   local.set $9
   local.get $2
   local.set $8
   local.get $6
   i32.ctz
   local.set $4
   local.get $9
   local.get $8
   i32.const 4
   i32.shl
   local.get $4
   i32.add
   i32.const 2
   i32.shl
   i32.add
   i32.load offset=96
   local.set $7
  end
  local.get $7
 )
 (func $~lib/rt/tlsf/growMemory (; 7 ;) (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
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
   i32.const 1
   i32.sub
   i32.add
   local.set $1
  end
  memory.size
  local.set $2
  local.get $1
  i32.const 16
  local.get $2
  i32.const 16
  i32.shl
  i32.const 16
  i32.sub
  local.get $0
  local.set $3
  local.get $3
  i32.load offset=1568
  i32.ne
  i32.shl
  i32.add
  local.set $1
  local.get $1
  i32.const 65535
  i32.add
  i32.const 65535
  i32.const -1
  i32.xor
  i32.and
  i32.const 16
  i32.shr_u
  local.set $4
  local.get $2
  local.tee $3
  local.get $4
  local.tee $5
  local.get $3
  local.get $5
  i32.gt_s
  select
  local.set $6
  local.get $6
  memory.grow
  i32.const 0
  i32.lt_s
  if
   local.get $4
   memory.grow
   i32.const 0
   i32.lt_s
   if
    unreachable
   end
  end
  memory.size
  local.set $7
  local.get $0
  local.get $2
  i32.const 16
  i32.shl
  local.get $7
  i32.const 16
  i32.shl
  call $~lib/rt/tlsf/addMemory
  drop
 )
 (func $~lib/rt/tlsf/prepareBlock (; 8 ;) (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $1
  i32.load
  local.set $3
  local.get $2
  i32.const 15
  i32.and
  i32.eqz
  i32.eqz
  if
   i32.const 0
   i32.const 32
   i32.const 365
   i32.const 13
   call $~lib/builtins/abort
   unreachable
  end
  local.get $3
  i32.const 3
  i32.const -1
  i32.xor
  i32.and
  local.get $2
  i32.sub
  local.set $4
  local.get $4
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
   local.get $1
   i32.const 16
   i32.add
   local.get $2
   i32.add
   local.set $5
   local.get $5
   local.get $4
   i32.const 16
   i32.sub
   i32.const 1
   i32.or
   i32.store
   local.get $0
   local.get $5
   call $~lib/rt/tlsf/insertBlock
  else
   local.get $1
   local.get $3
   i32.const 1
   i32.const -1
   i32.xor
   i32.and
   i32.store
   local.get $1
   local.set $5
   local.get $5
   i32.const 16
   i32.add
   local.get $5
   i32.load
   i32.const 3
   i32.const -1
   i32.xor
   i32.and
   i32.add
   local.get $1
   local.set $5
   local.get $5
   i32.const 16
   i32.add
   local.get $5
   i32.load
   i32.const 3
   i32.const -1
   i32.xor
   i32.and
   i32.add
   i32.load
   i32.const 2
   i32.const -1
   i32.xor
   i32.and
   i32.store
  end
 )
 (func $~lib/rt/tlsf/allocateBlock (; 9 ;) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/rt/tlsf/collectLock
  i32.eqz
  i32.eqz
  if
   i32.const 0
   i32.const 32
   i32.const 490
   i32.const 13
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  call $~lib/rt/tlsf/prepareSize
  local.set $3
  local.get $0
  local.get $3
  call $~lib/rt/tlsf/searchBlock
  local.set $4
  local.get $4
  i32.eqz
  if
   global.get $~lib/gc/gc.auto
   if
    i32.const 1
    global.set $~lib/rt/tlsf/collectLock
    call $~lib/rt/pure/__collect
    i32.const 0
    global.set $~lib/rt/tlsf/collectLock
    local.get $0
    local.get $3
    call $~lib/rt/tlsf/searchBlock
    local.set $4
    local.get $4
    i32.eqz
    if
     local.get $0
     local.get $3
     call $~lib/rt/tlsf/growMemory
     local.get $0
     local.get $3
     call $~lib/rt/tlsf/searchBlock
     local.set $4
     local.get $4
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
   else
    local.get $0
    local.get $3
    call $~lib/rt/tlsf/growMemory
    local.get $0
    local.get $3
    call $~lib/rt/tlsf/searchBlock
    local.set $4
    local.get $4
    i32.eqz
    if
     i32.const 0
     i32.const 32
     i32.const 507
     i32.const 17
     call $~lib/builtins/abort
     unreachable
    end
   end
  end
  local.get $4
  i32.load
  i32.const -4
  i32.and
  local.get $3
  i32.ge_u
  i32.eqz
  if
   i32.const 0
   i32.const 32
   i32.const 510
   i32.const 13
   call $~lib/builtins/abort
   unreachable
  end
  local.get $4
  i32.const 0
  i32.store offset=4
  local.get $4
  local.get $2
  i32.store offset=8
  local.get $4
  local.get $1
  i32.store offset=12
  local.get $0
  local.get $4
  call $~lib/rt/tlsf/removeBlock
  local.get $0
  local.get $4
  local.get $3
  call $~lib/rt/tlsf/prepareBlock
  local.get $4
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
  local.set $1
  local.get $1
  i32.const -268435456
  i32.and
  local.get $1
  i32.const 1
  i32.add
  i32.const -268435456
  i32.and
  i32.eq
  i32.eqz
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
  i32.eqz
  i32.eqz
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
  global.get $~lib/heap/__heap_base
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
  global.get $~lib/heap/__heap_base
  i32.gt_u
  if
   local.get $0
   i32.const 16
   i32.sub
   call $~lib/rt/pure/decrement
  end
 )
 (func $~lib/util/memory/memcpy (; 14 ;) (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  loop $while-continue|0
   local.get $2
   if (result i32)
    local.get $1
    i32.const 3
    i32.and
   else
    i32.const 0
   end
   local.set $5
   local.get $5
   if
    local.get $0
    local.tee $6
    i32.const 1
    i32.add
    local.set $0
    local.get $6
    local.get $1
    local.tee $6
    i32.const 1
    i32.add
    local.set $1
    local.get $6
    i32.load8_u
    i32.store8
    local.get $2
    i32.const 1
    i32.sub
    local.set $2
    br $while-continue|0
   end
  end
  local.get $0
  i32.const 3
  i32.and
  i32.const 0
  i32.eq
  if
   loop $while-continue|1
    local.get $2
    i32.const 16
    i32.ge_u
    local.set $5
    local.get $5
    if
     local.get $0
     local.get $1
     i32.load
     i32.store
     local.get $0
     i32.const 4
     i32.add
     local.get $1
     i32.const 4
     i32.add
     i32.load
     i32.store
     local.get $0
     i32.const 8
     i32.add
     local.get $1
     i32.const 8
     i32.add
     i32.load
     i32.store
     local.get $0
     i32.const 12
     i32.add
     local.get $1
     i32.const 12
     i32.add
     i32.load
     i32.store
     local.get $1
     i32.const 16
     i32.add
     local.set $1
     local.get $0
     i32.const 16
     i32.add
     local.set $0
     local.get $2
     i32.const 16
     i32.sub
     local.set $2
     br $while-continue|1
    end
   end
   local.get $2
   i32.const 8
   i32.and
   if
    local.get $0
    local.get $1
    i32.load
    i32.store
    local.get $0
    i32.const 4
    i32.add
    local.get $1
    i32.const 4
    i32.add
    i32.load
    i32.store
    local.get $0
    i32.const 8
    i32.add
    local.set $0
    local.get $1
    i32.const 8
    i32.add
    local.set $1
   end
   local.get $2
   i32.const 4
   i32.and
   if
    local.get $0
    local.get $1
    i32.load
    i32.store
    local.get $0
    i32.const 4
    i32.add
    local.set $0
    local.get $1
    i32.const 4
    i32.add
    local.set $1
   end
   local.get $2
   i32.const 2
   i32.and
   if
    local.get $0
    local.get $1
    i32.load16_u
    i32.store16
    local.get $0
    i32.const 2
    i32.add
    local.set $0
    local.get $1
    i32.const 2
    i32.add
    local.set $1
   end
   local.get $2
   i32.const 1
   i32.and
   if
    local.get $0
    local.tee $5
    i32.const 1
    i32.add
    local.set $0
    local.get $5
    local.get $1
    local.tee $5
    i32.const 1
    i32.add
    local.set $1
    local.get $5
    i32.load8_u
    i32.store8
   end
   return
  end
  local.get $2
  i32.const 32
  i32.ge_u
  if
   block $break|2
    block $case2|2
     block $case1|2
      block $case0|2
       local.get $0
       i32.const 3
       i32.and
       local.set $5
       local.get $5
       i32.const 1
       i32.eq
       br_if $case0|2
       local.get $5
       i32.const 2
       i32.eq
       br_if $case1|2
       local.get $5
       i32.const 3
       i32.eq
       br_if $case2|2
       br $break|2
      end
      local.get $1
      i32.load
      local.set $3
      local.get $0
      local.tee $5
      i32.const 1
      i32.add
      local.set $0
      local.get $5
      local.get $1
      local.tee $5
      i32.const 1
      i32.add
      local.set $1
      local.get $5
      i32.load8_u
      i32.store8
      local.get $0
      local.tee $5
      i32.const 1
      i32.add
      local.set $0
      local.get $5
      local.get $1
      local.tee $5
      i32.const 1
      i32.add
      local.set $1
      local.get $5
      i32.load8_u
      i32.store8
      local.get $0
      local.tee $5
      i32.const 1
      i32.add
      local.set $0
      local.get $5
      local.get $1
      local.tee $5
      i32.const 1
      i32.add
      local.set $1
      local.get $5
      i32.load8_u
      i32.store8
      local.get $2
      i32.const 3
      i32.sub
      local.set $2
      loop $while-continue|3
       local.get $2
       i32.const 17
       i32.ge_u
       local.set $5
       local.get $5
       if
        local.get $1
        i32.const 1
        i32.add
        i32.load
        local.set $4
        local.get $0
        local.get $3
        i32.const 24
        i32.shr_u
        local.get $4
        i32.const 8
        i32.shl
        i32.or
        i32.store
        local.get $1
        i32.const 5
        i32.add
        i32.load
        local.set $3
        local.get $0
        i32.const 4
        i32.add
        local.get $4
        i32.const 24
        i32.shr_u
        local.get $3
        i32.const 8
        i32.shl
        i32.or
        i32.store
        local.get $1
        i32.const 9
        i32.add
        i32.load
        local.set $4
        local.get $0
        i32.const 8
        i32.add
        local.get $3
        i32.const 24
        i32.shr_u
        local.get $4
        i32.const 8
        i32.shl
        i32.or
        i32.store
        local.get $1
        i32.const 13
        i32.add
        i32.load
        local.set $3
        local.get $0
        i32.const 12
        i32.add
        local.get $4
        i32.const 24
        i32.shr_u
        local.get $3
        i32.const 8
        i32.shl
        i32.or
        i32.store
        local.get $1
        i32.const 16
        i32.add
        local.set $1
        local.get $0
        i32.const 16
        i32.add
        local.set $0
        local.get $2
        i32.const 16
        i32.sub
        local.set $2
        br $while-continue|3
       end
      end
      br $break|2
     end
     local.get $1
     i32.load
     local.set $3
     local.get $0
     local.tee $5
     i32.const 1
     i32.add
     local.set $0
     local.get $5
     local.get $1
     local.tee $5
     i32.const 1
     i32.add
     local.set $1
     local.get $5
     i32.load8_u
     i32.store8
     local.get $0
     local.tee $5
     i32.const 1
     i32.add
     local.set $0
     local.get $5
     local.get $1
     local.tee $5
     i32.const 1
     i32.add
     local.set $1
     local.get $5
     i32.load8_u
     i32.store8
     local.get $2
     i32.const 2
     i32.sub
     local.set $2
     loop $while-continue|4
      local.get $2
      i32.const 18
      i32.ge_u
      local.set $5
      local.get $5
      if
       local.get $1
       i32.const 2
       i32.add
       i32.load
       local.set $4
       local.get $0
       local.get $3
       i32.const 16
       i32.shr_u
       local.get $4
       i32.const 16
       i32.shl
       i32.or
       i32.store
       local.get $1
       i32.const 6
       i32.add
       i32.load
       local.set $3
       local.get $0
       i32.const 4
       i32.add
       local.get $4
       i32.const 16
       i32.shr_u
       local.get $3
       i32.const 16
       i32.shl
       i32.or
       i32.store
       local.get $1
       i32.const 10
       i32.add
       i32.load
       local.set $4
       local.get $0
       i32.const 8
       i32.add
       local.get $3
       i32.const 16
       i32.shr_u
       local.get $4
       i32.const 16
       i32.shl
       i32.or
       i32.store
       local.get $1
       i32.const 14
       i32.add
       i32.load
       local.set $3
       local.get $0
       i32.const 12
       i32.add
       local.get $4
       i32.const 16
       i32.shr_u
       local.get $3
       i32.const 16
       i32.shl
       i32.or
       i32.store
       local.get $1
       i32.const 16
       i32.add
       local.set $1
       local.get $0
       i32.const 16
       i32.add
       local.set $0
       local.get $2
       i32.const 16
       i32.sub
       local.set $2
       br $while-continue|4
      end
     end
     br $break|2
    end
    local.get $1
    i32.load
    local.set $3
    local.get $0
    local.tee $5
    i32.const 1
    i32.add
    local.set $0
    local.get $5
    local.get $1
    local.tee $5
    i32.const 1
    i32.add
    local.set $1
    local.get $5
    i32.load8_u
    i32.store8
    local.get $2
    i32.const 1
    i32.sub
    local.set $2
    loop $while-continue|5
     local.get $2
     i32.const 19
     i32.ge_u
     local.set $5
     local.get $5
     if
      local.get $1
      i32.const 3
      i32.add
      i32.load
      local.set $4
      local.get $0
      local.get $3
      i32.const 8
      i32.shr_u
      local.get $4
      i32.const 24
      i32.shl
      i32.or
      i32.store
      local.get $1
      i32.const 7
      i32.add
      i32.load
      local.set $3
      local.get $0
      i32.const 4
      i32.add
      local.get $4
      i32.const 8
      i32.shr_u
      local.get $3
      i32.const 24
      i32.shl
      i32.or
      i32.store
      local.get $1
      i32.const 11
      i32.add
      i32.load
      local.set $4
      local.get $0
      i32.const 8
      i32.add
      local.get $3
      i32.const 8
      i32.shr_u
      local.get $4
      i32.const 24
      i32.shl
      i32.or
      i32.store
      local.get $1
      i32.const 15
      i32.add
      i32.load
      local.set $3
      local.get $0
      i32.const 12
      i32.add
      local.get $4
      i32.const 8
      i32.shr_u
      local.get $3
      i32.const 24
      i32.shl
      i32.or
      i32.store
      local.get $1
      i32.const 16
      i32.add
      local.set $1
      local.get $0
      i32.const 16
      i32.add
      local.set $0
      local.get $2
      i32.const 16
      i32.sub
      local.set $2
      br $while-continue|5
     end
    end
    br $break|2
   end
  end
  local.get $2
  i32.const 16
  i32.and
  if
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
  end
  local.get $2
  i32.const 8
  i32.and
  if
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
  end
  local.get $2
  i32.const 4
  i32.and
  if
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
  end
  local.get $2
  i32.const 2
  i32.and
  if
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
  end
  local.get $2
  i32.const 1
  i32.and
  if
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
  end
 )
 (func $~lib/memory/memory.copy (; 15 ;) (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  block $~lib/util/memory/memmove|inlined.0
   local.get $0
   local.set $5
   local.get $1
   local.set $4
   local.get $2
   local.set $3
   local.get $5
   local.get $4
   i32.eq
   if
    br $~lib/util/memory/memmove|inlined.0
   end
   local.get $4
   local.get $3
   i32.add
   local.get $5
   i32.le_u
   if (result i32)
    i32.const 1
   else
    local.get $5
    local.get $3
    i32.add
    local.get $4
    i32.le_u
   end
   if
    local.get $5
    local.get $4
    local.get $3
    call $~lib/util/memory/memcpy
    br $~lib/util/memory/memmove|inlined.0
   end
   local.get $5
   local.get $4
   i32.lt_u
   if
    local.get $4
    i32.const 7
    i32.and
    local.get $5
    i32.const 7
    i32.and
    i32.eq
    if
     loop $while-continue|0
      local.get $5
      i32.const 7
      i32.and
      local.set $6
      local.get $6
      if
       local.get $3
       i32.eqz
       if
        br $~lib/util/memory/memmove|inlined.0
       end
       local.get $3
       i32.const 1
       i32.sub
       local.set $3
       local.get $5
       local.tee $7
       i32.const 1
       i32.add
       local.set $5
       local.get $7
       local.get $4
       local.tee $7
       i32.const 1
       i32.add
       local.set $4
       local.get $7
       i32.load8_u
       i32.store8
       br $while-continue|0
      end
     end
     loop $while-continue|1
      local.get $3
      i32.const 8
      i32.ge_u
      local.set $6
      local.get $6
      if
       local.get $5
       local.get $4
       i64.load
       i64.store
       local.get $3
       i32.const 8
       i32.sub
       local.set $3
       local.get $5
       i32.const 8
       i32.add
       local.set $5
       local.get $4
       i32.const 8
       i32.add
       local.set $4
       br $while-continue|1
      end
     end
    end
    loop $while-continue|2
     local.get $3
     local.set $6
     local.get $6
     if
      local.get $5
      local.tee $7
      i32.const 1
      i32.add
      local.set $5
      local.get $7
      local.get $4
      local.tee $7
      i32.const 1
      i32.add
      local.set $4
      local.get $7
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
    local.get $4
    i32.const 7
    i32.and
    local.get $5
    i32.const 7
    i32.and
    i32.eq
    if
     loop $while-continue|3
      local.get $5
      local.get $3
      i32.add
      i32.const 7
      i32.and
      local.set $6
      local.get $6
      if
       local.get $3
       i32.eqz
       if
        br $~lib/util/memory/memmove|inlined.0
       end
       local.get $5
       local.get $3
       i32.const 1
       i32.sub
       local.tee $3
       i32.add
       local.get $4
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
      local.set $6
      local.get $6
      if
       local.get $3
       i32.const 8
       i32.sub
       local.set $3
       local.get $5
       local.get $3
       i32.add
       local.get $4
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
     local.set $6
     local.get $6
     if
      local.get $5
      local.get $3
      i32.const 1
      i32.sub
      local.tee $3
      i32.add
      local.get $4
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
 (func $~lib/rt/__allocBuffer (; 16 ;) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  local.get $0
  local.get $1
  call $~lib/rt/tlsf/__alloc
  local.set $3
  local.get $2
  if
   local.get $3
   local.get $2
   local.get $0
   call $~lib/memory/memory.copy
  end
  local.get $3
 )
 (func $~lib/rt/__allocArray (; 17 ;) (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (result i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  i32.const 16
  local.get $2
  call $~lib/rt/tlsf/__alloc
  local.set $4
  local.get $0
  local.get $1
  i32.shl
  local.set $5
  local.get $5
  i32.const 0
  local.get $3
  call $~lib/rt/__allocBuffer
  local.set $6
  local.get $4
  local.get $6
  call $~lib/rt/pure/__retain
  i32.store
  local.get $4
  local.get $6
  i32.store offset=4
  local.get $4
  local.get $5
  i32.store offset=8
  local.get $4
  local.get $0
  i32.store offset=12
  local.get $4
 )
 (func $~lib/rt/tlsf/checkUsedBlock (; 18 ;) (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  i32.const 16
  i32.sub
  local.set $1
  local.get $0
  i32.const 0
  i32.ne
  if (result i32)
   local.get $0
   i32.const 15
   i32.and
   i32.eqz
  else
   i32.const 0
  end
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
 (func $~lib/rt/tlsf/freeBlock (; 19 ;) (param $0 i32) (param $1 i32)
  (local $2 i32)
  local.get $1
  i32.load
  local.set $2
  local.get $1
  local.get $2
  i32.const 1
  i32.or
  i32.store
  local.get $0
  local.get $1
  call $~lib/rt/tlsf/insertBlock
 )
 (func $~lib/rt/tlsf/reallocateBlock (; 20 ;) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  local.get $2
  call $~lib/rt/tlsf/prepareSize
  local.set $3
  local.get $1
  i32.load
  local.set $4
  local.get $3
  local.get $4
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
  local.set $5
  local.get $5
  i32.const 16
  i32.add
  local.get $5
  i32.load
  i32.const 3
  i32.const -1
  i32.xor
  i32.and
  i32.add
  local.set $6
  local.get $6
  i32.load
  local.set $7
  local.get $7
  i32.const 1
  i32.and
  if
   local.get $4
   i32.const 3
   i32.const -1
   i32.xor
   i32.and
   i32.const 16
   i32.add
   local.get $7
   i32.const 3
   i32.const -1
   i32.xor
   i32.and
   i32.add
   local.set $5
   local.get $5
   local.get $3
   i32.ge_u
   if
    local.get $0
    local.get $6
    call $~lib/rt/tlsf/removeBlock
    local.get $1
    local.get $4
    i32.const 3
    i32.and
    local.get $5
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
  local.set $8
  local.get $8
  local.get $1
  i32.load offset=4
  i32.store offset=4
  local.get $8
  i32.const 16
  i32.add
  local.get $1
  i32.const 16
  i32.add
  local.get $2
  call $~lib/memory/memory.copy
  local.get $1
  global.get $~lib/heap/__heap_base
  i32.ge_u
  if
   local.get $0
   local.get $1
   call $~lib/rt/tlsf/freeBlock
  end
  local.get $8
 )
 (func $~lib/rt/tlsf/__realloc (; 21 ;) (param $0 i32) (param $1 i32) (result i32)
  call $~lib/rt/tlsf/maybeInitialize
  local.get $0
  call $~lib/rt/tlsf/checkUsedBlock
  local.get $1
  call $~lib/rt/tlsf/reallocateBlock
  i32.const 16
  i32.add
 )
 (func $~lib/memory/memory.fill (; 22 ;) (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i64)
  (local $9 i32)
  block $~lib/util/memory/memset|inlined.0
   local.get $0
   local.set $5
   local.get $1
   local.set $4
   local.get $2
   local.set $3
   local.get $3
   i32.eqz
   if
    br $~lib/util/memory/memset|inlined.0
   end
   local.get $5
   local.get $4
   i32.store8
   local.get $5
   local.get $3
   i32.add
   i32.const 1
   i32.sub
   local.get $4
   i32.store8
   local.get $3
   i32.const 2
   i32.le_u
   if
    br $~lib/util/memory/memset|inlined.0
   end
   local.get $5
   i32.const 1
   i32.add
   local.get $4
   i32.store8
   local.get $5
   i32.const 2
   i32.add
   local.get $4
   i32.store8
   local.get $5
   local.get $3
   i32.add
   i32.const 2
   i32.sub
   local.get $4
   i32.store8
   local.get $5
   local.get $3
   i32.add
   i32.const 3
   i32.sub
   local.get $4
   i32.store8
   local.get $3
   i32.const 6
   i32.le_u
   if
    br $~lib/util/memory/memset|inlined.0
   end
   local.get $5
   i32.const 3
   i32.add
   local.get $4
   i32.store8
   local.get $5
   local.get $3
   i32.add
   i32.const 4
   i32.sub
   local.get $4
   i32.store8
   local.get $3
   i32.const 8
   i32.le_u
   if
    br $~lib/util/memory/memset|inlined.0
   end
   i32.const 0
   local.get $5
   i32.sub
   i32.const 3
   i32.and
   local.set $6
   local.get $5
   local.get $6
   i32.add
   local.set $5
   local.get $3
   local.get $6
   i32.sub
   local.set $3
   local.get $3
   i32.const -4
   i32.and
   local.set $3
   i32.const -1
   i32.const 255
   i32.div_u
   local.get $4
   i32.const 255
   i32.and
   i32.mul
   local.set $7
   local.get $5
   local.get $7
   i32.store
   local.get $5
   local.get $3
   i32.add
   i32.const 4
   i32.sub
   local.get $7
   i32.store
   local.get $3
   i32.const 8
   i32.le_u
   if
    br $~lib/util/memory/memset|inlined.0
   end
   local.get $5
   i32.const 4
   i32.add
   local.get $7
   i32.store
   local.get $5
   i32.const 8
   i32.add
   local.get $7
   i32.store
   local.get $5
   local.get $3
   i32.add
   i32.const 12
   i32.sub
   local.get $7
   i32.store
   local.get $5
   local.get $3
   i32.add
   i32.const 8
   i32.sub
   local.get $7
   i32.store
   local.get $3
   i32.const 24
   i32.le_u
   if
    br $~lib/util/memory/memset|inlined.0
   end
   local.get $5
   i32.const 12
   i32.add
   local.get $7
   i32.store
   local.get $5
   i32.const 16
   i32.add
   local.get $7
   i32.store
   local.get $5
   i32.const 20
   i32.add
   local.get $7
   i32.store
   local.get $5
   i32.const 24
   i32.add
   local.get $7
   i32.store
   local.get $5
   local.get $3
   i32.add
   i32.const 28
   i32.sub
   local.get $7
   i32.store
   local.get $5
   local.get $3
   i32.add
   i32.const 24
   i32.sub
   local.get $7
   i32.store
   local.get $5
   local.get $3
   i32.add
   i32.const 20
   i32.sub
   local.get $7
   i32.store
   local.get $5
   local.get $3
   i32.add
   i32.const 16
   i32.sub
   local.get $7
   i32.store
   i32.const 24
   local.get $5
   i32.const 4
   i32.and
   i32.add
   local.set $6
   local.get $5
   local.get $6
   i32.add
   local.set $5
   local.get $3
   local.get $6
   i32.sub
   local.set $3
   local.get $7
   i64.extend_i32_u
   local.get $7
   i64.extend_i32_u
   i64.const 32
   i64.shl
   i64.or
   local.set $8
   loop $while-continue|0
    local.get $3
    i32.const 32
    i32.ge_u
    local.set $9
    local.get $9
    if
     local.get $5
     local.get $8
     i64.store
     local.get $5
     i32.const 8
     i32.add
     local.get $8
     i64.store
     local.get $5
     i32.const 16
     i32.add
     local.get $8
     i64.store
     local.get $5
     i32.const 24
     i32.add
     local.get $8
     i64.store
     local.get $3
     i32.const 32
     i32.sub
     local.set $3
     local.get $5
     i32.const 32
     i32.add
     local.set $5
     br $while-continue|0
    end
   end
  end
 )
 (func $~lib/array/ensureSize (; 23 ;) (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  local.get $0
  i32.load offset=8
  local.set $3
  local.get $1
  local.get $3
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
   local.get $1
   local.get $2
   i32.shl
   local.set $5
   local.get $4
   local.get $5
   call $~lib/rt/tlsf/__realloc
   local.set $6
   local.get $6
   local.get $3
   i32.add
   i32.const 0
   local.get $5
   local.get $3
   i32.sub
   call $~lib/memory/memory.fill
   local.get $6
   local.get $4
   i32.ne
   if
    local.get $0
    local.get $6
    i32.store
    local.get $0
    local.get $6
    i32.store offset=4
   end
   local.get $0
   local.get $5
   i32.store offset=8
  end
 )
 (func $~lib/array/Array<bool>#__unchecked_set (; 24 ;) (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 0
  i32.shl
  i32.add
  local.get $2
  i32.store8
 )
 (func $~lib/array/Array<bool>#__set (; 25 ;) (param $0 i32) (param $1 i32) (param $2 i32)
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
   i32.const 0
   call $~lib/array/ensureSize
   local.get $0
   local.get $1
   i32.const 1
   i32.add
   i32.store offset=12
  end
  local.get $0
  local.get $1
  local.get $2
  call $~lib/array/Array<bool>#__unchecked_set
 )
 (func $~lib/array/Array<src/assembly/Z80Cpu/Z80Cpu | null>#__unchecked_set (; 26 ;) (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  local.get $2
  call $~lib/rt/pure/__retain
  local.set $2
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 2
  i32.shl
  i32.add
  local.set $3
  local.get $3
  i32.load
  local.set $4
  local.get $2
  local.get $4
  i32.ne
  if
   local.get $3
   local.get $2
   call $~lib/rt/pure/__retain
   i32.store
   local.get $4
   call $~lib/rt/pure/__release
  end
  local.get $2
  call $~lib/rt/pure/__release
 )
 (func $~lib/array/Array<src/assembly/Z80Cpu/Z80Cpu | null>#__set (; 27 ;) (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $2
  call $~lib/rt/pure/__retain
  local.set $2
  local.get $1
  local.get $0
  i32.load offset=12
  i32.ge_u
  if
   local.get $1
   i32.const 0
   i32.lt_s
   if
    local.get $2
    call $~lib/rt/pure/__release
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
   i32.const 2
   call $~lib/array/ensureSize
   local.get $0
   local.get $1
   i32.const 1
   i32.add
   i32.store offset=12
  end
  local.get $0
  local.get $1
  local.get $2
  call $~lib/array/Array<src/assembly/Z80Cpu/Z80Cpu | null>#__unchecked_set
  local.get $2
  call $~lib/rt/pure/__release
 )
 (func $src/assembly/ObjectPool/ObjectPool<src/assembly/Z80Cpu/Z80Cpu>#reset (; 28 ;) (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  i32.const 0
  local.set $1
  loop $for-loop|0
   local.get $1
   local.get $0
   i32.load offset=8
   i32.lt_s
   local.set $2
   local.get $2
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
 (func $src/assembly/ObjectPool/ObjectPool<src/assembly/Z80Cpu/Z80Cpu>#constructor (; 29 ;) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  local.get $0
  i32.eqz
  if
   i32.const 16
   i32.const 13
   call $~lib/rt/tlsf/__alloc
   call $~lib/rt/pure/__retain
   local.set $0
  end
  local.get $0
  i32.const 0
  i32.const 0
  i32.const 14
  i32.const 192
  call $~lib/rt/__allocArray
  call $~lib/rt/pure/__retain
  i32.store
  local.get $0
  i32.const 0
  i32.const 2
  i32.const 15
  i32.const 208
  call $~lib/rt/__allocArray
  call $~lib/rt/pure/__retain
  i32.store offset=4
  local.get $0
  local.get $1
  i32.store offset=8
  local.get $0
  local.get $2
  i32.store offset=12
  local.get $0
  call $src/assembly/ObjectPool/ObjectPool<src/assembly/Z80Cpu/Z80Cpu>#reset
  local.get $0
 )
 (func $~lib/arraybuffer/ArrayBufferView#constructor (; 30 ;) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
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
  local.tee $1
  i32.const 0
  call $~lib/rt/tlsf/__alloc
  local.set $3
  local.get $3
  i32.const 0
  local.get $1
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
  local.get $0
  local.tee $4
  local.get $3
  local.tee $5
  local.get $4
  i32.load
  local.tee $6
  i32.ne
  if
   local.get $5
   call $~lib/rt/pure/__retain
   local.set $5
   local.get $6
   call $~lib/rt/pure/__release
  end
  local.get $5
  i32.store
  local.get $0
  local.get $3
  i32.store offset=4
  local.get $0
  local.get $1
  i32.store offset=8
  local.get $0
 )
 (func $~lib/typedarray/Uint32Array#constructor (; 31 ;) (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  if (result i32)
   local.get $0
  else
   i32.const 12
   i32.const 8
   call $~lib/rt/tlsf/__alloc
   call $~lib/rt/pure/__retain
  end
  local.get $1
  i32.const 2
  call $~lib/arraybuffer/ArrayBufferView#constructor
  local.set $0
  local.get $0
 )
 (func $~lib/typedarray/Uint32Array#__set (; 32 ;) (param $0 i32) (param $1 i32) (param $2 i32)
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
  local.get $2
  i32.store
 )
 (func $src/assembly/MemoryStatusArray/MemoryStatusArray#clearAll (; 33 ;) (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  i32.const 0
  local.set $1
  loop $for-loop|0
   local.get $1
   i32.const 2048
   i32.lt_s
   local.set $2
   local.get $2
   if
    local.get $0
    i32.load
    local.get $1
    i32.const 0
    call $~lib/typedarray/Uint32Array#__set
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
 )
 (func $src/assembly/MemoryStatusArray/MemoryStatusArray#constructor (; 34 ;) (param $0 i32) (result i32)
  local.get $0
  i32.eqz
  if
   i32.const 4
   i32.const 12
   call $~lib/rt/tlsf/__alloc
   call $~lib/rt/pure/__retain
   local.set $0
  end
  local.get $0
  i32.const 0
  i32.const 2048
  call $~lib/typedarray/Uint32Array#constructor
  i32.store
  local.get $0
  call $src/assembly/MemoryStatusArray/MemoryStatusArray#clearAll
  local.get $0
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#constructor (; 35 ;) (param $0 i32) (param $1 i32) (result i32)
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
  global.get $src/assembly/Z80Cpu/Z80StateFlags.None
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
  i32.const 0
  call $src/assembly/MemoryStatusArray/MemoryStatusArray#constructor
  i32.store offset=68
  local.get $0
  i32.const 0
  call $src/assembly/MemoryStatusArray/MemoryStatusArray#constructor
  i32.store offset=72
  local.get $0
  i32.const 0
  call $src/assembly/MemoryStatusArray/MemoryStatusArray#constructor
  i32.store offset=76
  local.get $0
  global.get $src/assembly/Z80Cpu/OpPrefixMode.None
  i32.store offset=80
  local.get $0
  global.get $src/assembly/Z80Cpu/OpIndexMode.None
  i32.store offset=84
  local.get $0
  i32.const 0
  i32.store8 offset=88
  local.get $0
  local.get $1
  i32.store8 offset=89
  local.get $0
 )
 (func $start:src/assembly/index~anonymous|0 (; 36 ;) (result i32)
  i32.const 0
  i32.const 0
  call $src/assembly/Z80Cpu/Z80Cpu#constructor
 )
 (func $~lib/array/Array<src/assembly/test-machine/TestZ80Machine/TestZ80Machine | null>#__unchecked_set (; 37 ;) (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  local.get $2
  call $~lib/rt/pure/__retain
  local.set $2
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 2
  i32.shl
  i32.add
  local.set $3
  local.get $3
  i32.load
  local.set $4
  local.get $2
  local.get $4
  i32.ne
  if
   local.get $3
   local.get $2
   call $~lib/rt/pure/__retain
   i32.store
   local.get $4
   call $~lib/rt/pure/__release
  end
  local.get $2
  call $~lib/rt/pure/__release
 )
 (func $~lib/array/Array<src/assembly/test-machine/TestZ80Machine/TestZ80Machine | null>#__set (; 38 ;) (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $2
  call $~lib/rt/pure/__retain
  local.set $2
  local.get $1
  local.get $0
  i32.load offset=12
  i32.ge_u
  if
   local.get $1
   i32.const 0
   i32.lt_s
   if
    local.get $2
    call $~lib/rt/pure/__release
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
   i32.const 2
   call $~lib/array/ensureSize
   local.get $0
   local.get $1
   i32.const 1
   i32.add
   i32.store offset=12
  end
  local.get $0
  local.get $1
  local.get $2
  call $~lib/array/Array<src/assembly/test-machine/TestZ80Machine/TestZ80Machine | null>#__unchecked_set
  local.get $2
  call $~lib/rt/pure/__release
 )
 (func $src/assembly/ObjectPool/ObjectPool<src/assembly/test-machine/TestZ80Machine/TestZ80Machine>#reset (; 39 ;) (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  i32.const 0
  local.set $1
  loop $for-loop|0
   local.get $1
   local.get $0
   i32.load offset=8
   i32.lt_s
   local.set $2
   local.get $2
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
    call $~lib/array/Array<src/assembly/test-machine/TestZ80Machine/TestZ80Machine | null>#__set
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
 )
 (func $src/assembly/ObjectPool/ObjectPool<src/assembly/test-machine/TestZ80Machine/TestZ80Machine>#constructor (; 40 ;) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  local.get $0
  i32.eqz
  if
   i32.const 16
   i32.const 26
   call $~lib/rt/tlsf/__alloc
   call $~lib/rt/pure/__retain
   local.set $0
  end
  local.get $0
  i32.const 0
  i32.const 0
  i32.const 14
  i32.const 512
  call $~lib/rt/__allocArray
  call $~lib/rt/pure/__retain
  i32.store
  local.get $0
  i32.const 0
  i32.const 2
  i32.const 27
  i32.const 528
  call $~lib/rt/__allocArray
  call $~lib/rt/pure/__retain
  i32.store offset=4
  local.get $0
  local.get $1
  i32.store offset=8
  local.get $0
  local.get $2
  i32.store offset=12
  local.get $0
  call $src/assembly/ObjectPool/ObjectPool<src/assembly/test-machine/TestZ80Machine/TestZ80Machine>#reset
  local.get $0
 )
 (func $~lib/typedarray/Uint8Array#constructor (; 41 ;) (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  if (result i32)
   local.get $0
  else
   i32.const 12
   i32.const 4
   call $~lib/rt/tlsf/__alloc
   call $~lib/rt/pure/__retain
  end
  local.get $1
  i32.const 0
  call $~lib/arraybuffer/ArrayBufferView#constructor
  local.set $0
  local.get $0
 )
 (func $~lib/typedarray/Uint8Array#__set (; 42 ;) (param $0 i32) (param $1 i32) (param $2 i32)
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
  local.get $0
  i32.load offset=4
  local.get $1
  i32.add
  local.get $2
  i32.store8
 )
 (func $src/assembly/test-machine/TestZ80Cpu/TestMemoryDevice#reset (; 43 ;) (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  i32.const 0
  local.set $1
  loop $for-loop|0
   local.get $1
   i32.const 4096
   i32.lt_s
   local.set $2
   local.get $2
   if
    local.get $0
    i32.load
    local.get $1
    i32.const 255
    call $~lib/typedarray/Uint8Array#__set
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
  local.get $0
  local.tee $1
  i32.const 0
  i32.const 2
  i32.const 21
  i32.const 560
  call $~lib/rt/__allocArray
  call $~lib/rt/pure/__retain
  local.set $2
  local.get $1
  i32.load offset=4
  call $~lib/rt/pure/__release
  local.get $2
  i32.store offset=4
 )
 (func $src/assembly/test-machine/TestZ80Cpu/TestMemoryDevice#constructor (; 44 ;) (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  local.get $0
  i32.eqz
  if
   i32.const 8
   i32.const 19
   call $~lib/rt/tlsf/__alloc
   call $~lib/rt/pure/__retain
   local.set $0
  end
  local.get $0
  i32.const 0
  i32.const 65536
  call $~lib/typedarray/Uint8Array#constructor
  i32.store
  local.get $0
  i32.const 0
  i32.const 2
  i32.const 21
  i32.const 544
  call $~lib/rt/__allocArray
  call $~lib/rt/pure/__retain
  i32.store offset=4
  local.get $0
  call $src/assembly/test-machine/TestZ80Cpu/TestMemoryDevice#reset
  local.get $0
 )
 (func $src/assembly/test-machine/TestZ80Cpu/TestPortDevice#constructor (; 45 ;) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  local.set $1
  local.get $2
  call $~lib/rt/pure/__retain
  local.set $2
  local.get $0
  i32.eqz
  if
   i32.const 16
   i32.const 22
   call $~lib/rt/tlsf/__alloc
   call $~lib/rt/pure/__retain
   local.set $0
  end
  local.get $0
  i32.const 0
  i32.store
  local.get $0
  i32.const 0
  i32.const 2
  i32.const 24
  i32.const 576
  call $~lib/rt/__allocArray
  call $~lib/rt/pure/__retain
  i32.store offset=4
  local.get $0
  local.get $1
  call $~lib/rt/pure/__retain
  i32.store offset=8
  local.get $0
  local.get $2
  call $~lib/rt/pure/__retain
  i32.store offset=12
  local.get $0
  i32.const 0
  i32.store
  local.get $1
  call $~lib/rt/pure/__release
  local.get $2
  call $~lib/rt/pure/__release
  local.get $0
 )
 (func $src/assembly/test-machine/TestZ80Cpu/TestPortDevice#constructor|trampoline (; 46 ;) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
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
   i32.const 0
   i32.const 0
   i32.const 25
   i32.const 592
   call $~lib/rt/__allocArray
   call $~lib/rt/pure/__retain
   local.tee $4
   local.set $2
  end
  local.get $0
  local.get $1
  local.get $2
  call $src/assembly/test-machine/TestZ80Cpu/TestPortDevice#constructor
  local.set $3
  local.get $4
  call $~lib/rt/pure/__release
  local.get $3
 )
 (func $~setArgumentsLength (; 47 ;) (param $0 i32)
  local.get $0
  global.set $~argumentsLength
 )
 (func $src/assembly/test-machine/TestZ80Cpu/TestZ80Cpu#constructor (; 48 ;) (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  local.get $0
  if (result i32)
   local.get $0
  else
   i32.const 100
   i32.const 18
   call $~lib/rt/tlsf/__alloc
   call $~lib/rt/pure/__retain
  end
  i32.const 0
  call $src/assembly/Z80Cpu/Z80Cpu#constructor
  local.set $0
  local.get $0
  i32.const 0
  i32.store offset=92
  local.get $0
  i32.const 0
  i32.store offset=96
  local.get $0
  local.tee $1
  i32.const 0
  call $src/assembly/test-machine/TestZ80Cpu/TestMemoryDevice#constructor
  local.set $2
  local.get $1
  i32.load offset=92
  call $~lib/rt/pure/__release
  local.get $2
  i32.store offset=92
  local.get $0
  local.tee $2
  i32.const 1
  global.set $~argumentsLength
  i32.const 0
  local.get $0
  i32.const 0
  call $src/assembly/test-machine/TestZ80Cpu/TestPortDevice#constructor|trampoline
  local.set $1
  local.get $2
  i32.load offset=96
  call $~lib/rt/pure/__release
  local.get $1
  i32.store offset=96
  local.get $0
 )
 (func $src/assembly/test-machine/TestZ80Machine/TestZ80Machine#constructor (; 49 ;) (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
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
  local.get $0
  local.tee $1
  i32.const 0
  call $src/assembly/test-machine/TestZ80Cpu/TestZ80Cpu#constructor
  local.set $2
  local.get $1
  i32.load
  call $~lib/rt/pure/__release
  local.get $2
  i32.store
  local.get $0
 )
 (func $start:src/assembly/index~anonymous|1 (; 50 ;) (result i32)
  i32.const 0
  call $src/assembly/test-machine/TestZ80Machine/TestZ80Machine#constructor
 )
 (func $start:src/assembly/index (; 51 ;)
  i32.const 0
  i32.const 100
  i32.const 1
  call $src/assembly/ObjectPool/ObjectPool<src/assembly/Z80Cpu/Z80Cpu>#constructor
  global.set $src/assembly/index/cpuPool
  i32.const 0
  i32.const 10
  i32.const 2
  call $src/assembly/ObjectPool/ObjectPool<src/assembly/test-machine/TestZ80Machine/TestZ80Machine>#constructor
  global.set $src/assembly/index/testMachinePool
 )
 (func $src/assembly/index/getCpuPoolMaxSize (; 52 ;) (result i32)
  global.get $src/assembly/index/cpuPool
  i32.load offset=8
 )
 (func $src/assembly/index/resetCpuPool (; 53 ;)
  global.get $src/assembly/index/cpuPool
  call $src/assembly/ObjectPool/ObjectPool<src/assembly/Z80Cpu/Z80Cpu>#reset
 )
 (func $src/assembly/ObjectPool/ObjectPool<src/assembly/Z80Cpu/Z80Cpu>#create~anonymous|0 (; 54 ;) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  local.get $2
  call $~lib/rt/pure/__retain
  local.set $2
  local.get $0
  i32.eqz
  local.set $3
  local.get $2
  call $~lib/rt/pure/__release
  local.get $3
 )
 (func $~lib/array/Array<bool>#findIndex (; 55 ;) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  i32.const 0
  local.set $2
  local.get $0
  i32.load offset=12
  local.set $3
  loop $for-loop|0
   local.get $2
   local.get $3
   local.tee $4
   local.get $0
   i32.load offset=12
   local.tee $5
   local.get $4
   local.get $5
   i32.lt_s
   select
   i32.lt_s
   local.set $4
   local.get $4
   if
    i32.const 3
    global.set $~argumentsLength
    local.get $0
    i32.load offset=4
    local.get $2
    i32.const 0
    i32.shl
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
 (func $src/assembly/ObjectPool/ObjectPool<src/assembly/Z80Cpu/Z80Cpu>#create (; 56 ;) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  local.get $0
  i32.load
  i32.const 3
  call $~lib/array/Array<bool>#findIndex
  local.set $2
  local.get $2
  i32.const 0
  i32.lt_s
  if
   i32.const -1
   return
  end
  local.get $0
  i32.load offset=4
  local.get $2
  local.get $1
  if (result i32)
   i32.const 0
   global.set $~argumentsLength
   local.get $1
   call_indirect (type $none_=>_i32)
   local.tee $3
  else
   i32.const 0
   global.set $~argumentsLength
   local.get $0
   i32.load offset=12
   call_indirect (type $none_=>_i32)
   local.tee $4
  end
  local.tee $4
  call $~lib/array/Array<src/assembly/Z80Cpu/Z80Cpu | null>#__set
  local.get $0
  i32.load
  local.get $2
  i32.const 1
  call $~lib/array/Array<bool>#__set
  local.get $2
  local.set $3
  local.get $4
  call $~lib/rt/pure/__release
  local.get $3
 )
 (func $src/assembly/index/createCpu (; 57 ;) (result i32)
  global.get $src/assembly/index/cpuPool
  i32.const 0
  call $src/assembly/ObjectPool/ObjectPool<src/assembly/Z80Cpu/Z80Cpu>#create
 )
 (func $~lib/array/Array<bool>#__unchecked_get (; 58 ;) (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 0
  i32.shl
  i32.add
  i32.load8_u
 )
 (func $~lib/array/Array<bool>#__get (; 59 ;) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
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
  local.get $1
  call $~lib/array/Array<bool>#__unchecked_get
  local.set $2
  local.get $2
 )
 (func $src/assembly/ObjectPool/ObjectPool<src/assembly/Z80Cpu/Z80Cpu>#release (; 60 ;) (param $0 i32) (param $1 i32) (result i32)
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
 (func $src/assembly/index/releaseCpu (; 61 ;) (param $0 i32) (result i32)
  global.get $src/assembly/index/cpuPool
  local.get $0
  call $src/assembly/ObjectPool/ObjectPool<src/assembly/Z80Cpu/Z80Cpu>#release
 )
 (func $~lib/array/Array<src/assembly/Z80Cpu/Z80Cpu | null>#__unchecked_get (; 62 ;) (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 2
  i32.shl
  i32.add
  i32.load
  call $~lib/rt/pure/__retain
 )
 (func $~lib/array/Array<src/assembly/Z80Cpu/Z80Cpu | null>#__get (; 63 ;) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
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
  local.get $1
  call $~lib/array/Array<src/assembly/Z80Cpu/Z80Cpu | null>#__unchecked_get
  local.set $2
  local.get $2
 )
 (func $src/assembly/ObjectPool/ObjectPool<src/assembly/Z80Cpu/Z80Cpu>#get (; 64 ;) (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  i32.load offset=4
  local.get $1
  call $~lib/array/Array<src/assembly/Z80Cpu/Z80Cpu | null>#__get
 )
 (func $src/assembly/index/getCpu (; 65 ;) (param $0 i32) (result i32)
  global.get $src/assembly/index/cpuPool
  local.get $0
  call $src/assembly/ObjectPool/ObjectPool<src/assembly/Z80Cpu/Z80Cpu>#get
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#longOp (; 66 ;) (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  i32.const 0
  local.set $1
  loop $for-loop|0
   local.get $1
   i32.const 100000000
   i32.lt_s
   local.set $2
   local.get $2
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
 (func $src/assembly/Z80Cpu/Z80Cpu#get:af (; 67 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=2
 )
 (func $src/assembly/index/longOp (; 68 ;) (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  local.get $0
  call $src/assembly/index/getCpu
  local.set $1
  local.get $1
  i32.eqz
  if
   i32.const -1
   local.set $2
   local.get $1
   call $~lib/rt/pure/__release
   local.get $2
   return
  end
  local.get $1
  call $src/assembly/Z80Cpu/Z80Cpu#longOp
  local.get $1
  call $src/assembly/Z80Cpu/Z80Cpu#get:af
  local.set $2
  local.get $1
  call $~lib/rt/pure/__release
  local.get $2
 )
 (func $src/assembly/index/getTestMachinePoolMaxSize (; 69 ;) (result i32)
  global.get $src/assembly/index/testMachinePool
  i32.load offset=8
 )
 (func $src/assembly/index/resetTestMachinePool (; 70 ;)
  global.get $src/assembly/index/testMachinePool
  call $src/assembly/ObjectPool/ObjectPool<src/assembly/test-machine/TestZ80Machine/TestZ80Machine>#reset
 )
 (func $src/assembly/ObjectPool/ObjectPool<src/assembly/test-machine/TestZ80Machine/TestZ80Machine>#create~anonymous|0 (; 71 ;) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  local.get $2
  call $~lib/rt/pure/__retain
  local.set $2
  local.get $0
  i32.eqz
  local.set $3
  local.get $2
  call $~lib/rt/pure/__release
  local.get $3
 )
 (func $src/assembly/ObjectPool/ObjectPool<src/assembly/test-machine/TestZ80Machine/TestZ80Machine>#create (; 72 ;) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  local.get $0
  i32.load
  i32.const 4
  call $~lib/array/Array<bool>#findIndex
  local.set $2
  local.get $2
  i32.const 0
  i32.lt_s
  if
   i32.const -1
   return
  end
  local.get $0
  i32.load offset=4
  local.get $2
  local.get $1
  if (result i32)
   i32.const 0
   global.set $~argumentsLength
   local.get $1
   call_indirect (type $none_=>_i32)
   local.tee $3
  else
   i32.const 0
   global.set $~argumentsLength
   local.get $0
   i32.load offset=12
   call_indirect (type $none_=>_i32)
   local.tee $4
  end
  local.tee $4
  call $~lib/array/Array<src/assembly/test-machine/TestZ80Machine/TestZ80Machine | null>#__set
  local.get $0
  i32.load
  local.get $2
  i32.const 1
  call $~lib/array/Array<bool>#__set
  local.get $2
  local.set $3
  local.get $4
  call $~lib/rt/pure/__release
  local.get $3
 )
 (func $src/assembly/index/createTestMachine (; 73 ;) (result i32)
  global.get $src/assembly/index/testMachinePool
  i32.const 0
  call $src/assembly/ObjectPool/ObjectPool<src/assembly/test-machine/TestZ80Machine/TestZ80Machine>#create
 )
 (func $src/assembly/ObjectPool/ObjectPool<src/assembly/test-machine/TestZ80Machine/TestZ80Machine>#release (; 74 ;) (param $0 i32) (param $1 i32) (result i32)
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
  call $~lib/array/Array<src/assembly/test-machine/TestZ80Machine/TestZ80Machine | null>#__set
  i32.const 1
 )
 (func $src/assembly/index/releaseTestMachine (; 75 ;) (param $0 i32) (result i32)
  global.get $src/assembly/index/testMachinePool
  local.get $0
  call $src/assembly/ObjectPool/ObjectPool<src/assembly/test-machine/TestZ80Machine/TestZ80Machine>#release
 )
 (func $~lib/array/Array<src/assembly/test-machine/TestZ80Machine/TestZ80Machine | null>#__unchecked_get (; 76 ;) (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 2
  i32.shl
  i32.add
  i32.load
  call $~lib/rt/pure/__retain
 )
 (func $~lib/array/Array<src/assembly/test-machine/TestZ80Machine/TestZ80Machine | null>#__get (; 77 ;) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
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
  local.get $1
  call $~lib/array/Array<src/assembly/test-machine/TestZ80Machine/TestZ80Machine | null>#__unchecked_get
  local.set $2
  local.get $2
 )
 (func $src/assembly/ObjectPool/ObjectPool<src/assembly/test-machine/TestZ80Machine/TestZ80Machine>#get (; 78 ;) (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  i32.load offset=4
  local.get $1
  call $~lib/array/Array<src/assembly/test-machine/TestZ80Machine/TestZ80Machine | null>#__get
 )
 (func $src/assembly/index/getTestMachine (; 79 ;) (param $0 i32) (result i32)
  global.get $src/assembly/index/testMachinePool
  local.get $0
  call $src/assembly/ObjectPool/ObjectPool<src/assembly/test-machine/TestZ80Machine/TestZ80Machine>#get
 )
 (func $src/assembly/test-machine/TestZ80Machine/TestZ80Machine#get:memory (; 80 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load
  i32.load offset=92
  i32.load
  call $~lib/rt/pure/__retain
 )
 (func $src/assembly/index/getMemory (; 81 ;) (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  local.get $0
  call $src/assembly/index/getTestMachine
  local.set $1
  local.get $1
  if
   local.get $1
   call $src/assembly/test-machine/TestZ80Machine/TestZ80Machine#get:memory
   local.tee $2
   local.set $3
   local.get $1
   call $~lib/rt/pure/__release
   local.get $3
   return
  end
  i32.const 0
  i32.const 5
  call $~lib/typedarray/Uint8Array#constructor
  local.set $2
  local.get $1
  call $~lib/rt/pure/__release
  local.get $2
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_a (; 82 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:_a (; 83 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_f (; 84 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=1
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:_f (; 85 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=1
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_af (; 86 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=2
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:_af (; 87 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=2
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_b (; 88 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=4
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:_b (; 89 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=4
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_c (; 90 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=5
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:_c (; 91 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=5
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_bc (; 92 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=6
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:_bc (; 93 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=6
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_d (; 94 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=8
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:_d (; 95 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=8
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_e (; 96 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=9
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:_e (; 97 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=9
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_de (; 98 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=10
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:_de (; 99 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=10
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_h (; 100 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=12
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:_h (; 101 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=12
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_l (; 102 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=13
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:_l (; 103 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=13
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_hl (; 104 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=14
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:_hl (; 105 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=14
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_af_sec (; 106 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=16
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:_af_sec (; 107 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=16
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_bc_sec (; 108 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=18
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:_bc_sec (; 109 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=18
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_de_sec (; 110 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=20
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:_de_sec (; 111 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=20
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_hl_sec (; 112 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=22
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:_hl_sec (; 113 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=22
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_i (; 114 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=24
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:_i (; 115 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=24
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_r (; 116 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=25
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:_r (; 117 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=25
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_pc (; 118 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=26
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:_pc (; 119 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=26
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_sp (; 120 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=28
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:_sp (; 121 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=28
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_xh (; 122 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=30
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:_xh (; 123 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=30
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_xl (; 124 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=31
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:_xl (; 125 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=31
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_ix (; 126 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=32
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:_ix (; 127 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=32
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_yh (; 128 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=34
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:_yh (; 129 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=34
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_yl (; 130 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=35
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:_yl (; 131 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=35
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_iy (; 132 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=36
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:_iy (; 133 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=36
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_wh (; 134 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=38
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:_wh (; 135 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=38
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_wl (; 136 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=39
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:_wl (; 137 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=39
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_wz (; 138 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=40
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:_wz (; 139 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=40
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:tacts (; 140 ;) (param $0 i32) (result i64)
  local.get $0
  i64.load offset=48
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:tacts (; 141 ;) (param $0 i32) (param $1 i64)
  local.get $0
  local.get $1
  i64.store offset=48
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:stateFlags (; 142 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=56
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:stateFlags (; 143 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store offset=56
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:useGateArrayContention (; 144 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=60
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:useGateArrayContention (; 145 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=60
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:iff1 (; 146 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=61
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:iff1 (; 147 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=61
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:iff2 (; 148 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=62
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:iff2 (; 149 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=62
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:interruptMode (; 150 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=63
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:interruptMode (; 151 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=63
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:isInterruptBlocked (; 152 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=64
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:isInterruptBlocked (; 153 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=64
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:isInOpExecution (; 154 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=65
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:isInOpExecution (; 155 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=65
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:executionFlowStatus (; 156 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=68
  call $~lib/rt/pure/__retain
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:executionFlowStatus (; 157 ;) (param $0 i32) (param $1 i32)
  (local $2 i32)
  local.get $0
  local.get $1
  local.get $0
  i32.load offset=68
  local.tee $2
  i32.ne
  if
   local.get $1
   call $~lib/rt/pure/__retain
   drop
   local.get $2
   call $~lib/rt/pure/__release
  end
  local.get $1
  i32.store offset=68
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:memoryReadStatus (; 158 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=72
  call $~lib/rt/pure/__retain
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:memoryReadStatus (; 159 ;) (param $0 i32) (param $1 i32)
  (local $2 i32)
  local.get $0
  local.get $1
  local.get $0
  i32.load offset=72
  local.tee $2
  i32.ne
  if
   local.get $1
   call $~lib/rt/pure/__retain
   drop
   local.get $2
   call $~lib/rt/pure/__release
  end
  local.get $1
  i32.store offset=72
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:memoryWriteStatus (; 160 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=76
  call $~lib/rt/pure/__retain
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:memoryWriteStatus (; 161 ;) (param $0 i32) (param $1 i32)
  (local $2 i32)
  local.get $0
  local.get $1
  local.get $0
  i32.load offset=76
  local.tee $2
  i32.ne
  if
   local.get $1
   call $~lib/rt/pure/__retain
   drop
   local.get $2
   call $~lib/rt/pure/__release
  end
  local.get $1
  i32.store offset=76
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:prefixMode (; 162 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=80
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:prefixMode (; 163 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store offset=80
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:indexMode (; 164 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=84
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:indexMode (; 165 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store offset=84
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:maskableInterruptModeEntered (; 166 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=88
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:maskableInterruptModeEntered (; 167 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=88
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:allowExtendedInstructionSet (; 168 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=89
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:allowExtendedInstructionSet (; 169 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=89
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:a (; 170 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:a (; 171 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8
  local.get $0
  local.get $0
  i32.load8_u
  i32.const 8
  i32.shl
  local.get $0
  i32.load8_u offset=1
  i32.or
  i32.const 255
  i32.and
  i32.store16 offset=2
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:f (; 172 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=1
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:f (; 173 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=1
  local.get $0
  local.get $0
  i32.load8_u
  i32.const 8
  i32.shl
  local.get $0
  i32.load8_u offset=1
  i32.or
  i32.const 255
  i32.and
  i32.store16 offset=2
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:af (; 174 ;) (param $0 i32) (param $1 i32)
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
 (func $src/assembly/Z80Cpu/Z80Cpu#get:b (; 175 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=4
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:b (; 176 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=4
  local.get $0
  local.get $0
  i32.load8_u offset=4
  i32.const 8
  i32.shl
  local.get $0
  i32.load8_u offset=5
  i32.or
  i32.const 255
  i32.and
  i32.store16 offset=6
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:c (; 177 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=5
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:c (; 178 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=5
  local.get $0
  local.get $0
  i32.load8_u offset=4
  i32.const 8
  i32.shl
  local.get $0
  i32.load8_u offset=4
  i32.or
  i32.const 255
  i32.and
  i32.store16 offset=6
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:bc (; 179 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=6
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:bc (; 180 ;) (param $0 i32) (param $1 i32)
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
 (func $src/assembly/Z80Cpu/Z80Cpu#get:d (; 181 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=8
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:d (; 182 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=8
  local.get $0
  local.get $0
  i32.load8_u offset=8
  i32.const 8
  i32.shl
  local.get $0
  i32.load8_u offset=9
  i32.or
  i32.const 255
  i32.and
  i32.store16 offset=10
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:e (; 183 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=9
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:e (; 184 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=9
  local.get $0
  local.get $0
  i32.load8_u offset=8
  i32.const 8
  i32.shl
  local.get $0
  i32.load8_u offset=9
  i32.or
  i32.const 255
  i32.and
  i32.store16 offset=10
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:de (; 185 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=10
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:de (; 186 ;) (param $0 i32) (param $1 i32)
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
 (func $src/assembly/Z80Cpu/Z80Cpu#get:h (; 187 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=12
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:h (; 188 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=12
  local.get $0
  local.get $0
  i32.load8_u offset=12
  i32.const 8
  i32.shl
  local.get $0
  i32.load8_u offset=13
  i32.or
  i32.const 255
  i32.and
  i32.store16 offset=14
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:l (; 189 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=13
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:l (; 190 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=13
  local.get $0
  local.get $0
  i32.load8_u offset=12
  i32.const 8
  i32.shl
  local.get $0
  i32.load8_u offset=13
  i32.or
  i32.const 255
  i32.and
  i32.store16 offset=14
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:hl (; 191 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=14
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:hl (; 192 ;) (param $0 i32) (param $1 i32)
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
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_af_ (; 193 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=16
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_bc_ (; 194 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=18
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_de_ (; 195 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=20
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_hl_ (; 196 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=22
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:i (; 197 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=24
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:i (; 198 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=24
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:r (; 199 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=25
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:r (; 200 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=25
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:pc (; 201 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=26
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:pc (; 202 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=26
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:sp (; 203 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=28
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:sp (; 204 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=28
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:xh (; 205 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=30
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:xh (; 206 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=30
  local.get $0
  local.get $0
  i32.load8_u offset=30
  i32.const 8
  i32.shl
  local.get $0
  i32.load8_u offset=31
  i32.or
  i32.const 255
  i32.and
  i32.store16 offset=32
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:xl (; 207 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=31
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:xl (; 208 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=31
  local.get $0
  local.get $0
  i32.load8_u offset=30
  i32.const 8
  i32.shl
  local.get $0
  i32.load8_u offset=31
  i32.or
  i32.const 255
  i32.and
  i32.store16 offset=32
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:ix (; 209 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=32
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:ix (; 210 ;) (param $0 i32) (param $1 i32)
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
 (func $src/assembly/Z80Cpu/Z80Cpu#get:yh (; 211 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=34
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:yh (; 212 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=34
  local.get $0
  local.get $0
  i32.load8_u offset=34
  i32.const 8
  i32.shl
  local.get $0
  i32.load8_u offset=35
  i32.or
  i32.const 255
  i32.and
  i32.store16 offset=36
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:yl (; 213 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=35
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:yl (; 214 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=35
  local.get $0
  local.get $0
  i32.load8_u offset=34
  i32.const 8
  i32.shl
  local.get $0
  i32.load8_u offset=35
  i32.or
  i32.const 255
  i32.and
  i32.store16 offset=36
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:iy (; 215 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=36
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:iy (; 216 ;) (param $0 i32) (param $1 i32)
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
 (func $src/assembly/Z80Cpu/Z80Cpu#get:wh (; 217 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=38
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:wh (; 218 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=38
  local.get $0
  local.get $0
  i32.load8_u offset=38
  i32.const 8
  i32.shl
  local.get $0
  i32.load8_u offset=39
  i32.or
  i32.const 255
  i32.and
  i32.store16 offset=40
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:wl (; 219 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=39
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:wl (; 220 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=39
  local.get $0
  local.get $0
  i32.load8_u offset=38
  i32.const 8
  i32.shl
  local.get $0
  i32.load8_u offset=39
  i32.or
  i32.store8 offset=38
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:wz (; 221 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=40
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:wz (; 222 ;) (param $0 i32) (param $1 i32)
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
 (func $src/assembly/Z80Cpu/Z80Cpu#readMemory (; 223 ;) (param $0 i32) (param $1 i32) (result i32)
  i32.const 255
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#writeMemory (; 224 ;) (param $0 i32) (param $1 i32) (param $2 i32)
  nop
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#readPort (; 225 ;) (param $0 i32) (param $1 i32) (result i32)
  i32.const 255
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#writePort (; 226 ;) (param $0 i32) (param $1 i32) (param $2 i32)
  nop
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#delay (; 227 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $0
  i64.load offset=48
  local.get $1
  i64.extend_i32_s
  i64.add
  i64.store offset=48
 )
 (func $src/assembly/test-machine/TestZ80Machine/TestZ80Machine#get:cpu (; 228 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load
  call $~lib/rt/pure/__retain
 )
 (func $src/assembly/test-machine/TestZ80Machine/TestZ80Machine#set:cpu (; 229 ;) (param $0 i32) (param $1 i32)
  (local $2 i32)
  local.get $0
  local.get $1
  local.get $0
  i32.load
  local.tee $2
  i32.ne
  if
   local.get $1
   call $~lib/rt/pure/__retain
   drop
   local.get $2
   call $~lib/rt/pure/__release
  end
  local.get $1
  i32.store
 )
 (func $src/assembly/test-machine/TestZ80Cpu/TestMemoryDevice#get:log (; 230 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=4
  call $~lib/rt/pure/__retain
 )
 (func $src/assembly/test-machine/TestZ80Machine/TestZ80Machine#get:memoryAccessLog (; 231 ;) (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  i32.load
  i32.load offset=92
  call $src/assembly/test-machine/TestZ80Cpu/TestMemoryDevice#get:log
  local.tee $1
 )
 (func $src/assembly/test-machine/TestZ80Cpu/TestPortDevice#get:log (; 232 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=4
  call $~lib/rt/pure/__retain
 )
 (func $src/assembly/test-machine/TestZ80Machine/TestZ80Machine#get:ioAccessLog (; 233 ;) (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  i32.load
  i32.load offset=96
  call $src/assembly/test-machine/TestZ80Cpu/TestPortDevice#get:log
  local.tee $1
 )
 (func $~start (; 234 ;)
  call $start:src/assembly/index
 )
 (func $~lib/rt/pure/markGray (; 235 ;) (param $0 i32)
  (local $1 i32)
  local.get $0
  i32.load offset=4
  local.set $1
  local.get $1
  i32.const 1879048192
  i32.and
  i32.const 268435456
  i32.ne
  if
   local.get $0
   local.get $1
   i32.const 1879048192
   i32.const -1
   i32.xor
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
 (func $~lib/rt/pure/scanBlack (; 236 ;) (param $0 i32)
  local.get $0
  local.get $0
  i32.load offset=4
  i32.const 1879048192
  i32.const -1
  i32.xor
  i32.and
  i32.const 0
  i32.or
  i32.store offset=4
  local.get $0
  i32.const 16
  i32.add
  i32.const 4
  call $~lib/rt/__visit_members
 )
 (func $~lib/rt/pure/scan (; 237 ;) (param $0 i32)
  (local $1 i32)
  local.get $0
  i32.load offset=4
  local.set $1
  local.get $1
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
    i32.const 1879048192
    i32.const -1
    i32.xor
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
 (func $~lib/rt/pure/collectWhite (; 238 ;) (param $0 i32)
  (local $1 i32)
  local.get $0
  i32.load offset=4
  local.set $1
  local.get $1
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
   i32.const 1879048192
   i32.const -1
   i32.xor
   i32.and
   i32.const 0
   i32.or
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
 (func $~lib/rt/pure/__collect (; 239 ;)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  global.get $~lib/rt/pure/ROOTS
  local.set $0
  local.get $0
  local.set $1
  local.get $1
  local.set $2
  global.get $~lib/rt/pure/CUR
  local.set $3
  loop $for-loop|0
   local.get $2
   local.get $3
   i32.lt_u
   local.set $4
   local.get $4
   if
    local.get $2
    i32.load
    local.set $5
    local.get $5
    i32.load offset=4
    local.set $6
    local.get $6
    i32.const 1879048192
    i32.and
    i32.const 805306368
    i32.eq
    if (result i32)
     local.get $6
     i32.const 268435455
     i32.and
     i32.const 0
     i32.gt_u
    else
     i32.const 0
    end
    if
     local.get $5
     call $~lib/rt/pure/markGray
     local.get $1
     local.get $5
     i32.store
     local.get $1
     i32.const 4
     i32.add
     local.set $1
    else
     local.get $6
     i32.const 1879048192
     i32.and
     i32.const 0
     i32.eq
     if (result i32)
      local.get $6
      i32.const 268435455
      i32.and
      i32.eqz
     else
      i32.const 0
     end
     if
      global.get $~lib/rt/tlsf/ROOT
      local.get $5
      call $~lib/rt/tlsf/freeBlock
     else
      local.get $5
      local.get $6
      i32.const -2147483648
      i32.const -1
      i32.xor
      i32.and
      i32.store offset=4
     end
    end
    local.get $2
    i32.const 4
    i32.add
    local.set $2
    br $for-loop|0
   end
  end
  local.get $1
  global.set $~lib/rt/pure/CUR
  local.get $0
  local.set $3
  loop $for-loop|1
   local.get $3
   local.get $1
   i32.lt_u
   local.set $2
   local.get $2
   if
    local.get $3
    i32.load
    call $~lib/rt/pure/scan
    local.get $3
    i32.const 4
    i32.add
    local.set $3
    br $for-loop|1
   end
  end
  local.get $0
  local.set $3
  loop $for-loop|2
   local.get $3
   local.get $1
   i32.lt_u
   local.set $2
   local.get $2
   if
    local.get $3
    i32.load
    local.set $4
    local.get $4
    local.get $4
    i32.load offset=4
    i32.const -2147483648
    i32.const -1
    i32.xor
    i32.and
    i32.store offset=4
    local.get $4
    call $~lib/rt/pure/collectWhite
    local.get $3
    i32.const 4
    i32.add
    local.set $3
    br $for-loop|2
   end
  end
  local.get $0
  global.set $~lib/rt/pure/CUR
 )
 (func $~lib/rt/__typeinfo (; 240 ;) (param $0 i32) (result i32)
  (local $1 i32)
  global.get $~lib/rt/__rtti_base
  local.set $1
  local.get $0
  local.get $1
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
  local.get $1
  i32.const 4
  i32.add
  local.get $0
  i32.const 8
  i32.mul
  i32.add
  i32.load
 )
 (func $~lib/rt/tlsf/__free (; 241 ;) (param $0 i32)
  call $~lib/rt/tlsf/maybeInitialize
  local.get $0
  call $~lib/rt/tlsf/checkUsedBlock
  call $~lib/rt/tlsf/freeBlock
 )
 (func $~lib/rt/pure/growRoots (; 242 ;)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  global.get $~lib/rt/pure/ROOTS
  local.set $0
  global.get $~lib/rt/pure/CUR
  local.get $0
  i32.sub
  local.set $1
  local.get $1
  i32.const 2
  i32.mul
  local.tee $2
  i32.const 64
  i32.const 2
  i32.shl
  local.tee $3
  local.get $2
  local.get $3
  i32.gt_u
  select
  local.set $4
  local.get $4
  i32.const 0
  call $~lib/rt/tlsf/__alloc
  local.set $5
  local.get $5
  local.get $0
  local.get $1
  call $~lib/memory/memory.copy
  local.get $0
  if
   local.get $0
   call $~lib/rt/tlsf/__free
  end
  local.get $5
  global.set $~lib/rt/pure/ROOTS
  local.get $5
  local.get $1
  i32.add
  global.set $~lib/rt/pure/CUR
  local.get $5
  local.get $4
  i32.add
  global.set $~lib/rt/pure/END
 )
 (func $~lib/rt/pure/appendRoot (; 243 ;) (param $0 i32)
  (local $1 i32)
  global.get $~lib/rt/pure/CUR
  local.set $1
  local.get $1
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
 (func $~lib/rt/pure/decrement (; 244 ;) (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  local.get $0
  i32.load offset=4
  local.set $1
  local.get $1
  i32.const 268435455
  i32.and
  local.set $2
  local.get $0
  i32.load
  i32.const 1
  i32.and
  i32.eqz
  i32.eqz
  if
   i32.const 0
   i32.const 144
   i32.const 122
   i32.const 13
   call $~lib/builtins/abort
   unreachable
  end
  local.get $2
  i32.const 1
  i32.eq
  if
   local.get $0
   i32.const 16
   i32.add
   i32.const 1
   call $~lib/rt/__visit_members
   local.get $1
   i32.const -2147483648
   i32.and
   i32.eqz
   if
    global.get $~lib/rt/tlsf/ROOT
    local.get $0
    call $~lib/rt/tlsf/freeBlock
   else
    local.get $0
    i32.const -2147483648
    i32.const 0
    i32.or
    i32.const 0
    i32.or
    i32.store offset=4
   end
  else
   local.get $2
   i32.const 0
   i32.gt_u
   i32.eqz
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
   i32.eqz
   if
    local.get $0
    i32.const -2147483648
    i32.const 805306368
    i32.or
    local.get $2
    i32.const 1
    i32.sub
    i32.or
    i32.store offset=4
    local.get $1
    i32.const -2147483648
    i32.and
    i32.eqz
    if
     local.get $0
     call $~lib/rt/pure/appendRoot
    end
   else
    local.get $0
    local.get $1
    i32.const 268435455
    i32.const -1
    i32.xor
    i32.and
    local.get $2
    i32.const 1
    i32.sub
    i32.or
    i32.store offset=4
   end
  end
 )
 (func $~lib/rt/pure/__visit (; 245 ;) (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  local.get $0
  global.get $~lib/heap/__heap_base
  i32.lt_u
  if
   return
  end
  local.get $0
  i32.const 16
  i32.sub
  local.set $2
  block $break|0
   block $case5|0
    block $case4|0
     block $case3|0
      block $case2|0
       block $case1|0
        block $case0|0
         local.get $1
         local.set $3
         local.get $3
         i32.const 1
         i32.eq
         br_if $case0|0
         local.get $3
         i32.const 2
         i32.eq
         br_if $case1|0
         local.get $3
         i32.const 3
         i32.eq
         br_if $case2|0
         local.get $3
         i32.const 4
         i32.eq
         br_if $case3|0
         local.get $3
         i32.const 5
         i32.eq
         br_if $case4|0
         br $case5|0
        end
        local.get $2
        call $~lib/rt/pure/decrement
        br $break|0
       end
       local.get $2
       i32.load offset=4
       i32.const 268435455
       i32.and
       i32.const 0
       i32.gt_u
       i32.eqz
       if
        i32.const 0
        i32.const 144
        i32.const 79
        i32.const 19
        call $~lib/builtins/abort
        unreachable
       end
       local.get $2
       local.get $2
       i32.load offset=4
       i32.const 1
       i32.sub
       i32.store offset=4
       local.get $2
       call $~lib/rt/pure/markGray
       br $break|0
      end
      local.get $2
      call $~lib/rt/pure/scan
      br $break|0
     end
     local.get $2
     i32.load offset=4
     local.set $3
     local.get $3
     i32.const -268435456
     i32.and
     local.get $3
     i32.const 1
     i32.add
     i32.const -268435456
     i32.and
     i32.eq
     i32.eqz
     if
      i32.const 0
      i32.const 144
      i32.const 90
      i32.const 8
      call $~lib/builtins/abort
      unreachable
     end
     local.get $2
     local.get $3
     i32.const 1
     i32.add
     i32.store offset=4
     local.get $3
     i32.const 1879048192
     i32.and
     i32.const 0
     i32.ne
     if
      local.get $2
      call $~lib/rt/pure/scanBlack
     end
     br $break|0
    end
    local.get $2
    call $~lib/rt/pure/collectWhite
    br $break|0
   end
   i32.const 0
   i32.eqz
   if
    i32.const 0
    i32.const 144
    i32.const 101
    i32.const 26
    call $~lib/builtins/abort
    unreachable
   end
  end
 )
 (func $~lib/array/Array<bool>#__visit_impl (; 246 ;) (param $0 i32) (param $1 i32)
  nop
 )
 (func $~lib/array/Array<src/assembly/Z80Cpu/Z80Cpu | null>#__visit_impl (; 247 ;) (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $0
  i32.load offset=4
  local.set $2
  local.get $2
  local.get $0
  i32.load offset=12
  i32.const 2
  i32.shl
  i32.add
  local.set $3
  loop $while-continue|0
   local.get $2
   local.get $3
   i32.lt_u
   local.set $4
   local.get $4
   if
    local.get $2
    i32.load
    local.set $5
    local.get $5
    if
     local.get $5
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
 (func $~lib/array/Array<i32>#__visit_impl (; 248 ;) (param $0 i32) (param $1 i32)
  nop
 )
 (func $~lib/array/Array<src/assembly/test-machine/TestZ80Cpu/MemoryOp>#__visit_impl (; 249 ;) (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $0
  i32.load offset=4
  local.set $2
  local.get $2
  local.get $0
  i32.load offset=12
  i32.const 2
  i32.shl
  i32.add
  local.set $3
  loop $while-continue|0
   local.get $2
   local.get $3
   i32.lt_u
   local.set $4
   local.get $4
   if
    local.get $2
    i32.load
    local.set $5
    local.get $5
    if
     local.get $5
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
 (func $~lib/array/Array<src/assembly/test-machine/TestZ80Cpu/IoOp>#__visit_impl (; 250 ;) (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $0
  i32.load offset=4
  local.set $2
  local.get $2
  local.get $0
  i32.load offset=12
  i32.const 2
  i32.shl
  i32.add
  local.set $3
  loop $while-continue|0
   local.get $2
   local.get $3
   i32.lt_u
   local.set $4
   local.get $4
   if
    local.get $2
    i32.load
    local.set $5
    local.get $5
    if
     local.get $5
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
 (func $~lib/array/Array<u8>#__visit_impl (; 251 ;) (param $0 i32) (param $1 i32)
  nop
 )
 (func $~lib/array/Array<src/assembly/test-machine/TestZ80Machine/TestZ80Machine | null>#__visit_impl (; 252 ;) (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $0
  i32.load offset=4
  local.set $2
  local.get $2
  local.get $0
  i32.load offset=12
  i32.const 2
  i32.shl
  i32.add
  local.set $3
  loop $while-continue|0
   local.get $2
   local.get $3
   i32.lt_u
   local.set $4
   local.get $4
   if
    local.get $2
    i32.load
    local.set $5
    local.get $5
    if
     local.get $5
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
 (func $~lib/rt/__visit_members (; 253 ;) (param $0 i32) (param $1 i32)
  (local $2 i32)
  block $block$13$break
   block $block$4$break
    block $switch$1$default
     block $switch$1$case$29
      block $switch$1$case$27
       block $switch$1$case$26
        block $switch$1$case$24
         block $switch$1$case$23
          block $switch$1$case$20
           block $switch$1$case$18
            block $switch$1$case$17
             block $switch$1$case$16
              block $switch$1$case$15
               block $switch$1$case$13
                block $switch$1$case$4
                 block $switch$1$case$2
                  local.get $0
                  i32.const 8
                  i32.sub
                  i32.load
                  br_table $switch$1$case$2 $switch$1$case$2 $switch$1$case$4 $switch$1$case$4 $switch$1$case$4 $switch$1$case$4 $switch$1$case$4 $switch$1$case$4 $switch$1$case$4 $switch$1$case$4 $switch$1$case$4 $switch$1$case$13 $switch$1$case$4 $switch$1$case$15 $switch$1$case$16 $switch$1$case$17 $switch$1$case$18 $switch$1$case$4 $switch$1$case$20 $switch$1$case$15 $switch$1$case$2 $switch$1$case$23 $switch$1$case$24 $switch$1$case$2 $switch$1$case$26 $switch$1$case$27 $switch$1$case$15 $switch$1$case$29 $switch$1$default
                 end
                 return
                end
                br $block$4$break
               end
               br $block$13$break
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
              local.tee $2
              if
               local.get $2
               local.get $1
               call $~lib/rt/pure/__visit
              end
              return
             end
             local.get $0
             local.get $1
             call $~lib/array/Array<bool>#__visit_impl
             br $block$4$break
            end
            local.get $0
            local.get $1
            call $~lib/array/Array<src/assembly/Z80Cpu/Z80Cpu | null>#__visit_impl
            br $block$4$break
           end
           local.get $0
           local.get $1
           call $~lib/array/Array<i32>#__visit_impl
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
         call $~lib/array/Array<src/assembly/test-machine/TestZ80Cpu/MemoryOp>#__visit_impl
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
        local.tee $2
        if
         local.get $2
         local.get $1
         call $~lib/rt/pure/__visit
        end
        return
       end
       local.get $0
       local.get $1
       call $~lib/array/Array<src/assembly/test-machine/TestZ80Cpu/IoOp>#__visit_impl
       br $block$4$break
      end
      local.get $0
      local.get $1
      call $~lib/array/Array<u8>#__visit_impl
      br $block$4$break
     end
     local.get $0
     local.get $1
     call $~lib/array/Array<src/assembly/test-machine/TestZ80Machine/TestZ80Machine | null>#__visit_impl
     br $block$4$break
    end
    unreachable
   end
   local.get $0
   i32.load
   local.tee $2
   if
    local.get $2
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
  local.tee $2
  if
   local.get $2
   local.get $1
   call $~lib/rt/pure/__visit
  end
  return
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#constructor|trampoline (; 254 ;) (param $0 i32) (param $1 i32) (result i32)
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
