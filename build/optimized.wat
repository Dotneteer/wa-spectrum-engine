(module
 (type $i32_=>_i32 (func (param i32) (result i32)))
 (type $i32_i32_=>_none (func (param i32 i32)))
 (type $i32_=>_none (func (param i32)))
 (type $i32_i32_i32_=>_none (func (param i32 i32 i32)))
 (type $i32_i32_=>_i32 (func (param i32 i32) (result i32)))
 (type $none_=>_i32 (func (result i32)))
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
 (data (i32.const 192) "\10\00\00\00\01\00\00\00\03\00\00\00\10\00\00\00\c0\00\00\00\c0")
 (data (i32.const 224) "$\00\00\00\01\00\00\00\01\00\00\00$\00\00\00I\00n\00d\00e\00x\00 \00o\00u\00t\00 \00o\00f\00 \00r\00a\00n\00g\00e")
 (data (i32.const 288) "\1a\00\00\00\01\00\00\00\01\00\00\00\1a\00\00\00~\00l\00i\00b\00/\00a\00r\00r\00a\00y\00.\00t\00s")
 (data (i32.const 336) "\1c\00\00\00\01\00\00\00\01\00\00\00\1c\00\00\00I\00n\00v\00a\00l\00i\00d\00 \00l\00e\00n\00g\00t\00h")
 (data (i32.const 388) "\01")
 (data (i32.const 400) "\10\00\00\00\01\00\00\00\03\00\00\00\10\00\00\00\90\01\00\00\90\01")
 (data (i32.const 436) "\01")
 (data (i32.const 448) "\10\00\00\00\01\00\00\00\03\00\00\00\10\00\00\00\c0\01\00\00\c0\01")
 (data (i32.const 484) "\01")
 (data (i32.const 496) "\10\00\00\00\01\00\00\00\03\00\00\00\10\00\00\00\f0\01\00\00\f0\01")
 (data (i32.const 532) "\01")
 (data (i32.const 544) "\10\00\00\00\01\00\00\00\03\00\00\00\10\00\00\00 \02\00\00 \02")
 (data (i32.const 580) "\01")
 (data (i32.const 592) "\10\00\00\00\01\00\00\00\03\00\00\00\10\00\00\00P\02\00\00P\02")
 (data (i32.const 628) "\01")
 (data (i32.const 640) "\10\00\00\00\01\00\00\00\04\00\00\00\10\00\00\00\80\02\00\00\80\02")
 (data (i32.const 676) "\01")
 (data (i32.const 688) "\10\00\00\00\01\00\00\00\03\00\00\00\10\00\00\00\b0\02\00\00\b0\02")
 (data (i32.const 724) "\01")
 (data (i32.const 736) "\10\00\00\00\01\00\00\00\04\00\00\00\10\00\00\00\e0\02\00\00\e0\02")
 (data (i32.const 772) "\01")
 (data (i32.const 784) "\10\00\00\00\01\00\00\00\03\00\00\00\10\00\00\00\10\03\00\00\10\03")
 (data (i32.const 820) "\01")
 (data (i32.const 832) "\10\00\00\00\01\00\00\00\03\00\00\00\10\00\00\00@\03\00\00@\03")
 (data (i32.const 868) "\01")
 (data (i32.const 880) "\10\00\00\00\01\00\00\00\03\00\00\00\10\00\00\00p\03\00\00p\03")
 (data (i32.const 916) "\01")
 (data (i32.const 928) "\10\00\00\00\01\00\00\00\03\00\00\00\10\00\00\00\a0\03\00\00\a0\03")
 (data (i32.const 964) "\01")
 (data (i32.const 976) "\10\00\00\00\01\00\00\00\03\00\00\00\10\00\00\00\d0\03\00\00\d0\03")
 (data (i32.const 1012) "\01")
 (data (i32.const 1024) "\10\00\00\00\01\00\00\00\03\00\00\00\10\00\00\00\00\04\00\00\00\04")
 (data (i32.const 1056) " \00\00\00\01\00\00\00\00\00\00\00 \00\00\00\01\00\00\00\02\00\00\00\03\00\00\00\04\00\00\00\05\00\00\00\06\00\00\00\07\00\00\00\08")
 (data (i32.const 1104) "\10\00\00\00\01\00\00\00\08\00\00\00\10\00\00\000\04\00\000\04\00\00 \00\00\00\08")
 (data (i32.const 1136) "\08\00\00\00\01\00\00\00\00\00\00\00\08\00\00\00\00\00\00\00\t")
 (data (i32.const 1168) "\10\00\00\00\01\00\00\00\t\00\00\00\10\00\00\00\80\04\00\00\80\04\00\00\08\00\00\00\02")
 (data (i32.const 1200) "\08\00\00\00\01\00\00\00\00\00\00\00\08\00\00\00\00\00\00\00\t")
 (data (i32.const 1232) "\10\00\00\00\01\00\00\00\t\00\00\00\10\00\00\00\c0\04\00\00\c0\04\00\00\08\00\00\00\02")
 (data (i32.const 1264) "\08\00\00\00\01\00\00\00\00\00\00\00\08\00\00\00\00\00\00\00\t")
 (data (i32.const 1296) "\10\00\00\00\01\00\00\00\t\00\00\00\10\00\00\00\00\05\00\00\00\05\00\00\08\00\00\00\02")
 (data (i32.const 1328) "\08\00\00\00\01\00\00\00\00\00\00\00\08\00\00\00\00\00\00\00\t")
 (data (i32.const 1360) "\10\00\00\00\01\00\00\00\t\00\00\00\10\00\00\00@\05\00\00@\05\00\00\08\00\00\00\02")
 (data (i32.const 1392) "\08\00\00\00\01\00\00\00\00\00\00\00\08\00\00\00\00\00\00\00\n")
 (data (i32.const 1424) "\10\00\00\00\01\00\00\00\n\00\00\00\10\00\00\00\80\05\00\00\80\05\00\00\08\00\00\00\02")
 (data (i32.const 1460) "\01")
 (data (i32.const 1476) "\01")
 (data (i32.const 1488) "&\00\00\00\01\00\00\00\01\00\00\00&\00\00\00~\00l\00i\00b\00/\00a\00r\00r\00a\00y\00b\00u\00f\00f\00e\00r\00.\00t\00s")
 (data (i32.const 1552) "$\00\00\00\01\00\00\00\01\00\00\00$\00\00\00~\00l\00i\00b\00/\00t\00y\00p\00e\00d\00a\00r\00r\00a\00y\00.\00t\00s")
 (data (i32.const 1620) "\01")
 (data (i32.const 1636) "\01")
 (data (i32.const 1652) "\01")
 (data (i32.const 1668) "\01")
 (data (i32.const 1684) "\01")
 (data (i32.const 1700) "\01")
 (data (i32.const 1716) "\01")
 (data (i32.const 1728) "\14\00\00\00\01\00\00\00\01\00\00\00\14\00\00\00~\00l\00i\00b\00/\00r\00t\00.\00t\00s")
 (data (i32.const 1776) "\1b\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\003\00\00\00\02\00\00\00\93\00\00\00\02\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\91\00\00\00\02\00\00\00\93\00\00\00\02\00\00\00\93\10\00\00\02\00\00\00\93\10\00\00\02\00\00\00\10\00\00\00\00\00\00\003\00\00\00\02\00\00\00\930\00\00\02\00\00\00\93\04\00\00\02\00\00\00\10")
 (data (i32.const 1912) "\05\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\93 \00\00\02")
 (data (i32.const 1948) "\10\00\00\00\00\00\00\00\93 \00\00\02\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\930\00\00\02\00\00\001\00\00\00\02")
 (table $0 15 funcref)
 (elem (i32.const 1) $src/assembly/Z80Cpu/AluADD $src/assembly/Z80Cpu/AluADC $src/assembly/Z80Cpu/AluSUB $src/assembly/Z80Cpu/AluSBC $src/assembly/Z80Cpu/AluAND $src/assembly/Z80Cpu/AluXOR $src/assembly/Z80Cpu/AluOR $src/assembly/Z80Cpu/AluCP $src/assembly/Z80Cpu/LdBcNN $src/assembly/Z80Cpu/LdBcNNIdx $start:src/assembly/index~anonymous|0 $start:src/assembly/index~anonymous|1 $src/assembly/ObjectPool/ObjectPool<src/assembly/Z80Cpu/Z80Cpu>#create~anonymous|0 $src/assembly/ObjectPool/ObjectPool<src/assembly/Z80Cpu/Z80Cpu>#create~anonymous|0)
 (global $~lib/rt/tlsf/ROOT (mut i32) (i32.const 0))
 (global $~lib/rt/tlsf/collectLock (mut i32) (i32.const 0))
 (global $src/assembly/index/cpuPool (mut i32) (i32.const 0))
 (global $~argumentsLength (mut i32) (i32.const 0))
 (global $src/assembly/index/testMachinePool (mut i32) (i32.const 0))
 (global $src/assembly/index/UINT8ARRAY_ID i32 (i32.const 26))
 (global $~lib/rt/pure/ROOTS (mut i32) (i32.const 0))
 (global $~lib/rt/pure/CUR (mut i32) (i32.const 0))
 (global $~lib/rt/pure/END (mut i32) (i32.const 0))
 (global $~lib/rt/__rtti_base i32 (i32.const 1776))
 (global $src/assembly/Z80Cpu/Z80Cpu i32 (i32.const 5))
 (global $src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine i32 (i32.const 15))
 (global $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState i32 (i32.const 23))
 (export "__setArgumentsLength" (func $~setArgumentsLength))
 (export "memory" (memory $0))
 (export "__alloc" (func $~lib/rt/tlsf/__alloc))
 (export "__retain" (func $~lib/rt/pure/__retain))
 (export "__release" (func $~lib/rt/pure/__release))
 (export "__collect" (func $~lib/rt/pure/__collect))
 (export "__rtti_base" (global $~lib/rt/__rtti_base))
 (export "UINT8ARRAY_ID" (global $src/assembly/index/UINT8ARRAY_ID))
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
 (export "getTestMachineState" (func $src/assembly/index/getTestMachineState))
 (export "updateTestMachineState" (func $src/assembly/index/updateTestMachineState))
 (export "getTestMachineMemory" (func $src/assembly/index/getTestMachineMemory))
 (export "updateTestMachineMemory" (func $src/assembly/index/updateTestMachineMemory))
 (export "initTestMachineCode" (func $src/assembly/index/initTestMachineCode))
 (export "runTestMachine" (func $src/assembly/index/runTestMachine))
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
 (export "Z80Cpu#get:opCode" (func $src/assembly/Z80Cpu/Z80Cpu#get:opCode))
 (export "Z80Cpu#set:opCode" (func $src/assembly/Z80Cpu/Z80Cpu#set:opCode))
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
 (export "Z80Cpu#set:_af_" (func $src/assembly/Z80Cpu/Z80Cpu#set:_af_))
 (export "Z80Cpu#get:_bc_" (func $src/assembly/Z80Cpu/Z80Cpu#get:_bc_))
 (export "Z80Cpu#set:_bc_" (func $src/assembly/Z80Cpu/Z80Cpu#set:_bc_))
 (export "Z80Cpu#get:_de_" (func $src/assembly/Z80Cpu/Z80Cpu#get:_de_))
 (export "Z80Cpu#set:_de_" (func $src/assembly/Z80Cpu/Z80Cpu#set:_de_))
 (export "Z80Cpu#get:_hl_" (func $src/assembly/Z80Cpu/Z80Cpu#get:_hl_))
 (export "Z80Cpu#set:_hl_" (func $src/assembly/Z80Cpu/Z80Cpu#set:_hl_))
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
 (export "Z80Cpu#getReg8" (func $src/assembly/Z80Cpu/Z80Cpu#getReg8))
 (export "Z80Cpu#setReg8" (func $src/assembly/Z80Cpu/Z80Cpu#setReg8))
 (export "Z80Cpu#getReg16" (func $src/assembly/Z80Cpu/Z80Cpu#getReg16))
 (export "Z80Cpu#setReg16" (func $src/assembly/Z80Cpu/Z80Cpu#setReg16))
 (export "Z80Cpu#get:sFlag" (func $src/assembly/Z80Cpu/Z80Cpu#get:sFlag))
 (export "Z80Cpu#get:zFlag" (func $src/assembly/Z80Cpu/Z80Cpu#get:zFlag))
 (export "Z80Cpu#get:r5Flag" (func $src/assembly/Z80Cpu/Z80Cpu#get:r5Flag))
 (export "Z80Cpu#get:hFlag" (func $src/assembly/Z80Cpu/Z80Cpu#get:hFlag))
 (export "Z80Cpu#get:r3Flag" (func $src/assembly/Z80Cpu/Z80Cpu#get:r3Flag))
 (export "Z80Cpu#get:pvFlag" (func $src/assembly/Z80Cpu/Z80Cpu#get:pvFlag))
 (export "Z80Cpu#get:nFlag" (func $src/assembly/Z80Cpu/Z80Cpu#get:nFlag))
 (export "Z80Cpu#get:cFlag" (func $src/assembly/Z80Cpu/Z80Cpu#get:cFlag))
 (export "Z80Cpu#readMemory" (func $src/assembly/Z80Cpu/Z80Cpu#readMemory))
 (export "Z80Cpu#writeMemory" (func $src/assembly/Z80Cpu/Z80Cpu#writeMemory))
 (export "Z80Cpu#readPort" (func $src/assembly/Z80Cpu/Z80Cpu#readMemory))
 (export "Z80Cpu#writePort" (func $src/assembly/Z80Cpu/Z80Cpu#writeMemory))
 (export "Z80Cpu#reset" (func $src/assembly/Z80Cpu/Z80Cpu#reset))
 (export "Z80Cpu#delay" (func $src/assembly/Z80Cpu/Z80Cpu#delay))
 (export "Z80Cpu#executeCpuCycle" (func $src/assembly/Z80Cpu/Z80Cpu#executeCpuCycle))
 (export "Z80Cpu#getCallInstructionLength" (func $src/assembly/Z80Cpu/Z80Cpu#getCallInstructionLength))
 (export "Z80Cpu#readCodeMemory" (func $src/assembly/Z80Cpu/Z80Cpu#readCodeMemory))
 (export "Z80Cpu#processStandardOrIndexedOperations" (func $src/assembly/Z80Cpu/Z80Cpu#processStandardOrIndexedOperations))
 (export "Z80Cpu#processEDOperations" (func $src/assembly/Z80Cpu/Z80Cpu#processEDOperations))
 (export "Z80Cpu#processCBPrefixedOperations" (func $src/assembly/Z80Cpu/Z80Cpu#processCBPrefixedOperations))
 (export "Z80Cpu#longOp" (func $src/assembly/Z80Cpu/Z80Cpu#longOp))
 (export "WaTestZ80Machine" (global $src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine))
 (export "WaTestZ80Machine#get:cpu" (func $src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine#get:cpu))
 (export "WaTestZ80Machine#get:codeEndsAt" (func $src/assembly/Z80Cpu/Z80Cpu#get:de))
 (export "WaTestZ80Machine#set:codeEndsAt" (func $src/assembly/Z80Cpu/Z80Cpu#set:de))
 (export "WaTestZ80Machine#get:runMode" (func $~lib/typedarray/Uint8Array#get:length))
 (export "WaTestZ80Machine#set:runMode" (func $src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine#set:runMode))
 (export "WaTestZ80Machine#constructor" (func $src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine#constructor))
 (export "WaTestZ80Machine#get:memoryAccessLog" (func $src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine#get:memoryAccessLog))
 (export "WaTestZ80Machine#get:ioAccessLog" (func $src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine#get:ioAccessLog))
 (export "WaTestZ80Machine#get:memory" (func $src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine#get:memory))
 (export "WaTestZ80Machine#set:memory" (func $src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine#set:memory))
 (export "WaTestZ80Machine#get:memoryLength" (func $src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine#get:memoryLength))
 (export "WaTestZ80Machine#get:machineState" (func $src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine#get:machineState))
 (export "WaTestZ80Machine#set:machineState" (func $src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine#set:machineState))
 (export "WaTestZ80Machine#initCode" (func $src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine#initCode|trampoline))
 (export "WaTestZ80Machine#run" (func $src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine#run))
 (export "TestZ80MachineState" (global $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState))
 (export "TestZ80MachineState#get:a" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:a))
 (export "TestZ80MachineState#set:a" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:a))
 (export "TestZ80MachineState#get:f" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:f))
 (export "TestZ80MachineState#set:f" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:f))
 (export "TestZ80MachineState#get:af" (func $src/assembly/Z80Cpu/Z80Cpu#get:bc))
 (export "TestZ80MachineState#set:af" (func $src/assembly/Z80Cpu/Z80Cpu#set:bc))
 (export "TestZ80MachineState#get:b" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:b))
 (export "TestZ80MachineState#set:b" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:b))
 (export "TestZ80MachineState#get:c" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:c))
 (export "TestZ80MachineState#set:c" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:c))
 (export "TestZ80MachineState#get:bc" (func $src/assembly/Z80Cpu/Z80Cpu#get:hl))
 (export "TestZ80MachineState#set:bc" (func $src/assembly/Z80Cpu/Z80Cpu#set:hl))
 (export "TestZ80MachineState#get:d" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:d))
 (export "TestZ80MachineState#set:d" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:d))
 (export "TestZ80MachineState#get:e" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:e))
 (export "TestZ80MachineState#set:e" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:e))
 (export "TestZ80MachineState#get:de" (func $src/assembly/Z80Cpu/Z80Cpu#get:_bc_))
 (export "TestZ80MachineState#set:de" (func $src/assembly/Z80Cpu/Z80Cpu#set:_bc_))
 (export "TestZ80MachineState#get:h" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:h))
 (export "TestZ80MachineState#set:h" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:h))
 (export "TestZ80MachineState#get:l" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:l))
 (export "TestZ80MachineState#set:l" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:l))
 (export "TestZ80MachineState#get:hl" (func $src/assembly/Z80Cpu/Z80Cpu#get:_hl_))
 (export "TestZ80MachineState#set:hl" (func $src/assembly/Z80Cpu/Z80Cpu#set:_hl_))
 (export "TestZ80MachineState#get:af_sec" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:af_sec))
 (export "TestZ80MachineState#set:af_sec" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:af_sec))
 (export "TestZ80MachineState#get:bc_sec" (func $src/assembly/Z80Cpu/Z80Cpu#get:pc))
 (export "TestZ80MachineState#set:bc_sec" (func $src/assembly/Z80Cpu/Z80Cpu#set:pc))
 (export "TestZ80MachineState#get:de_sec" (func $src/assembly/Z80Cpu/Z80Cpu#get:sp))
 (export "TestZ80MachineState#set:de_sec" (func $src/assembly/Z80Cpu/Z80Cpu#set:sp))
 (export "TestZ80MachineState#get:hl_sec" (func $src/assembly/Z80Cpu/Z80Cpu#get:ix))
 (export "TestZ80MachineState#set:hl_sec" (func $src/assembly/Z80Cpu/Z80Cpu#set:ix))
 (export "TestZ80MachineState#get:i" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:i))
 (export "TestZ80MachineState#set:i" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:i))
 (export "TestZ80MachineState#get:r" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:r))
 (export "TestZ80MachineState#set:r" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:r))
 (export "TestZ80MachineState#get:pc" (func $src/assembly/Z80Cpu/Z80Cpu#get:wz))
 (export "TestZ80MachineState#set:pc" (func $src/assembly/Z80Cpu/Z80Cpu#set:wz))
 (export "TestZ80MachineState#get:sp" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:sp))
 (export "TestZ80MachineState#set:sp" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:sp))
 (export "TestZ80MachineState#get:xh" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:xh))
 (export "TestZ80MachineState#set:xh" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:xh))
 (export "TestZ80MachineState#get:xl" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:xl))
 (export "TestZ80MachineState#set:xl" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:xl))
 (export "TestZ80MachineState#get:ix" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:ix))
 (export "TestZ80MachineState#set:ix" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:ix))
 (export "TestZ80MachineState#get:yh" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:yh))
 (export "TestZ80MachineState#set:yh" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:yh))
 (export "TestZ80MachineState#get:yl" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:yl))
 (export "TestZ80MachineState#set:yl" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:yl))
 (export "TestZ80MachineState#get:iy" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:iy))
 (export "TestZ80MachineState#set:iy" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:iy))
 (export "TestZ80MachineState#get:wh" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:wh))
 (export "TestZ80MachineState#set:wh" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:wh))
 (export "TestZ80MachineState#get:wl" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:wl))
 (export "TestZ80MachineState#set:wl" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:wl))
 (export "TestZ80MachineState#get:wz" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:wz))
 (export "TestZ80MachineState#set:wz" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:wz))
 (export "TestZ80MachineState#get:tactsL" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:tactsL))
 (export "TestZ80MachineState#set:tactsL" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:tactsL))
 (export "TestZ80MachineState#get:tactsH" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:tactsH))
 (export "TestZ80MachineState#set:tactsH" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:tactsH))
 (export "TestZ80MachineState#get:stateFlags" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:stateFlags))
 (export "TestZ80MachineState#set:stateFlags" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:stateFlags))
 (export "TestZ80MachineState#get:useGateArrayContention" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:useGateArrayContention))
 (export "TestZ80MachineState#set:useGateArrayContention" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:useGateArrayContention))
 (export "TestZ80MachineState#get:iff1" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:iff1))
 (export "TestZ80MachineState#set:iff1" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:iff1))
 (export "TestZ80MachineState#get:iff2" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:iff2))
 (export "TestZ80MachineState#set:iff2" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:iff2))
 (export "TestZ80MachineState#get:interruptMode" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:interruptMode))
 (export "TestZ80MachineState#set:interruptMode" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:interruptMode))
 (export "TestZ80MachineState#get:isInterruptBlocked" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:isInterruptBlocked))
 (export "TestZ80MachineState#set:isInterruptBlocked" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:isInterruptBlocked))
 (export "TestZ80MachineState#get:isInOpExecution" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:isInOpExecution))
 (export "TestZ80MachineState#set:isInOpExecution" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:isInOpExecution))
 (export "TestZ80MachineState#get:prefixMode" (func $src/assembly/Z80Cpu/Z80Cpu#get:prefixMode))
 (export "TestZ80MachineState#set:prefixMode" (func $src/assembly/Z80Cpu/Z80Cpu#set:prefixMode))
 (export "TestZ80MachineState#get:indexMode" (func $src/assembly/Z80Cpu/Z80Cpu#get:indexMode))
 (export "TestZ80MachineState#set:indexMode" (func $src/assembly/Z80Cpu/Z80Cpu#set:indexMode))
 (export "TestZ80MachineState#get:maskableInterruptModeEntered" (func $src/assembly/Z80Cpu/Z80Cpu#get:maskableInterruptModeEntered))
 (export "TestZ80MachineState#set:maskableInterruptModeEntered" (func $src/assembly/Z80Cpu/Z80Cpu#set:maskableInterruptModeEntered))
 (export "TestZ80MachineState#get:opCode" (func $src/assembly/Z80Cpu/Z80Cpu#get:opCode))
 (export "TestZ80MachineState#set:opCode" (func $src/assembly/Z80Cpu/Z80Cpu#set:opCode))
 (export "TestZ80MachineState#constructor" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#constructor))
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
   i32.const 2000
   local.tee $0
   i32.const 0
   i32.store
   i32.const 3568
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
     i32.const 2000
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
       i32.const 2000
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
   i32.const 2000
   i32.const 3584
   memory.size
   i32.const 16
   i32.shl
   call $~lib/rt/tlsf/addMemory
   i32.const 2000
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
  i32.const 1996
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
  i32.const 1996
  i32.gt_u
  if
   local.get $0
   i32.const 16
   i32.sub
   call $~lib/rt/pure/decrement
  end
 )
 (func $~lib/rt/tlsf/checkUsedBlock (; 14 ;) (param $0 i32) (result i32)
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
 (func $~lib/memory/memory.copy (; 15 ;) (param $0 i32) (param $1 i32) (param $2 i32)
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
 (func $~lib/rt/tlsf/freeBlock (; 16 ;) (param $0 i32) (param $1 i32)
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
 (func $~lib/rt/tlsf/reallocateBlock (; 17 ;) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
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
  i32.const 1996
  i32.ge_u
  if
   local.get $0
   local.get $1
   call $~lib/rt/tlsf/freeBlock
  end
  local.get $3
 )
 (func $~lib/memory/memory.fill (; 18 ;) (param $0 i32) (param $1 i32)
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
 (func $~lib/array/ensureSize (; 19 ;) (param $0 i32) (param $1 i32) (param $2 i32)
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
    i32.const 352
    i32.const 304
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
 (func $~lib/array/Array<u8>#__set (; 20 ;) (param $0 i32) (param $1 i32) (param $2 i32)
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
    i32.const 240
    i32.const 304
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
 (func $~lib/array/Array<u8>#__get (; 21 ;) (param $0 i32) (param $1 i32) (result i32)
  local.get $1
  local.get $0
  i32.load offset=12
  i32.ge_u
  if
   i32.const 240
   i32.const 304
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
 (func $~lib/array/Array<usize>#__set (; 22 ;) (param $0 i32) (param $1 i32) (param $2 i32)
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
    i32.const 240
    i32.const 304
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
  i32.load offset=4
  local.get $1
  i32.const 2
  i32.shl
  i32.add
  local.get $2
  i32.store
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:a (; 23 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u
  i32.const 8
  i32.shr_u
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:af (; 24 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16
 )
 (func $src/assembly/Z80Cpu/AluADC (; 25 ;) (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  i32.const 1
  i32.const 0
  local.get $2
  select
  local.tee $2
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#get:a
  local.get $1
  i32.add
  i32.const 255
  i32.and
  i32.add
  local.set $3
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#get:a
  local.get $1
  i32.add
  i32.const 24
  i32.shl
  i32.const 24
  i32.shr_s
  local.get $2
  i32.add
  local.set $4
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#get:a
  i32.const 15
  i32.and
  local.get $1
  i32.const 15
  i32.and
  i32.add
  i32.const 255
  i32.and
  local.get $2
  i32.add
  i32.const 16
  i32.and
  local.set $2
  local.get $0
  local.get $3
  i32.const 168
  i32.and
  local.tee $1
  local.get $1
  i32.const 64
  i32.or
  local.get $3
  i32.const 255
  i32.and
  select
  local.tee $1
  i32.const 1
  i32.or
  local.get $1
  local.get $3
  i32.const 256
  i32.ge_s
  select
  local.tee $1
  i32.const 16
  i32.or
  local.get $1
  local.get $2
  select
  local.tee $1
  i32.const 4
  i32.or
  local.get $1
  i32.const 1
  local.get $4
  i32.const -129
  i32.le_s
  local.get $4
  i32.const 128
  i32.ge_s
  select
  select
  i32.const 255
  i32.and
  local.get $3
  i32.const 8
  i32.shl
  i32.or
  call $src/assembly/Z80Cpu/Z80Cpu#set:af
 )
 (func $src/assembly/Z80Cpu/AluADD (; 26 ;) (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $0
  local.get $1
  i32.const 0
  call $src/assembly/Z80Cpu/AluADC
 )
 (func $src/assembly/Z80Cpu/AluSBC (; 27 ;) (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#get:a
  local.get $1
  i32.sub
  i32.const 255
  i32.and
  i32.const 1
  i32.const 0
  local.get $2
  select
  local.tee $2
  i32.sub
  local.set $3
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#get:a
  local.get $1
  i32.sub
  i32.const 24
  i32.shl
  i32.const 24
  i32.shr_s
  local.get $2
  i32.sub
  local.set $4
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#get:a
  i32.const 15
  i32.and
  local.get $1
  i32.const 15
  i32.and
  i32.sub
  i32.const 255
  i32.and
  local.get $2
  i32.sub
  i32.const 16
  i32.and
  local.set $2
  local.get $0
  local.get $3
  i32.const 8
  i32.and
  i32.const 2
  i32.or
  local.tee $1
  local.get $1
  i32.const 64
  i32.or
  local.get $3
  i32.const 255
  i32.and
  select
  local.tee $1
  i32.const 1
  i32.or
  local.get $1
  local.get $3
  i32.const 65536
  i32.and
  select
  local.tee $1
  i32.const 16
  i32.or
  local.get $1
  local.get $2
  select
  local.tee $1
  i32.const 4
  i32.or
  local.get $1
  i32.const 1
  local.get $4
  i32.const -129
  i32.le_s
  local.get $4
  i32.const 128
  i32.ge_s
  select
  select
  i32.const 255
  i32.and
  local.get $3
  i32.const 8
  i32.shl
  i32.or
  call $src/assembly/Z80Cpu/Z80Cpu#set:af
 )
 (func $src/assembly/Z80Cpu/AluSUB (; 28 ;) (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $0
  local.get $1
  i32.const 0
  call $src/assembly/Z80Cpu/AluSBC
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:a (; 29 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $0
  i32.load16_u
  local.get $1
  i32.const 8
  i32.shl
  i32.or
  i32.const 255
  i32.and
  i32.store16
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:f (; 30 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $0
  i32.load16_u
  i32.const 65280
  i32.and
  local.get $1
  i32.const 255
  i32.and
  i32.or
  i32.store16
 )
 (func $src/assembly/Z80Cpu/AluAND (; 31 ;) (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $0
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#get:a
  local.get $1
  i32.and
  call $src/assembly/Z80Cpu/Z80Cpu#set:a
  local.get $0
  i32.const 608
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#get:a
  call $~lib/array/Array<u8>#__get
  i32.const 16
  i32.or
  call $src/assembly/Z80Cpu/Z80Cpu#set:f
 )
 (func $src/assembly/Z80Cpu/AluXOR (; 32 ;) (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $0
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#get:a
  local.get $1
  i32.xor
  call $src/assembly/Z80Cpu/Z80Cpu#set:a
  local.get $0
  i32.const 608
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#get:a
  call $~lib/array/Array<u8>#__get
  call $src/assembly/Z80Cpu/Z80Cpu#set:f
 )
 (func $src/assembly/Z80Cpu/AluOR (; 33 ;) (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $0
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#get:a
  local.get $1
  i32.or
  call $src/assembly/Z80Cpu/Z80Cpu#set:a
  local.get $0
  i32.const 608
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#get:a
  call $~lib/array/Array<u8>#__get
  call $src/assembly/Z80Cpu/Z80Cpu#set:f
 )
 (func $src/assembly/Z80Cpu/AluCP (; 34 ;) (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#get:a
  local.get $1
  i32.sub
  local.set $2
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#get:a
  local.get $1
  i32.sub
  local.set $3
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#get:a
  i32.const 15
  i32.and
  local.get $1
  i32.const 15
  i32.and
  i32.sub
  i32.const 16
  i32.and
  local.set $4
  local.get $0
  local.get $2
  i32.const 255
  i32.and
  local.tee $0
  i32.const 168
  i32.and
  i32.const 2
  i32.or
  local.tee $1
  local.get $1
  i32.const 64
  i32.or
  local.get $0
  select
  local.tee $1
  i32.const 16
  i32.or
  local.get $1
  local.get $4
  select
  local.tee $1
  i32.const 4
  i32.or
  local.get $1
  i32.const 1
  local.get $3
  i32.const 24
  i32.shl
  i32.const 24
  i32.shr_s
  i32.const -129
  i32.le_s
  local.get $3
  i32.const 24
  i32.shl
  i32.const 24
  i32.shr_s
  i32.const 128
  i32.ge_s
  select
  select
  call $src/assembly/Z80Cpu/Z80Cpu#set:f
 )
 (func $src/assembly/Z80Cpu/LdBcNN (; 35 ;) (param $0 i32)
  nop
 )
 (func $src/assembly/Z80Cpu/LdBcNNIdx (; 36 ;) (param $0 i32) (param $1 i32)
  nop
 )
 (func $start:src/assembly/Z80Cpu (; 37 ;)
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
  loop $for-loop|0
   local.get $0
   i32.const 256
   i32.lt_s
   if
    i32.const 208
    local.get $0
    local.get $0
    i32.const 1
    i32.add
    local.tee $1
    i32.const 255
    i32.and
    local.tee $2
    i32.const 8
    i32.and
    local.get $2
    i32.const 32
    i32.and
    i32.or
    i32.const 128
    i32.const 0
    local.get $1
    i32.const 128
    i32.and
    select
    i32.or
    i32.const 0
    i32.const 64
    local.get $1
    i32.const 255
    i32.and
    select
    i32.or
    i32.const 16
    i32.const 0
    local.get $0
    i32.const 15
    i32.and
    i32.const 15
    i32.eq
    select
    i32.or
    i32.const 4
    i32.const 0
    local.get $0
    i32.const 255
    i32.and
    i32.const 127
    i32.eq
    select
    i32.or
    call $~lib/array/Array<u8>#__set
    local.get $0
    i32.const 1
    i32.add
    local.set $0
    br $for-loop|0
   end
  end
  i32.const 0
  local.set $0
  loop $for-loop|1
   local.get $0
   i32.const 256
   i32.lt_s
   if
    i32.const 416
    local.get $0
    local.get $0
    i32.const 1
    i32.sub
    local.tee $1
    i32.const 255
    i32.and
    local.tee $2
    i32.const 8
    i32.and
    local.get $2
    i32.const 32
    i32.and
    i32.or
    i32.const 128
    i32.const 0
    local.get $1
    i32.const 128
    i32.and
    select
    i32.or
    i32.const 0
    i32.const 64
    local.get $1
    i32.const 255
    i32.and
    select
    i32.or
    i32.const 0
    i32.const 16
    local.get $0
    i32.const 15
    i32.and
    select
    i32.or
    i32.const 4
    i32.const 0
    local.get $0
    i32.const 255
    i32.and
    i32.const 128
    i32.eq
    select
    i32.or
    i32.const 2
    i32.or
    call $~lib/array/Array<u8>#__set
    local.get $0
    i32.const 1
    i32.add
    local.set $0
    br $for-loop|1
   end
  end
  i32.const 0
  local.set $0
  loop $for-loop|2
   local.get $0
   i32.const 256
   i32.lt_s
   if
    local.get $0
    i32.const 4
    i32.shr_s
    local.set $5
    local.get $0
    i32.const 15
    i32.and
    local.set $2
    i32.const 0
    local.set $1
    loop $for-loop|3
     local.get $1
     i32.const 1
     i32.le_s
     if
      i32.const 0
      local.set $6
      loop $for-loop|4
       local.get $6
       i32.const 1
       i32.le_s
       if
        i32.const 0
        local.set $7
        loop $for-loop|5
         local.get $7
         i32.const 1
         i32.le_s
         if
          i32.const 0
          local.set $4
          i32.const 0
          local.set $8
          local.get $7
          if
           i32.const 1
           local.set $8
           i32.const 102
           i32.const 96
           local.get $1
           select
           i32.const 102
           i32.const 0
           local.get $2
           i32.const 15
           i32.le_s
           i32.const 0
           local.get $2
           i32.const 10
           i32.ge_s
           select
           select
           local.get $2
           i32.const 9
           i32.le_s
           i32.const 0
           local.get $2
           i32.const 0
           i32.ge_s
           select
           select
           local.set $4
          else
           local.get $2
           i32.const 9
           i32.le_s
           i32.const 0
           local.get $2
           i32.const 0
           i32.ge_s
           i32.const 0
           local.get $5
           i32.const 9
           i32.le_s
           i32.const 0
           local.get $5
           i32.const 0
           i32.ge_s
           select
           select
           select
           if
            i32.const 6
            i32.const 0
            local.get $1
            select
            local.set $4
           else
            local.get $2
            i32.const 15
            i32.le_s
            i32.const 0
            local.get $2
            i32.const 10
            i32.ge_s
            i32.const 0
            local.get $5
            i32.const 8
            i32.le_s
            i32.const 0
            local.get $5
            i32.const 0
            i32.ge_s
            select
            select
            select
            if
             i32.const 6
             local.set $4
            else
             local.get $1
             i32.eqz
             i32.const 0
             local.get $2
             i32.const 9
             i32.le_s
             i32.const 0
             local.get $2
             i32.const 0
             i32.ge_s
             i32.const 0
             local.get $5
             i32.const 15
             i32.le_s
             i32.const 0
             local.get $5
             i32.const 10
             i32.ge_s
             select
             select
             select
             select
             if (result i32)
              i32.const 96
              local.set $4
              i32.const 1
             else
              local.get $2
              i32.const 15
              i32.le_s
              i32.const 0
              local.get $2
              i32.const 10
              i32.ge_s
              i32.const 0
              local.get $5
              i32.const 15
              i32.le_s
              i32.const 0
              local.get $5
              i32.const 9
              i32.ge_s
              select
              select
              select
              if (result i32)
               i32.const 102
               local.set $4
               i32.const 1
              else
               local.get $2
               i32.const 9
               i32.le_s
               i32.const 0
               local.get $2
               i32.const 0
               i32.ge_s
               i32.const 0
               local.get $5
               i32.const 15
               i32.le_s
               i32.const 0
               local.get $5
               i32.const 10
               i32.ge_s
               select
               select
               select
               if (result i32)
                i32.const 102
                i32.const 0
                local.get $1
                i32.const 1
                i32.eq
                select
                local.set $4
                i32.const 1
               else
                i32.const 0
               end
              end
             end
             local.set $8
            end
           end
          end
          i32.const 1
          i32.const 0
          i32.const 1
          local.get $1
          i32.const 1
          i32.eq
          i32.const 0
          local.get $6
          i32.const 1
          i32.eq
          i32.const 0
          local.get $2
          i32.const 5
          i32.le_s
          i32.const 0
          local.get $2
          i32.const 0
          i32.ge_s
          select
          select
          select
          local.get $6
          i32.eqz
          i32.const 0
          local.get $2
          i32.const 15
          i32.le_s
          i32.const 0
          local.get $2
          i32.const 10
          i32.ge_s
          select
          select
          select
          select
          local.set $11
          i32.const 0
          local.set $3
          local.get $0
          local.get $4
          i32.sub
          local.get $0
          local.get $4
          i32.add
          local.get $6
          select
          i32.const 255
          i32.and
          local.tee $4
          local.set $9
          i32.const 0
          local.set $10
          loop $for-loop|6
           local.get $10
           i32.const 8
           i32.lt_s
           if
            local.get $9
            i32.const 1
            i32.and
            local.get $3
            i32.add
            local.set $3
            local.get $9
            i32.const 1
            i32.shr_s
            local.set $9
            local.get $10
            i32.const 1
            i32.add
            local.set $10
            br $for-loop|6
           end
          end
          i32.const 464
          local.get $1
          i32.const 2
          i32.shl
          local.get $6
          i32.const 1
          i32.shl
          i32.add
          local.get $7
          i32.add
          i32.const 255
          i32.and
          i32.const 8
          i32.shl
          local.get $0
          i32.add
          local.get $3
          i32.const 2
          i32.rem_s
          if (result i32)
           i32.const 0
          else
           i32.const 4
          end
          local.get $4
          i32.const 8
          i32.and
          local.get $4
          i32.const 32
          i32.and
          i32.or
          i32.const 128
          i32.const 0
          local.get $4
          i32.const 128
          i32.and
          select
          i32.or
          i32.const 0
          i32.const 64
          local.get $4
          select
          i32.or
          i32.or
          i32.const 2
          i32.const 0
          local.get $6
          i32.const 1
          i32.eq
          select
          i32.or
          i32.const 16
          i32.const 0
          local.get $11
          i32.const 1
          i32.eq
          select
          i32.or
          i32.const 1
          i32.const 0
          local.get $8
          i32.const 1
          i32.eq
          select
          i32.or
          i32.const 255
          i32.and
          local.get $4
          i32.const 8
          i32.shl
          i32.or
          i32.const 65535
          i32.and
          call $~lib/array/Array<u8>#__set
          local.get $7
          i32.const 1
          i32.add
          local.set $7
          br $for-loop|5
         end
        end
        local.get $6
        i32.const 1
        i32.add
        local.set $6
        br $for-loop|4
       end
      end
      local.get $1
      i32.const 1
      i32.add
      local.set $1
      br $for-loop|3
     end
    end
    local.get $0
    i32.const 1
    i32.add
    local.set $0
    br $for-loop|2
   end
  end
  i32.const 0
  local.set $0
  loop $for-loop|7
   local.get $0
   i32.const 2
   i32.lt_s
   if
    i32.const 0
    local.set $5
    loop $for-loop|8
     local.get $5
     i32.const 256
     i32.lt_s
     if
      i32.const 0
      local.set $1
      loop $for-loop|9
       local.get $1
       i32.const 256
       i32.lt_s
       if
        local.get $1
        local.get $5
        i32.add
        local.get $0
        i32.add
        i32.const 65535
        i32.and
        local.tee $3
        i32.const 255
        i32.and
        if (result i32)
         i32.const 0
        else
         i32.const 64
        end
        local.get $3
        i32.const 168
        i32.and
        i32.or
        local.tee $4
        i32.const 1
        i32.or
        local.get $4
        local.get $3
        i32.const 256
        i32.ge_s
        select
        local.tee $4
        i32.const 16
        i32.or
        local.get $4
        local.get $5
        i32.const 15
        i32.and
        local.get $1
        i32.const 15
        i32.and
        i32.add
        local.get $0
        i32.add
        i32.const 16
        i32.and
        select
        local.set $4
        i32.const 512
        local.get $0
        i32.const 16
        i32.shl
        local.get $5
        i32.const 8
        i32.shl
        i32.add
        local.get $1
        i32.add
        local.get $1
        local.get $5
        i32.add
        i32.const 24
        i32.shl
        i32.const 24
        i32.shr_s
        local.get $0
        i32.add
        local.tee $3
        i32.const 128
        i32.ge_s
        if (result i32)
         i32.const 1
        else
         local.get $3
         i32.const -129
         i32.le_s
        end
        if (result i32)
         local.get $4
         i32.const 4
         i32.or
        else
         local.get $4
        end
        call $~lib/array/Array<u8>#__set
        local.get $1
        i32.const 1
        i32.add
        local.set $1
        br $for-loop|9
       end
      end
      local.get $5
      i32.const 1
      i32.add
      local.set $5
      br $for-loop|8
     end
    end
    local.get $0
    i32.const 1
    i32.add
    local.set $0
    br $for-loop|7
   end
  end
  i32.const 0
  local.set $0
  loop $for-loop|10
   local.get $0
   i32.const 2
   i32.lt_s
   if
    i32.const 0
    local.set $5
    loop $for-loop|11
     local.get $5
     i32.const 256
     i32.lt_s
     if
      i32.const 0
      local.set $1
      loop $for-loop|12
       local.get $1
       i32.const 256
       i32.lt_s
       if
        local.get $5
        local.get $1
        i32.sub
        local.get $0
        i32.sub
        local.tee $3
        i32.const 168
        i32.and
        local.tee $4
        local.get $4
        i32.const 64
        i32.or
        local.get $3
        i32.const 255
        i32.and
        select
        local.tee $4
        i32.const 1
        i32.or
        local.get $4
        local.get $3
        i32.const 65536
        i32.and
        select
        local.set $4
        i32.const 560
        local.get $0
        i32.const 16
        i32.shl
        local.get $5
        i32.const 8
        i32.shl
        i32.add
        local.get $1
        i32.add
        local.get $5
        local.get $1
        i32.sub
        i32.const 24
        i32.shl
        i32.const 24
        i32.shr_s
        local.get $0
        i32.sub
        local.tee $2
        i32.const 128
        i32.ge_s
        if (result i32)
         i32.const 1
        else
         local.get $2
         i32.const -128
         i32.lt_s
        end
        if
         local.get $4
         i32.const 4
         i32.or
         local.set $4
        end
        local.get $4
        i32.const 16
        i32.or
        local.get $4
        local.get $5
        i32.const 15
        i32.and
        local.get $3
        i32.const 15
        i32.and
        i32.sub
        local.get $0
        i32.sub
        i32.const 16
        i32.and
        select
        i32.const 2
        i32.or
        call $~lib/array/Array<u8>#__set
        local.get $1
        i32.const 1
        i32.add
        local.set $1
        br $for-loop|12
       end
      end
      local.get $5
      i32.const 1
      i32.add
      local.set $5
      br $for-loop|11
     end
    end
    local.get $0
    i32.const 1
    i32.add
    local.set $0
    br $for-loop|10
   end
  end
  i32.const 0
  local.set $0
  loop $for-loop|13
   local.get $0
   i32.const 256
   i32.lt_s
   if
    local.get $0
    i32.const 168
    i32.and
    local.set $4
    i32.const 4
    local.set $3
    i32.const 128
    local.set $1
    loop $for-loop|14
     local.get $1
     if
      local.get $3
      i32.const 4
      i32.xor
      local.get $3
      local.get $0
      local.get $1
      i32.and
      select
      local.set $3
      local.get $1
      i32.const 2
      i32.div_s
      local.set $1
      br $for-loop|14
     end
    end
    i32.const 608
    local.get $0
    local.get $3
    local.get $4
    i32.or
    call $~lib/array/Array<u8>#__set
    local.get $0
    i32.const 1
    i32.add
    local.set $0
    br $for-loop|13
   end
  end
  i32.const 608
  i32.const 0
  i32.const 608
  i32.const 0
  call $~lib/array/Array<u8>#__get
  i32.const 64
  i32.or
  call $~lib/array/Array<u8>#__set
  i32.const 0
  local.set $0
  loop $for-loop|15
   local.get $0
   i32.const 256
   i32.lt_s
   if
    local.get $0
    i32.const 1
    i32.shl
    local.tee $3
    i32.const 256
    i32.and
    if (result i32)
     i32.const 1
    else
     i32.const 0
    end
    local.tee $4
    if
     local.get $3
     i32.const 1
     i32.or
     i32.const 255
     i32.and
     local.set $3
    end
    i32.const 4
    local.set $1
    i32.const 128
    local.set $2
    loop $for-loop|16
     local.get $2
     if
      local.get $1
      i32.const 4
      i32.xor
      local.get $1
      local.get $2
      local.get $3
      i32.and
      select
      local.set $1
      local.get $2
      i32.const 2
      i32.div_s
      local.set $2
      br $for-loop|16
     end
    end
    i32.const 656
    local.get $0
    local.get $3
    i32.const 168
    i32.and
    local.get $1
    i32.or
    local.get $4
    i32.or
    i32.const 255
    i32.and
    local.tee $2
    local.get $2
    i32.const 64
    i32.or
    local.get $3
    select
    i32.const 255
    i32.and
    call $~lib/array/Array<usize>#__set
    local.get $0
    i32.const 1
    i32.add
    local.set $0
    br $for-loop|15
   end
  end
  i32.const 0
  local.set $0
  loop $for-loop|17
   local.get $0
   i32.const 256
   i32.lt_s
   if
    local.get $0
    i32.const 1
    i32.shr_s
    local.set $2
    i32.const 1
    i32.const 0
    local.get $0
    i32.const 1
    i32.and
    select
    local.tee $4
    if
     local.get $2
     i32.const 128
     i32.or
     local.set $2
    end
    i32.const 4
    local.set $5
    i32.const 128
    local.set $3
    loop $for-loop|18
     local.get $3
     if
      local.get $5
      i32.const 4
      i32.xor
      local.get $5
      local.get $2
      local.get $3
      i32.and
      select
      local.set $5
      local.get $3
      i32.const 2
      i32.div_s
      local.set $3
      br $for-loop|18
     end
    end
    i32.const 704
    local.get $0
    local.get $2
    i32.const 168
    i32.and
    local.get $5
    i32.or
    local.get $4
    i32.or
    i32.const 255
    i32.and
    local.tee $3
    local.get $3
    i32.const 64
    i32.or
    local.get $2
    select
    call $~lib/array/Array<u8>#__set
    local.get $0
    i32.const 1
    i32.add
    local.set $0
    br $for-loop|17
   end
  end
  i32.const 0
  local.set $0
  loop $for-loop|19
   local.get $0
   i32.const 256
   i32.lt_s
   if
    local.get $0
    i32.const 1
    i32.shl
    local.tee $3
    i32.const 256
    i32.and
    if (result i32)
     i32.const 1
    else
     i32.const 0
    end
    local.set $4
    i32.const 4
    local.set $1
    i32.const 128
    local.set $2
    loop $for-loop|20
     local.get $2
     if
      local.get $1
      i32.const 4
      i32.xor
      local.get $1
      local.get $2
      local.get $3
      i32.and
      select
      local.set $1
      local.get $2
      i32.const 2
      i32.div_s
      local.set $2
      br $for-loop|20
     end
    end
    i32.const 752
    local.get $0
    local.get $3
    i32.const 168
    i32.and
    local.get $1
    i32.or
    local.get $4
    i32.or
    i32.const 255
    i32.and
    local.tee $2
    local.get $2
    i32.const 64
    i32.or
    local.get $3
    i32.const 255
    i32.and
    select
    i32.const 255
    i32.and
    call $~lib/array/Array<usize>#__set
    local.get $0
    i32.const 1
    i32.add
    local.set $0
    br $for-loop|19
   end
  end
  i32.const 0
  local.set $0
  loop $for-loop|21
   local.get $0
   i32.const 256
   i32.lt_s
   if
    local.get $0
    i32.const 1
    i32.shl
    i32.const 1
    i32.add
    local.tee $1
    i32.const 256
    i32.and
    if (result i32)
     i32.const 1
    else
     i32.const 0
    end
    local.set $4
    i32.const 4
    local.set $5
    i32.const 128
    local.set $3
    loop $for-loop|22
     local.get $3
     if
      local.get $5
      i32.const 4
      i32.xor
      local.get $5
      local.get $1
      local.get $3
      i32.and
      select
      local.set $5
      local.get $3
      i32.const 2
      i32.div_s
      local.set $3
      br $for-loop|22
     end
    end
    i32.const 800
    local.get $0
    local.get $1
    i32.const 168
    i32.and
    local.get $5
    i32.or
    local.get $4
    i32.or
    i32.const 255
    i32.and
    local.tee $3
    local.get $3
    i32.const 64
    i32.or
    local.get $1
    i32.const 511
    i32.and
    select
    call $~lib/array/Array<u8>#__set
    local.get $0
    i32.const 1
    i32.add
    local.set $0
    br $for-loop|21
   end
  end
  i32.const 0
  local.set $0
  loop $for-loop|23
   local.get $0
   i32.const 256
   i32.lt_s
   if
    i32.const 1
    i32.const 0
    local.get $0
    i32.const 1
    i32.and
    select
    local.set $4
    local.get $0
    i32.const 1
    i32.shr_s
    local.set $3
    i32.const 4
    local.set $1
    i32.const 128
    local.set $2
    loop $for-loop|24
     local.get $2
     if
      local.get $1
      i32.const 4
      i32.xor
      local.get $1
      local.get $2
      local.get $3
      i32.and
      select
      local.set $1
      local.get $2
      i32.const 2
      i32.div_s
      local.set $2
      br $for-loop|24
     end
    end
    i32.const 848
    local.get $0
    local.get $3
    i32.const 168
    i32.and
    local.get $1
    i32.or
    local.get $4
    i32.or
    i32.const 255
    i32.and
    local.tee $2
    local.get $2
    i32.const 64
    i32.or
    local.get $3
    select
    call $~lib/array/Array<u8>#__set
    local.get $0
    i32.const 1
    i32.add
    local.set $0
    br $for-loop|23
   end
  end
  i32.const 0
  local.set $0
  loop $for-loop|25
   local.get $0
   i32.const 256
   i32.lt_s
   if
    i32.const 1
    i32.const 0
    local.get $0
    i32.const 1
    i32.and
    select
    local.set $4
    local.get $0
    i32.const 1
    i32.shr_s
    i32.const 128
    i32.add
    local.set $1
    i32.const 4
    local.set $5
    i32.const 128
    local.set $3
    loop $for-loop|26
     local.get $3
     if
      local.get $5
      i32.const 4
      i32.xor
      local.get $5
      local.get $1
      local.get $3
      i32.and
      select
      local.set $5
      local.get $3
      i32.const 2
      i32.div_s
      local.set $3
      br $for-loop|26
     end
    end
    i32.const 896
    local.get $0
    local.get $1
    i32.const 168
    i32.and
    local.get $5
    i32.or
    local.get $4
    i32.or
    i32.const 255
    i32.and
    local.tee $3
    local.get $3
    i32.const 64
    i32.or
    local.get $1
    select
    call $~lib/array/Array<u8>#__set
    local.get $0
    i32.const 1
    i32.add
    local.set $0
    br $for-loop|25
   end
  end
  i32.const 0
  local.set $0
  loop $for-loop|27
   local.get $0
   i32.const 256
   i32.lt_s
   if
    i32.const 1
    i32.const 0
    local.get $0
    i32.const 1
    i32.and
    select
    local.set $3
    local.get $0
    i32.const 128
    i32.and
    local.get $0
    i32.const 1
    i32.shr_s
    i32.add
    local.set $4
    i32.const 4
    local.set $1
    i32.const 128
    local.set $2
    loop $for-loop|28
     local.get $2
     if
      local.get $1
      i32.const 4
      i32.xor
      local.get $1
      local.get $2
      local.get $4
      i32.and
      select
      local.set $1
      local.get $2
      i32.const 2
      i32.div_s
      local.set $2
      br $for-loop|28
     end
    end
    i32.const 944
    local.get $0
    local.get $4
    i32.const 168
    i32.and
    local.get $1
    i32.or
    local.get $3
    i32.or
    i32.const 255
    i32.and
    local.tee $2
    local.get $2
    i32.const 64
    i32.or
    local.get $4
    i32.const 255
    i32.and
    select
    call $~lib/array/Array<u8>#__set
    local.get $0
    i32.const 1
    i32.add
    local.set $0
    br $for-loop|27
   end
  end
  i32.const 0
  local.set $0
  loop $for-loop|29
   local.get $0
   i32.const 256
   i32.lt_s
   if
    i32.const 992
    local.get $0
    local.get $0
    i32.const 1
    i32.shl
    local.get $0
    i32.const 7
    i32.shr_s
    i32.add
    call $~lib/array/Array<u8>#__set
    i32.const 1040
    local.get $0
    local.get $0
    i32.const 7
    i32.shl
    local.get $0
    i32.const 1
    i32.shr_s
    i32.add
    call $~lib/array/Array<u8>#__set
    local.get $0
    i32.const 1
    i32.add
    local.set $0
    br $for-loop|29
   end
  end
 )
 (func $~lib/rt/__allocArray (; 38 ;) (param $0 i32) (param $1 i32) (result i32)
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
 (func $~lib/array/Array<src/assembly/Z80Cpu/Z80Cpu | null>#__unchecked_set (; 39 ;) (param $0 i32) (param $1 i32) (param $2 i32)
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
 (func $~lib/array/Array<src/assembly/Z80Cpu/Z80Cpu | null>#__set (; 40 ;) (param $0 i32) (param $1 i32) (param $2 i32)
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
    i32.const 240
    i32.const 304
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
 (func $src/assembly/ObjectPool/ObjectPool<src/assembly/Z80Cpu/Z80Cpu>#reset (; 41 ;) (param $0 i32)
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
    call $~lib/array/Array<u8>#__set
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
 (func $src/assembly/ObjectPool/ObjectPool<src/assembly/Z80Cpu/Z80Cpu>#constructor (; 42 ;) (result i32)
  (local $0 i32)
  i32.const 16
  i32.const 11
  call $~lib/rt/tlsf/__alloc
  call $~lib/rt/pure/__retain
  local.tee $0
  i32.const 12
  i32.const 1472
  call $~lib/rt/__allocArray
  call $~lib/rt/pure/__retain
  i32.store
  local.get $0
  i32.const 13
  i32.const 1488
  call $~lib/rt/__allocArray
  call $~lib/rt/pure/__retain
  i32.store offset=4
  local.get $0
  i32.const 100
  i32.store offset=8
  local.get $0
  i32.const 11
  i32.store offset=12
  local.get $0
  call $src/assembly/ObjectPool/ObjectPool<src/assembly/Z80Cpu/Z80Cpu>#reset
  local.get $0
 )
 (func $~lib/arraybuffer/ArrayBufferView#constructor (; 43 ;) (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  i32.const 8192
  i32.const 0
  call $~lib/rt/tlsf/__alloc
  local.tee $1
  i32.const 8192
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
  local.get $1
  local.set $2
  local.get $1
  local.get $0
  i32.load
  local.tee $3
  i32.ne
  if
   local.get $2
   call $~lib/rt/pure/__retain
   local.set $2
   local.get $3
   call $~lib/rt/pure/__release
  end
  local.get $0
  local.get $2
  i32.store
  local.get $0
  local.get $1
  i32.store offset=4
  local.get $0
  i32.const 8192
  i32.store offset=8
  local.get $0
 )
 (func $~lib/typedarray/Uint32Array#__set (; 44 ;) (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $1
  local.get $0
  i32.load offset=8
  i32.const 2
  i32.shr_u
  i32.ge_u
  if
   i32.const 240
   i32.const 1568
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
 (func $src/assembly/MemoryStatusArray/MemoryStatusArray#clearAll (; 45 ;) (param $0 i32)
  (local $1 i32)
  loop $for-loop|0
   local.get $1
   i32.const 2048
   i32.lt_s
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
 (func $src/assembly/MemoryStatusArray/MemoryStatusArray#constructor (; 46 ;) (result i32)
  (local $0 i32)
  i32.const 4
  i32.const 6
  call $~lib/rt/tlsf/__alloc
  call $~lib/rt/pure/__retain
  local.tee $0
  i32.const 12
  i32.const 7
  call $~lib/rt/tlsf/__alloc
  call $~lib/rt/pure/__retain
  call $~lib/arraybuffer/ArrayBufferView#constructor
  i32.store
  local.get $0
  call $src/assembly/MemoryStatusArray/MemoryStatusArray#clearAll
  local.get $0
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:pc (; 47 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=18
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:i (; 48 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=16
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:r (; 49 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=17
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#executeReset (; 50 ;) (param $0 i32)
  local.get $0
  i32.const 0
  i32.store8 offset=45
  local.get $0
  i32.const 0
  i32.store8 offset=46
  local.get $0
  i32.const 0
  i32.store8 offset=47
  local.get $0
  i32.const 0
  i32.store8 offset=48
  local.get $0
  i32.const 0
  i32.store offset=40
  local.get $0
  i32.const 0
  i32.store offset=64
  local.get $0
  i32.const 0
  i32.store offset=68
  local.get $0
  i32.const 0
  call $src/assembly/Z80Cpu/Z80Cpu#set:pc
  local.get $0
  i32.const 0
  call $src/assembly/Z80Cpu/Z80Cpu#set:i
  local.get $0
  i32.const 0
  call $src/assembly/Z80Cpu/Z80Cpu#set:r
  local.get $0
  i32.const 0
  i32.store8 offset=49
  local.get $0
  i64.const 0
  i64.store offset=32
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#constructor (; 51 ;) (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  i32.eqz
  if
   i32.const 75
   i32.const 5
   call $~lib/rt/tlsf/__alloc
   call $~lib/rt/pure/__retain
   local.set $0
  end
  local.get $0
  i32.const 65535
  i32.store16
  local.get $0
  i32.const 65535
  i32.store16 offset=2
  local.get $0
  i32.const 65535
  i32.store16 offset=4
  local.get $0
  i32.const 65535
  i32.store16 offset=6
  local.get $0
  i32.const 65535
  i32.store16 offset=8
  local.get $0
  i32.const 65535
  i32.store16 offset=10
  local.get $0
  i32.const 65535
  i32.store16 offset=12
  local.get $0
  i32.const 65535
  i32.store16 offset=14
  local.get $0
  i32.const 255
  i32.store8 offset=16
  local.get $0
  i32.const 255
  i32.store8 offset=17
  local.get $0
  i32.const 65535
  i32.store16 offset=18
  local.get $0
  i32.const 65535
  i32.store16 offset=20
  local.get $0
  i32.const 255
  i32.store16 offset=22
  local.get $0
  i32.const 255
  i32.store16 offset=24
  local.get $0
  i32.const 255
  i32.store16 offset=26
  local.get $0
  i64.const 0
  i64.store offset=32
  local.get $0
  i32.const 0
  i32.store offset=40
  local.get $0
  i32.const 0
  i32.store8 offset=44
  local.get $0
  i32.const 0
  i32.store8 offset=45
  local.get $0
  i32.const 0
  i32.store8 offset=46
  local.get $0
  i32.const 0
  i32.store8 offset=47
  local.get $0
  i32.const 0
  i32.store8 offset=48
  local.get $0
  i32.const 0
  i32.store8 offset=49
  local.get $0
  call $src/assembly/MemoryStatusArray/MemoryStatusArray#constructor
  i32.store offset=52
  local.get $0
  call $src/assembly/MemoryStatusArray/MemoryStatusArray#constructor
  i32.store offset=56
  local.get $0
  call $src/assembly/MemoryStatusArray/MemoryStatusArray#constructor
  i32.store offset=60
  local.get $0
  i32.const 0
  i32.store offset=64
  local.get $0
  i32.const 0
  i32.store offset=68
  local.get $0
  i32.const 0
  i32.store8 offset=72
  local.get $0
  i32.const 255
  i32.store8 offset=73
  local.get $0
  local.get $1
  i32.store8 offset=74
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#executeReset
  local.get $0
 )
 (func $start:src/assembly/index~anonymous|0 (; 52 ;) (result i32)
  i32.const 0
  i32.const 0
  call $src/assembly/Z80Cpu/Z80Cpu#constructor
 )
 (func $src/assembly/ObjectPool/ObjectPool<src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine>#constructor (; 53 ;) (result i32)
  (local $0 i32)
  i32.const 16
  i32.const 24
  call $~lib/rt/tlsf/__alloc
  call $~lib/rt/pure/__retain
  local.tee $0
  i32.const 12
  i32.const 1632
  call $~lib/rt/__allocArray
  call $~lib/rt/pure/__retain
  i32.store
  local.get $0
  i32.const 25
  i32.const 1648
  call $~lib/rt/__allocArray
  call $~lib/rt/pure/__retain
  i32.store offset=4
  local.get $0
  i32.const 10
  i32.store offset=8
  local.get $0
  i32.const 12
  i32.store offset=12
  local.get $0
  call $src/assembly/ObjectPool/ObjectPool<src/assembly/Z80Cpu/Z80Cpu>#reset
  local.get $0
 )
 (func $src/assembly/test-machine/WaTestZ80Cpu/TestMemoryDevice#reset (; 54 ;) (param $0 i32)
  (local $1 i32)
  loop $for-loop|0
   local.get $1
   i32.const 65536
   i32.lt_s
   if
    local.get $0
    i32.load
    local.get $1
    i32.const 255
    call $~lib/array/Array<u8>#__set
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
  i32.const 19
  i32.const 1696
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
 (func $src/assembly/test-machine/WaTestZ80Cpu/TestMemoryDevice#constructor (; 55 ;) (result i32)
  (local $0 i32)
  i32.const 8
  i32.const 17
  call $~lib/rt/tlsf/__alloc
  call $~lib/rt/pure/__retain
  local.tee $0
  i32.const 3
  i32.const 1664
  call $~lib/rt/__allocArray
  call $~lib/rt/pure/__retain
  i32.store
  local.get $0
  i32.const 19
  i32.const 1680
  call $~lib/rt/__allocArray
  call $~lib/rt/pure/__retain
  i32.store offset=4
  local.get $0
  call $src/assembly/test-machine/WaTestZ80Cpu/TestMemoryDevice#reset
  local.get $0
 )
 (func $src/assembly/test-machine/WaTestZ80Cpu/TestPortDevice#constructor (; 56 ;) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  i32.const 16
  i32.const 20
  call $~lib/rt/tlsf/__alloc
  call $~lib/rt/pure/__retain
  local.tee $2
  i32.const 0
  i32.store
  local.get $2
  i32.const 22
  i32.const 1712
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
 (func $src/assembly/test-machine/WaTestZ80Cpu/TestPortDevice#constructor|trampoline (; 57 ;) (param $0 i32) (result i32)
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
   i32.const 3
   i32.const 1728
   call $~lib/rt/__allocArray
   call $~lib/rt/pure/__retain
   local.tee $1
   local.set $2
  end
  local.get $0
  local.get $2
  call $src/assembly/test-machine/WaTestZ80Cpu/TestPortDevice#constructor
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $~setArgumentsLength (; 58 ;) (param $0 i32)
  local.get $0
  global.set $~argumentsLength
 )
 (func $src/assembly/test-machine/WaTestZ80Cpu/WaTestZ80Cpu#constructor (; 59 ;) (result i32)
  (local $0 i32)
  (local $1 i32)
  i32.const 84
  i32.const 16
  call $~lib/rt/tlsf/__alloc
  call $~lib/rt/pure/__retain
  i32.const 0
  call $src/assembly/Z80Cpu/Z80Cpu#constructor
  local.tee $0
  i32.const 0
  i32.store offset=76
  local.get $0
  i32.const 0
  i32.store offset=80
  call $src/assembly/test-machine/WaTestZ80Cpu/TestMemoryDevice#constructor
  local.set $1
  local.get $0
  i32.load offset=76
  call $~lib/rt/pure/__release
  local.get $0
  local.get $1
  i32.store offset=76
  i32.const 1
  global.set $~argumentsLength
  local.get $0
  call $src/assembly/test-machine/WaTestZ80Cpu/TestPortDevice#constructor|trampoline
  local.set $1
  local.get $0
  i32.load offset=80
  call $~lib/rt/pure/__release
  local.get $0
  local.get $1
  i32.store offset=80
  local.get $0
 )
 (func $src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine#constructor (; 60 ;) (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  i32.eqz
  if
   i32.const 12
   i32.const 15
   call $~lib/rt/tlsf/__alloc
   call $~lib/rt/pure/__retain
   local.set $0
  end
  local.get $0
  i32.const 0
  i32.store
  local.get $0
  i32.const 0
  i32.store16 offset=4
  local.get $0
  i32.const 4
  i32.store offset=8
  call $src/assembly/test-machine/WaTestZ80Cpu/WaTestZ80Cpu#constructor
  local.set $1
  local.get $0
  i32.load
  call $~lib/rt/pure/__release
  local.get $0
  local.get $1
  i32.store
  local.get $0
 )
 (func $start:src/assembly/index~anonymous|1 (; 61 ;) (result i32)
  i32.const 0
  call $src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine#constructor
 )
 (func $src/assembly/index/getCpuPoolMaxSize (; 62 ;) (result i32)
  global.get $src/assembly/index/cpuPool
  i32.load offset=8
 )
 (func $src/assembly/index/resetCpuPool (; 63 ;)
  global.get $src/assembly/index/cpuPool
  call $src/assembly/ObjectPool/ObjectPool<src/assembly/Z80Cpu/Z80Cpu>#reset
 )
 (func $src/assembly/ObjectPool/ObjectPool<src/assembly/Z80Cpu/Z80Cpu>#create~anonymous|0 (; 64 ;) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  local.get $0
  i32.eqz
 )
 (func $~lib/array/Array<bool>#findIndex (; 65 ;) (param $0 i32) (param $1 i32) (result i32)
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
 (func $src/assembly/ObjectPool/ObjectPool<src/assembly/Z80Cpu/Z80Cpu>#create (; 66 ;) (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  local.get $0
  i32.load
  i32.const 13
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
  call $~lib/array/Array<u8>#__set
  local.get $2
  call $~lib/rt/pure/__release
  local.get $1
 )
 (func $src/assembly/index/createCpu (; 67 ;) (result i32)
  global.get $src/assembly/index/cpuPool
  call $src/assembly/ObjectPool/ObjectPool<src/assembly/Z80Cpu/Z80Cpu>#create
 )
 (func $src/assembly/ObjectPool/ObjectPool<src/assembly/Z80Cpu/Z80Cpu>#release (; 68 ;) (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  i32.load
  local.get $1
  call $~lib/array/Array<u8>#__get
  i32.eqz
  if
   i32.const 0
   return
  end
  local.get $0
  i32.load
  local.get $1
  i32.const 0
  call $~lib/array/Array<u8>#__set
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 0
  call $~lib/array/Array<src/assembly/Z80Cpu/Z80Cpu | null>#__set
  i32.const 1
 )
 (func $src/assembly/index/releaseCpu (; 69 ;) (param $0 i32) (result i32)
  global.get $src/assembly/index/cpuPool
  local.get $0
  call $src/assembly/ObjectPool/ObjectPool<src/assembly/Z80Cpu/Z80Cpu>#release
 )
 (func $~lib/array/Array<src/assembly/Z80Cpu/Z80Cpu | null>#__get (; 70 ;) (param $0 i32) (param $1 i32) (result i32)
  local.get $1
  local.get $0
  i32.load offset=12
  i32.ge_u
  if
   i32.const 240
   i32.const 304
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
 (func $src/assembly/ObjectPool/ObjectPool<src/assembly/Z80Cpu/Z80Cpu>#get (; 71 ;) (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  i32.load offset=4
  local.get $1
  call $~lib/array/Array<src/assembly/Z80Cpu/Z80Cpu | null>#__get
 )
 (func $src/assembly/index/getCpu (; 72 ;) (param $0 i32) (result i32)
  global.get $src/assembly/index/cpuPool
  local.get $0
  call $src/assembly/ObjectPool/ObjectPool<src/assembly/Z80Cpu/Z80Cpu>#get
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#longOp (; 73 ;) (param $0 i32)
  (local $1 i32)
  loop $for-loop|0
   local.get $1
   i32.const 100000000
   i32.lt_s
   if
    local.get $0
    local.get $1
    i32.store16
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:af (; 74 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u
 )
 (func $src/assembly/index/longOp (; 75 ;) (param $0 i32) (result i32)
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
  i32.load16_u
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $src/assembly/index/getTestMachinePoolMaxSize (; 76 ;) (result i32)
  global.get $src/assembly/index/testMachinePool
  i32.load offset=8
 )
 (func $src/assembly/index/resetTestMachinePool (; 77 ;)
  global.get $src/assembly/index/testMachinePool
  call $src/assembly/ObjectPool/ObjectPool<src/assembly/Z80Cpu/Z80Cpu>#reset
 )
 (func $src/assembly/ObjectPool/ObjectPool<src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine>#create (; 78 ;) (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  local.get $0
  i32.load
  i32.const 14
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
  call $~lib/array/Array<u8>#__set
  local.get $2
  call $~lib/rt/pure/__release
  local.get $1
 )
 (func $src/assembly/index/createTestMachine (; 79 ;) (result i32)
  global.get $src/assembly/index/testMachinePool
  call $src/assembly/ObjectPool/ObjectPool<src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine>#create
 )
 (func $src/assembly/index/releaseTestMachine (; 80 ;) (param $0 i32) (result i32)
  global.get $src/assembly/index/testMachinePool
  local.get $0
  call $src/assembly/ObjectPool/ObjectPool<src/assembly/Z80Cpu/Z80Cpu>#release
 )
 (func $src/assembly/index/getTestMachine (; 81 ;) (param $0 i32) (result i32)
  global.get $src/assembly/index/testMachinePool
  local.get $0
  call $src/assembly/ObjectPool/ObjectPool<src/assembly/Z80Cpu/Z80Cpu>#get
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#constructor (; 82 ;) (param $0 i32) (result i32)
  local.get $0
  i32.eqz
  if
   i32.const 74
   i32.const 23
   call $~lib/rt/tlsf/__alloc
   call $~lib/rt/pure/__retain
   local.set $0
  end
  local.get $0
  i32.const 0
  i32.store8
  local.get $0
  i32.const 0
  i32.store8 offset=1
  local.get $0
  i32.const 0
  i32.store16 offset=2
  local.get $0
  i32.const 0
  i32.store8 offset=4
  local.get $0
  i32.const 0
  i32.store8 offset=5
  local.get $0
  i32.const 0
  i32.store16 offset=6
  local.get $0
  i32.const 0
  i32.store8 offset=8
  local.get $0
  i32.const 0
  i32.store8 offset=9
  local.get $0
  i32.const 0
  i32.store16 offset=10
  local.get $0
  i32.const 0
  i32.store8 offset=12
  local.get $0
  i32.const 0
  i32.store8 offset=13
  local.get $0
  i32.const 0
  i32.store16 offset=14
  local.get $0
  i32.const 0
  i32.store16 offset=16
  local.get $0
  i32.const 0
  i32.store16 offset=18
  local.get $0
  i32.const 0
  i32.store16 offset=20
  local.get $0
  i32.const 0
  i32.store16 offset=22
  local.get $0
  i32.const 0
  i32.store8 offset=24
  local.get $0
  i32.const 0
  i32.store8 offset=25
  local.get $0
  i32.const 0
  i32.store16 offset=26
  local.get $0
  i32.const 0
  i32.store16 offset=28
  local.get $0
  i32.const 0
  i32.store8 offset=30
  local.get $0
  i32.const 0
  i32.store8 offset=31
  local.get $0
  i32.const 0
  i32.store16 offset=32
  local.get $0
  i32.const 0
  i32.store8 offset=34
  local.get $0
  i32.const 0
  i32.store8 offset=35
  local.get $0
  i32.const 0
  i32.store16 offset=36
  local.get $0
  i32.const 0
  i32.store8 offset=38
  local.get $0
  i32.const 0
  i32.store8 offset=39
  local.get $0
  i32.const 0
  i32.store16 offset=40
  local.get $0
  i32.const 0
  i32.store offset=44
  local.get $0
  i32.const 0
  i32.store offset=48
  local.get $0
  i32.const 0
  i32.store offset=52
  local.get $0
  i32.const 0
  i32.store8 offset=56
  local.get $0
  i32.const 0
  i32.store8 offset=57
  local.get $0
  i32.const 0
  i32.store8 offset=58
  local.get $0
  i32.const 0
  i32.store8 offset=59
  local.get $0
  i32.const 0
  i32.store8 offset=60
  local.get $0
  i32.const 0
  i32.store8 offset=61
  local.get $0
  i32.const 0
  i32.store offset=64
  local.get $0
  i32.const 0
  i32.store offset=68
  local.get $0
  i32.const 0
  i32.store8 offset=72
  local.get $0
  i32.const 0
  i32.store8 offset=73
  local.get $0
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:f (; 83 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u
  i32.const 255
  i32.and
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_af_ (; 84 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=8
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:b (; 85 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=2
  i32.const 8
  i32.shr_u
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:c (; 86 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=2
  i32.const 255
  i32.and
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:bc (; 87 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=2
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_bc_ (; 88 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=10
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:d (; 89 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=4
  i32.const 8
  i32.shr_u
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:e (; 90 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=4
  i32.const 255
  i32.and
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:de (; 91 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=4
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_de_ (; 92 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=12
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:h (; 93 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=6
  i32.const 8
  i32.shr_u
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:l (; 94 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=6
  i32.const 255
  i32.and
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:hl (; 95 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=6
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_hl_ (; 96 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=14
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:i (; 97 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=16
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:xh (; 98 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=22
  i32.const 8
  i32.shr_u
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:xl (; 99 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=22
  i32.const 255
  i32.and
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:ix (; 100 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=22
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:yh (; 101 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=24
  i32.const 8
  i32.shr_u
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:yl (; 102 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=24
  i32.const 255
  i32.and
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:iy (; 103 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=24
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:pc (; 104 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=18
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:r (; 105 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=17
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:sp (; 106 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=20
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:wh (; 107 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=26
  i32.const 8
  i32.shr_u
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:wl (; 108 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=26
  i32.const 255
  i32.and
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:wz (; 109 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=26
 )
 (func $src/assembly/test-machine/WaTestZ80Cpu/WaTestZ80Cpu#getCpuState (; 110 ;) (param $0 i32) (result i32)
  (local $1 i32)
  i32.const 0
  call $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#constructor
  local.tee $1
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#get:a
  i32.store8
  local.get $1
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#get:f
  i32.store8 offset=1
  local.get $1
  local.get $0
  i32.load16_u
  i32.store16 offset=2
  local.get $1
  local.get $0
  i32.load16_u offset=8
  i32.store16 offset=16
  local.get $1
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#get:b
  i32.store8 offset=4
  local.get $1
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#get:c
  i32.store8 offset=5
  local.get $1
  local.get $0
  i32.load16_u offset=2
  i32.store16 offset=6
  local.get $1
  local.get $0
  i32.load16_u offset=10
  i32.store16 offset=18
  local.get $1
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#get:d
  i32.store8 offset=8
  local.get $1
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#get:e
  i32.store8 offset=9
  local.get $1
  local.get $0
  i32.load16_u offset=4
  i32.store16 offset=10
  local.get $1
  local.get $0
  i32.load16_u offset=12
  i32.store16 offset=20
  local.get $1
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#get:h
  i32.store8 offset=12
  local.get $1
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#get:l
  i32.store8 offset=13
  local.get $1
  local.get $0
  i32.load16_u offset=6
  i32.store16 offset=14
  local.get $1
  local.get $0
  i32.load16_u offset=14
  i32.store16 offset=22
  local.get $1
  local.get $0
  i32.load8_u offset=16
  i32.store8 offset=24
  local.get $1
  local.get $0
  i32.load8_u offset=45
  i32.store8 offset=57
  local.get $1
  local.get $0
  i32.load8_u offset=46
  i32.store8 offset=58
  local.get $1
  local.get $0
  i32.load offset=68
  i32.store offset=68
  local.get $1
  local.get $0
  i32.load8_u offset=47
  i32.store8 offset=59
  local.get $1
  local.get $0
  i32.load8_u offset=49
  i32.store8 offset=61
  local.get $1
  local.get $0
  i32.load8_u offset=48
  i32.store8 offset=60
  local.get $1
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#get:xh
  i32.store8 offset=30
  local.get $1
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#get:xl
  i32.store8 offset=31
  local.get $1
  local.get $0
  i32.load16_u offset=22
  i32.store16 offset=32
  local.get $1
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#get:yh
  i32.store8 offset=34
  local.get $1
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#get:yl
  i32.store8 offset=35
  local.get $1
  local.get $0
  i32.load16_u offset=24
  i32.store16 offset=36
  local.get $1
  local.get $0
  i32.load8_u offset=72
  i32.store8 offset=72
  local.get $1
  local.get $0
  i32.load8_u offset=73
  i32.store8 offset=73
  local.get $1
  local.get $0
  i32.load16_u offset=18
  i32.store16 offset=26
  local.get $1
  local.get $0
  i32.load offset=64
  i32.store offset=64
  local.get $1
  local.get $0
  i32.load8_u offset=17
  i32.store8 offset=25
  local.get $1
  local.get $0
  i32.load16_u offset=20
  i32.store16 offset=28
  local.get $1
  local.get $0
  i32.load offset=40
  i32.store offset=52
  local.get $1
  local.get $0
  i64.load offset=32
  i64.const 32
  i64.shr_u
  i64.store32 offset=48
  local.get $1
  local.get $0
  i64.load offset=32
  i64.store32 offset=44
  local.get $1
  local.get $0
  i32.load8_u offset=44
  i32.store8 offset=56
  local.get $1
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#get:wh
  i32.store8 offset=38
  local.get $1
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#get:wl
  i32.store8 offset=39
  local.get $1
  local.get $0
  i32.load16_u offset=26
  i32.store16 offset=40
  local.get $1
 )
 (func $src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine#get:machineState (; 111 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load
  call $src/assembly/test-machine/WaTestZ80Cpu/WaTestZ80Cpu#getCpuState
 )
 (func $src/assembly/index/getTestMachineState (; 112 ;) (param $0 i32) (result i32)
  (local $1 i32)
  global.get $src/assembly/index/testMachinePool
  local.get $0
  call $src/assembly/ObjectPool/ObjectPool<src/assembly/Z80Cpu/Z80Cpu>#get
  local.tee $0
  if (result i32)
   local.get $0
   call $src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine#get:machineState
  else
   i32.const 0
  end
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:_af_ (; 113 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=8
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:b (; 114 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $0
  i32.load16_u offset=2
  local.get $1
  i32.const 8
  i32.shl
  i32.or
  i32.const 255
  i32.and
  i32.store16 offset=2
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:c (; 115 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $0
  i32.load16_u offset=2
  i32.const 65280
  i32.and
  local.get $1
  i32.const 255
  i32.and
  i32.or
  i32.store16 offset=2
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:bc (; 116 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=2
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:_bc_ (; 117 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=10
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:d (; 118 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $0
  i32.load16_u offset=4
  local.get $1
  i32.const 8
  i32.shl
  i32.or
  i32.const 255
  i32.and
  i32.store16 offset=4
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:e (; 119 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $0
  i32.load16_u offset=4
  i32.const 65280
  i32.and
  local.get $1
  i32.const 255
  i32.and
  i32.or
  i32.store16 offset=4
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:de (; 120 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=4
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:_de_ (; 121 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=12
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:h (; 122 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $0
  i32.load16_u offset=6
  local.get $1
  i32.const 8
  i32.shl
  i32.or
  i32.const 255
  i32.and
  i32.store16 offset=6
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:l (; 123 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $0
  i32.load16_u offset=6
  i32.const 65280
  i32.and
  local.get $1
  i32.const 255
  i32.and
  i32.or
  i32.store16 offset=6
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:hl (; 124 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=6
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:_hl_ (; 125 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=14
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:xh (; 126 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $0
  i32.load16_u offset=22
  local.get $1
  i32.const 8
  i32.shl
  i32.or
  i32.const 255
  i32.and
  i32.store16 offset=22
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:xl (; 127 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $0
  i32.load16_u offset=22
  i32.const 65280
  i32.and
  local.get $1
  i32.const 255
  i32.and
  i32.or
  i32.store16 offset=22
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:ix (; 128 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=22
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:yh (; 129 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $0
  i32.load16_u offset=24
  local.get $1
  i32.const 8
  i32.shl
  i32.or
  i32.const 255
  i32.and
  i32.store16 offset=24
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:yl (; 130 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $0
  i32.load16_u offset=24
  local.get $1
  i32.const 255
  i32.and
  i32.or
  i32.store16 offset=24
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:iy (; 131 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=24
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:sp (; 132 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=20
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:wh (; 133 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $0
  i32.load16_u offset=26
  local.get $1
  i32.const 8
  i32.shl
  i32.or
  i32.const 255
  i32.and
  i32.store16 offset=26
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:wl (; 134 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $0
  i32.load16_u offset=26
  i32.const 65280
  i32.and
  local.get $1
  i32.const 255
  i32.and
  i32.or
  i32.store16 offset=26
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:wz (; 135 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=26
 )
 (func $src/assembly/test-machine/WaTestZ80Cpu/WaTestZ80Cpu#updateCpuState (; 136 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.load8_u
  call $src/assembly/Z80Cpu/Z80Cpu#set:a
  local.get $0
  local.get $1
  i32.load8_u offset=1
  call $src/assembly/Z80Cpu/Z80Cpu#set:f
  local.get $0
  local.get $1
  i32.load16_u offset=2
  call $src/assembly/Z80Cpu/Z80Cpu#set:af
  local.get $0
  local.get $1
  i32.load16_u offset=16
  call $src/assembly/Z80Cpu/Z80Cpu#set:_af_
  local.get $0
  local.get $1
  i32.load8_u offset=4
  call $src/assembly/Z80Cpu/Z80Cpu#set:b
  local.get $0
  local.get $1
  i32.load8_u offset=5
  call $src/assembly/Z80Cpu/Z80Cpu#set:c
  local.get $0
  local.get $1
  i32.load16_u offset=6
  call $src/assembly/Z80Cpu/Z80Cpu#set:bc
  local.get $0
  local.get $1
  i32.load16_u offset=18
  call $src/assembly/Z80Cpu/Z80Cpu#set:_bc_
  local.get $0
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#get:d
  call $src/assembly/Z80Cpu/Z80Cpu#set:d
  local.get $0
  local.get $1
  i32.load8_u offset=9
  call $src/assembly/Z80Cpu/Z80Cpu#set:e
  local.get $0
  local.get $1
  i32.load16_u offset=10
  call $src/assembly/Z80Cpu/Z80Cpu#set:de
  local.get $0
  local.get $1
  i32.load16_u offset=20
  call $src/assembly/Z80Cpu/Z80Cpu#set:_de_
  local.get $0
  local.get $1
  i32.load8_u offset=12
  call $src/assembly/Z80Cpu/Z80Cpu#set:h
  local.get $0
  local.get $1
  i32.load8_u offset=13
  call $src/assembly/Z80Cpu/Z80Cpu#set:l
  local.get $0
  local.get $1
  i32.load16_u offset=14
  call $src/assembly/Z80Cpu/Z80Cpu#set:hl
  local.get $0
  local.get $1
  i32.load16_u offset=22
  call $src/assembly/Z80Cpu/Z80Cpu#set:_hl_
  local.get $0
  local.get $1
  i32.load8_u offset=24
  call $src/assembly/Z80Cpu/Z80Cpu#set:i
  local.get $0
  local.get $1
  i32.load8_u offset=57
  i32.store8 offset=45
  local.get $0
  local.get $1
  i32.load8_u offset=58
  i32.store8 offset=46
  local.get $0
  local.get $1
  i32.load offset=68
  i32.store offset=68
  local.get $0
  local.get $1
  i32.load8_u offset=59
  i32.store8 offset=47
  local.get $0
  local.get $1
  i32.load8_u offset=60
  i32.store8 offset=49
  local.get $0
  local.get $1
  i32.load8_u offset=60
  i32.store8 offset=48
  local.get $0
  local.get $1
  i32.load8_u offset=30
  call $src/assembly/Z80Cpu/Z80Cpu#set:xh
  local.get $0
  local.get $1
  i32.load8_u offset=31
  call $src/assembly/Z80Cpu/Z80Cpu#set:xl
  local.get $0
  local.get $1
  i32.load16_u offset=32
  call $src/assembly/Z80Cpu/Z80Cpu#set:ix
  local.get $0
  local.get $1
  i32.load8_u offset=34
  call $src/assembly/Z80Cpu/Z80Cpu#set:yh
  local.get $0
  local.get $1
  i32.load8_u offset=35
  call $src/assembly/Z80Cpu/Z80Cpu#set:yl
  local.get $0
  local.get $1
  i32.load16_u offset=36
  call $src/assembly/Z80Cpu/Z80Cpu#set:iy
  local.get $0
  local.get $1
  i32.load8_u offset=72
  i32.store8 offset=72
  local.get $0
  local.get $1
  i32.load8_u offset=73
  i32.store8 offset=73
  local.get $0
  local.get $1
  i32.load16_u offset=26
  call $src/assembly/Z80Cpu/Z80Cpu#set:pc
  local.get $0
  local.get $1
  i32.load offset=64
  i32.store offset=64
  local.get $0
  local.get $1
  i32.load8_u offset=25
  call $src/assembly/Z80Cpu/Z80Cpu#set:r
  local.get $0
  local.get $1
  i32.load16_u offset=28
  call $src/assembly/Z80Cpu/Z80Cpu#set:sp
  local.get $0
  local.get $1
  i32.load offset=52
  i32.store offset=40
  local.get $0
  local.get $1
  i32.load offset=48
  i32.const 32
  i32.shl
  i64.extend_i32_u
  local.get $1
  i32.load offset=44
  i64.extend_i32_u
  i64.or
  i64.store offset=32
  local.get $0
  local.get $1
  i32.load8_u offset=56
  i32.store8 offset=44
  local.get $0
  local.get $1
  i32.load8_u offset=38
  call $src/assembly/Z80Cpu/Z80Cpu#set:wh
  local.get $0
  local.get $1
  i32.load8_u offset=39
  call $src/assembly/Z80Cpu/Z80Cpu#set:wl
  local.get $0
  local.get $1
  i32.load16_u offset=40
  call $src/assembly/Z80Cpu/Z80Cpu#set:wz
 )
 (func $src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine#set:machineState (; 137 ;) (param $0 i32) (param $1 i32)
  local.get $0
  i32.load
  local.get $1
  call $src/assembly/test-machine/WaTestZ80Cpu/WaTestZ80Cpu#updateCpuState
 )
 (func $src/assembly/index/updateTestMachineState (; 138 ;) (param $0 i32) (param $1 i32) (result i32)
  global.get $src/assembly/index/testMachinePool
  local.get $0
  call $src/assembly/ObjectPool/ObjectPool<src/assembly/Z80Cpu/Z80Cpu>#get
  local.tee $0
  i32.eqz
  if
   local.get $0
   call $~lib/rt/pure/__release
   i32.const 0
   return
  end
  local.get $0
  local.get $1
  call $src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine#set:machineState
  local.get $0
  call $~lib/rt/pure/__release
  i32.const 1
 )
 (func $src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine#get:memory (; 139 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load
  i32.load offset=76
  i32.load
  call $~lib/rt/pure/__retain
 )
 (func $src/assembly/index/getTestMachineMemory (; 140 ;) (param $0 i32) (result i32)
  (local $1 i32)
  global.get $src/assembly/index/testMachinePool
  local.get $0
  call $src/assembly/ObjectPool/ObjectPool<src/assembly/Z80Cpu/Z80Cpu>#get
  local.tee $0
  if (result i32)
   local.get $0
   call $src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine#get:memory
  else
   i32.const 0
  end
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine#set:memory (; 141 ;) (param $0 i32) (param $1 i32)
  (local $2 i32)
  local.get $0
  i32.load
  i32.load offset=76
  local.tee $0
  local.get $1
  local.get $0
  i32.load
  local.tee $0
  i32.ne
  if
   local.get $1
   call $~lib/rt/pure/__retain
   local.set $1
   local.get $0
   call $~lib/rt/pure/__release
  end
  local.get $1
  i32.store
 )
 (func $src/assembly/index/updateTestMachineMemory (; 142 ;) (param $0 i32) (param $1 i32) (result i32)
  global.get $src/assembly/index/testMachinePool
  local.get $0
  call $src/assembly/ObjectPool/ObjectPool<src/assembly/Z80Cpu/Z80Cpu>#get
  local.tee $0
  i32.eqz
  if
   local.get $0
   call $~lib/rt/pure/__release
   i32.const 0
   return
  end
  local.get $0
  local.get $1
  call $src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine#set:memory
  local.get $0
  call $~lib/rt/pure/__release
  i32.const 1
 )
 (func $~lib/typedarray/Uint8Array#get:length (; 143 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=8
 )
 (func $~lib/typedarray/Uint8Array#__get (; 144 ;) (param $0 i32) (param $1 i32) (result i32)
  local.get $1
  local.get $0
  i32.load offset=8
  i32.ge_u
  if
   i32.const 240
   i32.const 1568
   i32.const 152
   i32.const 44
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  local.get $0
  i32.load offset=4
  i32.add
  i32.load8_u
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#reset (; 145 ;) (param $0 i32)
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#executeReset
 )
 (func $src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine#initCode (; 146 ;) (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  local.get $1
  local.set $4
  local.get $0
  i32.load
  i32.load offset=76
  i32.load
  local.set $5
  i32.const 0
  local.set $1
  loop $for-loop|0
   local.get $1
   local.get $4
   i32.load offset=8
   i32.lt_s
   if
    local.get $2
    local.tee $6
    i32.const 1
    i32.add
    local.set $2
    local.get $5
    local.get $6
    i32.const 65535
    i32.and
    local.get $4
    local.get $1
    call $~lib/typedarray/Uint8Array#__get
    call $~lib/array/Array<u8>#__set
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
  local.get $0
  i32.const 0
  i32.store16 offset=4
  local.get $2
  i32.const 65535
  i32.and
  local.set $1
  loop $while-continue|1
   local.get $1
   i32.const 65536
   i32.lt_s
   if
    local.get $1
    local.tee $2
    i32.const 1
    i32.add
    local.set $1
    local.get $5
    local.get $2
    i32.const 0
    call $~lib/array/Array<u8>#__set
    br $while-continue|1
   end
  end
  local.get $0
  i32.load
  call $src/assembly/Z80Cpu/Z80Cpu#executeReset
  local.get $0
  i32.load
  local.get $3
  call $src/assembly/Z80Cpu/Z80Cpu#set:pc
 )
 (func $src/assembly/index/initTestMachineCode (; 147 ;) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  global.get $src/assembly/index/testMachinePool
  local.get $0
  call $src/assembly/ObjectPool/ObjectPool<src/assembly/Z80Cpu/Z80Cpu>#get
  local.tee $0
  i32.eqz
  if
   local.get $0
   call $~lib/rt/pure/__release
   i32.const 0
   return
  end
  local.get $0
  local.get $1
  i32.store offset=8
  local.get $0
  local.get $2
  i32.const 0
  i32.const 0
  call $src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine#initCode
  local.get $0
  call $~lib/rt/pure/__release
  i32.const 1
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#writeMemory (; 148 ;) (param $0 i32) (param $1 i32) (param $2 i32)
  nop
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#readMemory (; 149 ;) (param $0 i32) (param $1 i32) (result i32)
  i32.const 255
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#executeInterrupt (; 150 ;) (param $0 i32)
  (local $1 i32)
  local.get $0
  i32.load offset=40
  i32.const 8
  i32.and
  if
   local.get $0
   local.get $0
   i32.load16_u offset=18
   i32.const 1
   i32.add
   i32.store16 offset=18
   local.get $0
   local.get $0
   i32.load offset=40
   i32.const 247
   i32.and
   i32.store offset=40
  end
  local.get $0
  i32.const 0
  i32.store8 offset=45
  local.get $0
  i32.const 0
  i32.store8 offset=46
  local.get $0
  local.get $0
  i32.load16_u offset=20
  i32.const 1
  i32.sub
  call $src/assembly/Z80Cpu/Z80Cpu#set:sp
  local.get $0
  local.get $0
  i64.load offset=32
  i64.const 1
  i64.add
  i64.store offset=32
  local.get $0
  i32.load16_u offset=20
  drop
  local.get $0
  i32.load16_u offset=18
  drop
  local.get $0
  local.get $0
  i64.load offset=32
  i64.const 3
  i64.add
  i64.store offset=32
  local.get $0
  local.get $0
  i32.load16_u offset=20
  i32.const 1
  i32.sub
  call $src/assembly/Z80Cpu/Z80Cpu#set:sp
  local.get $0
  i32.load16_u offset=20
  drop
  local.get $0
  i32.load16_u offset=18
  drop
  local.get $0
  local.get $0
  i64.load offset=32
  i64.const 3
  i64.add
  i64.store offset=32
  block $break|0
   local.get $0
   i32.load8_u offset=47
   local.tee $1
   i32.eqz
   local.get $1
   i32.const 1
   i32.eq
   i32.or
   if
    local.get $0
    i32.const 56
    call $src/assembly/Z80Cpu/Z80Cpu#set:wz
    local.get $0
    local.get $0
    i64.load offset=32
    i64.const 5
    i64.add
    i64.store offset=32
    br $break|0
   end
   local.get $0
   local.get $0
   i64.load offset=32
   i64.const 2
   i64.add
   i64.store offset=32
   local.get $0
   i32.load8_u offset=17
   local.get $0
   i32.load8_u offset=16
   i32.const 8
   i32.shl
   i32.or
   drop
   local.get $0
   local.get $0
   i64.load offset=32
   i64.const 5
   i64.add
   i64.store offset=32
   local.get $0
   local.get $0
   i64.load offset=32
   i64.const 3
   i64.add
   i64.store offset=32
   local.get $0
   local.get $0
   i64.load offset=32
   i64.const 3
   i64.add
   i64.store offset=32
   local.get $0
   i32.const 255
   call $src/assembly/Z80Cpu/Z80Cpu#set:wz
   local.get $0
   local.get $0
   i64.load offset=32
   i64.const 6
   i64.add
   i64.store offset=32
  end
  local.get $0
  local.get $0
  i32.load16_u offset=26
  call $src/assembly/Z80Cpu/Z80Cpu#set:pc
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#refreshMemory (; 151 ;) (param $0 i32)
  local.get $0
  local.get $0
  i32.load8_u offset=17
  i32.const 1
  i32.add
  i32.const 127
  i32.and
  local.get $0
  i32.load8_u offset=17
  i32.const 128
  i32.and
  i32.or
  call $src/assembly/Z80Cpu/Z80Cpu#set:r
  local.get $0
  local.get $0
  i64.load offset=32
  i64.const 1
  i64.add
  i64.store offset=32
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#executeNmi (; 152 ;) (param $0 i32)
  local.get $0
  i32.load offset=40
  i32.const 8
  i32.and
  if
   local.get $0
   local.get $0
   i32.load16_u offset=18
   i32.const 1
   i32.add
   i32.store16 offset=18
   local.get $0
   local.get $0
   i32.load offset=40
   i32.const 247
   i32.and
   i32.store offset=40
  end
  local.get $0
  local.get $0
  i32.load8_u offset=45
  i32.store8 offset=46
  local.get $0
  i32.const 0
  i32.store8 offset=45
  local.get $0
  local.get $0
  i32.load16_u offset=20
  i32.const 1
  i32.sub
  call $src/assembly/Z80Cpu/Z80Cpu#set:sp
  local.get $0
  local.get $0
  i64.load offset=32
  i64.const 1
  i64.add
  i64.store offset=32
  local.get $0
  i32.load16_u offset=20
  drop
  local.get $0
  i32.load16_u offset=18
  drop
  local.get $0
  local.get $0
  i64.load offset=32
  i64.const 3
  i64.add
  i64.store offset=32
  local.get $0
  local.get $0
  i32.load16_u offset=20
  i32.const 1
  i32.sub
  call $src/assembly/Z80Cpu/Z80Cpu#set:sp
  local.get $0
  i32.load16_u offset=20
  drop
  local.get $0
  i32.load16_u offset=18
  drop
  local.get $0
  local.get $0
  i64.load offset=32
  i64.const 3
  i64.add
  i64.store offset=32
  local.get $0
  i32.const 102
  call $src/assembly/Z80Cpu/Z80Cpu#set:pc
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#processCpuSignals (; 153 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=40
  i32.const 1
  i32.and
  if (result i32)
   local.get $0
   i32.load8_u offset=48
   i32.eqz
  else
   i32.const 0
  end
  if (result i32)
   local.get $0
   i32.load8_u offset=45
  else
   i32.const 0
  end
  if
   local.get $0
   call $src/assembly/Z80Cpu/Z80Cpu#executeInterrupt
   i32.const 1
   return
  end
  local.get $0
  i32.load offset=40
  i32.const 8
  i32.and
  if
   local.get $0
   local.get $0
   i64.load offset=32
   i64.const 3
   i64.add
   i64.store offset=32
   local.get $0
   call $src/assembly/Z80Cpu/Z80Cpu#refreshMemory
   i32.const 1
   return
  end
  local.get $0
  i32.load offset=40
  i32.const 4
  i32.and
  if
   local.get $0
   call $src/assembly/Z80Cpu/Z80Cpu#executeReset
   i32.const 1
   return
  end
  local.get $0
  i32.load offset=40
  i32.const 2
  i32.and
  if
   local.get $0
   call $src/assembly/Z80Cpu/Z80Cpu#executeNmi
   i32.const 1
   return
  end
  i32.const 0
 )
 (func $~lib/typedarray/Uint32Array#__get (; 154 ;) (param $0 i32) (param $1 i32) (result i32)
  local.get $1
  local.get $0
  i32.load offset=8
  i32.const 2
  i32.shr_u
  i32.ge_u
  if
   i32.const 240
   i32.const 1568
   i32.const 792
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
  i32.load
 )
 (func $src/assembly/MemoryStatusArray/MemoryStatusArray#touch (; 155 ;) (param $0 i32) (param $1 i32)
  (local $2 i32)
  local.get $0
  i32.load
  local.get $1
  i32.const 65535
  i32.and
  local.tee $1
  i32.const 5
  i32.shr_u
  local.tee $2
  local.get $0
  i32.load
  local.get $2
  call $~lib/typedarray/Uint32Array#__get
  i32.const 1
  local.get $1
  i32.const 31
  i32.and
  i32.shl
  i32.or
  call $~lib/typedarray/Uint32Array#__set
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#readCodeMemory (; 156 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=52
  local.get $0
  i32.load16_u offset=18
  call $src/assembly/MemoryStatusArray/MemoryStatusArray#touch
  local.get $0
  i32.load16_u offset=18
  drop
  i32.const 255
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#executeCpuCycle (; 157 ;) (param $0 i32)
  local.get $0
  i32.load offset=40
  if (result i32)
   local.get $0
   call $src/assembly/Z80Cpu/Z80Cpu#processCpuSignals
  else
   i32.const 0
  end
  if
   return
  end
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#readCodeMemory
  drop
  local.get $0
  local.get $0
  i64.load offset=32
  i64.const 3
  i64.add
  i64.store offset=32
  local.get $0
  local.get $0
  i32.load16_u offset=18
  i32.const 1
  i32.add
  i32.store16 offset=18
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#refreshMemory
 )
 (func $src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine#run (; 158 ;) (param $0 i32)
  (local $1 i32)
  loop $while-continue|0
   local.get $1
   i32.eqz
   if
    local.get $0
    i32.load
    call $src/assembly/Z80Cpu/Z80Cpu#executeCpuCycle
    block $break|1 (result i32)
     block $case4|1
      block $case3|1
       block $case2|1
        block $case1|1
         local.get $0
         i32.load offset=8
         local.tee $1
         i32.eqz
         br_if $case1|1
         block $tablify|0
          local.get $1
          i32.const 1
          i32.sub
          br_table $case1|1 $case2|1 $case3|1 $tablify|0
         end
         br $case4|1
        end
        i32.const 1
        br $break|1
       end
       local.get $0
       i32.load
       i32.load8_u offset=49
       i32.eqz
       br $break|1
      end
      local.get $0
      i32.load
      i32.load offset=40
      i32.const 8
      i32.and
      i32.const 0
      i32.ne
      br $break|1
     end
     local.get $0
     i32.load
     i32.load16_u offset=18
     local.get $0
     i32.load16_u offset=4
     i32.ge_u
    end
    local.set $1
    br $while-continue|0
   end
  end
 )
 (func $src/assembly/index/runTestMachine (; 159 ;) (param $0 i32) (result i32)
  global.get $src/assembly/index/testMachinePool
  local.get $0
  call $src/assembly/ObjectPool/ObjectPool<src/assembly/Z80Cpu/Z80Cpu>#get
  local.tee $0
  i32.eqz
  if
   local.get $0
   call $~lib/rt/pure/__release
   i32.const 0
   return
  end
  local.get $0
  call $src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine#run
  local.get $0
  call $~lib/rt/pure/__release
  i32.const 1
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:tacts (; 160 ;) (param $0 i32) (result i64)
  local.get $0
  i64.load offset=32
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:tacts (; 161 ;) (param $0 i32) (param $1 i64)
  local.get $0
  local.get $1
  i64.store offset=32
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:stateFlags (; 162 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=40
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:stateFlags (; 163 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store offset=40
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:useGateArrayContention (; 164 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=44
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:useGateArrayContention (; 165 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=44
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:iff1 (; 166 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=45
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:iff1 (; 167 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=45
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:iff2 (; 168 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=46
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:iff2 (; 169 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=46
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:interruptMode (; 170 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=47
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:interruptMode (; 171 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=47
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:isInterruptBlocked (; 172 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=48
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:isInterruptBlocked (; 173 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=48
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:isInOpExecution (; 174 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=49
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:isInOpExecution (; 175 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=49
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:executionFlowStatus (; 176 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=52
  call $~lib/rt/pure/__retain
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:memoryReadStatus (; 177 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=56
  call $~lib/rt/pure/__retain
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:memoryWriteStatus (; 178 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=60
  call $~lib/rt/pure/__retain
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:prefixMode (; 179 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=64
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:prefixMode (; 180 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store offset=64
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:indexMode (; 181 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=68
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:indexMode (; 182 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store offset=68
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:maskableInterruptModeEntered (; 183 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=72
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:maskableInterruptModeEntered (; 184 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=72
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:opCode (; 185 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=73
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:opCode (; 186 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=73
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:allowExtendedInstructionSet (; 187 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=74
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:allowExtendedInstructionSet (; 188 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=74
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#getReg8 (; 189 ;) (param $0 i32) (param $1 i32) (result i32)
  block $case7|0
   block $case6|0
    block $case5|0
     block $case4|0
      block $case3|0
       block $case2|0
        block $case1|0
         local.get $1
         i32.const 255
         i32.and
         local.tee $1
         if
          local.get $1
          i32.const 1
          i32.sub
          br_table $case1|0 $case2|0 $case3|0 $case4|0 $case5|0 $case7|0 $case6|0 $case7|0
         end
         local.get $0
         i32.load16_u offset=2
         i32.const 8
         i32.shr_u
         return
        end
        local.get $0
        i32.load16_u offset=2
        i32.const 255
        i32.and
        return
       end
       local.get $0
       i32.load16_u offset=4
       i32.const 8
       i32.shr_u
       return
      end
      local.get $0
      i32.load16_u offset=4
      i32.const 255
      i32.and
      return
     end
     local.get $0
     i32.load16_u offset=6
     i32.const 8
     i32.shr_u
     return
    end
    local.get $0
    i32.load16_u offset=6
    i32.const 255
    i32.and
    return
   end
   local.get $0
   i32.load16_u
   i32.const 8
   i32.shr_u
   return
  end
  i32.const 255
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#setReg8 (; 190 ;) (param $0 i32) (param $1 i32) (param $2 i32)
  block $break|0
   block $case6|0
    block $case5|0
     block $case4|0
      block $case3|0
       block $case2|0
        block $case1|0
         local.get $1
         i32.const 255
         i32.and
         local.tee $1
         if
          local.get $1
          i32.const 1
          i32.sub
          br_table $case1|0 $case2|0 $case3|0 $case4|0 $case5|0 $break|0 $case6|0 $break|0
         end
         local.get $0
         local.get $2
         call $src/assembly/Z80Cpu/Z80Cpu#set:b
         br $break|0
        end
        local.get $0
        local.get $2
        call $src/assembly/Z80Cpu/Z80Cpu#set:c
        br $break|0
       end
       local.get $0
       local.get $2
       call $src/assembly/Z80Cpu/Z80Cpu#set:d
       br $break|0
      end
      local.get $0
      local.get $2
      call $src/assembly/Z80Cpu/Z80Cpu#set:e
      br $break|0
     end
     local.get $0
     local.get $2
     call $src/assembly/Z80Cpu/Z80Cpu#set:h
     br $break|0
    end
    local.get $0
    local.get $2
    call $src/assembly/Z80Cpu/Z80Cpu#set:l
    br $break|0
   end
   local.get $0
   local.get $2
   call $src/assembly/Z80Cpu/Z80Cpu#set:a
  end
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#getReg16 (; 191 ;) (param $0 i32) (param $1 i32) (result i32)
  block $case4|0
   block $case3|0
    block $case2|0
     block $case1|0
      local.get $1
      i32.const 255
      i32.and
      local.tee $1
      if
       local.get $1
       i32.const 1
       i32.sub
       br_table $case1|0 $case2|0 $case3|0 $case4|0
      end
      local.get $0
      i32.load16_u offset=2
      return
     end
     local.get $0
     i32.load16_u offset=4
     return
    end
    local.get $0
    i32.load16_u offset=6
    return
   end
   local.get $0
   i32.load16_u offset=20
   return
  end
  i32.const 65535
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#setReg16 (; 192 ;) (param $0 i32) (param $1 i32) (param $2 i32)
  block $break|0
   block $case3|0
    block $case2|0
     block $case1|0
      local.get $1
      i32.const 255
      i32.and
      local.tee $1
      if
       local.get $1
       i32.const 1
       i32.sub
       br_table $case1|0 $case2|0 $case3|0 $break|0
      end
      local.get $0
      local.get $2
      i32.const 255
      i32.and
      call $src/assembly/Z80Cpu/Z80Cpu#set:bc
      br $break|0
     end
     local.get $0
     local.get $2
     i32.const 255
     i32.and
     call $src/assembly/Z80Cpu/Z80Cpu#set:de
     br $break|0
    end
    local.get $0
    local.get $2
    i32.const 255
    i32.and
    call $src/assembly/Z80Cpu/Z80Cpu#set:hl
    br $break|0
   end
   local.get $0
   local.get $2
   i32.const 255
   i32.and
   call $src/assembly/Z80Cpu/Z80Cpu#set:sp
  end
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:sFlag (; 193 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u
  i32.const 128
  i32.and
  i32.const 0
  i32.ne
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:zFlag (; 194 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u
  i32.const 64
  i32.and
  i32.const 0
  i32.ne
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:r5Flag (; 195 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u
  i32.const 32
  i32.and
  i32.const 0
  i32.ne
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:hFlag (; 196 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u
  i32.const 16
  i32.and
  i32.const 0
  i32.ne
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:r3Flag (; 197 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u
  i32.const 8
  i32.and
  i32.const 0
  i32.ne
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:pvFlag (; 198 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u
  i32.const 4
  i32.and
  i32.const 0
  i32.ne
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:nFlag (; 199 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u
  i32.const 2
  i32.and
  i32.const 0
  i32.ne
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:cFlag (; 200 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u
  i32.const 1
  i32.and
  i32.const 0
  i32.ne
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#delay (; 201 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $0
  i64.load offset=32
  local.get $1
  i64.extend_i32_s
  i64.add
  i64.store offset=32
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#getCallInstructionLength (; 202 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=18
  drop
  i32.const 1
 )
 (func "$~lib/array/Array<((cpu: src/assembly/Z80Cpu/Z80Cpu) => void) | null>#__get" (; 203 ;) (param $0 i32) (param $1 i32) (result i32)
  local.get $1
  local.get $0
  i32.load offset=12
  i32.ge_u
  if
   i32.const 240
   i32.const 304
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
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#processStandardOrIndexedOperations (; 204 ;) (param $0 i32)
  (local $1 i32)
  local.get $0
  i32.load offset=68
  if (result i32)
   i32.const 1376
   local.get $0
   i32.load8_u offset=73
   call "$~lib/array/Array<((cpu: src/assembly/Z80Cpu/Z80Cpu) => void) | null>#__get"
  else
   i32.const 1184
   local.get $0
   i32.load8_u offset=73
   call "$~lib/array/Array<((cpu: src/assembly/Z80Cpu/Z80Cpu) => void) | null>#__get"
  end
  local.tee $1
  if
   i32.const 1
   global.set $~argumentsLength
   local.get $0
   local.get $1
   call_indirect (type $i32_=>_none)
  end
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#processEDOperations (; 205 ;) (param $0 i32)
  (local $1 i32)
  i32.const 1248
  local.get $0
  i32.load8_u offset=73
  call "$~lib/array/Array<((cpu: src/assembly/Z80Cpu/Z80Cpu) => void) | null>#__get"
  local.tee $1
  if
   i32.const 1
   global.set $~argumentsLength
   local.get $0
   local.get $1
   call_indirect (type $i32_=>_none)
  end
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#processCBPrefixedOperations (; 206 ;) (param $0 i32)
  (local $1 i32)
  local.get $0
  i32.load offset=68
  i32.eqz
  if
   i32.const 1312
   local.get $0
   i32.load8_u offset=73
   call "$~lib/array/Array<((cpu: src/assembly/Z80Cpu/Z80Cpu) => void) | null>#__get"
   local.tee $1
   if
    i32.const 1
    global.set $~argumentsLength
    local.get $0
    local.get $1
    call_indirect (type $i32_=>_none)
   end
   return
  end
  local.get $0
  local.get $0
  i32.load offset=68
  i32.const 1
  i32.eq
  if (result i32)
   local.get $0
   i32.load16_u offset=22
  else
   local.get $0
   i32.load16_u offset=24
  end
  local.get $0
  i32.load8_s offset=73
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:wz
  local.get $0
  i32.load8_u offset=44
  i32.eqz
  if
   local.get $0
   i32.load16_u offset=18
   drop
  end
  local.get $0
  local.get $0
  i64.load offset=32
  i64.const 1
  i64.add
  i64.store offset=32
  local.get $0
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#readCodeMemory
  i32.store8 offset=73
  local.get $0
  local.get $0
  i64.load offset=32
  i64.const 3
  i64.add
  i64.store offset=32
  local.get $0
  local.get $0
  i32.load16_u offset=18
  i32.const 1
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:pc
  i32.const 1440
  local.get $0
  i32.load8_u offset=73
  call "$~lib/array/Array<((cpu: src/assembly/Z80Cpu/Z80Cpu) => void) | null>#__get"
  local.tee $1
  if
   i32.const 2
   global.set $~argumentsLength
   local.get $0
   local.get $0
   i32.load16_u offset=26
   local.get $1
   call_indirect (type $i32_i32_=>_none)
  end
 )
 (func $src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine#get:cpu (; 207 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load
  call $~lib/rt/pure/__retain
 )
 (func $src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine#set:runMode (; 208 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store offset=8
 )
 (func $src/assembly/test-machine/WaTestZ80Cpu/TestMemoryDevice#get:log (; 209 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=4
  call $~lib/rt/pure/__retain
 )
 (func $src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine#get:memoryAccessLog (; 210 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load
  i32.load offset=76
  call $src/assembly/test-machine/WaTestZ80Cpu/TestMemoryDevice#get:log
 )
 (func $src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine#get:ioAccessLog (; 211 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load
  i32.load offset=80
  call $src/assembly/test-machine/WaTestZ80Cpu/TestMemoryDevice#get:log
 )
 (func $src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine#get:memoryLength (; 212 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load
  i32.load offset=76
  i32.load
  i32.load offset=12
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:a (; 213 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:a (; 214 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:f (; 215 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=1
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:f (; 216 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=1
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:b (; 217 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=4
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:b (; 218 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=4
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:c (; 219 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=5
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:c (; 220 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=5
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:d (; 221 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=8
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:d (; 222 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=8
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:e (; 223 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=9
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:e (; 224 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=9
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:h (; 225 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=12
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:h (; 226 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=12
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:l (; 227 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=13
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:l (; 228 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=13
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:af_sec (; 229 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=16
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:af_sec (; 230 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=16
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:i (; 231 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=24
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:i (; 232 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=24
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:r (; 233 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=25
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:r (; 234 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=25
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:sp (; 235 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=28
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:sp (; 236 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=28
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:xh (; 237 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=30
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:xh (; 238 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=30
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:xl (; 239 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=31
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:xl (; 240 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=31
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:ix (; 241 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=32
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:ix (; 242 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=32
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:yh (; 243 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=34
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:yh (; 244 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=34
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:yl (; 245 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=35
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:yl (; 246 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=35
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:iy (; 247 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=36
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:iy (; 248 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=36
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:wh (; 249 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=38
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:wh (; 250 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=38
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:wl (; 251 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=39
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:wl (; 252 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=39
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:wz (; 253 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=40
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:wz (; 254 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=40
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:tactsL (; 255 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=44
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:tactsL (; 256 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store offset=44
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:tactsH (; 257 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=48
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:tactsH (; 258 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store offset=48
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:stateFlags (; 259 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=52
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:stateFlags (; 260 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store offset=52
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:useGateArrayContention (; 261 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=56
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:useGateArrayContention (; 262 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=56
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:iff1 (; 263 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=57
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:iff1 (; 264 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=57
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:iff2 (; 265 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=58
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:iff2 (; 266 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=58
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:interruptMode (; 267 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=59
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:interruptMode (; 268 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=59
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:isInterruptBlocked (; 269 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=60
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:isInterruptBlocked (; 270 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=60
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:isInOpExecution (; 271 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=61
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:isInOpExecution (; 272 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=61
 )
 (func $~start (; 273 ;)
  call $start:src/assembly/Z80Cpu
  call $src/assembly/ObjectPool/ObjectPool<src/assembly/Z80Cpu/Z80Cpu>#constructor
  global.set $src/assembly/index/cpuPool
  call $src/assembly/ObjectPool/ObjectPool<src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine>#constructor
  global.set $src/assembly/index/testMachinePool
 )
 (func $~lib/rt/pure/markGray (; 274 ;) (param $0 i32)
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
 (func $~lib/rt/pure/scanBlack (; 275 ;) (param $0 i32)
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
 (func $~lib/rt/pure/scan (; 276 ;) (param $0 i32)
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
 (func $~lib/rt/pure/collectWhite (; 277 ;) (param $0 i32)
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
 (func $~lib/rt/pure/__collect (; 278 ;)
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
 (func $~lib/rt/__typeinfo (; 279 ;) (param $0 i32) (result i32)
  local.get $0
  i32.const 1776
  i32.load
  i32.gt_u
  if
   i32.const 240
   i32.const 1744
   i32.const 22
   i32.const 27
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  i32.const 3
  i32.shl
  i32.const 1780
  i32.add
  i32.load
 )
 (func $~lib/rt/pure/growRoots (; 280 ;)
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
 (func $~lib/rt/pure/appendRoot (; 281 ;) (param $0 i32)
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
 (func $~lib/rt/pure/decrement (; 282 ;) (param $0 i32)
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
 (func $~lib/rt/pure/__visit (; 283 ;) (param $0 i32) (param $1 i32)
  local.get $0
  i32.const 1996
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
 (func $~lib/array/Array<src/assembly/Z80Cpu/Z80Cpu | null>#__visit_impl (; 284 ;) (param $0 i32) (param $1 i32)
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
 (func $~lib/rt/__visit_members (; 285 ;) (param $0 i32) (param $1 i32)
  (local $2 i32)
  block $block$7$break
   block $block$4$break
    block $switch$1$default
     block $switch$1$case$27
      block $switch$1$case$24
       block $switch$1$case$22
        block $switch$1$case$21
         block $switch$1$case$18
          block $switch$1$case$15
           block $switch$1$case$13
            block $switch$1$case$2
             local.get $0
             i32.const 8
             i32.sub
             i32.load
             br_table $switch$1$case$2 $switch$1$case$2 $block$4$break $block$4$break $block$4$break $block$7$break $block$4$break $block$4$break $block$4$break $block$4$break $block$4$break $switch$1$case$13 $block$4$break $switch$1$case$15 $block$4$break $block$4$break $switch$1$case$18 $switch$1$case$13 $switch$1$case$2 $switch$1$case$21 $switch$1$case$22 $switch$1$case$2 $switch$1$case$24 $switch$1$case$2 $switch$1$case$13 $switch$1$case$27 $block$4$break $switch$1$default
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
         i32.load offset=76
         local.tee $2
         if
          local.get $2
          local.get $1
          call $~lib/rt/pure/__visit
         end
         local.get $0
         i32.load offset=80
         local.tee $2
         if
          local.get $2
          local.get $1
          call $~lib/rt/pure/__visit
         end
         br $block$7$break
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
  i32.load offset=52
  local.tee $2
  if
   local.get $2
   local.get $1
   call $~lib/rt/pure/__visit
  end
  local.get $0
  i32.load offset=56
  local.tee $2
  if
   local.get $2
   local.get $1
   call $~lib/rt/pure/__visit
  end
  local.get $0
  i32.load offset=60
  local.tee $0
  if
   local.get $0
   local.get $1
   call $~lib/rt/pure/__visit
  end
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#constructor|trampoline (; 286 ;) (param $0 i32) (param $1 i32) (result i32)
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
 (func $src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine#initCode|trampoline (; 287 ;) (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  block $2of2
   block $1of2
    block $0of2
     block $outOfRange
      global.get $~argumentsLength
      i32.const 1
      i32.sub
      br_table $0of2 $1of2 $2of2 $outOfRange
     end
     unreachable
    end
    i32.const 0
    local.set $2
   end
   i32.const 0
   local.set $3
  end
  local.get $0
  local.get $1
  local.get $2
  local.get $3
  call $src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine#initCode
 )
)
