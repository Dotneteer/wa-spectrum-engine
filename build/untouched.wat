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
 (data (i32.const 192) "\10\00\00\00\01\00\00\00\03\00\00\00\10\00\00\00\c0\00\00\00\c0\00\00\00\00\00\00\00\00\00\00\00")
 (data (i32.const 224) "$\00\00\00\01\00\00\00\01\00\00\00$\00\00\00I\00n\00d\00e\00x\00 \00o\00u\00t\00 \00o\00f\00 \00r\00a\00n\00g\00e\00")
 (data (i32.const 288) "\1a\00\00\00\01\00\00\00\01\00\00\00\1a\00\00\00~\00l\00i\00b\00/\00a\00r\00r\00a\00y\00.\00t\00s\00")
 (data (i32.const 336) "\1c\00\00\00\01\00\00\00\01\00\00\00\1c\00\00\00I\00n\00v\00a\00l\00i\00d\00 \00l\00e\00n\00g\00t\00h\00")
 (data (i32.const 384) "\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00")
 (data (i32.const 400) "\10\00\00\00\01\00\00\00\03\00\00\00\10\00\00\00\90\01\00\00\90\01\00\00\00\00\00\00\00\00\00\00")
 (data (i32.const 432) "\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00")
 (data (i32.const 448) "\10\00\00\00\01\00\00\00\03\00\00\00\10\00\00\00\c0\01\00\00\c0\01\00\00\00\00\00\00\00\00\00\00")
 (data (i32.const 480) "\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00")
 (data (i32.const 496) "\10\00\00\00\01\00\00\00\03\00\00\00\10\00\00\00\f0\01\00\00\f0\01\00\00\00\00\00\00\00\00\00\00")
 (data (i32.const 528) "\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00")
 (data (i32.const 544) "\10\00\00\00\01\00\00\00\03\00\00\00\10\00\00\00 \02\00\00 \02\00\00\00\00\00\00\00\00\00\00")
 (data (i32.const 576) "\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00")
 (data (i32.const 592) "\10\00\00\00\01\00\00\00\03\00\00\00\10\00\00\00P\02\00\00P\02\00\00\00\00\00\00\00\00\00\00")
 (data (i32.const 624) "\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00")
 (data (i32.const 640) "\10\00\00\00\01\00\00\00\04\00\00\00\10\00\00\00\80\02\00\00\80\02\00\00\00\00\00\00\00\00\00\00")
 (data (i32.const 672) "\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00")
 (data (i32.const 688) "\10\00\00\00\01\00\00\00\03\00\00\00\10\00\00\00\b0\02\00\00\b0\02\00\00\00\00\00\00\00\00\00\00")
 (data (i32.const 720) "\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00")
 (data (i32.const 736) "\10\00\00\00\01\00\00\00\04\00\00\00\10\00\00\00\e0\02\00\00\e0\02\00\00\00\00\00\00\00\00\00\00")
 (data (i32.const 768) "\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00")
 (data (i32.const 784) "\10\00\00\00\01\00\00\00\03\00\00\00\10\00\00\00\10\03\00\00\10\03\00\00\00\00\00\00\00\00\00\00")
 (data (i32.const 816) "\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00")
 (data (i32.const 832) "\10\00\00\00\01\00\00\00\03\00\00\00\10\00\00\00@\03\00\00@\03\00\00\00\00\00\00\00\00\00\00")
 (data (i32.const 864) "\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00")
 (data (i32.const 880) "\10\00\00\00\01\00\00\00\03\00\00\00\10\00\00\00p\03\00\00p\03\00\00\00\00\00\00\00\00\00\00")
 (data (i32.const 912) "\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00")
 (data (i32.const 928) "\10\00\00\00\01\00\00\00\03\00\00\00\10\00\00\00\a0\03\00\00\a0\03\00\00\00\00\00\00\00\00\00\00")
 (data (i32.const 960) "\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00")
 (data (i32.const 976) "\10\00\00\00\01\00\00\00\03\00\00\00\10\00\00\00\d0\03\00\00\d0\03\00\00\00\00\00\00\00\00\00\00")
 (data (i32.const 1008) "\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00")
 (data (i32.const 1024) "\10\00\00\00\01\00\00\00\03\00\00\00\10\00\00\00\00\04\00\00\00\04\00\00\00\00\00\00\00\00\00\00")
 (data (i32.const 1056) " \00\00\00\01\00\00\00\00\00\00\00 \00\00\00\01\00\00\00\02\00\00\00\03\00\00\00\04\00\00\00\05\00\00\00\06\00\00\00\07\00\00\00\08\00\00\00")
 (data (i32.const 1104) "\10\00\00\00\01\00\00\00\08\00\00\00\10\00\00\000\04\00\000\04\00\00 \00\00\00\08\00\00\00")
 (data (i32.const 1136) "\08\00\00\00\01\00\00\00\00\00\00\00\08\00\00\00\00\00\00\00\t\00\00\00")
 (data (i32.const 1168) "\10\00\00\00\01\00\00\00\t\00\00\00\10\00\00\00\80\04\00\00\80\04\00\00\08\00\00\00\02\00\00\00")
 (data (i32.const 1200) "\08\00\00\00\01\00\00\00\00\00\00\00\08\00\00\00\00\00\00\00\t\00\00\00")
 (data (i32.const 1232) "\10\00\00\00\01\00\00\00\t\00\00\00\10\00\00\00\c0\04\00\00\c0\04\00\00\08\00\00\00\02\00\00\00")
 (data (i32.const 1264) "\08\00\00\00\01\00\00\00\00\00\00\00\08\00\00\00\00\00\00\00\t\00\00\00")
 (data (i32.const 1296) "\10\00\00\00\01\00\00\00\t\00\00\00\10\00\00\00\00\05\00\00\00\05\00\00\08\00\00\00\02\00\00\00")
 (data (i32.const 1328) "\08\00\00\00\01\00\00\00\00\00\00\00\08\00\00\00\00\00\00\00\t\00\00\00")
 (data (i32.const 1360) "\10\00\00\00\01\00\00\00\t\00\00\00\10\00\00\00@\05\00\00@\05\00\00\08\00\00\00\02\00\00\00")
 (data (i32.const 1392) "\08\00\00\00\01\00\00\00\00\00\00\00\08\00\00\00\00\00\00\00\n\00\00\00")
 (data (i32.const 1424) "\10\00\00\00\01\00\00\00\n\00\00\00\10\00\00\00\80\05\00\00\80\05\00\00\08\00\00\00\02\00\00\00")
 (data (i32.const 1456) "\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00")
 (data (i32.const 1472) "\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00")
 (data (i32.const 1488) "&\00\00\00\01\00\00\00\01\00\00\00&\00\00\00~\00l\00i\00b\00/\00a\00r\00r\00a\00y\00b\00u\00f\00f\00e\00r\00.\00t\00s\00")
 (data (i32.const 1552) "$\00\00\00\01\00\00\00\01\00\00\00$\00\00\00~\00l\00i\00b\00/\00t\00y\00p\00e\00d\00a\00r\00r\00a\00y\00.\00t\00s\00")
 (data (i32.const 1616) "\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00")
 (data (i32.const 1632) "\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00")
 (data (i32.const 1648) "\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00")
 (data (i32.const 1664) "\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00")
 (data (i32.const 1680) "\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00")
 (data (i32.const 1696) "\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00")
 (data (i32.const 1712) "\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00")
 (data (i32.const 1728) "\14\00\00\00\01\00\00\00\01\00\00\00\14\00\00\00~\00l\00i\00b\00/\00r\00t\00.\00t\00s\00")
 (data (i32.const 1776) "\1b\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\003\00\00\00\02\00\00\00\93\00\00\00\02\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\91\00\00\00\02\00\00\00\93\00\00\00\02\00\00\00\93\10\00\00\02\00\00\00\93\10\00\00\02\00\00\00\10\00\00\00\00\00\00\003\00\00\00\02\00\00\00\930\00\00\02\00\00\00\93\04\00\00\02\00\00\00\10\00\00\00\00\00\00\00\00\00\00\00\05\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\93 \00\00\02\00\00\00\00\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\93 \00\00\02\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\930\00\00\02\00\00\001\00\00\00\02\00\00\00")
 (table $0 15 funcref)
 (elem (i32.const 1) $src/assembly/Z80Cpu/AluADD $src/assembly/Z80Cpu/AluADC $src/assembly/Z80Cpu/AluSUB $src/assembly/Z80Cpu/AluSBC $src/assembly/Z80Cpu/AluAND $src/assembly/Z80Cpu/AluXOR $src/assembly/Z80Cpu/AluOR $src/assembly/Z80Cpu/AluCP $src/assembly/Z80Cpu/LdBcNN $src/assembly/Z80Cpu/LdBcNNIdx $start:src/assembly/index~anonymous|0 $start:src/assembly/index~anonymous|1 $src/assembly/ObjectPool/ObjectPool<src/assembly/Z80Cpu/Z80Cpu>#create~anonymous|0 $src/assembly/ObjectPool/ObjectPool<src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine>#create~anonymous|0)
 (global $~lib/rt/tlsf/ROOT (mut i32) (i32.const 0))
 (global $~lib/rt/tlsf/collectLock (mut i32) (i32.const 0))
 (global $~lib/gc/gc.auto (mut i32) (i32.const 1))
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
 (global $src/assembly/Z80Cpu/FlagsSetMask.S i32 (i32.const 128))
 (global $src/assembly/Z80Cpu/FlagsSetMask.Z i32 (i32.const 64))
 (global $src/assembly/Z80Cpu/FlagsSetMask.R5 i32 (i32.const 32))
 (global $src/assembly/Z80Cpu/FlagsSetMask.H i32 (i32.const 16))
 (global $src/assembly/Z80Cpu/FlagsSetMask.R3 i32 (i32.const 8))
 (global $src/assembly/Z80Cpu/FlagsSetMask.PV i32 (i32.const 4))
 (global $src/assembly/Z80Cpu/FlagsSetMask.N i32 (i32.const 2))
 (global $src/assembly/Z80Cpu/FlagsSetMask.C i32 (i32.const 1))
 (global $src/assembly/Z80Cpu/FlagsSetMask.SZPV i32 (i32.const 196))
 (global $src/assembly/Z80Cpu/FlagsSetMask.NH i32 (i32.const 18))
 (global $src/assembly/Z80Cpu/FlagsSetMask.R3R5 i32 (i32.const 40))
 (global $src/assembly/Z80Cpu/incOpFlags i32 (i32.const 208))
 (global $~lib/ASC_SHRINK_LEVEL i32 (i32.const 0))
 (global $src/assembly/Z80Cpu/decOpFlags i32 (i32.const 416))
 (global $src/assembly/Z80Cpu/daaResults i32 (i32.const 464))
 (global $src/assembly/Z80Cpu/adcFlags i32 (i32.const 512))
 (global $src/assembly/Z80Cpu/sbcFlags i32 (i32.const 560))
 (global $src/assembly/Z80Cpu/aluLogOpFlags i32 (i32.const 608))
 (global $src/assembly/Z80Cpu/rlcFlags i32 (i32.const 656))
 (global $src/assembly/Z80Cpu/rrcFlags i32 (i32.const 704))
 (global $src/assembly/Z80Cpu/rlCarry0Flags i32 (i32.const 752))
 (global $src/assembly/Z80Cpu/rlCarry1Flags i32 (i32.const 800))
 (global $src/assembly/Z80Cpu/rrCarry0Flags i32 (i32.const 848))
 (global $src/assembly/Z80Cpu/rrCarry1Flags i32 (i32.const 896))
 (global $src/assembly/Z80Cpu/sraFlags i32 (i32.const 944))
 (global $src/assembly/Z80Cpu/rolOpResults i32 (i32.const 992))
 (global $src/assembly/Z80Cpu/rorOpResults i32 (i32.const 1040))
 (global $src/assembly/Z80Cpu/aluAlgorithms i32 (i32.const 1120))
 (global $src/assembly/Z80Cpu/standardOperations i32 (i32.const 1184))
 (global $src/assembly/Z80Cpu/extendedOperations i32 (i32.const 1248))
 (global $src/assembly/Z80Cpu/bitOperations i32 (i32.const 1312))
 (global $src/assembly/Z80Cpu/indexedOperations i32 (i32.const 1376))
 (global $src/assembly/Z80Cpu/indexedBitOperations i32 (i32.const 1440))
 (global $src/shared/RunMode/RunMode.Normal i32 (i32.const 0))
 (global $src/shared/RunMode/RunMode.OneCycle i32 (i32.const 1))
 (global $src/shared/RunMode/RunMode.OneInstruction i32 (i32.const 2))
 (global $src/shared/RunMode/RunMode.UntilHalt i32 (i32.const 3))
 (global $src/shared/RunMode/RunMode.UntilEnd i32 (i32.const 4))
 (global $src/assembly/index/CPU_POOL i32 (i32.const 100))
 (global $src/assembly/index/TEST_MACHINE_POOL_SIZE i32 (i32.const 10))
 (global $src/assembly/index/cpuPool (mut i32) (i32.const 0))
 (global $~argumentsLength (mut i32) (i32.const 0))
 (global $src/assembly/index/testMachinePool (mut i32) (i32.const 0))
 (global $src/assembly/index/UINT8ARRAY_ID i32 (i32.const 26))
 (global $~lib/rt/pure/ROOTS (mut i32) (i32.const 0))
 (global $~lib/rt/pure/CUR (mut i32) (i32.const 0))
 (global $~lib/rt/pure/END (mut i32) (i32.const 0))
 (global $~lib/rt/__rtti_base i32 (i32.const 1776))
 (global $~lib/heap/__heap_base i32 (i32.const 1996))
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
 (export "Z80Cpu#readPort" (func $src/assembly/Z80Cpu/Z80Cpu#readPort))
 (export "Z80Cpu#writePort" (func $src/assembly/Z80Cpu/Z80Cpu#writePort))
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
 (export "WaTestZ80Machine#get:codeEndsAt" (func $src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine#get:codeEndsAt))
 (export "WaTestZ80Machine#set:codeEndsAt" (func $src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine#set:codeEndsAt))
 (export "WaTestZ80Machine#get:runMode" (func $src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine#get:runMode))
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
 (export "TestZ80MachineState#get:af" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:af))
 (export "TestZ80MachineState#set:af" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:af))
 (export "TestZ80MachineState#get:b" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:b))
 (export "TestZ80MachineState#set:b" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:b))
 (export "TestZ80MachineState#get:c" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:c))
 (export "TestZ80MachineState#set:c" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:c))
 (export "TestZ80MachineState#get:bc" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:bc))
 (export "TestZ80MachineState#set:bc" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:bc))
 (export "TestZ80MachineState#get:d" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:d))
 (export "TestZ80MachineState#set:d" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:d))
 (export "TestZ80MachineState#get:e" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:e))
 (export "TestZ80MachineState#set:e" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:e))
 (export "TestZ80MachineState#get:de" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:de))
 (export "TestZ80MachineState#set:de" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:de))
 (export "TestZ80MachineState#get:h" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:h))
 (export "TestZ80MachineState#set:h" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:h))
 (export "TestZ80MachineState#get:l" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:l))
 (export "TestZ80MachineState#set:l" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:l))
 (export "TestZ80MachineState#get:hl" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:hl))
 (export "TestZ80MachineState#set:hl" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:hl))
 (export "TestZ80MachineState#get:af_sec" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:af_sec))
 (export "TestZ80MachineState#set:af_sec" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:af_sec))
 (export "TestZ80MachineState#get:bc_sec" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:bc_sec))
 (export "TestZ80MachineState#set:bc_sec" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:bc_sec))
 (export "TestZ80MachineState#get:de_sec" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:de_sec))
 (export "TestZ80MachineState#set:de_sec" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:de_sec))
 (export "TestZ80MachineState#get:hl_sec" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:hl_sec))
 (export "TestZ80MachineState#set:hl_sec" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:hl_sec))
 (export "TestZ80MachineState#get:i" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:i))
 (export "TestZ80MachineState#set:i" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:i))
 (export "TestZ80MachineState#get:r" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:r))
 (export "TestZ80MachineState#set:r" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:r))
 (export "TestZ80MachineState#get:pc" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:pc))
 (export "TestZ80MachineState#set:pc" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:pc))
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
 (export "TestZ80MachineState#get:prefixMode" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:prefixMode))
 (export "TestZ80MachineState#set:prefixMode" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:prefixMode))
 (export "TestZ80MachineState#get:indexMode" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:indexMode))
 (export "TestZ80MachineState#set:indexMode" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:indexMode))
 (export "TestZ80MachineState#get:maskableInterruptModeEntered" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:maskableInterruptModeEntered))
 (export "TestZ80MachineState#set:maskableInterruptModeEntered" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:maskableInterruptModeEntered))
 (export "TestZ80MachineState#get:opCode" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:opCode))
 (export "TestZ80MachineState#set:opCode" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:opCode))
 (export "TestZ80MachineState#constructor" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#constructor))
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
 (func $~lib/rt/tlsf/checkUsedBlock (; 14 ;) (param $0 i32) (result i32)
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
 (func $~lib/util/memory/memcpy (; 15 ;) (param $0 i32) (param $1 i32) (param $2 i32)
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
 (func $~lib/memory/memory.copy (; 16 ;) (param $0 i32) (param $1 i32) (param $2 i32)
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
 (func $~lib/rt/tlsf/freeBlock (; 17 ;) (param $0 i32) (param $1 i32)
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
 (func $~lib/rt/tlsf/reallocateBlock (; 18 ;) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
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
 (func $~lib/rt/tlsf/__realloc (; 19 ;) (param $0 i32) (param $1 i32) (result i32)
  call $~lib/rt/tlsf/maybeInitialize
  local.get $0
  call $~lib/rt/tlsf/checkUsedBlock
  local.get $1
  call $~lib/rt/tlsf/reallocateBlock
  i32.const 16
  i32.add
 )
 (func $~lib/memory/memory.fill (; 20 ;) (param $0 i32) (param $1 i32) (param $2 i32)
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
 (func $~lib/array/ensureSize (; 21 ;) (param $0 i32) (param $1 i32) (param $2 i32)
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
 (func $~lib/array/Array<u8>#__unchecked_set (; 22 ;) (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 0
  i32.shl
  i32.add
  local.get $2
  i32.store8
 )
 (func $~lib/array/Array<u8>#__set (; 23 ;) (param $0 i32) (param $1 i32) (param $2 i32)
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
  call $~lib/array/Array<u8>#__unchecked_set
 )
 (func $~lib/array/Array<u8>#__unchecked_get (; 24 ;) (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 0
  i32.shl
  i32.add
  i32.load8_u
 )
 (func $~lib/array/Array<u8>#__get (; 25 ;) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
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
  local.get $1
  call $~lib/array/Array<u8>#__unchecked_get
  local.set $2
  local.get $2
 )
 (func $~lib/array/Array<usize>#__unchecked_set (; 26 ;) (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 2
  i32.shl
  i32.add
  local.get $2
  i32.store
 )
 (func $~lib/array/Array<usize>#__set (; 27 ;) (param $0 i32) (param $1 i32) (param $2 i32)
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
  call $~lib/array/Array<usize>#__unchecked_set
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:a (; 28 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u
  i32.const 8
  i32.shr_u
  i32.const 255
  i32.and
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:af (; 29 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16
 )
 (func $src/assembly/Z80Cpu/AluADC (; 30 ;) (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
  local.get $2
  if (result i32)
   i32.const 1
  else
   i32.const 0
  end
  local.set $3
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#get:a
  local.get $1
  i32.add
  i32.const 255
  i32.and
  local.get $3
  i32.add
  local.set $4
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#get:a
  local.get $1
  i32.add
  i32.const 24
  i32.shl
  i32.const 24
  i32.shr_s
  local.get $3
  i32.add
  local.set $5
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
  local.get $3
  i32.add
  i32.const 16
  i32.and
  local.set $6
  local.get $4
  global.get $src/assembly/Z80Cpu/FlagsSetMask.S
  global.get $src/assembly/Z80Cpu/FlagsSetMask.R5
  i32.or
  global.get $src/assembly/Z80Cpu/FlagsSetMask.R3
  i32.or
  i32.and
  i32.const 255
  i32.and
  local.set $7
  local.get $4
  i32.const 255
  i32.and
  i32.const 0
  i32.eq
  if
   local.get $7
   global.get $src/assembly/Z80Cpu/FlagsSetMask.Z
   i32.or
   local.set $7
  end
  local.get $4
  i32.const 256
  i32.ge_s
  if
   local.get $7
   global.get $src/assembly/Z80Cpu/FlagsSetMask.C
   i32.or
   local.set $7
  end
  local.get $6
  i32.const 0
  i32.ne
  if
   local.get $7
   global.get $src/assembly/Z80Cpu/FlagsSetMask.H
   i32.or
   local.set $7
  end
  local.get $5
  i32.const 128
  i32.ge_s
  if (result i32)
   i32.const 1
  else
   local.get $5
   i32.const -129
   i32.le_s
  end
  if
   local.get $7
   global.get $src/assembly/Z80Cpu/FlagsSetMask.PV
   i32.or
   local.set $7
  end
  local.get $0
  local.get $4
  i32.const 8
  i32.shl
  local.get $7
  i32.const 255
  i32.and
  i32.or
  call $src/assembly/Z80Cpu/Z80Cpu#set:af
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $src/assembly/Z80Cpu/AluADD (; 31 ;) (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
  local.get $0
  local.get $1
  i32.const 0
  call $src/assembly/Z80Cpu/AluADC
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $src/assembly/Z80Cpu/AluSBC (; 32 ;) (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
  local.get $2
  if (result i32)
   i32.const 1
  else
   i32.const 0
  end
  local.set $3
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#get:a
  local.get $1
  i32.sub
  i32.const 255
  i32.and
  local.get $3
  i32.sub
  local.set $4
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#get:a
  local.get $1
  i32.sub
  i32.const 24
  i32.shl
  i32.const 24
  i32.shr_s
  local.get $3
  i32.sub
  local.set $5
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
  local.get $3
  i32.sub
  i32.const 16
  i32.and
  local.set $6
  local.get $4
  global.get $src/assembly/Z80Cpu/FlagsSetMask.S
  global.get $src/assembly/Z80Cpu/FlagsSetMask.R5
  i32.or
  global.get $src/assembly/Z80Cpu/FlagsSetMask.R3
  i32.or
  i32.and
  i32.const 15
  i32.and
  local.set $7
  local.get $7
  global.get $src/assembly/Z80Cpu/FlagsSetMask.N
  i32.or
  local.set $7
  local.get $4
  i32.const 255
  i32.and
  i32.const 0
  i32.eq
  if
   local.get $7
   global.get $src/assembly/Z80Cpu/FlagsSetMask.Z
   i32.or
   local.set $7
  end
  local.get $4
  i32.const 65536
  i32.and
  i32.const 0
  i32.ne
  if
   local.get $7
   global.get $src/assembly/Z80Cpu/FlagsSetMask.C
   i32.or
   local.set $7
  end
  local.get $6
  i32.const 0
  i32.ne
  if
   local.get $7
   global.get $src/assembly/Z80Cpu/FlagsSetMask.H
   i32.or
   local.set $7
  end
  local.get $5
  i32.const 128
  i32.ge_s
  if (result i32)
   i32.const 1
  else
   local.get $5
   i32.const -129
   i32.le_s
  end
  if
   local.get $7
   global.get $src/assembly/Z80Cpu/FlagsSetMask.PV
   i32.or
   local.set $7
  end
  local.get $0
  local.get $4
  i32.const 8
  i32.shl
  local.get $7
  i32.const 255
  i32.and
  i32.or
  call $src/assembly/Z80Cpu/Z80Cpu#set:af
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $src/assembly/Z80Cpu/AluSUB (; 33 ;) (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
  local.get $0
  local.get $1
  i32.const 0
  call $src/assembly/Z80Cpu/AluSBC
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:a (; 34 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.const 8
  i32.shl
  local.get $0
  i32.load16_u
  i32.or
  i32.const 255
  i32.and
  i32.store16
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:f (; 35 ;) (param $0 i32) (param $1 i32)
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
 (func $src/assembly/Z80Cpu/AluAND (; 36 ;) (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
  local.get $0
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#get:a
  local.get $1
  i32.and
  call $src/assembly/Z80Cpu/Z80Cpu#set:a
  local.get $0
  global.get $src/assembly/Z80Cpu/aluLogOpFlags
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#get:a
  call $~lib/array/Array<u8>#__get
  global.get $src/assembly/Z80Cpu/FlagsSetMask.H
  i32.or
  call $src/assembly/Z80Cpu/Z80Cpu#set:f
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $src/assembly/Z80Cpu/AluXOR (; 37 ;) (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
  local.get $0
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#get:a
  local.get $1
  i32.xor
  call $src/assembly/Z80Cpu/Z80Cpu#set:a
  local.get $0
  global.get $src/assembly/Z80Cpu/aluLogOpFlags
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#get:a
  call $~lib/array/Array<u8>#__get
  call $src/assembly/Z80Cpu/Z80Cpu#set:f
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $src/assembly/Z80Cpu/AluOR (; 38 ;) (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
  local.get $0
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#get:a
  local.get $1
  i32.or
  call $src/assembly/Z80Cpu/Z80Cpu#set:a
  local.get $0
  global.get $src/assembly/Z80Cpu/aluLogOpFlags
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#get:a
  call $~lib/array/Array<u8>#__get
  call $src/assembly/Z80Cpu/Z80Cpu#set:f
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $src/assembly/Z80Cpu/AluCP (; 39 ;) (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#get:a
  local.get $1
  i32.sub
  local.set $3
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#get:a
  local.get $1
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
  i32.const 16
  i32.and
  local.set $5
  local.get $3
  i32.const 255
  i32.and
  global.get $src/assembly/Z80Cpu/FlagsSetMask.S
  global.get $src/assembly/Z80Cpu/FlagsSetMask.R5
  i32.or
  global.get $src/assembly/Z80Cpu/FlagsSetMask.R3
  i32.or
  i32.and
  i32.const 255
  i32.and
  local.set $6
  local.get $6
  global.get $src/assembly/Z80Cpu/FlagsSetMask.N
  i32.or
  local.set $6
  local.get $3
  i32.const 255
  i32.and
  i32.const 0
  i32.eq
  if
   local.get $6
   global.get $src/assembly/Z80Cpu/FlagsSetMask.Z
   i32.or
   local.set $6
  end
  local.get $3
  i32.const 255
  i32.and
  i32.const 65536
  i32.and
  i32.const 0
  i32.ne
  if
   local.get $6
   global.get $src/assembly/Z80Cpu/FlagsSetMask.C
   i32.or
   local.set $6
  end
  local.get $5
  i32.const 0
  i32.ne
  if
   local.get $6
   global.get $src/assembly/Z80Cpu/FlagsSetMask.H
   i32.or
   local.set $6
  end
  local.get $4
  i32.const 24
  i32.shl
  i32.const 24
  i32.shr_s
  i32.const 128
  i32.ge_s
  if (result i32)
   i32.const 1
  else
   local.get $4
   i32.const 24
   i32.shl
   i32.const 24
   i32.shr_s
   i32.const -129
   i32.le_s
  end
  if
   local.get $6
   global.get $src/assembly/Z80Cpu/FlagsSetMask.PV
   i32.or
   local.set $6
  end
  local.get $0
  local.get $6
  call $src/assembly/Z80Cpu/Z80Cpu#set:f
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $src/assembly/Z80Cpu/LdBcNN (; 40 ;) (param $0 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $src/assembly/Z80Cpu/LdBcNNIdx (; 41 ;) (param $0 i32) (param $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $start:src/assembly/Z80Cpu (; 42 ;)
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
  (local $12 i32)
  (local $13 i32)
  (local $14 i32)
  (local $15 i32)
  (local $16 i32)
  (local $17 i32)
  (local $18 i32)
  (local $19 i32)
  i32.const 0
  local.set $1
  loop $for-loop|0
   local.get $1
   i32.const 256
   i32.lt_s
   local.set $0
   local.get $0
   if
    local.get $1
    local.set $2
    local.get $2
    i32.const 1
    i32.add
    local.set $3
    global.get $src/assembly/Z80Cpu/incOpFlags
    local.get $1
    local.get $3
    i32.const 255
    i32.and
    global.get $src/assembly/Z80Cpu/FlagsSetMask.R3
    i32.and
    local.get $3
    i32.const 255
    i32.and
    global.get $src/assembly/Z80Cpu/FlagsSetMask.R5
    i32.and
    i32.or
    local.get $3
    i32.const 128
    i32.and
    i32.const 0
    i32.ne
    if (result i32)
     global.get $src/assembly/Z80Cpu/FlagsSetMask.S
    else
     i32.const 0
    end
    i32.or
    local.get $3
    i32.const 255
    i32.and
    i32.const 0
    i32.eq
    if (result i32)
     global.get $src/assembly/Z80Cpu/FlagsSetMask.Z
    else
     i32.const 0
    end
    i32.or
    local.get $2
    i32.const 15
    i32.and
    i32.const 15
    i32.eq
    if (result i32)
     global.get $src/assembly/Z80Cpu/FlagsSetMask.H
    else
     i32.const 0
    end
    i32.or
    local.get $2
    i32.const 255
    i32.and
    i32.const 127
    i32.eq
    if (result i32)
     global.get $src/assembly/Z80Cpu/FlagsSetMask.PV
    else
     i32.const 0
    end
    i32.or
    call $~lib/array/Array<u8>#__set
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
  i32.const 0
  local.set $0
  loop $for-loop|1
   local.get $0
   i32.const 256
   i32.lt_s
   local.set $1
   local.get $1
   if
    local.get $0
    local.set $3
    local.get $3
    i32.const 1
    i32.sub
    local.set $2
    global.get $src/assembly/Z80Cpu/decOpFlags
    local.get $0
    local.get $2
    i32.const 255
    i32.and
    global.get $src/assembly/Z80Cpu/FlagsSetMask.R3
    i32.and
    local.get $2
    i32.const 255
    i32.and
    global.get $src/assembly/Z80Cpu/FlagsSetMask.R5
    i32.and
    i32.or
    local.get $2
    i32.const 128
    i32.and
    i32.const 0
    i32.ne
    if (result i32)
     global.get $src/assembly/Z80Cpu/FlagsSetMask.S
    else
     i32.const 0
    end
    i32.or
    local.get $2
    i32.const 255
    i32.and
    i32.const 0
    i32.eq
    if (result i32)
     global.get $src/assembly/Z80Cpu/FlagsSetMask.Z
    else
     i32.const 0
    end
    i32.or
    local.get $3
    i32.const 15
    i32.and
    i32.const 0
    i32.eq
    if (result i32)
     global.get $src/assembly/Z80Cpu/FlagsSetMask.H
    else
     i32.const 0
    end
    i32.or
    local.get $3
    i32.const 255
    i32.and
    i32.const 128
    i32.eq
    if (result i32)
     global.get $src/assembly/Z80Cpu/FlagsSetMask.PV
    else
     i32.const 0
    end
    i32.or
    global.get $src/assembly/Z80Cpu/FlagsSetMask.N
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
  local.set $1
  loop $for-loop|2
   local.get $1
   i32.const 256
   i32.lt_s
   local.set $0
   local.get $0
   if
    local.get $1
    i32.const 4
    i32.shr_s
    local.set $2
    local.get $1
    i32.const 15
    i32.and
    local.set $3
    i32.const 0
    local.set $4
    loop $for-loop|3
     local.get $4
     i32.const 1
     i32.le_s
     local.set $5
     local.get $5
     if
      i32.const 0
      local.set $6
      loop $for-loop|4
       local.get $6
       i32.const 1
       i32.le_s
       local.set $7
       local.get $7
       if
        i32.const 0
        local.set $8
        loop $for-loop|5
         local.get $8
         i32.const 1
         i32.le_s
         local.set $9
         local.get $9
         if
          i32.const 0
          local.set $10
          i32.const 0
          local.set $11
          local.get $8
          i32.const 0
          i32.eq
          if
           local.get $2
           i32.const 0
           i32.ge_s
           if (result i32)
            local.get $2
            i32.const 9
            i32.le_s
           else
            i32.const 0
           end
           if (result i32)
            local.get $3
            i32.const 0
            i32.ge_s
           else
            i32.const 0
           end
           if (result i32)
            local.get $3
            i32.const 9
            i32.le_s
           else
            i32.const 0
           end
           if
            local.get $4
            i32.const 0
            i32.eq
            if (result i32)
             i32.const 0
            else
             i32.const 6
            end
            local.set $10
           else
            local.get $2
            i32.const 0
            i32.ge_s
            if (result i32)
             local.get $2
             i32.const 8
             i32.le_s
            else
             i32.const 0
            end
            if (result i32)
             local.get $3
             i32.const 10
             i32.ge_s
            else
             i32.const 0
            end
            if (result i32)
             local.get $3
             i32.const 15
             i32.le_s
            else
             i32.const 0
            end
            if
             i32.const 6
             local.set $10
            else
             local.get $2
             i32.const 10
             i32.ge_s
             if (result i32)
              local.get $2
              i32.const 15
              i32.le_s
             else
              i32.const 0
             end
             if (result i32)
              local.get $3
              i32.const 0
              i32.ge_s
             else
              i32.const 0
             end
             if (result i32)
              local.get $3
              i32.const 9
              i32.le_s
             else
              i32.const 0
             end
             if (result i32)
              local.get $4
              i32.const 0
              i32.eq
             else
              i32.const 0
             end
             if
              i32.const 96
              local.set $10
              i32.const 1
              local.set $11
             else
              local.get $2
              i32.const 9
              i32.ge_s
              if (result i32)
               local.get $2
               i32.const 15
               i32.le_s
              else
               i32.const 0
              end
              if (result i32)
               local.get $3
               i32.const 10
               i32.ge_s
              else
               i32.const 0
              end
              if (result i32)
               local.get $3
               i32.const 15
               i32.le_s
              else
               i32.const 0
              end
              if
               i32.const 102
               local.set $10
               i32.const 1
               local.set $11
              else
               local.get $2
               i32.const 10
               i32.ge_s
               if (result i32)
                local.get $2
                i32.const 15
                i32.le_s
               else
                i32.const 0
               end
               if (result i32)
                local.get $3
                i32.const 0
                i32.ge_s
               else
                i32.const 0
               end
               if (result i32)
                local.get $3
                i32.const 9
                i32.le_s
               else
                i32.const 0
               end
               if
                local.get $4
                i32.const 1
                i32.eq
                if
                 i32.const 102
                 local.set $10
                end
                i32.const 1
                local.set $11
               end
              end
             end
            end
           end
          else
           i32.const 1
           local.set $11
           local.get $3
           i32.const 0
           i32.ge_s
           if (result i32)
            local.get $3
            i32.const 9
            i32.le_s
           else
            i32.const 0
           end
           if
            local.get $4
            i32.const 0
            i32.eq
            if (result i32)
             i32.const 96
            else
             i32.const 102
            end
            local.set $10
           else
            local.get $3
            i32.const 10
            i32.ge_s
            if (result i32)
             local.get $3
             i32.const 15
             i32.le_s
            else
             i32.const 0
            end
            if
             i32.const 102
             local.set $10
            end
           end
          end
          i32.const 0
          local.set $12
          local.get $3
          i32.const 10
          i32.ge_s
          if (result i32)
           local.get $3
           i32.const 15
           i32.le_s
          else
           i32.const 0
          end
          if (result i32)
           local.get $6
           i32.const 0
           i32.eq
          else
           i32.const 0
          end
          if (result i32)
           i32.const 1
          else
           local.get $3
           i32.const 0
           i32.ge_s
           if (result i32)
            local.get $3
            i32.const 5
            i32.le_s
           else
            i32.const 0
           end
           if (result i32)
            local.get $6
            i32.const 1
            i32.eq
           else
            i32.const 0
           end
           if (result i32)
            local.get $4
            i32.const 1
            i32.eq
           else
            i32.const 0
           end
          end
          if
           i32.const 1
           local.set $12
          end
          local.get $6
          i32.const 0
          i32.eq
          if (result i32)
           local.get $1
           local.get $10
           i32.add
          else
           local.get $1
           local.get $10
           i32.sub
          end
          i32.const 255
          i32.and
          local.set $13
          i32.const 0
          local.set $14
          local.get $13
          local.set $15
          i32.const 0
          local.set $16
          loop $for-loop|6
           local.get $16
           i32.const 8
           i32.lt_s
           local.set $17
           local.get $17
           if
            local.get $14
            local.get $15
            i32.const 1
            i32.and
            i32.add
            local.set $14
            local.get $15
            i32.const 1
            i32.shr_s
            local.set $15
            local.get $16
            i32.const 1
            i32.add
            local.set $16
            br $for-loop|6
           end
          end
          local.get $13
          global.get $src/assembly/Z80Cpu/FlagsSetMask.R3
          i32.and
          local.get $13
          global.get $src/assembly/Z80Cpu/FlagsSetMask.R5
          i32.and
          i32.or
          local.get $13
          i32.const 128
          i32.and
          i32.const 0
          i32.ne
          if (result i32)
           global.get $src/assembly/Z80Cpu/FlagsSetMask.S
          else
           i32.const 0
          end
          i32.or
          local.get $13
          i32.const 0
          i32.eq
          if (result i32)
           global.get $src/assembly/Z80Cpu/FlagsSetMask.Z
          else
           i32.const 0
          end
          i32.or
          local.get $14
          i32.const 2
          i32.rem_s
          i32.const 0
          i32.eq
          if (result i32)
           global.get $src/assembly/Z80Cpu/FlagsSetMask.PV
          else
           i32.const 0
          end
          i32.or
          local.get $6
          i32.const 1
          i32.eq
          if (result i32)
           global.get $src/assembly/Z80Cpu/FlagsSetMask.N
          else
           i32.const 0
          end
          i32.or
          local.get $12
          i32.const 1
          i32.eq
          if (result i32)
           global.get $src/assembly/Z80Cpu/FlagsSetMask.H
          else
           i32.const 0
          end
          i32.or
          local.get $11
          i32.const 1
          i32.eq
          if (result i32)
           global.get $src/assembly/Z80Cpu/FlagsSetMask.C
          else
           i32.const 0
          end
          i32.or
          local.set $16
          local.get $13
          i32.const 8
          i32.shl
          local.get $16
          i32.const 255
          i32.and
          i32.or
          i32.const 65535
          i32.and
          local.set $17
          local.get $4
          i32.const 4
          i32.mul
          local.get $6
          i32.const 2
          i32.mul
          i32.add
          local.get $8
          i32.add
          i32.const 255
          i32.and
          local.set $18
          local.get $18
          i32.const 8
          i32.shl
          local.get $1
          i32.add
          local.set $19
          global.get $src/assembly/Z80Cpu/daaResults
          local.get $19
          local.get $17
          call $~lib/array/Array<u8>#__set
          local.get $8
          i32.const 1
          i32.add
          local.set $8
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
      local.get $4
      i32.const 1
      i32.add
      local.set $4
      br $for-loop|3
     end
    end
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|2
   end
  end
  i32.const 0
  local.set $0
  loop $for-loop|7
   local.get $0
   i32.const 2
   i32.lt_s
   local.set $1
   local.get $1
   if
    i32.const 0
    local.set $3
    loop $for-loop|8
     local.get $3
     i32.const 256
     i32.lt_s
     local.set $2
     local.get $2
     if
      i32.const 0
      local.set $4
      loop $for-loop|9
       local.get $4
       i32.const 256
       i32.lt_s
       local.set $5
       local.get $5
       if
        local.get $3
        local.get $4
        i32.add
        local.get $0
        i32.add
        i32.const 65535
        i32.and
        local.set $6
        i32.const 0
        local.set $7
        local.get $6
        i32.const 255
        i32.and
        i32.const 0
        i32.eq
        if
         local.get $7
         global.get $src/assembly/Z80Cpu/FlagsSetMask.Z
         i32.or
         local.set $7
        end
        local.get $7
        local.get $6
        global.get $src/assembly/Z80Cpu/FlagsSetMask.R3
        global.get $src/assembly/Z80Cpu/FlagsSetMask.R5
        i32.or
        global.get $src/assembly/Z80Cpu/FlagsSetMask.S
        i32.or
        i32.and
        i32.or
        local.set $7
        local.get $6
        i32.const 256
        i32.ge_s
        if
         local.get $7
         global.get $src/assembly/Z80Cpu/FlagsSetMask.C
         i32.or
         local.set $7
        end
        local.get $3
        i32.const 15
        i32.and
        local.get $4
        i32.const 15
        i32.and
        i32.add
        local.get $0
        i32.add
        i32.const 16
        i32.and
        i32.const 0
        i32.ne
        if
         local.get $7
         global.get $src/assembly/Z80Cpu/FlagsSetMask.H
         i32.or
         local.set $7
        end
        local.get $3
        local.get $4
        i32.add
        i32.const 24
        i32.shl
        i32.const 24
        i32.shr_s
        local.get $0
        i32.add
        local.set $8
        local.get $8
        i32.const 128
        i32.ge_s
        if (result i32)
         i32.const 1
        else
         local.get $8
         i32.const -129
         i32.le_s
        end
        if
         local.get $7
         global.get $src/assembly/Z80Cpu/FlagsSetMask.PV
         i32.or
         local.set $7
        end
        global.get $src/assembly/Z80Cpu/adcFlags
        local.get $0
        i32.const 65536
        i32.mul
        local.get $3
        i32.const 256
        i32.mul
        i32.add
        local.get $4
        i32.add
        local.get $7
        call $~lib/array/Array<u8>#__set
        local.get $4
        i32.const 1
        i32.add
        local.set $4
        br $for-loop|9
       end
      end
      local.get $3
      i32.const 1
      i32.add
      local.set $3
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
  local.set $1
  loop $for-loop|10
   local.get $1
   i32.const 2
   i32.lt_s
   local.set $0
   local.get $0
   if
    i32.const 0
    local.set $3
    loop $for-loop|11
     local.get $3
     i32.const 256
     i32.lt_s
     local.set $2
     local.get $2
     if
      i32.const 0
      local.set $4
      loop $for-loop|12
       local.get $4
       i32.const 256
       i32.lt_s
       local.set $5
       local.get $5
       if
        local.get $3
        local.get $4
        i32.sub
        local.get $1
        i32.sub
        local.set $8
        local.get $8
        global.get $src/assembly/Z80Cpu/FlagsSetMask.R3
        global.get $src/assembly/Z80Cpu/FlagsSetMask.R5
        i32.or
        global.get $src/assembly/Z80Cpu/FlagsSetMask.S
        i32.or
        i32.and
        local.set $7
        local.get $8
        i32.const 255
        i32.and
        i32.const 0
        i32.eq
        if
         local.get $7
         global.get $src/assembly/Z80Cpu/FlagsSetMask.Z
         i32.or
         local.set $7
        end
        local.get $8
        i32.const 65536
        i32.and
        i32.const 0
        i32.ne
        if
         local.get $7
         global.get $src/assembly/Z80Cpu/FlagsSetMask.C
         i32.or
         local.set $7
        end
        local.get $3
        local.get $4
        i32.sub
        i32.const 24
        i32.shl
        i32.const 24
        i32.shr_s
        local.get $1
        i32.sub
        local.set $6
        local.get $6
        i32.const 128
        i32.ge_s
        if (result i32)
         i32.const 1
        else
         local.get $6
         i32.const -128
         i32.lt_s
        end
        if
         local.get $7
         global.get $src/assembly/Z80Cpu/FlagsSetMask.PV
         i32.or
         local.set $7
        end
        local.get $3
        i32.const 15
        i32.and
        local.get $8
        i32.const 15
        i32.and
        i32.sub
        local.get $1
        i32.sub
        i32.const 16
        i32.and
        i32.const 0
        i32.ne
        if
         local.get $7
         global.get $src/assembly/Z80Cpu/FlagsSetMask.H
         i32.or
         local.set $7
        end
        local.get $7
        global.get $src/assembly/Z80Cpu/FlagsSetMask.N
        i32.or
        local.set $7
        global.get $src/assembly/Z80Cpu/sbcFlags
        local.get $1
        i32.const 65536
        i32.mul
        local.get $3
        i32.const 256
        i32.mul
        i32.add
        local.get $4
        i32.add
        local.get $7
        call $~lib/array/Array<u8>#__set
        local.get $4
        i32.const 1
        i32.add
        local.set $4
        br $for-loop|12
       end
      end
      local.get $3
      i32.const 1
      i32.add
      local.set $3
      br $for-loop|11
     end
    end
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|10
   end
  end
  i32.const 0
  local.set $0
  loop $for-loop|13
   local.get $0
   i32.const 256
   i32.lt_s
   local.set $1
   local.get $1
   if
    local.get $0
    i32.const 168
    i32.and
    local.set $3
    global.get $src/assembly/Z80Cpu/FlagsSetMask.PV
    local.set $2
    i32.const 128
    local.set $4
    loop $for-loop|14
     local.get $4
     i32.const 0
     i32.ne
     local.set $5
     local.get $5
     if
      local.get $0
      local.get $4
      i32.and
      i32.const 0
      i32.ne
      if
       local.get $2
       global.get $src/assembly/Z80Cpu/FlagsSetMask.PV
       i32.xor
       local.set $2
      end
      local.get $4
      i32.const 2
      i32.div_s
      local.set $4
      br $for-loop|14
     end
    end
    global.get $src/assembly/Z80Cpu/aluLogOpFlags
    local.get $0
    local.get $3
    local.get $2
    i32.or
    call $~lib/array/Array<u8>#__set
    local.get $0
    i32.const 1
    i32.add
    local.set $0
    br $for-loop|13
   end
  end
  global.get $src/assembly/Z80Cpu/aluLogOpFlags
  i32.const 0
  global.get $src/assembly/Z80Cpu/aluLogOpFlags
  i32.const 0
  call $~lib/array/Array<u8>#__get
  global.get $src/assembly/Z80Cpu/FlagsSetMask.Z
  i32.or
  call $~lib/array/Array<u8>#__set
  i32.const 0
  local.set $1
  loop $for-loop|15
   local.get $1
   i32.const 256
   i32.lt_s
   local.set $0
   local.get $0
   if
    local.get $1
    local.set $2
    local.get $2
    i32.const 1
    i32.shl
    local.set $2
    local.get $2
    i32.const 256
    i32.and
    i32.const 0
    i32.ne
    if (result i32)
     global.get $src/assembly/Z80Cpu/FlagsSetMask.C
    else
     i32.const 0
    end
    local.set $3
    local.get $3
    i32.const 0
    i32.ne
    if
     local.get $2
     i32.const 1
     i32.or
     i32.const 255
     i32.and
     local.set $2
    end
    global.get $src/assembly/Z80Cpu/FlagsSetMask.PV
    local.set $4
    i32.const 128
    local.set $5
    loop $for-loop|16
     local.get $5
     i32.const 0
     i32.ne
     local.set $6
     local.get $6
     if
      local.get $2
      local.get $5
      i32.and
      i32.const 0
      i32.ne
      if
       local.get $4
       global.get $src/assembly/Z80Cpu/FlagsSetMask.PV
       i32.xor
       local.set $4
      end
      local.get $5
      i32.const 2
      i32.div_s
      local.set $5
      br $for-loop|16
     end
    end
    local.get $2
    global.get $src/assembly/Z80Cpu/FlagsSetMask.S
    global.get $src/assembly/Z80Cpu/FlagsSetMask.R5
    i32.or
    global.get $src/assembly/Z80Cpu/FlagsSetMask.R3
    i32.or
    i32.and
    local.get $4
    i32.or
    local.get $3
    i32.or
    i32.const 255
    i32.and
    local.set $5
    local.get $2
    i32.const 0
    i32.eq
    if
     local.get $5
     global.get $src/assembly/Z80Cpu/FlagsSetMask.Z
     i32.or
     local.set $5
    end
    global.get $src/assembly/Z80Cpu/rlcFlags
    local.get $1
    local.get $5
    i32.const 255
    i32.and
    call $~lib/array/Array<usize>#__set
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|15
   end
  end
  i32.const 0
  local.set $0
  loop $for-loop|17
   local.get $0
   i32.const 256
   i32.lt_s
   local.set $1
   local.get $1
   if
    local.get $0
    local.set $5
    local.get $5
    i32.const 1
    i32.and
    i32.const 0
    i32.ne
    if (result i32)
     global.get $src/assembly/Z80Cpu/FlagsSetMask.C
    else
     i32.const 0
    end
    local.set $4
    local.get $5
    i32.const 1
    i32.shr_s
    local.set $5
    local.get $4
    i32.const 0
    i32.ne
    if
     local.get $5
     i32.const 128
     i32.or
     local.set $5
    end
    global.get $src/assembly/Z80Cpu/FlagsSetMask.PV
    local.set $3
    i32.const 128
    local.set $2
    loop $for-loop|18
     local.get $2
     i32.const 0
     i32.ne
     local.set $6
     local.get $6
     if
      local.get $5
      local.get $2
      i32.and
      i32.const 0
      i32.ne
      if
       local.get $3
       global.get $src/assembly/Z80Cpu/FlagsSetMask.PV
       i32.xor
       local.set $3
      end
      local.get $2
      i32.const 2
      i32.div_s
      local.set $2
      br $for-loop|18
     end
    end
    local.get $5
    global.get $src/assembly/Z80Cpu/FlagsSetMask.S
    global.get $src/assembly/Z80Cpu/FlagsSetMask.R5
    i32.or
    global.get $src/assembly/Z80Cpu/FlagsSetMask.R3
    i32.or
    i32.and
    local.get $3
    i32.or
    local.get $4
    i32.or
    i32.const 255
    i32.and
    local.set $2
    local.get $5
    i32.const 0
    i32.eq
    if
     local.get $2
     global.get $src/assembly/Z80Cpu/FlagsSetMask.Z
     i32.or
     local.set $2
    end
    global.get $src/assembly/Z80Cpu/rrcFlags
    local.get $0
    local.get $2
    call $~lib/array/Array<u8>#__set
    local.get $0
    i32.const 1
    i32.add
    local.set $0
    br $for-loop|17
   end
  end
  i32.const 0
  local.set $1
  loop $for-loop|19
   local.get $1
   i32.const 256
   i32.lt_s
   local.set $0
   local.get $0
   if
    local.get $1
    local.set $2
    local.get $2
    i32.const 1
    i32.shl
    local.set $2
    local.get $2
    i32.const 256
    i32.and
    i32.const 0
    i32.ne
    if (result i32)
     global.get $src/assembly/Z80Cpu/FlagsSetMask.C
    else
     i32.const 0
    end
    local.set $3
    global.get $src/assembly/Z80Cpu/FlagsSetMask.PV
    local.set $4
    i32.const 128
    local.set $5
    loop $for-loop|20
     local.get $5
     i32.const 0
     i32.ne
     local.set $6
     local.get $6
     if
      local.get $2
      local.get $5
      i32.and
      i32.const 0
      i32.ne
      if
       local.get $4
       global.get $src/assembly/Z80Cpu/FlagsSetMask.PV
       i32.xor
       local.set $4
      end
      local.get $5
      i32.const 2
      i32.div_s
      local.set $5
      br $for-loop|20
     end
    end
    local.get $2
    global.get $src/assembly/Z80Cpu/FlagsSetMask.S
    global.get $src/assembly/Z80Cpu/FlagsSetMask.R5
    i32.or
    global.get $src/assembly/Z80Cpu/FlagsSetMask.R3
    i32.or
    i32.and
    local.get $4
    i32.or
    local.get $3
    i32.or
    i32.const 255
    i32.and
    local.set $5
    local.get $2
    i32.const 255
    i32.and
    i32.const 0
    i32.eq
    if
     local.get $5
     global.get $src/assembly/Z80Cpu/FlagsSetMask.Z
     i32.or
     local.set $5
    end
    global.get $src/assembly/Z80Cpu/rlCarry0Flags
    local.get $1
    local.get $5
    i32.const 255
    i32.and
    call $~lib/array/Array<usize>#__set
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|19
   end
  end
  i32.const 0
  local.set $0
  loop $for-loop|21
   local.get $0
   i32.const 256
   i32.lt_s
   local.set $1
   local.get $1
   if
    local.get $0
    local.set $5
    local.get $5
    i32.const 1
    i32.shl
    local.set $5
    local.get $5
    i32.const 1
    i32.add
    local.set $5
    local.get $5
    i32.const 256
    i32.and
    i32.const 0
    i32.ne
    if (result i32)
     global.get $src/assembly/Z80Cpu/FlagsSetMask.C
    else
     i32.const 0
    end
    local.set $4
    global.get $src/assembly/Z80Cpu/FlagsSetMask.PV
    local.set $3
    i32.const 128
    local.set $2
    loop $for-loop|22
     local.get $2
     i32.const 0
     i32.ne
     local.set $6
     local.get $6
     if
      local.get $5
      local.get $2
      i32.and
      i32.const 0
      i32.ne
      if
       local.get $3
       global.get $src/assembly/Z80Cpu/FlagsSetMask.PV
       i32.xor
       local.set $3
      end
      local.get $2
      i32.const 2
      i32.div_s
      local.set $2
      br $for-loop|22
     end
    end
    local.get $5
    global.get $src/assembly/Z80Cpu/FlagsSetMask.S
    global.get $src/assembly/Z80Cpu/FlagsSetMask.R5
    i32.or
    global.get $src/assembly/Z80Cpu/FlagsSetMask.R3
    i32.or
    i32.and
    local.get $3
    i32.or
    local.get $4
    i32.or
    i32.const 255
    i32.and
    local.set $2
    local.get $5
    i32.const 511
    i32.and
    i32.const 0
    i32.eq
    if
     local.get $2
     global.get $src/assembly/Z80Cpu/FlagsSetMask.Z
     i32.or
     local.set $2
    end
    global.get $src/assembly/Z80Cpu/rlCarry1Flags
    local.get $0
    local.get $2
    call $~lib/array/Array<u8>#__set
    local.get $0
    i32.const 1
    i32.add
    local.set $0
    br $for-loop|21
   end
  end
  i32.const 0
  local.set $1
  loop $for-loop|23
   local.get $1
   i32.const 256
   i32.lt_s
   local.set $0
   local.get $0
   if
    local.get $1
    local.set $2
    local.get $2
    i32.const 1
    i32.and
    i32.const 0
    i32.ne
    if (result i32)
     global.get $src/assembly/Z80Cpu/FlagsSetMask.C
    else
     i32.const 0
    end
    local.set $3
    local.get $2
    i32.const 1
    i32.shr_s
    local.set $2
    global.get $src/assembly/Z80Cpu/FlagsSetMask.PV
    local.set $4
    i32.const 128
    local.set $5
    loop $for-loop|24
     local.get $5
     i32.const 0
     i32.ne
     local.set $6
     local.get $6
     if
      local.get $2
      local.get $5
      i32.and
      i32.const 0
      i32.ne
      if
       local.get $4
       global.get $src/assembly/Z80Cpu/FlagsSetMask.PV
       i32.xor
       local.set $4
      end
      local.get $5
      i32.const 2
      i32.div_s
      local.set $5
      br $for-loop|24
     end
    end
    local.get $2
    global.get $src/assembly/Z80Cpu/FlagsSetMask.S
    global.get $src/assembly/Z80Cpu/FlagsSetMask.R5
    i32.or
    global.get $src/assembly/Z80Cpu/FlagsSetMask.R3
    i32.or
    i32.and
    local.get $4
    i32.or
    local.get $3
    i32.or
    i32.const 255
    i32.and
    local.set $5
    local.get $2
    i32.const 0
    i32.eq
    if
     local.get $5
     global.get $src/assembly/Z80Cpu/FlagsSetMask.Z
     i32.or
     local.set $5
    end
    global.get $src/assembly/Z80Cpu/rrCarry0Flags
    local.get $1
    local.get $5
    call $~lib/array/Array<u8>#__set
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|23
   end
  end
  i32.const 0
  local.set $0
  loop $for-loop|25
   local.get $0
   i32.const 256
   i32.lt_s
   local.set $1
   local.get $1
   if
    local.get $0
    local.set $5
    local.get $5
    i32.const 1
    i32.and
    i32.const 0
    i32.ne
    if (result i32)
     global.get $src/assembly/Z80Cpu/FlagsSetMask.C
    else
     i32.const 0
    end
    local.set $4
    local.get $5
    i32.const 1
    i32.shr_s
    local.set $5
    local.get $5
    i32.const 128
    i32.add
    local.set $5
    global.get $src/assembly/Z80Cpu/FlagsSetMask.PV
    local.set $3
    i32.const 128
    local.set $2
    loop $for-loop|26
     local.get $2
     i32.const 0
     i32.ne
     local.set $6
     local.get $6
     if
      local.get $5
      local.get $2
      i32.and
      i32.const 0
      i32.ne
      if
       local.get $3
       global.get $src/assembly/Z80Cpu/FlagsSetMask.PV
       i32.xor
       local.set $3
      end
      local.get $2
      i32.const 2
      i32.div_s
      local.set $2
      br $for-loop|26
     end
    end
    local.get $5
    global.get $src/assembly/Z80Cpu/FlagsSetMask.S
    global.get $src/assembly/Z80Cpu/FlagsSetMask.R5
    i32.or
    global.get $src/assembly/Z80Cpu/FlagsSetMask.R3
    i32.or
    i32.and
    local.get $3
    i32.or
    local.get $4
    i32.or
    i32.const 255
    i32.and
    local.set $2
    local.get $5
    i32.const 0
    i32.eq
    if
     local.get $2
     global.get $src/assembly/Z80Cpu/FlagsSetMask.Z
     i32.or
     local.set $2
    end
    global.get $src/assembly/Z80Cpu/rrCarry1Flags
    local.get $0
    local.get $2
    call $~lib/array/Array<u8>#__set
    local.get $0
    i32.const 1
    i32.add
    local.set $0
    br $for-loop|25
   end
  end
  i32.const 0
  local.set $1
  loop $for-loop|27
   local.get $1
   i32.const 256
   i32.lt_s
   local.set $0
   local.get $0
   if
    local.get $1
    local.set $2
    local.get $2
    i32.const 1
    i32.and
    i32.const 0
    i32.ne
    if (result i32)
     global.get $src/assembly/Z80Cpu/FlagsSetMask.C
    else
     i32.const 0
    end
    local.set $3
    local.get $2
    i32.const 1
    i32.shr_s
    local.get $2
    i32.const 128
    i32.and
    i32.add
    local.set $2
    global.get $src/assembly/Z80Cpu/FlagsSetMask.PV
    local.set $4
    i32.const 128
    local.set $5
    loop $for-loop|28
     local.get $5
     i32.const 0
     i32.ne
     local.set $6
     local.get $6
     if
      local.get $2
      local.get $5
      i32.and
      i32.const 0
      i32.ne
      if
       local.get $4
       global.get $src/assembly/Z80Cpu/FlagsSetMask.PV
       i32.xor
       local.set $4
      end
      local.get $5
      i32.const 2
      i32.div_s
      local.set $5
      br $for-loop|28
     end
    end
    local.get $2
    global.get $src/assembly/Z80Cpu/FlagsSetMask.S
    global.get $src/assembly/Z80Cpu/FlagsSetMask.R5
    i32.or
    global.get $src/assembly/Z80Cpu/FlagsSetMask.R3
    i32.or
    i32.and
    local.get $4
    i32.or
    local.get $3
    i32.or
    i32.const 255
    i32.and
    local.set $5
    local.get $2
    i32.const 255
    i32.and
    i32.const 0
    i32.eq
    if
     local.get $5
     global.get $src/assembly/Z80Cpu/FlagsSetMask.Z
     i32.or
     local.set $5
    end
    global.get $src/assembly/Z80Cpu/sraFlags
    local.get $1
    local.get $5
    call $~lib/array/Array<u8>#__set
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|27
   end
  end
  i32.const 0
  local.set $1
  loop $for-loop|29
   local.get $1
   i32.const 256
   i32.lt_s
   local.set $0
   local.get $0
   if
    global.get $src/assembly/Z80Cpu/rolOpResults
    local.get $1
    local.get $1
    i32.const 1
    i32.shl
    local.get $1
    i32.const 7
    i32.shr_s
    i32.add
    call $~lib/array/Array<u8>#__set
    global.get $src/assembly/Z80Cpu/rorOpResults
    local.get $1
    local.get $1
    i32.const 1
    i32.shr_s
    local.get $1
    i32.const 7
    i32.shl
    i32.add
    call $~lib/array/Array<u8>#__set
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|29
   end
  end
 )
 (func $~lib/rt/__allocBuffer (; 43 ;) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
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
 (func $~lib/rt/__allocArray (; 44 ;) (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (result i32)
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
 (func $~lib/array/Array<bool>#__unchecked_set (; 45 ;) (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 0
  i32.shl
  i32.add
  local.get $2
  i32.store8
 )
 (func $~lib/array/Array<bool>#__set (; 46 ;) (param $0 i32) (param $1 i32) (param $2 i32)
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
 (func $~lib/array/Array<src/assembly/Z80Cpu/Z80Cpu | null>#__unchecked_set (; 47 ;) (param $0 i32) (param $1 i32) (param $2 i32)
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
 (func $~lib/array/Array<src/assembly/Z80Cpu/Z80Cpu | null>#__set (; 48 ;) (param $0 i32) (param $1 i32) (param $2 i32)
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
 (func $src/assembly/ObjectPool/ObjectPool<src/assembly/Z80Cpu/Z80Cpu>#reset (; 49 ;) (param $0 i32)
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
 (func $src/assembly/ObjectPool/ObjectPool<src/assembly/Z80Cpu/Z80Cpu>#constructor (; 50 ;) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  local.get $0
  i32.eqz
  if
   i32.const 16
   i32.const 11
   call $~lib/rt/tlsf/__alloc
   call $~lib/rt/pure/__retain
   local.set $0
  end
  local.get $0
  i32.const 0
  i32.const 0
  i32.const 12
  i32.const 1472
  call $~lib/rt/__allocArray
  call $~lib/rt/pure/__retain
  i32.store
  local.get $0
  i32.const 0
  i32.const 2
  i32.const 13
  i32.const 1488
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
 (func $~lib/arraybuffer/ArrayBufferView#constructor (; 51 ;) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
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
   i32.const 352
   i32.const 1504
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
 (func $~lib/typedarray/Uint32Array#constructor (; 52 ;) (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  if (result i32)
   local.get $0
  else
   i32.const 12
   i32.const 7
   call $~lib/rt/tlsf/__alloc
   call $~lib/rt/pure/__retain
  end
  local.get $1
  i32.const 2
  call $~lib/arraybuffer/ArrayBufferView#constructor
  local.set $0
  local.get $0
 )
 (func $~lib/typedarray/Uint32Array#__set (; 53 ;) (param $0 i32) (param $1 i32) (param $2 i32)
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
 (func $src/assembly/MemoryStatusArray/MemoryStatusArray#clearAll (; 54 ;) (param $0 i32)
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
 (func $src/assembly/MemoryStatusArray/MemoryStatusArray#constructor (; 55 ;) (param $0 i32) (result i32)
  local.get $0
  i32.eqz
  if
   i32.const 4
   i32.const 6
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
 (func $src/assembly/Z80Cpu/Z80Cpu#set:pc (; 56 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=18
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:i (; 57 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=16
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:r (; 58 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=17
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#executeReset (; 59 ;) (param $0 i32)
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
  global.get $src/assembly/Z80Cpu/Z80StateFlags.None
  i32.store offset=40
  local.get $0
  global.get $src/assembly/Z80Cpu/OpPrefixMode.None
  i32.store offset=64
  local.get $0
  global.get $src/assembly/Z80Cpu/OpIndexMode.None
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
 (func $src/assembly/Z80Cpu/Z80Cpu#constructor (; 60 ;) (param $0 i32) (param $1 i32) (result i32)
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
  global.get $src/assembly/Z80Cpu/Z80StateFlags.None
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
  i32.const 0
  call $src/assembly/MemoryStatusArray/MemoryStatusArray#constructor
  i32.store offset=52
  local.get $0
  i32.const 0
  call $src/assembly/MemoryStatusArray/MemoryStatusArray#constructor
  i32.store offset=56
  local.get $0
  i32.const 0
  call $src/assembly/MemoryStatusArray/MemoryStatusArray#constructor
  i32.store offset=60
  local.get $0
  global.get $src/assembly/Z80Cpu/OpPrefixMode.None
  i32.store offset=64
  local.get $0
  global.get $src/assembly/Z80Cpu/OpIndexMode.None
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
 (func $start:src/assembly/index~anonymous|0 (; 61 ;) (result i32)
  i32.const 0
  i32.const 0
  call $src/assembly/Z80Cpu/Z80Cpu#constructor
 )
 (func $~lib/array/Array<src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine | null>#__unchecked_set (; 62 ;) (param $0 i32) (param $1 i32) (param $2 i32)
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
 (func $~lib/array/Array<src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine | null>#__set (; 63 ;) (param $0 i32) (param $1 i32) (param $2 i32)
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
  call $~lib/array/Array<src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine | null>#__unchecked_set
  local.get $2
  call $~lib/rt/pure/__release
 )
 (func $src/assembly/ObjectPool/ObjectPool<src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine>#reset (; 64 ;) (param $0 i32)
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
    call $~lib/array/Array<src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine | null>#__set
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
 )
 (func $src/assembly/ObjectPool/ObjectPool<src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine>#constructor (; 65 ;) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  local.get $0
  i32.eqz
  if
   i32.const 16
   i32.const 24
   call $~lib/rt/tlsf/__alloc
   call $~lib/rt/pure/__retain
   local.set $0
  end
  local.get $0
  i32.const 0
  i32.const 0
  i32.const 12
  i32.const 1632
  call $~lib/rt/__allocArray
  call $~lib/rt/pure/__retain
  i32.store
  local.get $0
  i32.const 0
  i32.const 2
  i32.const 25
  i32.const 1648
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
  call $src/assembly/ObjectPool/ObjectPool<src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine>#reset
  local.get $0
 )
 (func $src/assembly/test-machine/WaTestZ80Cpu/TestMemoryDevice#reset (; 66 ;) (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  i32.const 0
  local.set $1
  loop $for-loop|0
   local.get $1
   i32.const 65536
   i32.lt_s
   local.set $2
   local.get $2
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
  local.get $0
  local.tee $1
  i32.const 0
  i32.const 2
  i32.const 19
  i32.const 1696
  call $~lib/rt/__allocArray
  call $~lib/rt/pure/__retain
  local.set $2
  local.get $1
  i32.load offset=4
  call $~lib/rt/pure/__release
  local.get $2
  i32.store offset=4
 )
 (func $src/assembly/test-machine/WaTestZ80Cpu/TestMemoryDevice#constructor (; 67 ;) (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  local.get $0
  i32.eqz
  if
   i32.const 8
   i32.const 17
   call $~lib/rt/tlsf/__alloc
   call $~lib/rt/pure/__retain
   local.set $0
  end
  local.get $0
  i32.const 0
  i32.const 0
  i32.const 3
  i32.const 1664
  call $~lib/rt/__allocArray
  call $~lib/rt/pure/__retain
  i32.store
  local.get $0
  i32.const 0
  i32.const 2
  i32.const 19
  i32.const 1680
  call $~lib/rt/__allocArray
  call $~lib/rt/pure/__retain
  i32.store offset=4
  local.get $0
  call $src/assembly/test-machine/WaTestZ80Cpu/TestMemoryDevice#reset
  local.get $0
 )
 (func $src/assembly/test-machine/WaTestZ80Cpu/TestPortDevice#constructor (; 68 ;) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
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
   i32.const 20
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
  i32.const 22
  i32.const 1712
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
 (func $src/assembly/test-machine/WaTestZ80Cpu/TestPortDevice#constructor|trampoline (; 69 ;) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
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
   i32.const 3
   i32.const 1728
   call $~lib/rt/__allocArray
   call $~lib/rt/pure/__retain
   local.tee $4
   local.set $2
  end
  local.get $0
  local.get $1
  local.get $2
  call $src/assembly/test-machine/WaTestZ80Cpu/TestPortDevice#constructor
  local.set $3
  local.get $4
  call $~lib/rt/pure/__release
  local.get $3
 )
 (func $~setArgumentsLength (; 70 ;) (param $0 i32)
  local.get $0
  global.set $~argumentsLength
 )
 (func $src/assembly/test-machine/WaTestZ80Cpu/WaTestZ80Cpu#constructor (; 71 ;) (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  local.get $0
  if (result i32)
   local.get $0
  else
   i32.const 84
   i32.const 16
   call $~lib/rt/tlsf/__alloc
   call $~lib/rt/pure/__retain
  end
  i32.const 0
  call $src/assembly/Z80Cpu/Z80Cpu#constructor
  local.set $0
  local.get $0
  i32.const 0
  i32.store offset=76
  local.get $0
  i32.const 0
  i32.store offset=80
  local.get $0
  local.tee $1
  i32.const 0
  call $src/assembly/test-machine/WaTestZ80Cpu/TestMemoryDevice#constructor
  local.set $2
  local.get $1
  i32.load offset=76
  call $~lib/rt/pure/__release
  local.get $2
  i32.store offset=76
  local.get $0
  local.tee $2
  i32.const 1
  global.set $~argumentsLength
  i32.const 0
  local.get $0
  i32.const 0
  call $src/assembly/test-machine/WaTestZ80Cpu/TestPortDevice#constructor|trampoline
  local.set $1
  local.get $2
  i32.load offset=80
  call $~lib/rt/pure/__release
  local.get $1
  i32.store offset=80
  local.get $0
 )
 (func $src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine#constructor (; 72 ;) (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
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
  global.get $src/shared/RunMode/RunMode.UntilEnd
  i32.store offset=8
  local.get $0
  local.tee $1
  i32.const 0
  call $src/assembly/test-machine/WaTestZ80Cpu/WaTestZ80Cpu#constructor
  local.set $2
  local.get $1
  i32.load
  call $~lib/rt/pure/__release
  local.get $2
  i32.store
  local.get $0
 )
 (func $start:src/assembly/index~anonymous|1 (; 73 ;) (result i32)
  i32.const 0
  call $src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine#constructor
 )
 (func $start:src/assembly/index (; 74 ;)
  call $start:src/assembly/Z80Cpu
  i32.const 0
  i32.const 100
  i32.const 11
  call $src/assembly/ObjectPool/ObjectPool<src/assembly/Z80Cpu/Z80Cpu>#constructor
  global.set $src/assembly/index/cpuPool
  i32.const 0
  i32.const 10
  i32.const 12
  call $src/assembly/ObjectPool/ObjectPool<src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine>#constructor
  global.set $src/assembly/index/testMachinePool
 )
 (func $src/assembly/index/getCpuPoolMaxSize (; 75 ;) (result i32)
  global.get $src/assembly/index/cpuPool
  i32.load offset=8
 )
 (func $src/assembly/index/resetCpuPool (; 76 ;)
  global.get $src/assembly/index/cpuPool
  call $src/assembly/ObjectPool/ObjectPool<src/assembly/Z80Cpu/Z80Cpu>#reset
 )
 (func $src/assembly/ObjectPool/ObjectPool<src/assembly/Z80Cpu/Z80Cpu>#create~anonymous|0 (; 77 ;) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
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
 (func $~lib/array/Array<bool>#findIndex (; 78 ;) (param $0 i32) (param $1 i32) (result i32)
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
 (func $src/assembly/ObjectPool/ObjectPool<src/assembly/Z80Cpu/Z80Cpu>#create (; 79 ;) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  local.get $0
  i32.load
  i32.const 13
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
 (func $src/assembly/index/createCpu (; 80 ;) (result i32)
  global.get $src/assembly/index/cpuPool
  i32.const 0
  call $src/assembly/ObjectPool/ObjectPool<src/assembly/Z80Cpu/Z80Cpu>#create
 )
 (func $~lib/array/Array<bool>#__unchecked_get (; 81 ;) (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 0
  i32.shl
  i32.add
  i32.load8_u
 )
 (func $~lib/array/Array<bool>#__get (; 82 ;) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
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
  local.get $1
  call $~lib/array/Array<bool>#__unchecked_get
  local.set $2
  local.get $2
 )
 (func $src/assembly/ObjectPool/ObjectPool<src/assembly/Z80Cpu/Z80Cpu>#release (; 83 ;) (param $0 i32) (param $1 i32) (result i32)
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
 (func $src/assembly/index/releaseCpu (; 84 ;) (param $0 i32) (result i32)
  global.get $src/assembly/index/cpuPool
  local.get $0
  call $src/assembly/ObjectPool/ObjectPool<src/assembly/Z80Cpu/Z80Cpu>#release
 )
 (func $~lib/array/Array<src/assembly/Z80Cpu/Z80Cpu | null>#__unchecked_get (; 85 ;) (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 2
  i32.shl
  i32.add
  i32.load
  call $~lib/rt/pure/__retain
 )
 (func $~lib/array/Array<src/assembly/Z80Cpu/Z80Cpu | null>#__get (; 86 ;) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
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
  local.get $1
  call $~lib/array/Array<src/assembly/Z80Cpu/Z80Cpu | null>#__unchecked_get
  local.set $2
  local.get $2
 )
 (func $src/assembly/ObjectPool/ObjectPool<src/assembly/Z80Cpu/Z80Cpu>#get (; 87 ;) (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  i32.load offset=4
  local.get $1
  call $~lib/array/Array<src/assembly/Z80Cpu/Z80Cpu | null>#__get
 )
 (func $src/assembly/index/getCpu (; 88 ;) (param $0 i32) (result i32)
  global.get $src/assembly/index/cpuPool
  local.get $0
  call $src/assembly/ObjectPool/ObjectPool<src/assembly/Z80Cpu/Z80Cpu>#get
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#longOp (; 89 ;) (param $0 i32)
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
    i32.store16
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:af (; 90 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u
 )
 (func $src/assembly/index/longOp (; 91 ;) (param $0 i32) (result i32)
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
 (func $src/assembly/index/getTestMachinePoolMaxSize (; 92 ;) (result i32)
  global.get $src/assembly/index/testMachinePool
  i32.load offset=8
 )
 (func $src/assembly/index/resetTestMachinePool (; 93 ;)
  global.get $src/assembly/index/testMachinePool
  call $src/assembly/ObjectPool/ObjectPool<src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine>#reset
 )
 (func $src/assembly/ObjectPool/ObjectPool<src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine>#create~anonymous|0 (; 94 ;) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
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
 (func $src/assembly/ObjectPool/ObjectPool<src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine>#create (; 95 ;) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  local.get $0
  i32.load
  i32.const 14
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
  call $~lib/array/Array<src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine | null>#__set
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
 (func $src/assembly/index/createTestMachine (; 96 ;) (result i32)
  global.get $src/assembly/index/testMachinePool
  i32.const 0
  call $src/assembly/ObjectPool/ObjectPool<src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine>#create
 )
 (func $src/assembly/ObjectPool/ObjectPool<src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine>#release (; 97 ;) (param $0 i32) (param $1 i32) (result i32)
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
  call $~lib/array/Array<src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine | null>#__set
  i32.const 1
 )
 (func $src/assembly/index/releaseTestMachine (; 98 ;) (param $0 i32) (result i32)
  global.get $src/assembly/index/testMachinePool
  local.get $0
  call $src/assembly/ObjectPool/ObjectPool<src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine>#release
 )
 (func $~lib/array/Array<src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine | null>#__unchecked_get (; 99 ;) (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 2
  i32.shl
  i32.add
  i32.load
  call $~lib/rt/pure/__retain
 )
 (func $~lib/array/Array<src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine | null>#__get (; 100 ;) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
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
  local.get $1
  call $~lib/array/Array<src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine | null>#__unchecked_get
  local.set $2
  local.get $2
 )
 (func $src/assembly/ObjectPool/ObjectPool<src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine>#get (; 101 ;) (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  i32.load offset=4
  local.get $1
  call $~lib/array/Array<src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine | null>#__get
 )
 (func $src/assembly/index/getTestMachine (; 102 ;) (param $0 i32) (result i32)
  global.get $src/assembly/index/testMachinePool
  local.get $0
  call $src/assembly/ObjectPool/ObjectPool<src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine>#get
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#constructor (; 103 ;) (param $0 i32) (result i32)
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
 (func $src/assembly/Z80Cpu/Z80Cpu#get:f (; 104 ;) (param $0 i32) (result i32)
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#get:af
  i32.const 255
  i32.and
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_af_ (; 105 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=8
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:b (; 106 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=2
  i32.const 8
  i32.shr_u
  i32.const 255
  i32.and
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:c (; 107 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=2
  i32.const 255
  i32.and
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:bc (; 108 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=2
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_bc_ (; 109 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=10
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:d (; 110 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=4
  i32.const 8
  i32.shr_u
  i32.const 255
  i32.and
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:e (; 111 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=4
  i32.const 255
  i32.and
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:de (; 112 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=4
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_de_ (; 113 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=12
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:h (; 114 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=6
  i32.const 8
  i32.shr_u
  i32.const 255
  i32.and
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:l (; 115 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=6
  i32.const 255
  i32.and
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:hl (; 116 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=6
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_hl_ (; 117 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=14
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:i (; 118 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=16
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:xh (; 119 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=22
  i32.const 8
  i32.shr_u
  i32.const 255
  i32.and
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:xl (; 120 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=22
  i32.const 255
  i32.and
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:ix (; 121 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=22
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:yh (; 122 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=24
  i32.const 8
  i32.shr_u
  i32.const 255
  i32.and
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:yl (; 123 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=24
  i32.const 255
  i32.and
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:iy (; 124 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=24
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:pc (; 125 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=18
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:r (; 126 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=17
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:sp (; 127 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=20
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:wh (; 128 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=26
  i32.const 8
  i32.shr_u
  i32.const 255
  i32.and
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:wl (; 129 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=26
  i32.const 255
  i32.and
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:wz (; 130 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=26
 )
 (func $src/assembly/test-machine/WaTestZ80Cpu/WaTestZ80Cpu#getCpuState (; 131 ;) (param $0 i32) (result i32)
  (local $1 i32)
  i32.const 0
  call $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#constructor
  local.set $1
  local.get $1
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#get:a
  i32.store8
  local.get $1
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#get:f
  i32.store8 offset=1
  local.get $1
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#get:af
  i32.store16 offset=2
  local.get $1
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#get:_af_
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
  call $src/assembly/Z80Cpu/Z80Cpu#get:bc
  i32.store16 offset=6
  local.get $1
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#get:_bc_
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
  call $src/assembly/Z80Cpu/Z80Cpu#get:de
  i32.store16 offset=10
  local.get $1
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#get:_de_
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
  call $src/assembly/Z80Cpu/Z80Cpu#get:hl
  i32.store16 offset=14
  local.get $1
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#get:_hl_
  i32.store16 offset=22
  local.get $1
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#get:i
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
  call $src/assembly/Z80Cpu/Z80Cpu#get:ix
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
  call $src/assembly/Z80Cpu/Z80Cpu#get:iy
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
  call $src/assembly/Z80Cpu/Z80Cpu#get:pc
  i32.store16 offset=26
  local.get $1
  local.get $0
  i32.load offset=64
  i32.store offset=64
  local.get $1
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#get:r
  i32.store8 offset=25
  local.get $1
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#get:sp
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
  i32.wrap_i64
  i32.store offset=48
  local.get $1
  local.get $0
  i64.load offset=32
  i32.wrap_i64
  i32.store offset=44
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
  call $src/assembly/Z80Cpu/Z80Cpu#get:wz
  i32.store16 offset=40
  local.get $1
 )
 (func $src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine#get:machineState (; 132 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load
  call $src/assembly/test-machine/WaTestZ80Cpu/WaTestZ80Cpu#getCpuState
 )
 (func $src/assembly/index/getTestMachineState (; 133 ;) (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $src/assembly/index/testMachinePool
  local.get $0
  call $src/assembly/ObjectPool/ObjectPool<src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine>#get
  local.set $1
  local.get $1
  i32.const 0
  i32.eq
  if (result i32)
   i32.const 0
   call $~lib/rt/pure/__retain
  else
   local.get $1
   call $src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine#get:machineState
   local.tee $2
  end
  local.set $2
  local.get $1
  call $~lib/rt/pure/__release
  local.get $2
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:_af_ (; 134 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=8
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:b (; 135 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.const 8
  i32.shl
  local.get $0
  i32.load16_u offset=2
  i32.or
  i32.const 255
  i32.and
  i32.store16 offset=2
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:c (; 136 ;) (param $0 i32) (param $1 i32)
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
 (func $src/assembly/Z80Cpu/Z80Cpu#set:bc (; 137 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=2
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:_bc_ (; 138 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=10
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:d (; 139 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.const 8
  i32.shl
  local.get $0
  i32.load16_u offset=4
  i32.or
  i32.const 255
  i32.and
  i32.store16 offset=4
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:e (; 140 ;) (param $0 i32) (param $1 i32)
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
 (func $src/assembly/Z80Cpu/Z80Cpu#set:de (; 141 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=4
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:_de_ (; 142 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=12
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:h (; 143 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.const 8
  i32.shl
  local.get $0
  i32.load16_u offset=6
  i32.or
  i32.const 255
  i32.and
  i32.store16 offset=6
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:l (; 144 ;) (param $0 i32) (param $1 i32)
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
 (func $src/assembly/Z80Cpu/Z80Cpu#set:hl (; 145 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=6
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:_hl_ (; 146 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=14
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:xh (; 147 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.const 8
  i32.shl
  local.get $0
  i32.load16_u offset=22
  i32.or
  i32.const 255
  i32.and
  i32.store16 offset=22
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:xl (; 148 ;) (param $0 i32) (param $1 i32)
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
 (func $src/assembly/Z80Cpu/Z80Cpu#set:ix (; 149 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=22
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:yh (; 150 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.const 8
  i32.shl
  local.get $0
  i32.load16_u offset=24
  i32.or
  i32.const 255
  i32.and
  i32.store16 offset=24
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:yl (; 151 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $0
  i32.load16_u offset=24
  i32.const 65535
  i32.and
  local.get $1
  i32.const 255
  i32.and
  i32.or
  i32.store16 offset=24
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:iy (; 152 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=24
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:sp (; 153 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=20
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:wh (; 154 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.const 8
  i32.shl
  local.get $0
  i32.load16_u offset=26
  i32.or
  i32.const 255
  i32.and
  i32.store16 offset=26
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:wl (; 155 ;) (param $0 i32) (param $1 i32)
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
 (func $src/assembly/Z80Cpu/Z80Cpu#set:wz (; 156 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=26
 )
 (func $src/assembly/test-machine/WaTestZ80Cpu/WaTestZ80Cpu#updateCpuState (; 157 ;) (param $0 i32) (param $1 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  local.set $1
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
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine#set:machineState (; 158 ;) (param $0 i32) (param $1 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  local.set $1
  local.get $0
  i32.load
  local.get $1
  call $src/assembly/test-machine/WaTestZ80Cpu/WaTestZ80Cpu#updateCpuState
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $src/assembly/index/updateTestMachineState (; 159 ;) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  local.set $1
  global.get $src/assembly/index/testMachinePool
  local.get $0
  call $src/assembly/ObjectPool/ObjectPool<src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine>#get
  local.set $2
  local.get $2
  i32.const 0
  i32.eq
  if
   i32.const 0
   local.set $3
   local.get $1
   call $~lib/rt/pure/__release
   local.get $2
   call $~lib/rt/pure/__release
   local.get $3
   return
  end
  local.get $2
  local.get $1
  call $src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine#set:machineState
  i32.const 1
  local.set $3
  local.get $2
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
  local.get $3
 )
 (func $src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine#get:memory (; 160 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load
  i32.load offset=76
  i32.load
  call $~lib/rt/pure/__retain
 )
 (func $src/assembly/index/getTestMachineMemory (; 161 ;) (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $src/assembly/index/testMachinePool
  local.get $0
  call $src/assembly/ObjectPool/ObjectPool<src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine>#get
  local.set $1
  local.get $1
  i32.const 0
  i32.eq
  if (result i32)
   i32.const 0
   call $~lib/rt/pure/__retain
  else
   local.get $1
   call $src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine#get:memory
   local.tee $2
  end
  local.set $2
  local.get $1
  call $~lib/rt/pure/__release
  local.get $2
 )
 (func $src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine#set:memory (; 162 ;) (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  local.set $1
  local.get $0
  i32.load
  i32.load offset=76
  local.tee $2
  local.get $1
  local.tee $3
  local.get $2
  i32.load
  local.tee $4
  i32.ne
  if
   local.get $3
   call $~lib/rt/pure/__retain
   local.set $3
   local.get $4
   call $~lib/rt/pure/__release
  end
  local.get $3
  i32.store
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $src/assembly/index/updateTestMachineMemory (; 163 ;) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  local.set $1
  global.get $src/assembly/index/testMachinePool
  local.get $0
  call $src/assembly/ObjectPool/ObjectPool<src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine>#get
  local.set $2
  local.get $2
  i32.const 0
  i32.eq
  if
   i32.const 0
   local.set $3
   local.get $1
   call $~lib/rt/pure/__release
   local.get $2
   call $~lib/rt/pure/__release
   local.get $3
   return
  end
  local.get $2
  local.get $1
  call $src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine#set:memory
  i32.const 1
  local.set $3
  local.get $2
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
  local.get $3
 )
 (func $~lib/typedarray/Uint8Array#get:length (; 164 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=8
 )
 (func $~lib/typedarray/Uint8Array#__get (; 165 ;) (param $0 i32) (param $1 i32) (result i32)
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
  local.get $0
  i32.load offset=4
  local.get $1
  i32.add
  i32.load8_u
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#reset (; 166 ;) (param $0 i32)
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#executeReset
 )
 (func $src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine#initCode (; 167 ;) (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  local.set $1
  local.get $0
  i32.load
  i32.load offset=76
  i32.load
  call $~lib/rt/pure/__retain
  local.set $4
  i32.const 0
  local.set $5
  loop $for-loop|0
   local.get $5
   local.get $1
   call $~lib/typedarray/Uint8Array#get:length
   i32.lt_s
   local.set $6
   local.get $6
   if
    local.get $4
    local.get $2
    local.tee $7
    i32.const 1
    i32.add
    local.set $2
    local.get $7
    i32.const 65535
    i32.and
    local.get $1
    local.get $5
    call $~lib/typedarray/Uint8Array#__get
    call $~lib/array/Array<u8>#__set
    local.get $5
    i32.const 1
    i32.add
    local.set $5
    br $for-loop|0
   end
  end
  local.get $0
  i32.const 0
  i32.store16 offset=4
  local.get $2
  i32.const 65535
  i32.and
  local.set $5
  loop $while-continue|1
   local.get $5
   i32.const 65536
   i32.lt_s
   local.set $6
   local.get $6
   if
    local.get $4
    local.get $5
    local.tee $7
    i32.const 1
    i32.add
    local.set $5
    local.get $7
    i32.const 0
    call $~lib/array/Array<u8>#__set
    br $while-continue|1
   end
  end
  local.get $0
  i32.load
  call $src/assembly/Z80Cpu/Z80Cpu#reset
  local.get $0
  i32.load
  local.get $3
  call $src/assembly/Z80Cpu/Z80Cpu#set:pc
  local.get $4
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $src/assembly/index/initTestMachineCode (; 168 ;) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  local.get $2
  call $~lib/rt/pure/__retain
  local.set $2
  global.get $src/assembly/index/testMachinePool
  local.get $0
  call $src/assembly/ObjectPool/ObjectPool<src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine>#get
  local.set $3
  local.get $3
  i32.const 0
  i32.eq
  if
   i32.const 0
   local.set $4
   local.get $2
   call $~lib/rt/pure/__release
   local.get $3
   call $~lib/rt/pure/__release
   local.get $4
   return
  end
  local.get $3
  local.get $1
  i32.store offset=8
  local.get $3
  local.get $2
  i32.const 0
  i32.const 0
  call $src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine#initCode
  i32.const 1
  local.set $4
  local.get $3
  call $~lib/rt/pure/__release
  local.get $2
  call $~lib/rt/pure/__release
  local.get $4
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#writeMemory (; 169 ;) (param $0 i32) (param $1 i32) (param $2 i32)
  nop
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#readMemory (; 170 ;) (param $0 i32) (param $1 i32) (result i32)
  i32.const 255
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#executeInterrupt (; 171 ;) (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  local.get $0
  i32.load offset=40
  i32.const 8
  i32.and
  i32.const 0
  i32.ne
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
   global.get $src/assembly/Z80Cpu/Z80StateFlags.InvHalted
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
  call $src/assembly/Z80Cpu/Z80Cpu#get:sp
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
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#get:sp
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#get:pc
  i32.const 8
  i32.shr_u
  call $src/assembly/Z80Cpu/Z80Cpu#writeMemory
  local.get $0
  local.get $0
  i64.load offset=32
  i64.const 3
  i64.add
  i64.store offset=32
  local.get $0
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#get:sp
  i32.const 1
  i32.sub
  call $src/assembly/Z80Cpu/Z80Cpu#set:sp
  local.get $0
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#get:sp
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#get:pc
  i32.const 255
  i32.and
  call $src/assembly/Z80Cpu/Z80Cpu#writeMemory
  local.get $0
  local.get $0
  i64.load offset=32
  i64.const 3
  i64.add
  i64.store offset=32
  block $break|0
   block $case2|0
    block $case1|0
     block $case0|0
      local.get $0
      i32.load8_u offset=47
      local.set $1
      local.get $1
      i32.const 0
      i32.eq
      br_if $case0|0
      local.get $1
      i32.const 1
      i32.eq
      br_if $case1|0
      br $case2|0
     end
    end
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
   i32.load8_u offset=16
   i32.const 8
   i32.shl
   local.get $0
   i32.load8_u offset=17
   i32.or
   i32.const 255
   i32.and
   i32.const 65280
   i32.and
   i32.const 255
   i32.or
   local.set $1
   local.get $0
   local.get $0
   i64.load offset=32
   i64.const 5
   i64.add
   i64.store offset=32
   local.get $0
   local.get $1
   call $src/assembly/Z80Cpu/Z80Cpu#readMemory
   local.set $2
   local.get $0
   local.get $0
   i64.load offset=32
   i64.const 3
   i64.add
   i64.store offset=32
   local.get $0
   local.get $1
   i32.const 1
   i32.add
   local.tee $1
   call $src/assembly/Z80Cpu/Z80Cpu#readMemory
   local.set $3
   local.get $0
   local.get $0
   i64.load offset=32
   i64.const 3
   i64.add
   i64.store offset=32
   local.get $0
   local.get $3
   i32.const 8
   i32.shl
   local.get $2
   i32.or
   i32.const 255
   i32.and
   call $src/assembly/Z80Cpu/Z80Cpu#set:wz
   local.get $0
   local.get $0
   i64.load offset=32
   i64.const 6
   i64.add
   i64.store offset=32
   br $break|0
  end
  local.get $0
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#get:wz
  call $src/assembly/Z80Cpu/Z80Cpu#set:pc
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#refreshMemory (; 172 ;) (param $0 i32)
  local.get $0
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#get:r
  i32.const 1
  i32.add
  i32.const 127
  i32.and
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#get:r
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
 (func $src/assembly/Z80Cpu/Z80Cpu#executeNmi (; 173 ;) (param $0 i32)
  local.get $0
  i32.load offset=40
  i32.const 8
  i32.and
  i32.const 0
  i32.ne
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
   global.get $src/assembly/Z80Cpu/Z80StateFlags.InvHalted
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
  call $src/assembly/Z80Cpu/Z80Cpu#get:sp
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
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#get:sp
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#get:pc
  i32.const 8
  i32.shr_u
  call $src/assembly/Z80Cpu/Z80Cpu#writeMemory
  local.get $0
  local.get $0
  i64.load offset=32
  i64.const 3
  i64.add
  i64.store offset=32
  local.get $0
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#get:sp
  i32.const 1
  i32.sub
  call $src/assembly/Z80Cpu/Z80Cpu#set:sp
  local.get $0
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#get:sp
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#get:pc
  i32.const 255
  i32.and
  call $src/assembly/Z80Cpu/Z80Cpu#writeMemory
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
 (func $src/assembly/Z80Cpu/Z80Cpu#processCpuSignals (; 174 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=40
  i32.const 1
  i32.and
  i32.const 0
  i32.ne
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
  i32.const 0
  i32.ne
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
  i32.const 0
  i32.ne
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
  i32.const 0
  i32.ne
  if
   local.get $0
   call $src/assembly/Z80Cpu/Z80Cpu#executeNmi
   i32.const 1
   return
  end
  i32.const 0
 )
 (func $~lib/typedarray/Uint32Array#__get (; 175 ;) (param $0 i32) (param $1 i32) (result i32)
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
 (func $src/assembly/MemoryStatusArray/MemoryStatusArray#touch (; 176 ;) (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  local.get $1
  i32.const 65535
  i32.and
  local.set $1
  local.get $1
  i32.const 5
  i32.shr_u
  local.set $2
  i32.const 1
  local.get $1
  i32.const 32
  i32.rem_u
  i32.shl
  local.set $3
  local.get $0
  i32.load
  local.get $2
  local.get $0
  i32.load
  local.get $2
  call $~lib/typedarray/Uint32Array#__get
  local.get $3
  i32.or
  call $~lib/typedarray/Uint32Array#__set
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#readCodeMemory (; 177 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=52
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#get:pc
  call $src/assembly/MemoryStatusArray/MemoryStatusArray#touch
  local.get $0
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#get:pc
  call $src/assembly/Z80Cpu/Z80Cpu#readMemory
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#executeCpuCycle (; 178 ;) (param $0 i32)
  (local $1 i32)
  local.get $0
  i32.load offset=40
  i32.const 0
  i32.ne
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
  local.set $1
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
  return
 )
 (func $src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine#run (; 179 ;) (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  i32.const 0
  local.set $1
  loop $while-continue|0
   local.get $1
   i32.eqz
   local.set $2
   local.get $2
   if
    local.get $0
    i32.load
    call $src/assembly/Z80Cpu/Z80Cpu#executeCpuCycle
    block $break|1
     block $case4|1
      block $case3|1
       block $case2|1
        block $case1|1
         block $case0|1
          local.get $0
          i32.load offset=8
          local.set $3
          local.get $3
          global.get $src/shared/RunMode/RunMode.Normal
          i32.eq
          br_if $case0|1
          local.get $3
          global.get $src/shared/RunMode/RunMode.OneCycle
          i32.eq
          br_if $case1|1
          local.get $3
          global.get $src/shared/RunMode/RunMode.OneInstruction
          i32.eq
          br_if $case2|1
          local.get $3
          global.get $src/shared/RunMode/RunMode.UntilHalt
          i32.eq
          br_if $case3|1
          br $case4|1
         end
        end
        i32.const 1
        local.set $1
        br $break|1
       end
       local.get $0
       i32.load
       i32.load8_u offset=49
       i32.eqz
       local.set $1
       br $break|1
      end
      local.get $0
      i32.load
      i32.load offset=40
      global.get $src/assembly/Z80Cpu/Z80StateFlags.Halted
      i32.and
      i32.const 0
      i32.ne
      local.set $1
      br $break|1
     end
     local.get $0
     i32.load
     call $src/assembly/Z80Cpu/Z80Cpu#get:pc
     local.get $0
     i32.load16_u offset=4
     i32.ge_u
     local.set $1
     br $break|1
    end
    br $while-continue|0
   end
  end
 )
 (func $src/assembly/index/runTestMachine (; 180 ;) (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  global.get $src/assembly/index/testMachinePool
  local.get $0
  call $src/assembly/ObjectPool/ObjectPool<src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine>#get
  local.set $1
  local.get $1
  i32.const 0
  i32.eq
  if
   i32.const 0
   local.set $2
   local.get $1
   call $~lib/rt/pure/__release
   local.get $2
   return
  end
  local.get $1
  call $src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine#run
  i32.const 1
  local.set $2
  local.get $1
  call $~lib/rt/pure/__release
  local.get $2
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_af (; 181 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:_af (; 182 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_bc (; 183 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=2
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:_bc (; 184 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=2
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_de (; 185 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=4
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:_de (; 186 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=4
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_hl (; 187 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=6
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:_hl (; 188 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=6
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_af_sec (; 189 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=8
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:_af_sec (; 190 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=8
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_bc_sec (; 191 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=10
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:_bc_sec (; 192 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=10
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_de_sec (; 193 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=12
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:_de_sec (; 194 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=12
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_hl_sec (; 195 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=14
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:_hl_sec (; 196 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=14
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_i (; 197 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=16
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:_i (; 198 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=16
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_r (; 199 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=17
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:_r (; 200 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=17
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_pc (; 201 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=18
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:_pc (; 202 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=18
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_sp (; 203 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=20
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:_sp (; 204 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=20
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_ix (; 205 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=22
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:_ix (; 206 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=22
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_iy (; 207 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=24
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:_iy (; 208 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=24
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_wz (; 209 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=26
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:_wz (; 210 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=26
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:tacts (; 211 ;) (param $0 i32) (result i64)
  local.get $0
  i64.load offset=32
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:tacts (; 212 ;) (param $0 i32) (param $1 i64)
  local.get $0
  local.get $1
  i64.store offset=32
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:stateFlags (; 213 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=40
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:stateFlags (; 214 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store offset=40
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:useGateArrayContention (; 215 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=44
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:useGateArrayContention (; 216 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=44
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:iff1 (; 217 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=45
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:iff1 (; 218 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=45
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:iff2 (; 219 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=46
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:iff2 (; 220 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=46
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:interruptMode (; 221 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=47
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:interruptMode (; 222 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=47
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:isInterruptBlocked (; 223 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=48
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:isInterruptBlocked (; 224 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=48
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:isInOpExecution (; 225 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=49
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:isInOpExecution (; 226 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=49
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:executionFlowStatus (; 227 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=52
  call $~lib/rt/pure/__retain
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:executionFlowStatus (; 228 ;) (param $0 i32) (param $1 i32)
  (local $2 i32)
  local.get $0
  local.get $1
  local.get $0
  i32.load offset=52
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
  i32.store offset=52
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:memoryReadStatus (; 229 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=56
  call $~lib/rt/pure/__retain
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:memoryReadStatus (; 230 ;) (param $0 i32) (param $1 i32)
  (local $2 i32)
  local.get $0
  local.get $1
  local.get $0
  i32.load offset=56
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
  i32.store offset=56
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:memoryWriteStatus (; 231 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=60
  call $~lib/rt/pure/__retain
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:memoryWriteStatus (; 232 ;) (param $0 i32) (param $1 i32)
  (local $2 i32)
  local.get $0
  local.get $1
  local.get $0
  i32.load offset=60
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
  i32.store offset=60
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:prefixMode (; 233 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=64
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:prefixMode (; 234 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store offset=64
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:indexMode (; 235 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=68
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:indexMode (; 236 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store offset=68
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:maskableInterruptModeEntered (; 237 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=72
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:maskableInterruptModeEntered (; 238 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=72
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:opCode (; 239 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=73
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:opCode (; 240 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=73
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:allowExtendedInstructionSet (; 241 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=74
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:allowExtendedInstructionSet (; 242 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=74
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#getReg8 (; 243 ;) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  block $case7|0
   block $case6|0
    block $case5|0
     block $case4|0
      block $case3|0
       block $case2|0
        block $case1|0
         block $case0|0
          local.get $1
          i32.const 255
          i32.and
          local.set $2
          local.get $2
          i32.const 0
          i32.eq
          br_if $case0|0
          local.get $2
          i32.const 1
          i32.eq
          br_if $case1|0
          local.get $2
          i32.const 2
          i32.eq
          br_if $case2|0
          local.get $2
          i32.const 3
          i32.eq
          br_if $case3|0
          local.get $2
          i32.const 4
          i32.eq
          br_if $case4|0
          local.get $2
          i32.const 5
          i32.eq
          br_if $case5|0
          local.get $2
          i32.const 7
          i32.eq
          br_if $case6|0
          br $case7|0
         end
         local.get $0
         i32.load16_u offset=2
         i32.const 8
         i32.shr_u
         i32.const 255
         i32.and
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
       i32.const 255
       i32.and
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
     i32.const 255
     i32.and
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
   i32.const 255
   i32.and
   return
  end
  i32.const 255
  return
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#setReg8 (; 244 ;) (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  block $break|0
   block $case6|0
    block $case5|0
     block $case4|0
      block $case3|0
       block $case2|0
        block $case1|0
         block $case0|0
          local.get $1
          i32.const 255
          i32.and
          local.set $3
          local.get $3
          i32.const 0
          i32.eq
          br_if $case0|0
          local.get $3
          i32.const 1
          i32.eq
          br_if $case1|0
          local.get $3
          i32.const 2
          i32.eq
          br_if $case2|0
          local.get $3
          i32.const 3
          i32.eq
          br_if $case3|0
          local.get $3
          i32.const 4
          i32.eq
          br_if $case4|0
          local.get $3
          i32.const 5
          i32.eq
          br_if $case5|0
          local.get $3
          i32.const 7
          i32.eq
          br_if $case6|0
          br $break|0
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
   br $break|0
  end
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#getReg16 (; 245 ;) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  block $case4|0
   block $case3|0
    block $case2|0
     block $case1|0
      block $case0|0
       local.get $1
       i32.const 255
       i32.and
       local.set $2
       local.get $2
       i32.const 0
       i32.eq
       br_if $case0|0
       local.get $2
       i32.const 1
       i32.eq
       br_if $case1|0
       local.get $2
       i32.const 2
       i32.eq
       br_if $case2|0
       local.get $2
       i32.const 3
       i32.eq
       br_if $case3|0
       br $case4|0
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
  return
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#setReg16 (; 246 ;) (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  block $break|0
   block $case3|0
    block $case2|0
     block $case1|0
      block $case0|0
       local.get $1
       i32.const 255
       i32.and
       local.set $3
       local.get $3
       i32.const 0
       i32.eq
       br_if $case0|0
       local.get $3
       i32.const 1
       i32.eq
       br_if $case1|0
       local.get $3
       i32.const 2
       i32.eq
       br_if $case2|0
       local.get $3
       i32.const 3
       i32.eq
       br_if $case3|0
       br $break|0
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
   br $break|0
  end
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:sFlag (; 247 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u
  i32.const 255
  i32.and
  global.get $src/assembly/Z80Cpu/FlagsSetMask.S
  i32.and
  i32.const 0
  i32.ne
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:zFlag (; 248 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u
  i32.const 255
  i32.and
  global.get $src/assembly/Z80Cpu/FlagsSetMask.Z
  i32.and
  i32.const 0
  i32.ne
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:r5Flag (; 249 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u
  i32.const 255
  i32.and
  global.get $src/assembly/Z80Cpu/FlagsSetMask.R5
  i32.and
  i32.const 0
  i32.ne
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:hFlag (; 250 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u
  i32.const 255
  i32.and
  global.get $src/assembly/Z80Cpu/FlagsSetMask.H
  i32.and
  i32.const 0
  i32.ne
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:r3Flag (; 251 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u
  i32.const 255
  i32.and
  global.get $src/assembly/Z80Cpu/FlagsSetMask.R3
  i32.and
  i32.const 0
  i32.ne
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:pvFlag (; 252 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u
  i32.const 255
  i32.and
  global.get $src/assembly/Z80Cpu/FlagsSetMask.PV
  i32.and
  i32.const 0
  i32.ne
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:nFlag (; 253 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u
  i32.const 255
  i32.and
  global.get $src/assembly/Z80Cpu/FlagsSetMask.N
  i32.and
  i32.const 0
  i32.ne
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:cFlag (; 254 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u
  i32.const 255
  i32.and
  global.get $src/assembly/Z80Cpu/FlagsSetMask.C
  i32.and
  i32.const 0
  i32.ne
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#readPort (; 255 ;) (param $0 i32) (param $1 i32) (result i32)
  i32.const 255
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#writePort (; 256 ;) (param $0 i32) (param $1 i32) (param $2 i32)
  nop
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#delay (; 257 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $0
  i64.load offset=32
  local.get $1
  i64.extend_i32_s
  i64.add
  i64.store offset=32
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#getCallInstructionLength (; 258 ;) (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#get:pc
  call $src/assembly/Z80Cpu/Z80Cpu#readMemory
  local.set $1
  local.get $1
  i32.const 205
  i32.eq
  if
   i32.const 3
   return
  end
  local.get $1
  i32.const 199
  i32.and
  i32.const 196
  i32.eq
  if
   i32.const 3
   return
  end
  local.get $1
  i32.const 199
  i32.and
  i32.const 199
  i32.eq
  if
   i32.const 1
   return
  end
  local.get $1
  i32.const 118
  i32.eq
  if
   i32.const 1
   return
  end
  local.get $1
  i32.const 237
  i32.ne
  if
   i32.const 0
   return
  end
  local.get $0
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#get:pc
  i32.const 1
  i32.add
  i32.const 65535
  i32.and
  call $src/assembly/Z80Cpu/Z80Cpu#readMemory
  local.set $1
  local.get $1
  i32.const 180
  i32.and
  i32.const 176
  i32.eq
  if (result i32)
   i32.const 2
  else
   i32.const 0
  end
 )
 (func "$~lib/array/Array<((cpu: src/assembly/Z80Cpu/Z80Cpu) => void) | null>#__unchecked_get" (; 259 ;) (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 2
  i32.shl
  i32.add
  i32.load
 )
 (func "$~lib/array/Array<((cpu: src/assembly/Z80Cpu/Z80Cpu) => void) | null>#__get" (; 260 ;) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
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
  local.get $1
  call "$~lib/array/Array<((cpu: src/assembly/Z80Cpu/Z80Cpu) => void) | null>#__unchecked_get"
  local.set $2
  local.get $2
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#processStandardOrIndexedOperations (; 261 ;) (param $0 i32)
  (local $1 i32)
  local.get $0
  i32.load offset=68
  i32.const 0
  i32.eq
  if (result i32)
   i32.const 1184
   local.get $0
   i32.load8_u offset=73
   call "$~lib/array/Array<((cpu: src/assembly/Z80Cpu/Z80Cpu) => void) | null>#__get"
  else
   i32.const 1376
   local.get $0
   i32.load8_u offset=73
   call "$~lib/array/Array<((cpu: src/assembly/Z80Cpu/Z80Cpu) => void) | null>#__get"
  end
  local.set $1
  local.get $1
  i32.const 0
  i32.ne
  if
   i32.const 1
   global.set $~argumentsLength
   local.get $0
   local.get $1
   call_indirect (type $i32_=>_none)
  end
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#processEDOperations (; 262 ;) (param $0 i32)
  (local $1 i32)
  i32.const 1248
  local.get $0
  i32.load8_u offset=73
  call "$~lib/array/Array<((cpu: src/assembly/Z80Cpu/Z80Cpu) => void) | null>#__get"
  local.set $1
  local.get $1
  i32.const 0
  i32.ne
  if
   i32.const 1
   global.set $~argumentsLength
   local.get $0
   local.get $1
   call_indirect (type $i32_=>_none)
  end
 )
 (func "$~lib/array/Array<((cpu: src/assembly/Z80Cpu/Z80Cpu, addr: u16) => void) | null>#__unchecked_get" (; 263 ;) (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 2
  i32.shl
  i32.add
  i32.load
 )
 (func "$~lib/array/Array<((cpu: src/assembly/Z80Cpu/Z80Cpu, addr: u16) => void) | null>#__get" (; 264 ;) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
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
  local.get $1
  call "$~lib/array/Array<((cpu: src/assembly/Z80Cpu/Z80Cpu, addr: u16) => void) | null>#__unchecked_get"
  local.set $2
  local.get $2
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#processCBPrefixedOperations (; 265 ;) (param $0 i32)
  (local $1 i32)
  local.get $0
  i32.load offset=68
  i32.const 0
  i32.eq
  if
   i32.const 1312
   local.get $0
   i32.load8_u offset=73
   call "$~lib/array/Array<((cpu: src/assembly/Z80Cpu/Z80Cpu) => void) | null>#__get"
   local.set $1
   local.get $1
   i32.const 0
   i32.ne
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
   call $src/assembly/Z80Cpu/Z80Cpu#get:ix
  else
   local.get $0
   call $src/assembly/Z80Cpu/Z80Cpu#get:iy
  end
  local.get $0
  i32.load8_u offset=73
  i32.const 24
  i32.shl
  i32.const 24
  i32.shr_s
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:wz
  local.get $0
  i32.load8_u offset=44
  i32.eqz
  if
   local.get $0
   local.get $0
   call $src/assembly/Z80Cpu/Z80Cpu#get:pc
   i32.const 1
   i32.sub
   call $src/assembly/Z80Cpu/Z80Cpu#readMemory
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
  call $src/assembly/Z80Cpu/Z80Cpu#get:pc
  i32.const 1
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:pc
  i32.const 1440
  local.get $0
  i32.load8_u offset=73
  call "$~lib/array/Array<((cpu: src/assembly/Z80Cpu/Z80Cpu, addr: u16) => void) | null>#__get"
  local.set $1
  local.get $1
  i32.const 0
  i32.ne
  if
   i32.const 2
   global.set $~argumentsLength
   local.get $0
   local.get $0
   call $src/assembly/Z80Cpu/Z80Cpu#get:wz
   local.get $1
   call_indirect (type $i32_i32_=>_none)
  end
 )
 (func $src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine#get:cpu (; 266 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load
  call $~lib/rt/pure/__retain
 )
 (func $src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine#set:cpu (; 267 ;) (param $0 i32) (param $1 i32)
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
 (func $src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine#get:codeEndsAt (; 268 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=4
 )
 (func $src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine#set:codeEndsAt (; 269 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=4
 )
 (func $src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine#get:runMode (; 270 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=8
 )
 (func $src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine#set:runMode (; 271 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store offset=8
 )
 (func $src/assembly/test-machine/WaTestZ80Cpu/TestMemoryDevice#get:log (; 272 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=4
  call $~lib/rt/pure/__retain
 )
 (func $src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine#get:memoryAccessLog (; 273 ;) (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  i32.load
  i32.load offset=76
  call $src/assembly/test-machine/WaTestZ80Cpu/TestMemoryDevice#get:log
  local.tee $1
 )
 (func $src/assembly/test-machine/WaTestZ80Cpu/TestPortDevice#get:log (; 274 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=4
  call $~lib/rt/pure/__retain
 )
 (func $src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine#get:ioAccessLog (; 275 ;) (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  i32.load
  i32.load offset=80
  call $src/assembly/test-machine/WaTestZ80Cpu/TestPortDevice#get:log
  local.tee $1
 )
 (func $~lib/array/Array<u8>#get:length (; 276 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=12
 )
 (func $src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine#get:memoryLength (; 277 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load
  i32.load offset=76
  i32.load
  call $~lib/array/Array<u8>#get:length
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:a (; 278 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:a (; 279 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:f (; 280 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=1
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:f (; 281 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=1
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:af (; 282 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=2
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:af (; 283 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=2
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:b (; 284 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=4
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:b (; 285 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=4
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:c (; 286 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=5
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:c (; 287 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=5
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:bc (; 288 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=6
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:bc (; 289 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=6
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:d (; 290 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=8
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:d (; 291 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=8
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:e (; 292 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=9
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:e (; 293 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=9
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:de (; 294 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=10
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:de (; 295 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=10
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:h (; 296 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=12
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:h (; 297 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=12
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:l (; 298 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=13
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:l (; 299 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=13
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:hl (; 300 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=14
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:hl (; 301 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=14
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:af_sec (; 302 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=16
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:af_sec (; 303 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=16
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:bc_sec (; 304 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=18
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:bc_sec (; 305 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=18
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:de_sec (; 306 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=20
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:de_sec (; 307 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=20
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:hl_sec (; 308 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=22
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:hl_sec (; 309 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=22
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:i (; 310 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=24
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:i (; 311 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=24
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:r (; 312 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=25
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:r (; 313 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=25
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:pc (; 314 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=26
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:pc (; 315 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=26
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:sp (; 316 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=28
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:sp (; 317 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=28
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:xh (; 318 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=30
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:xh (; 319 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=30
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:xl (; 320 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=31
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:xl (; 321 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=31
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:ix (; 322 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=32
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:ix (; 323 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=32
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:yh (; 324 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=34
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:yh (; 325 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=34
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:yl (; 326 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=35
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:yl (; 327 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=35
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:iy (; 328 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=36
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:iy (; 329 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=36
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:wh (; 330 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=38
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:wh (; 331 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=38
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:wl (; 332 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=39
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:wl (; 333 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=39
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:wz (; 334 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=40
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:wz (; 335 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=40
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:tactsL (; 336 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=44
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:tactsL (; 337 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store offset=44
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:tactsH (; 338 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=48
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:tactsH (; 339 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store offset=48
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:stateFlags (; 340 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=52
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:stateFlags (; 341 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store offset=52
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:useGateArrayContention (; 342 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=56
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:useGateArrayContention (; 343 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=56
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:iff1 (; 344 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=57
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:iff1 (; 345 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=57
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:iff2 (; 346 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=58
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:iff2 (; 347 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=58
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:interruptMode (; 348 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=59
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:interruptMode (; 349 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=59
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:isInterruptBlocked (; 350 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=60
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:isInterruptBlocked (; 351 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=60
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:isInOpExecution (; 352 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=61
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:isInOpExecution (; 353 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=61
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:prefixMode (; 354 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=64
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:prefixMode (; 355 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store offset=64
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:indexMode (; 356 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=68
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:indexMode (; 357 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store offset=68
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:maskableInterruptModeEntered (; 358 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=72
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:maskableInterruptModeEntered (; 359 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=72
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:opCode (; 360 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=73
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:opCode (; 361 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=73
 )
 (func $~start (; 362 ;)
  call $start:src/assembly/index
 )
 (func $~lib/rt/pure/markGray (; 363 ;) (param $0 i32)
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
 (func $~lib/rt/pure/scanBlack (; 364 ;) (param $0 i32)
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
 (func $~lib/rt/pure/scan (; 365 ;) (param $0 i32)
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
 (func $~lib/rt/pure/collectWhite (; 366 ;) (param $0 i32)
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
 (func $~lib/rt/pure/__collect (; 367 ;)
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
 (func $~lib/rt/__typeinfo (; 368 ;) (param $0 i32) (result i32)
  (local $1 i32)
  global.get $~lib/rt/__rtti_base
  local.set $1
  local.get $0
  local.get $1
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
  local.get $1
  i32.const 4
  i32.add
  local.get $0
  i32.const 8
  i32.mul
  i32.add
  i32.load
 )
 (func $~lib/rt/tlsf/__free (; 369 ;) (param $0 i32)
  call $~lib/rt/tlsf/maybeInitialize
  local.get $0
  call $~lib/rt/tlsf/checkUsedBlock
  call $~lib/rt/tlsf/freeBlock
 )
 (func $~lib/rt/pure/growRoots (; 370 ;)
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
 (func $~lib/rt/pure/appendRoot (; 371 ;) (param $0 i32)
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
 (func $~lib/rt/pure/decrement (; 372 ;) (param $0 i32)
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
 (func $~lib/rt/pure/__visit (; 373 ;) (param $0 i32) (param $1 i32)
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
 (func $~lib/array/Array<u8>#__visit_impl (; 374 ;) (param $0 i32) (param $1 i32)
  nop
 )
 (func $~lib/array/Array<usize>#__visit_impl (; 375 ;) (param $0 i32) (param $1 i32)
  nop
 )
 (func "$~lib/array/Array<(cpu: src/assembly/Z80Cpu/Z80Cpu, value: u8, carry: bool) => void>#__visit_impl" (; 376 ;) (param $0 i32) (param $1 i32)
  nop
 )
 (func "$~lib/array/Array<((cpu: src/assembly/Z80Cpu/Z80Cpu) => void) | null>#__visit_impl" (; 377 ;) (param $0 i32) (param $1 i32)
  nop
 )
 (func "$~lib/array/Array<((cpu: src/assembly/Z80Cpu/Z80Cpu, addr: u16) => void) | null>#__visit_impl" (; 378 ;) (param $0 i32) (param $1 i32)
  nop
 )
 (func $~lib/array/Array<bool>#__visit_impl (; 379 ;) (param $0 i32) (param $1 i32)
  nop
 )
 (func $~lib/array/Array<src/assembly/Z80Cpu/Z80Cpu | null>#__visit_impl (; 380 ;) (param $0 i32) (param $1 i32)
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
 (func $~lib/array/Array<i32>#__visit_impl (; 381 ;) (param $0 i32) (param $1 i32)
  nop
 )
 (func $~lib/array/Array<src/assembly/test-machine/WaTestZ80Cpu/MemoryOp>#__visit_impl (; 382 ;) (param $0 i32) (param $1 i32)
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
 (func $~lib/array/Array<src/assembly/test-machine/WaTestZ80Cpu/IoOp>#__visit_impl (; 383 ;) (param $0 i32) (param $1 i32)
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
 (func $~lib/array/Array<src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine | null>#__visit_impl (; 384 ;) (param $0 i32) (param $1 i32)
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
 (func $~lib/rt/__visit_members (; 385 ;) (param $0 i32) (param $1 i32)
  (local $2 i32)
  block $block$7$break
   block $block$4$break
    block $switch$1$default
     block $switch$1$case$27
      block $switch$1$case$24
       block $switch$1$case$22
        block $switch$1$case$21
         block $switch$1$case$18
          block $switch$1$case$16
           block $switch$1$case$15
            block $switch$1$case$14
             block $switch$1$case$13
              block $switch$1$case$12
               block $switch$1$case$11
                block $switch$1$case$10
                 block $switch$1$case$7
                  block $switch$1$case$6
                   block $switch$1$case$5
                    block $switch$1$case$4
                     block $switch$1$case$2
                      local.get $0
                      i32.const 8
                      i32.sub
                      i32.load
                      br_table $switch$1$case$2 $switch$1$case$2 $switch$1$case$4 $switch$1$case$5 $switch$1$case$6 $switch$1$case$7 $switch$1$case$4 $switch$1$case$4 $switch$1$case$10 $switch$1$case$11 $switch$1$case$12 $switch$1$case$13 $switch$1$case$14 $switch$1$case$15 $switch$1$case$16 $switch$1$case$4 $switch$1$case$18 $switch$1$case$13 $switch$1$case$2 $switch$1$case$21 $switch$1$case$22 $switch$1$case$2 $switch$1$case$24 $switch$1$case$2 $switch$1$case$13 $switch$1$case$27 $switch$1$case$4 $switch$1$default
                     end
                     return
                    end
                    br $block$4$break
                   end
                   local.get $0
                   local.get $1
                   call $~lib/array/Array<u8>#__visit_impl
                   br $block$4$break
                  end
                  local.get $0
                  local.get $1
                  call $~lib/array/Array<usize>#__visit_impl
                  br $block$4$break
                 end
                 br $block$7$break
                end
                local.get $0
                local.get $1
                call "$~lib/array/Array<(cpu: src/assembly/Z80Cpu/Z80Cpu, value: u8, carry: bool) => void>#__visit_impl"
                br $block$4$break
               end
               local.get $0
               local.get $1
               call "$~lib/array/Array<((cpu: src/assembly/Z80Cpu/Z80Cpu) => void) | null>#__visit_impl"
               br $block$4$break
              end
              local.get $0
              local.get $1
              call "$~lib/array/Array<((cpu: src/assembly/Z80Cpu/Z80Cpu, addr: u16) => void) | null>#__visit_impl"
              br $block$4$break
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
        call $~lib/array/Array<src/assembly/test-machine/WaTestZ80Cpu/MemoryOp>#__visit_impl
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
      call $~lib/array/Array<src/assembly/test-machine/WaTestZ80Cpu/IoOp>#__visit_impl
      br $block$4$break
     end
     local.get $0
     local.get $1
     call $~lib/array/Array<src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine | null>#__visit_impl
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
  local.tee $2
  if
   local.get $2
   local.get $1
   call $~lib/rt/pure/__visit
  end
  return
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#constructor|trampoline (; 386 ;) (param $0 i32) (param $1 i32) (result i32)
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
 (func $src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine#initCode|trampoline (; 387 ;) (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
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
