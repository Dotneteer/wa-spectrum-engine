(module
 (type $i32_=>_none (func (param i32)))
 (type $i32_=>_i32 (func (param i32) (result i32)))
 (type $i32_i32_=>_none (func (param i32 i32)))
 (type $i32_i32_i32_=>_none (func (param i32 i32 i32)))
 (type $i32_i32_=>_i32 (func (param i32 i32) (result i32)))
 (type $none_=>_none (func))
 (type $none_=>_i32 (func (result i32)))
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
 (data (i32.const 448) "\10\00\00\00\01\00\00\00\04\00\00\00\10\00\00\00\c0\01\00\00\c0\01")
 (data (i32.const 484) "\01")
 (data (i32.const 496) "\10\00\00\00\01\00\00\00\03\00\00\00\10\00\00\00\f0\01\00\00\f0\01")
 (data (i32.const 532) "\01")
 (data (i32.const 544) "\10\00\00\00\01\00\00\00\03\00\00\00\10\00\00\00 \02\00\00 \02")
 (data (i32.const 580) "\01")
 (data (i32.const 592) "\10\00\00\00\01\00\00\00\03\00\00\00\10\00\00\00P\02\00\00P\02")
 (data (i32.const 628) "\01")
 (data (i32.const 640) "\10\00\00\00\01\00\00\00\05\00\00\00\10\00\00\00\80\02\00\00\80\02")
 (data (i32.const 676) "\01")
 (data (i32.const 688) "\10\00\00\00\01\00\00\00\03\00\00\00\10\00\00\00\b0\02\00\00\b0\02")
 (data (i32.const 724) "\01")
 (data (i32.const 736) "\10\00\00\00\01\00\00\00\05\00\00\00\10\00\00\00\e0\02\00\00\e0\02")
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
 (data (i32.const 1104) "\10\00\00\00\01\00\00\00\t\00\00\00\10\00\00\000\04\00\000\04\00\00 \00\00\00\08")
 (data (i32.const 1136) "$\00\00\00\01\00\00\00\01\00\00\00$\00\00\00~\00l\00i\00b\00/\00t\00y\00p\00e\00d\00a\00r\00r\00a\00y\00.\00t\00s")
 (data (i32.const 1200) "^\00\00\00\01\00\00\00\01\00\00\00^\00\00\00E\00l\00e\00m\00e\00n\00t\00 \00t\00y\00p\00e\00 \00m\00u\00s\00t\00 \00b\00e\00 \00n\00u\00l\00l\00a\00b\00l\00e\00 \00i\00f\00 \00a\00r\00r\00a\00y\00 \00i\00s\00 \00h\00o\00l\00e\00y")
 (data (i32.const 1313) "\04\00\00\01\00\00\00\00\00\00\00\00\04\00\00\00\00\00\00\t\00\00\00\n\00\00\00\0b\00\00\00\0c\00\00\00\0d\00\00\00\0e\00\00\00\0f\00\00\00\10\00\00\00\11\00\00\00\12\00\00\00\13\00\00\00\0c\00\00\00\0d\00\00\00\0e\00\00\00\14\00\00\00\15\00\00\00\t\00\00\00\16\00\00\00\0b\00\00\00\0c\00\00\00\0d\00\00\00\0e\00\00\00\17\00\00\00\18\00\00\00\11\00\00\00\19\00\00\00\13\00\00\00\0c\00\00\00\0d\00\00\00\0e\00\00\00\1a\00\00\00\1b\00\00\00\t\00\00\00\1c\00\00\00\0b\00\00\00\0c\00\00\00\0d\00\00\00\0e\00\00\00\1d\00\00\00\1e\00\00\00\11\00\00\00\1f\00\00\00\13\00\00\00\0c\00\00\00\0d\00\00\00\0e\00\00\00 \00\00\00!\00\00\00\t\00\00\00\"\00\00\00\0b\00\00\00#\00\00\00$\00\00\00%\00\00\00&\00\00\00\'\00\00\00\11\00\00\00(\00\00\00\13\00\00\00\0c\00\00\00\0d\00\00\00\0e\00\00\00)\00\00\00\00\00\00\00*\00\00\00*\00\00\00*\00\00\00*\00\00\00*\00\00\00+\00\00\00*\00\00\00*\00\00\00\00\00\00\00*\00\00\00*\00\00\00*\00\00\00*\00\00\00+\00\00\00*\00\00\00*\00\00\00*\00\00\00\00\00\00\00*\00\00\00*\00\00\00*\00\00\00+\00\00\00*\00\00\00*\00\00\00*\00\00\00*\00\00\00\00\00\00\00*\00\00\00*\00\00\00+\00\00\00*\00\00\00*\00\00\00*\00\00\00*\00\00\00*\00\00\00\00\00\00\00*\00\00\00+\00\00\00*\00\00\00*\00\00\00*\00\00\00*\00\00\00*\00\00\00*\00\00\00\00\00\00\00+\00\00\00*\00\00\00,\00\00\00,\00\00\00,\00\00\00,\00\00\00,\00\00\00,\00\00\00-\00\00\00,\00\00\00*\00\00\00*\00\00\00*\00\00\00*\00\00\00*\00\00\00*\00\00\00+\00\00\00\00\00\00\00.\00\00\00.\00\00\00.\00\00\00.\00\00\00.\00\00\00.\00\00\00/\00\00\00.\00\00\000\00\00\000\00\00\000\00\00\000\00\00\000\00\00\000\00\00\001\00\00\000\00\00\002\00\00\002\00\00\002\00\00\002\00\00\002\00\00\002\00\00\003\00\00\002\00\00\004\00\00\004\00\00\004\00\00\004\00\00\004\00\00\004\00\00\005\00\00\004\00\00\006\00\00\006\00\00\006\00\00\006\00\00\006\00\00\006\00\00\007\00\00\006\00\00\008\00\00\008\00\00\008\00\00\008\00\00\008\00\00\008\00\00\009\00\00\008\00\00\00:\00\00\00:\00\00\00:\00\00\00:\00\00\00:\00\00\00:\00\00\00;\00\00\00:\00\00\00<\00\00\00<\00\00\00<\00\00\00<\00\00\00<\00\00\00<\00\00\00=\00\00\00<\00\00\00>\00\00\00?\00\00\00@\00\00\00A\00\00\00B\00\00\00C\00\00\00D\00\00\00E\00\00\00F\00\00\00G\00\00\00H\00\00\00\00\00\00\00I\00\00\00J\00\00\00D\00\00\00E\00\00\00K\00\00\00L\00\00\00M\00\00\00N\00\00\00O\00\00\00P\00\00\00D\00\00\00E\00\00\00Q\00\00\00R\00\00\00S\00\00\00T\00\00\00U\00\00\00\00\00\00\00D\00\00\00E\00\00\00V\00\00\00W\00\00\00X\00\00\00Y\00\00\00Z\00\00\00[\00\00\00D\00\00\00E\00\00\00\\\00\00\00]\00\00\00^\00\00\00_\00\00\00`\00\00\00\00\00\00\00D\00\00\00E\00\00\00a\00\00\00b\00\00\00c\00\00\00d\00\00\00e\00\00\00f\00\00\00D\00\00\00E\00\00\00g\00\00\00h\00\00\00i\00\00\00j\00\00\00k\00\00\00\00\00\00\00D\00\00\00E")
 (data (i32.const 2352) "\10\00\00\00\01\00\00\00\n\00\00\00\10\00\00\000\05\00\000\05\00\00\00\04\00\00\00\01")
 (data (i32.const 2385) "\04\00\00\01\00\00\00\00\00\00\00\00\04\00\00\00\00\00\00\t")
 (data (i32.const 3424) "\10\00\00\00\01\00\00\00\n\00\00\00\10\00\00\00`\t\00\00`\t\00\00\00\04\00\00\00\01")
 (data (i32.const 3457) "\04\00\00\01\00\00\00\00\00\00\00\00\04")
 (data (i32.const 4496) "\10\00\00\00\01\00\00\00\n\00\00\00\10\00\00\00\90\0d\00\00\90\0d\00\00\00\04\00\00\00\01")
 (data (i32.const 4529) "\04\00\00\01\00\00\00\00\00\00\00\00\04\00\00\00\00\00\00\t\00\00\00\n\00\00\00\0b\00\00\00\0c\00\00\00\0d\00\00\00\0e\00\00\00\0f\00\00\00\10\00\00\00l\00\00\00\12\00\00\00\13\00\00\00\0c\00\00\00\0d\00\00\00\0e\00\00\00\14\00\00\00\15\00\00\00\t\00\00\00\16\00\00\00\0b\00\00\00\0c\00\00\00\0d\00\00\00\0e\00\00\00\17\00\00\00\18\00\00\00l\00\00\00\19\00\00\00\13\00\00\00\0c\00\00\00\0d\00\00\00\0e\00\00\00\1a\00\00\00\1b\00\00\00\t\00\00\00\1c\00\00\00\0b\00\00\00\0c\00\00\00\0d\00\00\00\0e\00\00\00\1d\00\00\00\1e\00\00\00l\00\00\00\1f\00\00\00\13\00\00\00\0c\00\00\00\0d\00\00\00\0e\00\00\00 \00\00\00!\00\00\00\t\00\00\00\"\00\00\00\0b\00\00\00#\00\00\00$\00\00\00%\00\00\00&\00\00\00\'\00\00\00l\00\00\00(\00\00\00\13\00\00\00\0c\00\00\00\0d\00\00\00\0e\00\00\00)")
 (data (i32.const 5568) "\10\00\00\00\01\00\00\00\n\00\00\00\10\00\00\00\c0\11\00\00\c0\11\00\00\00\04\00\00\00\01")
 (data (i32.const 5601) "\04\00\00\01\00\00\00\00\00\00\00\00\04\00\00\00\00\00\00m")
 (data (i32.const 6640) "\10\00\00\00\01\00\00\00\0b\00\00\00\10\00\00\00\f0\15\00\00\f0\15\00\00\00\04\00\00\00\01")
 (data (i32.const 6672) "&\00\00\00\01\00\00\00\01\00\00\00&\00\00\00~\00l\00i\00b\00/\00a\00r\00r\00a\00y\00b\00u\00f\00f\00e\00r\00.\00t\00s")
 (data (i32.const 6740) "\01")
 (data (i32.const 6752) "\10\00\00\00\01\00\00\00\0e\00\00\00\10\00\00\00`\1a\00\00`\1a")
 (data (i32.const 6788) "\01")
 (data (i32.const 6800) "\10\00\00\00\01\00\00\00\10\00\00\00\10\00\00\00\90\1a\00\00\90\1a")
 (data (i32.const 6836) "\01")
 (data (i32.const 6852) "\01")
 (data (i32.const 6864) "\14\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\003\00\00\00\02\00\00\00S\00\00\00\02\00\00\00\93\00\00\00\02\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\91\00\00\00\02\00\00\00\93\00\00\00\02\00\00\00\93\10\00\00\02\00\00\00\93\10\00\00\02\00\00\001\00\00\00\02\00\00\00\10\00\00\00\00\00\00\00\93 \00\00\02\00\00\00\10\00\00\00\00\00\00\00\93 \00\00\02\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\93\04\00\00\02")
 (table $0 118 funcref)
 (elem (i32.const 1) $src/assembly/Z80Cpu/AluADD $src/assembly/Z80Cpu/AluADC $src/assembly/Z80Cpu/AluSUB $src/assembly/Z80Cpu/AluSBC $src/assembly/Z80Cpu/AluAND $src/assembly/Z80Cpu/AluXOR $src/assembly/Z80Cpu/AluOR $src/assembly/Z80Cpu/AluCP $src/assembly/Z80Cpu/LdQQNN $src/assembly/Z80Cpu/LdBCiA $src/assembly/Z80Cpu/IncQQ $src/assembly/Z80Cpu/IncQ $src/assembly/Z80Cpu/DecQ $src/assembly/Z80Cpu/LdQN $src/assembly/Z80Cpu/Rlca $src/assembly/Z80Cpu/ExAf $src/assembly/Z80Cpu/AddHlQQ $src/assembly/Z80Cpu/LdABci $src/assembly/Z80Cpu/DecQQ $src/assembly/Z80Cpu/Rrca $src/assembly/Z80Cpu/Djnz $src/assembly/Z80Cpu/LdDEiA $src/assembly/Z80Cpu/Rla $src/assembly/Z80Cpu/JrE $src/assembly/Z80Cpu/LdADei $src/assembly/Z80Cpu/Rra $src/assembly/Z80Cpu/JrNz $src/assembly/Z80Cpu/LdNNiHl $src/assembly/Z80Cpu/Daa $src/assembly/Z80Cpu/JrZ $src/assembly/Z80Cpu/LdHlNNi $src/assembly/Z80Cpu/Cpl $src/assembly/Z80Cpu/JrNc $src/assembly/Z80Cpu/LdNNiA $src/assembly/Z80Cpu/IncHli $src/assembly/Z80Cpu/DecHli $src/assembly/Z80Cpu/LdHliN $src/assembly/Z80Cpu/Scf $src/assembly/Z80Cpu/JrC $src/assembly/Z80Cpu/LdANNi $src/assembly/Z80Cpu/Ccf $src/assembly/Z80Cpu/LdQW $src/assembly/Z80Cpu/LdQHli $src/assembly/Z80Cpu/LdHliQ $src/assembly/Z80Cpu/Halt $src/assembly/Z80Cpu/AddAQ $src/assembly/Z80Cpu/AddAHli $src/assembly/Z80Cpu/AdcAQ $src/assembly/Z80Cpu/AdcAHli $src/assembly/Z80Cpu/SubAQ $src/assembly/Z80Cpu/SubAHli $src/assembly/Z80Cpu/SbcAQ $src/assembly/Z80Cpu/SbcAHli $src/assembly/Z80Cpu/AndAQ $src/assembly/Z80Cpu/AndAHli $src/assembly/Z80Cpu/XorAQ $src/assembly/Z80Cpu/XorAHli $src/assembly/Z80Cpu/OrAQ $src/assembly/Z80Cpu/OrAHli $src/assembly/Z80Cpu/CpAQ $src/assembly/Z80Cpu/CpAHli $src/assembly/Z80Cpu/RetNz $src/assembly/Z80Cpu/PopBc $src/assembly/Z80Cpu/JpNz $src/assembly/Z80Cpu/Jp $src/assembly/Z80Cpu/CallNz $src/assembly/Z80Cpu/PushBc $src/assembly/Z80Cpu/AluAN $src/assembly/Z80Cpu/RstN $src/assembly/Z80Cpu/RetZ $src/assembly/Z80Cpu/Ret $src/assembly/Z80Cpu/JpZ $src/assembly/Z80Cpu/CallZ $src/assembly/Z80Cpu/Call $src/assembly/Z80Cpu/RetNc $src/assembly/Z80Cpu/PopDe $src/assembly/Z80Cpu/JpNc $src/assembly/Z80Cpu/OutNA $src/assembly/Z80Cpu/CallNc $src/assembly/Z80Cpu/PushDe $src/assembly/Z80Cpu/RetC $src/assembly/Z80Cpu/Exx $src/assembly/Z80Cpu/JpC $src/assembly/Z80Cpu/InAN $src/assembly/Z80Cpu/CallC $src/assembly/Z80Cpu/RetPo $src/assembly/Z80Cpu/PopHl $src/assembly/Z80Cpu/JpPo $src/assembly/Z80Cpu/ExSpiHl $src/assembly/Z80Cpu/CallPo $src/assembly/Z80Cpu/PushHl $src/assembly/Z80Cpu/RetPe $src/assembly/Z80Cpu/JpHli $src/assembly/Z80Cpu/JpPe $src/assembly/Z80Cpu/ExDeHl $src/assembly/Z80Cpu/CallPe $src/assembly/Z80Cpu/RetP $src/assembly/Z80Cpu/PopAf $src/assembly/Z80Cpu/JpP $src/assembly/Z80Cpu/Di $src/assembly/Z80Cpu/CallP $src/assembly/Z80Cpu/PushAf $src/assembly/Z80Cpu/RetM $src/assembly/Z80Cpu/LdSpHl $src/assembly/Z80Cpu/JpM $src/assembly/Z80Cpu/Ei $src/assembly/Z80Cpu/CallM $src/assembly/Z80Cpu/AddIxQQ $src/assembly/Z80Cpu/LdBcNNIdx $src/assembly/Z80Cpu/Z80Cpu#constructor~anonymous|0 $src/assembly/Z80Cpu/LdBcNNIdx $src/assembly/Z80Cpu/Z80Cpu#constructor~anonymous|0 $src/assembly/Z80Cpu/LdBcNNIdx $src/assembly/test-machine/test-devices/readSimpleMemory $src/assembly/test-machine/test-devices/writeSimpleMemory $src/assembly/test-machine/test-devices/writeSimpleIo $src/assembly/test-machine/test-devices/readSimpleIo)
 (global $~lib/rt/tlsf/ROOT (mut i32) (i32.const 0))
 (global $~lib/rt/tlsf/collectLock (mut i32) (i32.const 0))
 (global $~argumentsLength (mut i32) (i32.const 0))
 (global $src/assembly/test-machine/test-devices/simpleMemory (mut i32) (i32.const 0))
 (global $src/assembly/test-machine/test-devices/memoryAccessLog (mut i32) (i32.const 6768))
 (global $src/assembly/test-machine/test-devices/cpu (mut i32) (i32.const 0))
 (global $src/assembly/test-machine/test-devices/fakeInput (mut i32) (i32.const 0))
 (global $src/assembly/test-machine/test-devices/inputIndex (mut i32) (i32.const -1))
 (global $src/assembly/test-machine/test-devices/ioAccessLog (mut i32) (i32.const 6816))
 (global $src/assembly/test-machine/WaTestZ80Machine/waTestZ80Machine (mut i32) (i32.const 0))
 (global $src/assembly/index/UINT8ARRAY_ID i32 (i32.const 12))
 (global $src/assembly/index/UINT32ARRAY_ID i32 (i32.const 8))
 (global $~lib/rt/__rtti_base i32 (i32.const 6864))
 (global $src/assembly/Z80Cpu/Z80Cpu i32 (i32.const 6))
 (global $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState i32 (i32.const 18))
 (export "__setArgumentsLength" (func $~setArgumentsLength))
 (export "memory" (memory $0))
 (export "__alloc" (func $~lib/rt/tlsf/__alloc))
 (export "__retain" (func $~lib/rt/pure/__retain))
 (export "__release" (func $~lib/rt/pure/__release))
 (export "__collect" (func $~lib/rt/pure/__collect))
 (export "__rtti_base" (global $~lib/rt/__rtti_base))
 (export "UINT8ARRAY_ID" (global $src/assembly/index/UINT8ARRAY_ID))
 (export "UINT32ARRAY_ID" (global $src/assembly/index/UINT32ARRAY_ID))
 (export "initTestMachine" (func $src/assembly/index/initTestMachine))
 (export "getTestMachineState" (func $src/assembly/index/getTestMachineState))
 (export "updateTestMachineState" (func $src/assembly/index/updateTestMachineState))
 (export "getTestMachineMemory" (func $src/assembly/index/getTestMachineMemory))
 (export "updateTestMachineMemory" (func $src/assembly/index/updateTestMachineMemory))
 (export "initTestMachineCode" (func $src/assembly/index/initTestMachineCode))
 (export "initTestMachineInput" (func $src/assembly/index/initTestMachineInput))
 (export "runTestMachine" (func $src/assembly/index/runTestMachine))
 (export "resetMemoryAccessLog" (func $src/assembly/index/resetMemoryAccessLog))
 (export "resetIoAccessLog" (func $src/assembly/index/resetIoAccessLog))
 (export "getTestMachineIoAccessLog" (func $src/assembly/index/getTestMachineIoAccessLog))
 (export "getTestMachineMemoryAccessLog" (func $src/assembly/index/getTestMachineMemoryAccessLog))
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
 (export "Z80Cpu#turnOn" (func $src/assembly/Z80Cpu/Z80Cpu#turnOn))
 (export "Z80Cpu#get:memoryReader" (func $src/assembly/Z80Cpu/Z80Cpu#get:memoryReader))
 (export "Z80Cpu#set:memoryReader" (func $src/assembly/Z80Cpu/Z80Cpu#set:memoryReader))
 (export "Z80Cpu#get:memoryWriter" (func $src/assembly/Z80Cpu/Z80Cpu#get:memoryWriter))
 (export "Z80Cpu#set:memoryWriter" (func $src/assembly/Z80Cpu/Z80Cpu#set:memoryWriter))
 (export "Z80Cpu#get:portReader" (func $src/assembly/Z80Cpu/Z80Cpu#get:portReader))
 (export "Z80Cpu#set:portReader" (func $src/assembly/Z80Cpu/Z80Cpu#set:portReader))
 (export "Z80Cpu#get:portWriter" (func $src/assembly/Z80Cpu/Z80Cpu#get:portWriter))
 (export "Z80Cpu#set:portWriter" (func $src/assembly/Z80Cpu/Z80Cpu#set:portWriter))
 (export "Z80Cpu#getCpuState" (func $src/assembly/Z80Cpu/Z80Cpu#getCpuState))
 (export "Z80Cpu#updateCpuState" (func $src/assembly/Z80Cpu/Z80Cpu#updateCpuState))
 (export "Z80Cpu#get:a" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:a))
 (export "Z80Cpu#set:a" (func $src/assembly/Z80Cpu/Z80Cpu#set:a))
 (export "Z80Cpu#get:f" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:f))
 (export "Z80Cpu#set:f" (func $src/assembly/Z80Cpu/Z80Cpu#set:f))
 (export "Z80Cpu#get:af" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:af))
 (export "Z80Cpu#set:af" (func $src/assembly/Z80Cpu/Z80Cpu#set:af))
 (export "Z80Cpu#get:b" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:b))
 (export "Z80Cpu#set:b" (func $src/assembly/Z80Cpu/Z80Cpu#set:b))
 (export "Z80Cpu#get:c" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:c))
 (export "Z80Cpu#set:c" (func $src/assembly/Z80Cpu/Z80Cpu#set:c))
 (export "Z80Cpu#get:bc" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:bc))
 (export "Z80Cpu#set:bc" (func $src/assembly/Z80Cpu/Z80Cpu#set:bc))
 (export "Z80Cpu#get:d" (func $src/assembly/Z80Cpu/Z80Cpu#get:d))
 (export "Z80Cpu#set:d" (func $src/assembly/Z80Cpu/Z80Cpu#set:d))
 (export "Z80Cpu#get:e" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:e))
 (export "Z80Cpu#set:e" (func $src/assembly/Z80Cpu/Z80Cpu#set:e))
 (export "Z80Cpu#get:de" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:de))
 (export "Z80Cpu#set:de" (func $src/assembly/Z80Cpu/Z80Cpu#set:de))
 (export "Z80Cpu#get:h" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:h))
 (export "Z80Cpu#set:h" (func $src/assembly/Z80Cpu/Z80Cpu#set:h))
 (export "Z80Cpu#get:l" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:l))
 (export "Z80Cpu#set:l" (func $src/assembly/Z80Cpu/Z80Cpu#set:l))
 (export "Z80Cpu#get:hl" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:hl))
 (export "Z80Cpu#set:hl" (func $src/assembly/Z80Cpu/Z80Cpu#set:hl))
 (export "Z80Cpu#get:_af_" (func $src/assembly/Z80Cpu/Z80Cpu#get:_af_))
 (export "Z80Cpu#set:_af_" (func $src/assembly/Z80Cpu/Z80Cpu#set:_af_))
 (export "Z80Cpu#get:_bc_" (func $src/assembly/Z80Cpu/Z80Cpu#get:_bc_))
 (export "Z80Cpu#set:_bc_" (func $src/assembly/Z80Cpu/Z80Cpu#set:_bc_))
 (export "Z80Cpu#get:_de_" (func $src/assembly/Z80Cpu/Z80Cpu#get:_de_))
 (export "Z80Cpu#set:_de_" (func $src/assembly/Z80Cpu/Z80Cpu#set:_de_))
 (export "Z80Cpu#get:_hl_" (func $src/assembly/Z80Cpu/Z80Cpu#get:_hl_))
 (export "Z80Cpu#set:_hl_" (func $src/assembly/Z80Cpu/Z80Cpu#set:_hl_))
 (export "Z80Cpu#get:i" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:i))
 (export "Z80Cpu#set:i" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:i))
 (export "Z80Cpu#get:r" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:r))
 (export "Z80Cpu#set:r" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:r))
 (export "Z80Cpu#get:pc" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:pc))
 (export "Z80Cpu#set:pc" (func $src/assembly/Z80Cpu/Z80Cpu#set:pc))
 (export "Z80Cpu#get:sp" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:sp))
 (export "Z80Cpu#set:sp" (func $src/assembly/Z80Cpu/Z80Cpu#set:sp))
 (export "Z80Cpu#get:xh" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:xh))
 (export "Z80Cpu#set:xh" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:xh))
 (export "Z80Cpu#get:xl" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:xl))
 (export "Z80Cpu#set:xl" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:xl))
 (export "Z80Cpu#get:ix" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:ix))
 (export "Z80Cpu#set:ix" (func $src/assembly/Z80Cpu/Z80Cpu#set:ix))
 (export "Z80Cpu#get:yh" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:yh))
 (export "Z80Cpu#set:yh" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:yh))
 (export "Z80Cpu#get:yl" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:yl))
 (export "Z80Cpu#set:yl" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:yl))
 (export "Z80Cpu#get:iy" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:iy))
 (export "Z80Cpu#set:iy" (func $src/assembly/Z80Cpu/Z80Cpu#set:iy))
 (export "Z80Cpu#get:wh" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:wh))
 (export "Z80Cpu#set:wh" (func $src/assembly/Z80Cpu/Z80Cpu#set:wh))
 (export "Z80Cpu#get:wl" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:wl))
 (export "Z80Cpu#set:wl" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:wl))
 (export "Z80Cpu#get:wz" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:wz))
 (export "Z80Cpu#set:wz" (func $src/assembly/Z80Cpu/Z80Cpu#set:wz))
 (export "Z80Cpu#getReg8" (func $src/assembly/Z80Cpu/Z80Cpu#getReg8))
 (export "Z80Cpu#setReg8" (func $src/assembly/Z80Cpu/Z80Cpu#setReg8))
 (export "Z80Cpu#getReg16" (func $src/assembly/Z80Cpu/Z80Cpu#getReg16))
 (export "Z80Cpu#setReg16" (func $src/assembly/Z80Cpu/Z80Cpu#setReg16))
 (export "Z80Cpu#getIndexReg" (func $src/assembly/Z80Cpu/Z80Cpu#getIndexReg))
 (export "Z80Cpu#setIndexReg" (func $src/assembly/Z80Cpu/Z80Cpu#setIndexReg))
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
 (export "Z80Cpu#aluAddHL" (func $src/assembly/Z80Cpu/Z80Cpu#aluAddHL))
 (export "Z80Cpu#aluIncByte" (func $src/assembly/Z80Cpu/Z80Cpu#aluIncByte))
 (export "Z80Cpu#aluDecByte" (func $src/assembly/Z80Cpu/Z80Cpu#aluDecByte))
 (export "TestZ80MachineState" (global $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState))
 (export "TestZ80MachineState#get:a" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:a))
 (export "TestZ80MachineState#set:a" (func $src/assembly/Z80Cpu/Z80Cpu#set:a))
 (export "TestZ80MachineState#get:f" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:f))
 (export "TestZ80MachineState#set:f" (func $src/assembly/Z80Cpu/Z80Cpu#set:f))
 (export "TestZ80MachineState#get:af" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:af))
 (export "TestZ80MachineState#set:af" (func $src/assembly/Z80Cpu/Z80Cpu#set:af))
 (export "TestZ80MachineState#get:b" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:b))
 (export "TestZ80MachineState#set:b" (func $src/assembly/Z80Cpu/Z80Cpu#set:b))
 (export "TestZ80MachineState#get:c" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:c))
 (export "TestZ80MachineState#set:c" (func $src/assembly/Z80Cpu/Z80Cpu#set:c))
 (export "TestZ80MachineState#get:bc" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:bc))
 (export "TestZ80MachineState#set:bc" (func $src/assembly/Z80Cpu/Z80Cpu#set:bc))
 (export "TestZ80MachineState#get:d" (func $src/assembly/Z80Cpu/Z80Cpu#get:d))
 (export "TestZ80MachineState#set:d" (func $src/assembly/Z80Cpu/Z80Cpu#set:d))
 (export "TestZ80MachineState#get:e" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:e))
 (export "TestZ80MachineState#set:e" (func $src/assembly/Z80Cpu/Z80Cpu#set:e))
 (export "TestZ80MachineState#get:de" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:de))
 (export "TestZ80MachineState#set:de" (func $src/assembly/Z80Cpu/Z80Cpu#set:de))
 (export "TestZ80MachineState#get:h" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:h))
 (export "TestZ80MachineState#set:h" (func $src/assembly/Z80Cpu/Z80Cpu#set:h))
 (export "TestZ80MachineState#get:l" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:l))
 (export "TestZ80MachineState#set:l" (func $src/assembly/Z80Cpu/Z80Cpu#set:l))
 (export "TestZ80MachineState#get:hl" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:hl))
 (export "TestZ80MachineState#set:hl" (func $src/assembly/Z80Cpu/Z80Cpu#set:hl))
 (export "TestZ80MachineState#get:_af_" (func $src/assembly/Z80Cpu/Z80Cpu#get:_af_))
 (export "TestZ80MachineState#set:_af_" (func $src/assembly/Z80Cpu/Z80Cpu#set:_af_))
 (export "TestZ80MachineState#get:_bc_" (func $src/assembly/Z80Cpu/Z80Cpu#get:_bc_))
 (export "TestZ80MachineState#set:_bc_" (func $src/assembly/Z80Cpu/Z80Cpu#set:_bc_))
 (export "TestZ80MachineState#get:_de_" (func $src/assembly/Z80Cpu/Z80Cpu#get:_de_))
 (export "TestZ80MachineState#set:_de_" (func $src/assembly/Z80Cpu/Z80Cpu#set:_de_))
 (export "TestZ80MachineState#get:_hl_" (func $src/assembly/Z80Cpu/Z80Cpu#get:_hl_))
 (export "TestZ80MachineState#set:_hl_" (func $src/assembly/Z80Cpu/Z80Cpu#set:_hl_))
 (export "TestZ80MachineState#get:i" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:i))
 (export "TestZ80MachineState#set:i" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:i))
 (export "TestZ80MachineState#get:r" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:r))
 (export "TestZ80MachineState#set:r" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:r))
 (export "TestZ80MachineState#get:pc" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:pc))
 (export "TestZ80MachineState#set:pc" (func $src/assembly/Z80Cpu/Z80Cpu#set:pc))
 (export "TestZ80MachineState#get:sp" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:sp))
 (export "TestZ80MachineState#set:sp" (func $src/assembly/Z80Cpu/Z80Cpu#set:sp))
 (export "TestZ80MachineState#get:xh" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:xh))
 (export "TestZ80MachineState#set:xh" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:xh))
 (export "TestZ80MachineState#get:xl" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:xl))
 (export "TestZ80MachineState#set:xl" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:xl))
 (export "TestZ80MachineState#get:ix" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:ix))
 (export "TestZ80MachineState#set:ix" (func $src/assembly/Z80Cpu/Z80Cpu#set:ix))
 (export "TestZ80MachineState#get:yh" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:yh))
 (export "TestZ80MachineState#set:yh" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:yh))
 (export "TestZ80MachineState#get:yl" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:yl))
 (export "TestZ80MachineState#set:yl" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:yl))
 (export "TestZ80MachineState#get:iy" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:iy))
 (export "TestZ80MachineState#set:iy" (func $src/assembly/Z80Cpu/Z80Cpu#set:iy))
 (export "TestZ80MachineState#get:wh" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:wh))
 (export "TestZ80MachineState#set:wh" (func $src/assembly/Z80Cpu/Z80Cpu#set:wh))
 (export "TestZ80MachineState#get:wl" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:wl))
 (export "TestZ80MachineState#set:wl" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:wl))
 (export "TestZ80MachineState#get:wz" (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:wz))
 (export "TestZ80MachineState#set:wz" (func $src/assembly/Z80Cpu/Z80Cpu#set:wz))
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
 (export "TestZ80MachineState#get:isInterruptBlocked" (func $src/assembly/Z80Cpu/Z80Cpu#get:useGateArrayContention))
 (export "TestZ80MachineState#set:isInterruptBlocked" (func $src/assembly/Z80Cpu/Z80Cpu#set:useGateArrayContention))
 (export "TestZ80MachineState#get:isInOpExecution" (func $src/assembly/Z80Cpu/Z80Cpu#get:iff1))
 (export "TestZ80MachineState#set:isInOpExecution" (func $src/assembly/Z80Cpu/Z80Cpu#set:iff1))
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
   i32.const 7040
   local.tee $0
   i32.const 0
   i32.store
   i32.const 8608
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
     i32.const 7040
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
       i32.const 7040
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
   i32.const 7040
   i32.const 8624
   memory.size
   i32.const 16
   i32.shl
   call $~lib/rt/tlsf/addMemory
   i32.const 7040
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
  i32.const 7028
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
  i32.const 7028
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
  i32.const 7028
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
 (func $~lib/array/Array<u16>#__set (; 21 ;) (param $0 i32) (param $1 i32)
  (local $2 i32)
  local.get $0
  i32.const 476
  i32.load
  i32.ge_u
  if
   local.get $0
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
   i32.const 464
   local.get $0
   i32.const 1
   i32.add
   local.tee $2
   i32.const 1
   call $~lib/array/ensureSize
   i32.const 476
   local.get $2
   i32.store
  end
  i32.const 468
  i32.load
  local.get $0
  i32.const 1
  i32.shl
  i32.add
  local.get $1
  i32.store16
 )
 (func $~lib/array/Array<u8>#__get (; 22 ;) (param $0 i32) (param $1 i32) (result i32)
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
 (func $~lib/array/Array<usize>#__set (; 23 ;) (param $0 i32) (param $1 i32) (param $2 i32)
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
  i32.load16_u
  i32.const 8
  i32.shr_u
  local.get $1
  i32.add
  i32.const 24
  i32.shl
  i32.const 24
  i32.shr_s
  i32.add
  local.set $3
  local.get $0
  i32.load16_u
  i32.const 8
  i32.shr_u
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
  local.set $4
  local.get $0
  local.get $0
  i32.load16_u
  i32.const 8
  i32.shr_u
  local.get $1
  i32.add
  i32.const 255
  i32.and
  local.get $2
  i32.add
  local.tee $2
  i32.const 168
  i32.and
  local.tee $1
  local.get $1
  i32.const 64
  i32.or
  local.get $2
  i32.const 255
  i32.and
  select
  local.tee $1
  i32.const 1
  i32.or
  local.get $1
  local.get $2
  i32.const 256
  i32.ge_s
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
  i32.const -129
  i32.le_s
  local.get $3
  i32.const 128
  i32.ge_s
  select
  select
  i32.const 255
  i32.and
  local.get $2
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
  i32.load16_u
  i32.const 8
  i32.shr_u
  local.get $1
  i32.sub
  i32.const 24
  i32.shl
  i32.const 24
  i32.shr_s
  i32.const 1
  i32.const 0
  local.get $2
  select
  local.tee $2
  i32.sub
  local.set $3
  local.get $0
  i32.load16_u
  i32.const 8
  i32.shr_u
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
  local.set $4
  local.get $0
  local.get $0
  i32.load16_u
  i32.const 8
  i32.shr_u
  local.get $1
  i32.sub
  i32.const 255
  i32.and
  local.get $2
  i32.sub
  local.tee $2
  i32.const 8
  i32.and
  i32.const 2
  i32.or
  local.tee $1
  local.get $1
  i32.const 64
  i32.or
  local.get $2
  i32.const 255
  i32.and
  select
  local.tee $1
  i32.const 1
  i32.or
  local.get $1
  local.get $2
  i32.const 65536
  i32.and
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
  i32.const -129
  i32.le_s
  local.get $3
  i32.const 128
  i32.ge_s
  select
  select
  i32.const 255
  i32.and
  local.get $2
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
  i32.const 255
  i32.and
  local.get $1
  i32.const 255
  i32.and
  i32.const 8
  i32.shl
  i32.or
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
  i32.load16_u
  i32.const 8
  i32.shr_u
  local.get $1
  i32.and
  call $src/assembly/Z80Cpu/Z80Cpu#set:a
  local.get $0
  i32.const 608
  local.get $0
  i32.load16_u
  i32.const 8
  i32.shr_u
  call $~lib/array/Array<u8>#__get
  i32.const 16
  i32.or
  call $src/assembly/Z80Cpu/Z80Cpu#set:f
 )
 (func $src/assembly/Z80Cpu/AluXOR (; 32 ;) (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $0
  local.get $0
  i32.load16_u
  i32.const 8
  i32.shr_u
  local.get $1
  i32.xor
  call $src/assembly/Z80Cpu/Z80Cpu#set:a
  local.get $0
  i32.const 608
  local.get $0
  i32.load16_u
  i32.const 8
  i32.shr_u
  call $~lib/array/Array<u8>#__get
  call $src/assembly/Z80Cpu/Z80Cpu#set:f
 )
 (func $src/assembly/Z80Cpu/AluOR (; 33 ;) (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $0
  local.get $0
  i32.load16_u
  i32.const 8
  i32.shr_u
  local.get $1
  i32.or
  call $src/assembly/Z80Cpu/Z80Cpu#set:a
  local.get $0
  i32.const 608
  local.get $0
  i32.load16_u
  i32.const 8
  i32.shr_u
  call $~lib/array/Array<u8>#__get
  call $src/assembly/Z80Cpu/Z80Cpu#set:f
 )
 (func $src/assembly/Z80Cpu/AluCP (; 34 ;) (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  local.get $0
  i32.load16_u
  i32.const 8
  i32.shr_u
  local.get $1
  i32.sub
  local.set $2
  local.get $0
  i32.load16_u
  i32.const 8
  i32.shr_u
  i32.const 15
  i32.and
  local.get $1
  i32.const 15
  i32.and
  i32.sub
  i32.const 16
  i32.and
  local.set $3
  local.get $0
  local.get $0
  i32.load16_u
  i32.const 8
  i32.shr_u
  local.get $1
  i32.sub
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
  local.get $3
  select
  local.tee $1
  i32.const 4
  i32.or
  local.get $1
  i32.const 1
  local.get $2
  i32.const 24
  i32.shl
  i32.const 24
  i32.shr_s
  i32.const -129
  i32.le_s
  local.get $2
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
 (func $~lib/typedarray/Uint32Array#__get (; 35 ;) (param $0 i32) (param $1 i32) (result i32)
  local.get $1
  local.get $0
  i32.load offset=8
  i32.const 2
  i32.shr_u
  i32.ge_u
  if
   i32.const 240
   i32.const 1152
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
 (func $~lib/typedarray/Uint32Array#__set (; 36 ;) (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $1
  local.get $0
  i32.load offset=8
  i32.const 2
  i32.shr_u
  i32.ge_u
  if
   i32.const 240
   i32.const 1152
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
 (func $src/assembly/MemoryStatusArray/MemoryStatusArray#touch (; 37 ;) (param $0 i32) (param $1 i32)
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
 (func $~setArgumentsLength (; 38 ;) (param $0 i32)
  local.get $0
  global.set $~argumentsLength
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#readMemory (; 39 ;) (param $0 i32) (param $1 i32) (result i32)
  i32.const 1
  global.set $~argumentsLength
  local.get $1
  local.get $0
  i32.load offset=76
  call_indirect (type $i32_=>_i32)
  i32.const 255
  i32.and
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#readCodeMemory (; 40 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=52
  local.get $0
  i32.load16_u offset=18
  call $src/assembly/MemoryStatusArray/MemoryStatusArray#touch
  local.get $0
  local.get $0
  i32.load16_u offset=18
  call $src/assembly/Z80Cpu/Z80Cpu#readMemory
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:pc (; 41 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=18
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:bc (; 42 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=2
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:de (; 43 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=4
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:hl (; 44 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=6
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:sp (; 45 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=20
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#setReg16 (; 46 ;) (param $0 i32) (param $1 i32) (param $2 i32)
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
      call $src/assembly/Z80Cpu/Z80Cpu#set:bc
      br $break|0
     end
     local.get $0
     local.get $2
     call $src/assembly/Z80Cpu/Z80Cpu#set:de
     br $break|0
    end
    local.get $0
    local.get $2
    call $src/assembly/Z80Cpu/Z80Cpu#set:hl
    br $break|0
   end
   local.get $0
   local.get $2
   call $src/assembly/Z80Cpu/Z80Cpu#set:sp
  end
 )
 (func $src/assembly/Z80Cpu/LdQQNN (; 47 ;) (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  local.get $0
  i32.load8_u offset=73
  i32.const 48
  i32.and
  i32.const 4
  i32.shr_u
  local.set $1
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#readCodeMemory
  local.set $2
  local.get $0
  local.get $0
  i32.load16_u offset=18
  i32.const 1
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:pc
  local.get $0
  local.get $0
  i64.load offset=32
  i64.const 3
  i64.add
  i64.store offset=32
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#readCodeMemory
  local.set $3
  local.get $0
  local.get $0
  i32.load16_u offset=18
  i32.const 1
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:pc
  local.get $0
  local.get $1
  local.get $2
  local.get $3
  i32.const 8
  i32.shl
  i32.or
  call $src/assembly/Z80Cpu/Z80Cpu#setReg16
  local.get $0
  local.get $0
  i64.load offset=32
  i64.const 3
  i64.add
  i64.store offset=32
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#writeMemory (; 48 ;) (param $0 i32) (param $1 i32) (param $2 i32)
  i32.const 2
  global.set $~argumentsLength
  local.get $1
  local.get $2
  local.get $0
  i32.load offset=80
  call_indirect (type $i32_i32_=>_none)
 )
 (func $src/assembly/Z80Cpu/LdBCiA (; 49 ;) (param $0 i32)
  local.get $0
  local.get $0
  i32.load16_u offset=2
  local.get $0
  i32.load16_u
  i32.const 8
  i32.shr_u
  call $src/assembly/Z80Cpu/Z80Cpu#writeMemory
  local.get $0
  local.get $0
  i64.load offset=32
  i64.const 3
  i64.add
  i64.store offset=32
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#getReg16 (; 50 ;) (param $0 i32) (param $1 i32) (result i32)
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
 (func $src/assembly/Z80Cpu/IncQQ (; 51 ;) (param $0 i32)
  (local $1 i32)
  local.get $0
  local.get $0
  i32.load8_u offset=73
  i32.const 48
  i32.and
  i32.const 4
  i32.shr_u
  local.tee $1
  local.get $0
  local.get $1
  call $src/assembly/Z80Cpu/Z80Cpu#getReg16
  i32.const 1
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#setReg16
  local.get $0
  local.get $0
  i64.load offset=32
  i64.const 2
  i64.add
  i64.store offset=32
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#getReg8 (; 52 ;) (param $0 i32) (param $1 i32) (result i32)
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
 (func $src/assembly/Z80Cpu/Z80Cpu#set:b (; 53 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $0
  i32.load16_u offset=2
  i32.const 255
  i32.and
  local.get $1
  i32.const 255
  i32.and
  i32.const 8
  i32.shl
  i32.or
  i32.store16 offset=2
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:c (; 54 ;) (param $0 i32) (param $1 i32)
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
 (func $src/assembly/Z80Cpu/Z80Cpu#set:d (; 55 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $0
  i32.load16_u offset=4
  i32.const 255
  i32.and
  local.get $1
  i32.const 255
  i32.and
  i32.const 8
  i32.shl
  i32.or
  i32.store16 offset=4
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:e (; 56 ;) (param $0 i32) (param $1 i32)
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
 (func $src/assembly/Z80Cpu/Z80Cpu#set:h (; 57 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $0
  i32.load16_u offset=6
  i32.const 255
  i32.and
  local.get $1
  i32.const 255
  i32.and
  i32.const 8
  i32.shl
  i32.or
  i32.store16 offset=6
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:l (; 58 ;) (param $0 i32) (param $1 i32)
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
 (func $src/assembly/Z80Cpu/Z80Cpu#setReg8 (; 59 ;) (param $0 i32) (param $1 i32) (param $2 i32)
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
 (func $src/assembly/Z80Cpu/IncQ (; 60 ;) (param $0 i32)
  (local $1 i32)
  local.get $0
  local.get $0
  i32.load8_u offset=73
  i32.const 56
  i32.and
  i32.const 3
  i32.shr_u
  local.tee $1
  local.get $0
  local.get $1
  call $src/assembly/Z80Cpu/Z80Cpu#getReg8
  local.tee $1
  i32.const 1
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#setReg8
  local.get $0
  i32.const 208
  local.get $1
  call $~lib/array/Array<u8>#__get
  local.get $0
  i32.load16_u
  i32.const 1
  i32.and
  i32.or
  call $src/assembly/Z80Cpu/Z80Cpu#set:f
 )
 (func $src/assembly/Z80Cpu/DecQ (; 61 ;) (param $0 i32)
  (local $1 i32)
  local.get $0
  local.get $0
  i32.load8_u offset=73
  i32.const 56
  i32.and
  i32.const 3
  i32.shr_u
  local.tee $1
  local.get $0
  local.get $1
  call $src/assembly/Z80Cpu/Z80Cpu#getReg8
  local.tee $1
  i32.const 1
  i32.sub
  call $src/assembly/Z80Cpu/Z80Cpu#setReg8
  local.get $0
  i32.const 416
  local.get $1
  call $~lib/array/Array<u8>#__get
  local.get $0
  i32.load16_u
  i32.const 1
  i32.and
  i32.or
  call $src/assembly/Z80Cpu/Z80Cpu#set:f
 )
 (func $src/assembly/Z80Cpu/LdQN (; 62 ;) (param $0 i32)
  local.get $0
  local.get $0
  i32.load8_u offset=73
  i32.const 56
  i32.and
  i32.const 3
  i32.shr_u
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#readCodeMemory
  call $src/assembly/Z80Cpu/Z80Cpu#setReg8
  local.get $0
  local.get $0
  i32.load16_u offset=18
  i32.const 1
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:pc
  local.get $0
  local.get $0
  i64.load offset=32
  i64.const 3
  i64.add
  i64.store offset=32
 )
 (func $src/assembly/Z80Cpu/Rlca (; 63 ;) (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  local.get $0
  local.get $0
  i32.load16_u
  i32.const 8
  i32.shr_u
  i32.const 1
  i32.shl
  local.tee $1
  i32.const 256
  i32.and
  if (result i32)
   i32.const 1
  else
   i32.const 0
  end
  i32.const 255
  i32.and
  local.tee $2
  if (result i32)
   local.get $1
   i32.const 1
   i32.or
  else
   local.get $1
  end
  call $src/assembly/Z80Cpu/Z80Cpu#set:a
  local.get $0
  local.get $0
  i32.load16_u
  i32.const 196
  i32.and
  local.get $2
  i32.or
  call $src/assembly/Z80Cpu/Z80Cpu#set:f
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_af_ (; 64 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=8
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:_af_ (; 65 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=8
 )
 (func $src/assembly/Z80Cpu/ExAf (; 66 ;) (param $0 i32)
  (local $1 i32)
  local.get $0
  i32.load16_u offset=8
  local.set $1
  local.get $0
  local.get $0
  i32.load16_u
  call $src/assembly/Z80Cpu/Z80Cpu#set:_af_
  local.get $0
  local.get $1
  call $src/assembly/Z80Cpu/Z80Cpu#set:af
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:wz (; 67 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=26
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#aluAddHL (; 68 ;) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  local.get $0
  local.get $0
  i32.load16_u
  i32.const 196
  i32.and
  call $src/assembly/Z80Cpu/Z80Cpu#set:f
  local.get $0
  local.get $0
  i32.load16_u
  i32.const 255
  i32.and
  local.get $1
  i32.const 4095
  i32.and
  local.get $2
  i32.const 4095
  i32.and
  i32.add
  i32.const 65535
  i32.and
  i32.const 8
  i32.shr_u
  i32.const 16
  i32.and
  i32.or
  call $src/assembly/Z80Cpu/Z80Cpu#set:f
  local.get $1
  i32.const 65535
  i32.and
  local.get $2
  i32.const 65535
  i32.and
  i32.add
  local.tee $1
  i32.const 65536
  i32.and
  if
   local.get $0
   local.get $0
   i32.load16_u
   i32.const 255
   i32.and
   i32.const 1
   i32.or
   call $src/assembly/Z80Cpu/Z80Cpu#set:f
  end
  local.get $0
  local.get $0
  i32.load16_u
  i32.const 255
  i32.and
  local.get $1
  i32.const 8
  i32.shr_u
  i32.const 40
  i32.and
  i32.or
  call $src/assembly/Z80Cpu/Z80Cpu#set:f
  local.get $1
  i32.const 65535
  i32.and
 )
 (func $src/assembly/Z80Cpu/AddHlQQ (; 69 ;) (param $0 i32)
  (local $1 i32)
  local.get $0
  i32.load8_u offset=73
  i32.const 48
  i32.and
  i32.const 4
  i32.shr_u
  local.set $1
  local.get $0
  local.get $0
  i32.load16_u offset=6
  i32.const 1
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:wz
  local.get $0
  local.get $0
  local.get $0
  i32.load16_u offset=6
  local.get $0
  local.get $1
  call $src/assembly/Z80Cpu/Z80Cpu#getReg16
  call $src/assembly/Z80Cpu/Z80Cpu#aluAddHL
  call $src/assembly/Z80Cpu/Z80Cpu#set:hl
  local.get $0
  local.get $0
  i64.load offset=32
  i64.const 7
  i64.add
  i64.store offset=32
 )
 (func $src/assembly/Z80Cpu/LdABci (; 70 ;) (param $0 i32)
  local.get $0
  local.get $0
  i32.load16_u offset=2
  i32.const 1
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:wz
  local.get $0
  local.get $0
  local.get $0
  i32.load16_u offset=2
  call $src/assembly/Z80Cpu/Z80Cpu#readMemory
  call $src/assembly/Z80Cpu/Z80Cpu#set:a
  local.get $0
  local.get $0
  i64.load offset=32
  i64.const 3
  i64.add
  i64.store offset=32
 )
 (func $src/assembly/Z80Cpu/DecQQ (; 71 ;) (param $0 i32)
  (local $1 i32)
  local.get $0
  local.get $0
  i32.load8_u offset=73
  i32.const 48
  i32.and
  i32.const 4
  i32.shr_u
  local.tee $1
  local.get $0
  local.get $1
  call $src/assembly/Z80Cpu/Z80Cpu#getReg16
  i32.const 1
  i32.sub
  call $src/assembly/Z80Cpu/Z80Cpu#setReg16
  local.get $0
  local.get $0
  i64.load offset=32
  i64.const 2
  i64.add
  i64.store offset=32
 )
 (func $src/assembly/Z80Cpu/Rrca (; 72 ;) (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  local.get $0
  i32.load16_u
  i32.const 8
  i32.shr_u
  local.tee $1
  i32.const 1
  i32.and
  if (result i32)
   i32.const 1
  else
   i32.const 0
  end
  local.tee $2
  local.set $3
  local.get $0
  local.get $1
  i32.const 1
  i32.shr_u
  i32.const 128
  i32.or
  local.get $1
  i32.const 1
  i32.shr_u
  local.get $2
  select
  call $src/assembly/Z80Cpu/Z80Cpu#set:a
  local.get $0
  local.get $0
  i32.load16_u
  i32.const 196
  i32.and
  local.get $3
  i32.or
  call $src/assembly/Z80Cpu/Z80Cpu#set:f
 )
 (func $src/assembly/Z80Cpu/Djnz (; 73 ;) (param $0 i32)
  (local $1 i32)
  local.get $0
  local.get $0
  i64.load offset=32
  i64.const 1
  i64.add
  i64.store offset=32
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
  call $src/assembly/Z80Cpu/Z80Cpu#set:pc
  local.get $0
  local.get $0
  i32.load16_u offset=2
  i32.const 8
  i32.shr_u
  i32.const 1
  i32.sub
  call $src/assembly/Z80Cpu/Z80Cpu#set:b
  local.get $0
  i32.load16_u offset=2
  i32.const 8
  i32.shr_u
  i32.eqz
  if
   return
  end
  local.get $0
  i32.load8_u offset=44
  if
   local.get $0
   local.get $0
   i64.load offset=32
   i64.const 5
   i64.add
   i64.store offset=32
  else
   local.get $0
   local.get $0
   i32.load16_u offset=18
   call $src/assembly/Z80Cpu/Z80Cpu#readMemory
   drop
   local.get $0
   local.get $0
   i64.load offset=32
   i64.const 1
   i64.add
   i64.store offset=32
   local.get $0
   local.get $0
   i32.load16_u offset=18
   call $src/assembly/Z80Cpu/Z80Cpu#readMemory
   drop
   local.get $0
   local.get $0
   i64.load offset=32
   i64.const 1
   i64.add
   i64.store offset=32
   local.get $0
   local.get $0
   i32.load16_u offset=18
   call $src/assembly/Z80Cpu/Z80Cpu#readMemory
   drop
   local.get $0
   local.get $0
   i64.load offset=32
   i64.const 1
   i64.add
   i64.store offset=32
   local.get $0
   local.get $0
   i32.load16_u offset=18
   call $src/assembly/Z80Cpu/Z80Cpu#readMemory
   drop
   local.get $0
   local.get $0
   i64.load offset=32
   i64.const 1
   i64.add
   i64.store offset=32
   local.get $0
   local.get $0
   i32.load16_u offset=18
   call $src/assembly/Z80Cpu/Z80Cpu#readMemory
   drop
   local.get $0
   local.get $0
   i64.load offset=32
   i64.const 1
   i64.add
   i64.store offset=32
  end
  local.get $0
  local.get $0
  i32.load16_u offset=18
  local.get $1
  i32.const 24
  i32.shl
  i32.const 24
  i32.shr_s
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:pc
  local.get $0
  local.get $0
  i32.load16_u offset=18
  call $src/assembly/Z80Cpu/Z80Cpu#set:wz
 )
 (func $src/assembly/Z80Cpu/LdDEiA (; 74 ;) (param $0 i32)
  local.get $0
  local.get $0
  i32.load16_u offset=4
  local.get $0
  i32.load16_u
  i32.const 8
  i32.shr_u
  call $src/assembly/Z80Cpu/Z80Cpu#writeMemory
  local.get $0
  local.get $0
  i64.load offset=32
  i64.const 3
  i64.add
  i64.store offset=32
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:cFlag (; 75 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u
  i32.const 1
  i32.and
  i32.const 0
  i32.ne
 )
 (func $src/assembly/Z80Cpu/Rla (; 76 ;) (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  local.get $0
  i32.load16_u
  i32.const 8
  i32.shr_u
  local.tee $1
  i32.const 128
  i32.and
  if (result i32)
   i32.const 1
  else
   i32.const 0
  end
  local.set $2
  local.get $1
  i32.const 1
  i32.shl
  local.set $1
  local.get $0
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#get:cFlag
  if (result i32)
   local.get $1
   i32.const 1
   i32.or
  else
   local.get $1
  end
  call $src/assembly/Z80Cpu/Z80Cpu#set:a
  local.get $0
  local.get $0
  i32.load16_u
  i32.const 196
  i32.and
  local.get $2
  i32.or
  call $src/assembly/Z80Cpu/Z80Cpu#set:f
 )
 (func $src/assembly/Z80Cpu/JrE (; 77 ;) (param $0 i32)
  (local $1 i32)
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
  call $src/assembly/Z80Cpu/Z80Cpu#set:pc
  local.get $0
  local.get $0
  i32.load16_u offset=18
  local.get $1
  i32.const 24
  i32.shl
  i32.const 24
  i32.shr_s
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:pc
  local.get $0
  local.get $0
  i32.load16_u offset=18
  call $src/assembly/Z80Cpu/Z80Cpu#set:wz
  local.get $0
  local.get $0
  i64.load offset=32
  i64.const 5
  i64.add
  i64.store offset=32
 )
 (func $src/assembly/Z80Cpu/LdADei (; 78 ;) (param $0 i32)
  local.get $0
  local.get $0
  i32.load16_u offset=4
  i32.const 1
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:wz
  local.get $0
  local.get $0
  local.get $0
  i32.load16_u offset=4
  call $src/assembly/Z80Cpu/Z80Cpu#readMemory
  call $src/assembly/Z80Cpu/Z80Cpu#set:a
  local.get $0
  local.get $0
  i64.load offset=32
  i64.const 3
  i64.add
  i64.store offset=32
 )
 (func $src/assembly/Z80Cpu/Rra (; 79 ;) (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  local.get $0
  i32.load16_u
  i32.const 8
  i32.shr_u
  local.tee $1
  i32.const 1
  i32.and
  if (result i32)
   i32.const 1
  else
   i32.const 0
  end
  local.set $2
  local.get $1
  i32.const 1
  i32.shr_u
  local.set $1
  local.get $0
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#get:cFlag
  if (result i32)
   local.get $1
   i32.const 128
   i32.or
  else
   local.get $1
  end
  call $src/assembly/Z80Cpu/Z80Cpu#set:a
  local.get $0
  local.get $0
  i32.load16_u
  i32.const 196
  i32.and
  local.get $2
  i32.or
  call $src/assembly/Z80Cpu/Z80Cpu#set:f
 )
 (func $src/assembly/Z80Cpu/JrNz (; 80 ;) (param $0 i32)
  (local $1 i32)
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
  call $src/assembly/Z80Cpu/Z80Cpu#set:pc
  local.get $0
  i32.load16_u
  i32.const 64
  i32.and
  if
   return
  end
  local.get $0
  i32.load8_u offset=44
  if
   local.get $0
   local.get $0
   i64.load offset=32
   i64.const 5
   i64.add
   i64.store offset=32
  else
   local.get $0
   local.get $0
   i32.load16_u offset=18
   call $src/assembly/Z80Cpu/Z80Cpu#readMemory
   drop
   local.get $0
   local.get $0
   i64.load offset=32
   i64.const 1
   i64.add
   i64.store offset=32
   local.get $0
   local.get $0
   i32.load16_u offset=18
   call $src/assembly/Z80Cpu/Z80Cpu#readMemory
   drop
   local.get $0
   local.get $0
   i64.load offset=32
   i64.const 1
   i64.add
   i64.store offset=32
   local.get $0
   local.get $0
   i32.load16_u offset=18
   call $src/assembly/Z80Cpu/Z80Cpu#readMemory
   drop
   local.get $0
   local.get $0
   i64.load offset=32
   i64.const 1
   i64.add
   i64.store offset=32
   local.get $0
   local.get $0
   i32.load16_u offset=18
   call $src/assembly/Z80Cpu/Z80Cpu#readMemory
   drop
   local.get $0
   local.get $0
   i64.load offset=32
   i64.const 1
   i64.add
   i64.store offset=32
   local.get $0
   local.get $0
   i32.load16_u offset=18
   call $src/assembly/Z80Cpu/Z80Cpu#readMemory
   drop
   local.get $0
   local.get $0
   i64.load offset=32
   i64.const 1
   i64.add
   i64.store offset=32
  end
  local.get $0
  local.get $0
  i32.load16_u offset=18
  local.get $1
  i32.const 24
  i32.shl
  i32.const 24
  i32.shr_s
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:pc
  local.get $0
  local.get $0
  i32.load16_u offset=18
  call $src/assembly/Z80Cpu/Z80Cpu#set:wz
 )
 (func $src/assembly/Z80Cpu/LdNNiHl (; 81 ;) (param $0 i32)
  (local $1 i32)
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#readCodeMemory
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
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#readCodeMemory
  i32.const 8
  i32.shl
  i32.or
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
  call $src/assembly/Z80Cpu/Z80Cpu#set:pc
  local.get $0
  local.get $1
  i32.const 1
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:wz
  local.get $0
  local.get $1
  local.get $0
  i32.load16_u offset=6
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
  local.get $0
  i32.load16_u offset=26
  local.get $0
  i32.load16_u offset=6
  i32.const 8
  i32.shr_u
  call $src/assembly/Z80Cpu/Z80Cpu#writeMemory
  local.get $0
  local.get $0
  i64.load offset=32
  i64.const 3
  i64.add
  i64.store offset=32
 )
 (func $~lib/array/Array<u16>#__get (; 82 ;) (param $0 i32) (result i32)
  local.get $0
  i32.const 476
  i32.load
  i32.ge_u
  if
   i32.const 240
   i32.const 304
   i32.const 93
   i32.const 41
   call $~lib/builtins/abort
   unreachable
  end
  i32.const 468
  i32.load
  local.get $0
  i32.const 1
  i32.shl
  i32.add
  i32.load16_u
 )
 (func $src/assembly/Z80Cpu/Daa (; 83 ;) (param $0 i32)
  local.get $0
  local.get $0
  i32.load16_u
  i32.const 3
  i32.and
  local.get $0
  i32.load16_u
  i32.const 255
  i32.and
  i32.const 2
  i32.shr_u
  i32.const 4
  i32.and
  i32.add
  i32.const 255
  i32.and
  i32.const 8
  i32.shl
  local.get $0
  i32.load16_u
  i32.const 8
  i32.shr_u
  i32.add
  i32.const 65535
  i32.and
  call $~lib/array/Array<u16>#__get
  call $src/assembly/Z80Cpu/Z80Cpu#set:af
 )
 (func $src/assembly/Z80Cpu/JrZ (; 84 ;) (param $0 i32)
  (local $1 i32)
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
  call $src/assembly/Z80Cpu/Z80Cpu#set:pc
  local.get $0
  i32.load16_u
  i32.const 64
  i32.and
  i32.eqz
  if
   return
  end
  local.get $0
  i32.load8_u offset=44
  if
   local.get $0
   local.get $0
   i64.load offset=32
   i64.const 5
   i64.add
   i64.store offset=32
  else
   local.get $0
   local.get $0
   i32.load16_u offset=18
   call $src/assembly/Z80Cpu/Z80Cpu#readMemory
   drop
   local.get $0
   local.get $0
   i64.load offset=32
   i64.const 1
   i64.add
   i64.store offset=32
   local.get $0
   local.get $0
   i32.load16_u offset=18
   call $src/assembly/Z80Cpu/Z80Cpu#readMemory
   drop
   local.get $0
   local.get $0
   i64.load offset=32
   i64.const 1
   i64.add
   i64.store offset=32
   local.get $0
   local.get $0
   i32.load16_u offset=18
   call $src/assembly/Z80Cpu/Z80Cpu#readMemory
   drop
   local.get $0
   local.get $0
   i64.load offset=32
   i64.const 1
   i64.add
   i64.store offset=32
   local.get $0
   local.get $0
   i32.load16_u offset=18
   call $src/assembly/Z80Cpu/Z80Cpu#readMemory
   drop
   local.get $0
   local.get $0
   i64.load offset=32
   i64.const 1
   i64.add
   i64.store offset=32
   local.get $0
   local.get $0
   i32.load16_u offset=18
   call $src/assembly/Z80Cpu/Z80Cpu#readMemory
   drop
   local.get $0
   local.get $0
   i64.load offset=32
   i64.const 1
   i64.add
   i64.store offset=32
  end
  local.get $0
  local.get $0
  i32.load16_u offset=18
  local.get $1
  i32.const 24
  i32.shl
  i32.const 24
  i32.shr_s
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:pc
  local.get $0
  local.get $0
  i32.load16_u offset=18
  call $src/assembly/Z80Cpu/Z80Cpu#set:wz
 )
 (func $src/assembly/Z80Cpu/LdHlNNi (; 85 ;) (param $0 i32)
  (local $1 i32)
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#readCodeMemory
  local.get $0
  local.get $0
  i32.load16_u offset=18
  i32.const 1
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:pc
  local.get $0
  local.get $0
  i64.load offset=32
  i64.const 3
  i64.add
  i64.store offset=32
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#readCodeMemory
  i32.const 8
  i32.shl
  i32.add
  local.set $1
  local.get $0
  local.get $0
  i32.load16_u offset=18
  i32.const 1
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:pc
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
  call $src/assembly/Z80Cpu/Z80Cpu#set:wz
  local.get $0
  local.get $1
  call $src/assembly/Z80Cpu/Z80Cpu#readMemory
  local.get $0
  local.get $0
  i64.load offset=32
  i64.const 3
  i64.add
  i64.store offset=32
  local.get $0
  local.get $0
  i32.load16_u offset=26
  call $src/assembly/Z80Cpu/Z80Cpu#readMemory
  i32.const 8
  i32.shl
  i32.add
  local.set $1
  local.get $0
  local.get $0
  i64.load offset=32
  i64.const 3
  i64.add
  i64.store offset=32
  local.get $0
  local.get $1
  call $src/assembly/Z80Cpu/Z80Cpu#set:hl
 )
 (func $src/assembly/Z80Cpu/Cpl (; 86 ;) (param $0 i32)
  local.get $0
  local.get $0
  i32.load16_u
  i32.const 8
  i32.shr_u
  i32.const 255
  i32.xor
  call $src/assembly/Z80Cpu/Z80Cpu#set:a
  local.get $0
  local.get $0
  i32.load16_u
  i32.const 8
  i32.shr_u
  i32.const 40
  i32.and
  local.get $0
  i32.load16_u
  i32.const 215
  i32.and
  i32.const 18
  i32.or
  i32.or
  call $src/assembly/Z80Cpu/Z80Cpu#set:f
 )
 (func $src/assembly/Z80Cpu/JrNc (; 87 ;) (param $0 i32)
  (local $1 i32)
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
  call $src/assembly/Z80Cpu/Z80Cpu#set:pc
  local.get $0
  i32.load16_u
  i32.const 1
  i32.and
  if
   return
  end
  local.get $0
  i32.load8_u offset=44
  if
   local.get $0
   local.get $0
   i64.load offset=32
   i64.const 5
   i64.add
   i64.store offset=32
  else
   local.get $0
   local.get $0
   i32.load16_u offset=18
   call $src/assembly/Z80Cpu/Z80Cpu#readMemory
   drop
   local.get $0
   local.get $0
   i64.load offset=32
   i64.const 1
   i64.add
   i64.store offset=32
   local.get $0
   local.get $0
   i32.load16_u offset=18
   call $src/assembly/Z80Cpu/Z80Cpu#readMemory
   drop
   local.get $0
   local.get $0
   i64.load offset=32
   i64.const 1
   i64.add
   i64.store offset=32
   local.get $0
   local.get $0
   i32.load16_u offset=18
   call $src/assembly/Z80Cpu/Z80Cpu#readMemory
   drop
   local.get $0
   local.get $0
   i64.load offset=32
   i64.const 1
   i64.add
   i64.store offset=32
   local.get $0
   local.get $0
   i32.load16_u offset=18
   call $src/assembly/Z80Cpu/Z80Cpu#readMemory
   drop
   local.get $0
   local.get $0
   i64.load offset=32
   i64.const 1
   i64.add
   i64.store offset=32
   local.get $0
   local.get $0
   i32.load16_u offset=18
   call $src/assembly/Z80Cpu/Z80Cpu#readMemory
   drop
   local.get $0
   local.get $0
   i64.load offset=32
   i64.const 1
   i64.add
   i64.store offset=32
  end
  local.get $0
  local.get $0
  i32.load16_u offset=18
  local.get $1
  i32.const 24
  i32.shl
  i32.const 24
  i32.shr_s
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:pc
  local.get $0
  local.get $0
  i32.load16_u offset=18
  call $src/assembly/Z80Cpu/Z80Cpu#set:wz
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:wh (; 88 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $0
  i32.load16_u offset=26
  i32.const 255
  i32.and
  local.get $1
  i32.const 255
  i32.and
  i32.const 8
  i32.shl
  i32.or
  i32.store16 offset=26
 )
 (func $src/assembly/Z80Cpu/LdNNiA (; 89 ;) (param $0 i32)
  (local $1 i32)
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#readCodeMemory
  local.get $0
  local.get $0
  i32.load16_u offset=18
  i32.const 1
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:pc
  local.get $0
  local.get $0
  i64.load offset=32
  i64.const 3
  i64.add
  i64.store offset=32
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#readCodeMemory
  i32.const 8
  i32.shl
  i32.or
  local.set $1
  local.get $0
  local.get $0
  i32.load16_u offset=18
  i32.const 1
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:pc
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
  i32.const 255
  i32.and
  local.get $0
  i32.load16_u
  i32.const 8
  i32.shr_u
  i32.const 8
  i32.shl
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:wz
  local.get $0
  local.get $1
  local.get $0
  i32.load16_u
  i32.const 8
  i32.shr_u
  call $src/assembly/Z80Cpu/Z80Cpu#writeMemory
  local.get $0
  local.get $0
  i32.load16_u
  i32.const 8
  i32.shr_u
  call $src/assembly/Z80Cpu/Z80Cpu#set:wh
  local.get $0
  local.get $0
  i64.load offset=32
  i64.const 3
  i64.add
  i64.store offset=32
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#aluIncByte (; 90 ;) (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  i32.const 208
  local.get $1
  i32.const 255
  i32.and
  call $~lib/array/Array<u8>#__get
  local.get $0
  i32.load16_u
  i32.const 1
  i32.and
  i32.or
  call $src/assembly/Z80Cpu/Z80Cpu#set:f
  local.get $1
  i32.const 1
  i32.add
  i32.const 255
  i32.and
 )
 (func $src/assembly/Z80Cpu/IncHli (; 91 ;) (param $0 i32)
  (local $1 i32)
  local.get $0
  local.get $0
  i32.load16_u offset=6
  call $src/assembly/Z80Cpu/Z80Cpu#readMemory
  local.set $1
  local.get $0
  i32.load8_u offset=44
  if
   local.get $0
   local.get $0
   i64.load offset=32
   i64.const 4
   i64.add
   i64.store offset=32
  else
   local.get $0
   local.get $0
   i64.load offset=32
   i64.const 3
   i64.add
   i64.store offset=32
   local.get $0
   local.get $0
   i32.load16_u offset=6
   call $src/assembly/Z80Cpu/Z80Cpu#readMemory
   drop
   local.get $0
   local.get $0
   i64.load offset=32
   i64.const 1
   i64.add
   i64.store offset=32
  end
  local.get $0
  local.get $1
  call $src/assembly/Z80Cpu/Z80Cpu#aluIncByte
  local.set $1
  local.get $0
  local.get $0
  i32.load16_u offset=6
  local.get $1
  call $src/assembly/Z80Cpu/Z80Cpu#writeMemory
  local.get $0
  local.get $0
  i64.load offset=32
  i64.const 3
  i64.add
  i64.store offset=32
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#aluDecByte (; 92 ;) (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  i32.const 416
  local.get $1
  i32.const 255
  i32.and
  call $~lib/array/Array<u8>#__get
  local.get $0
  i32.load16_u
  i32.const 1
  i32.and
  i32.or
  call $src/assembly/Z80Cpu/Z80Cpu#set:f
  local.get $1
  i32.const 1
  i32.sub
  i32.const 255
  i32.and
 )
 (func $src/assembly/Z80Cpu/DecHli (; 93 ;) (param $0 i32)
  (local $1 i32)
  local.get $0
  local.get $0
  i32.load16_u offset=6
  call $src/assembly/Z80Cpu/Z80Cpu#readMemory
  local.set $1
  local.get $0
  i32.load8_u offset=44
  if
   local.get $0
   local.get $0
   i64.load offset=32
   i64.const 4
   i64.add
   i64.store offset=32
  else
   local.get $0
   local.get $0
   i64.load offset=32
   i64.const 3
   i64.add
   i64.store offset=32
   local.get $0
   local.get $0
   i32.load16_u offset=6
   call $src/assembly/Z80Cpu/Z80Cpu#readMemory
   drop
   local.get $0
   local.get $0
   i64.load offset=32
   i64.const 1
   i64.add
   i64.store offset=32
  end
  local.get $0
  local.get $1
  call $src/assembly/Z80Cpu/Z80Cpu#aluDecByte
  local.set $1
  local.get $0
  local.get $0
  i32.load16_u offset=6
  local.get $1
  call $src/assembly/Z80Cpu/Z80Cpu#writeMemory
  local.get $0
  local.get $0
  i64.load offset=32
  i64.const 3
  i64.add
  i64.store offset=32
 )
 (func $src/assembly/Z80Cpu/LdHliN (; 94 ;) (param $0 i32)
  (local $1 i32)
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
  call $src/assembly/Z80Cpu/Z80Cpu#set:pc
  local.get $0
  local.get $0
  i32.load16_u offset=6
  local.get $1
  call $src/assembly/Z80Cpu/Z80Cpu#writeMemory
  local.get $0
  local.get $0
  i64.load offset=32
  i64.const 3
  i64.add
  i64.store offset=32
 )
 (func $src/assembly/Z80Cpu/Scf (; 95 ;) (param $0 i32)
  local.get $0
  local.get $0
  i32.load16_u
  i32.const 196
  i32.and
  local.get $0
  i32.load16_u
  i32.const 8
  i32.shr_u
  i32.const 40
  i32.and
  i32.or
  i32.const 1
  i32.or
  call $src/assembly/Z80Cpu/Z80Cpu#set:f
 )
 (func $src/assembly/Z80Cpu/JrC (; 96 ;) (param $0 i32)
  (local $1 i32)
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
  call $src/assembly/Z80Cpu/Z80Cpu#set:pc
  local.get $0
  i32.load16_u
  i32.const 1
  i32.and
  i32.eqz
  if
   return
  end
  local.get $0
  i32.load8_u offset=44
  if
   local.get $0
   local.get $0
   i64.load offset=32
   i64.const 5
   i64.add
   i64.store offset=32
  else
   local.get $0
   local.get $0
   i32.load16_u offset=18
   call $src/assembly/Z80Cpu/Z80Cpu#readMemory
   drop
   local.get $0
   local.get $0
   i64.load offset=32
   i64.const 1
   i64.add
   i64.store offset=32
   local.get $0
   local.get $0
   i32.load16_u offset=18
   call $src/assembly/Z80Cpu/Z80Cpu#readMemory
   drop
   local.get $0
   local.get $0
   i64.load offset=32
   i64.const 1
   i64.add
   i64.store offset=32
   local.get $0
   local.get $0
   i32.load16_u offset=18
   call $src/assembly/Z80Cpu/Z80Cpu#readMemory
   drop
   local.get $0
   local.get $0
   i64.load offset=32
   i64.const 1
   i64.add
   i64.store offset=32
   local.get $0
   local.get $0
   i32.load16_u offset=18
   call $src/assembly/Z80Cpu/Z80Cpu#readMemory
   drop
   local.get $0
   local.get $0
   i64.load offset=32
   i64.const 1
   i64.add
   i64.store offset=32
   local.get $0
   local.get $0
   i32.load16_u offset=18
   call $src/assembly/Z80Cpu/Z80Cpu#readMemory
   drop
   local.get $0
   local.get $0
   i64.load offset=32
   i64.const 1
   i64.add
   i64.store offset=32
  end
  local.get $0
  local.get $0
  i32.load16_u offset=18
  local.get $1
  i32.const 24
  i32.shl
  i32.const 24
  i32.shr_s
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:pc
  local.get $0
  local.get $0
  i32.load16_u offset=18
  call $src/assembly/Z80Cpu/Z80Cpu#set:wz
 )
 (func $src/assembly/Z80Cpu/LdANNi (; 97 ;) (param $0 i32)
  (local $1 i32)
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#readCodeMemory
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
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#readCodeMemory
  i32.const 8
  i32.shl
  i32.add
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
  call $src/assembly/Z80Cpu/Z80Cpu#set:pc
  local.get $0
  local.get $1
  i32.const 1
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:wz
  local.get $0
  local.get $0
  local.get $1
  call $src/assembly/Z80Cpu/Z80Cpu#readMemory
  call $src/assembly/Z80Cpu/Z80Cpu#set:a
  local.get $0
  local.get $0
  i64.load offset=32
  i64.const 3
  i64.add
  i64.store offset=32
 )
 (func $src/assembly/Z80Cpu/Ccf (; 98 ;) (param $0 i32)
  local.get $0
  local.get $0
  i32.load16_u
  i32.const 1
  i32.and
  if (result i32)
   i32.const 16
  else
   i32.const 1
  end
  local.get $0
  i32.load16_u
  i32.const 196
  i32.and
  local.get $0
  i32.load16_u
  i32.const 8
  i32.shr_u
  i32.const 40
  i32.and
  i32.or
  i32.or
  call $src/assembly/Z80Cpu/Z80Cpu#set:f
 )
 (func $src/assembly/Z80Cpu/LdQW (; 99 ;) (param $0 i32)
  local.get $0
  local.get $0
  i32.load8_u offset=73
  i32.const 56
  i32.and
  i32.const 3
  i32.shr_u
  local.get $0
  local.get $0
  i32.load8_u offset=73
  i32.const 7
  i32.and
  call $src/assembly/Z80Cpu/Z80Cpu#getReg8
  call $src/assembly/Z80Cpu/Z80Cpu#setReg8
 )
 (func $src/assembly/Z80Cpu/LdQHli (; 100 ;) (param $0 i32)
  local.get $0
  local.get $0
  i32.load8_u offset=73
  i32.const 56
  i32.and
  i32.const 3
  i32.shr_u
  local.get $0
  local.get $0
  i32.load16_u offset=6
  call $src/assembly/Z80Cpu/Z80Cpu#readMemory
  call $src/assembly/Z80Cpu/Z80Cpu#setReg8
  local.get $0
  local.get $0
  i64.load offset=32
  i64.const 3
  i64.add
  i64.store offset=32
 )
 (func $src/assembly/Z80Cpu/LdHliQ (; 101 ;) (param $0 i32)
  local.get $0
  local.get $0
  i32.load16_u offset=6
  local.get $0
  local.get $0
  i32.load8_u offset=73
  i32.const 7
  i32.and
  call $src/assembly/Z80Cpu/Z80Cpu#getReg8
  call $src/assembly/Z80Cpu/Z80Cpu#writeMemory
  local.get $0
  local.get $0
  i64.load offset=32
  i64.const 3
  i64.add
  i64.store offset=32
 )
 (func $src/assembly/Z80Cpu/Halt (; 102 ;) (param $0 i32)
  local.get $0
  local.get $0
  i32.load offset=40
  i32.const 8
  i32.or
  i32.store offset=40
  local.get $0
  local.get $0
  i32.load16_u offset=18
  i32.const 1
  i32.sub
  call $src/assembly/Z80Cpu/Z80Cpu#set:pc
 )
 (func $src/assembly/Z80Cpu/AddAQ (; 103 ;) (param $0 i32)
  (local $1 i32)
  local.get $0
  i32.const 512
  local.get $0
  local.get $0
  i32.load8_u offset=73
  i32.const 7
  i32.and
  call $src/assembly/Z80Cpu/Z80Cpu#getReg8
  local.tee $1
  local.get $0
  i32.load16_u
  i32.const 8
  i32.shr_u
  i32.const 8
  i32.shl
  i32.add
  i32.const 65535
  i32.and
  call $~lib/array/Array<u8>#__get
  call $src/assembly/Z80Cpu/Z80Cpu#set:f
  local.get $0
  local.get $0
  i32.load16_u
  i32.const 8
  i32.shr_u
  local.get $1
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:a
 )
 (func $src/assembly/Z80Cpu/AddAHli (; 104 ;) (param $0 i32)
  (local $1 i32)
  local.get $0
  local.get $0
  i32.load16_u offset=6
  call $src/assembly/Z80Cpu/Z80Cpu#readMemory
  local.set $1
  local.get $0
  local.get $0
  i64.load offset=32
  i64.const 3
  i64.add
  i64.store offset=32
  local.get $0
  i32.const 512
  local.get $0
  i32.load16_u
  i32.const 8
  i32.shr_u
  i32.const 8
  i32.shl
  local.get $1
  i32.add
  i32.const 65535
  i32.and
  call $~lib/array/Array<u8>#__get
  call $src/assembly/Z80Cpu/Z80Cpu#set:f
  local.get $0
  local.get $0
  i32.load16_u
  i32.const 8
  i32.shr_u
  local.get $1
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:a
 )
 (func $src/assembly/Z80Cpu/AdcAQ (; 105 ;) (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  local.get $0
  i32.const 512
  local.get $0
  local.get $0
  i32.load8_u offset=73
  i32.const 7
  i32.and
  call $src/assembly/Z80Cpu/Z80Cpu#getReg8
  local.tee $1
  local.get $0
  i32.load16_u
  i32.const 1
  i32.and
  if (result i32)
   i32.const 1
  else
   i32.const 0
  end
  local.tee $2
  i32.const 16
  i32.shl
  local.get $0
  i32.load16_u
  i32.const 8
  i32.shr_u
  i32.const 8
  i32.shl
  i32.add
  i32.add
  call $~lib/array/Array<u8>#__get
  call $src/assembly/Z80Cpu/Z80Cpu#set:f
  local.get $0
  local.get $1
  local.get $2
  i32.add
  local.get $0
  i32.load16_u
  i32.const 8
  i32.shr_u
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:a
 )
 (func $src/assembly/Z80Cpu/AdcAHli (; 106 ;) (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  local.get $0
  local.get $0
  i32.load16_u offset=6
  call $src/assembly/Z80Cpu/Z80Cpu#readMemory
  local.set $1
  local.get $0
  local.get $0
  i64.load offset=32
  i64.const 3
  i64.add
  i64.store offset=32
  local.get $0
  i32.const 512
  local.get $0
  i32.load16_u
  i32.const 1
  i32.and
  if (result i32)
   i32.const 1
  else
   i32.const 0
  end
  local.tee $2
  i32.const 16
  i32.shl
  local.get $0
  i32.load16_u
  i32.const 8
  i32.shr_u
  i32.const 8
  i32.shl
  i32.add
  local.get $1
  i32.add
  call $~lib/array/Array<u8>#__get
  call $src/assembly/Z80Cpu/Z80Cpu#set:f
  local.get $0
  local.get $1
  local.get $2
  i32.add
  local.get $0
  i32.load16_u
  i32.const 8
  i32.shr_u
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:a
 )
 (func $src/assembly/Z80Cpu/SubAQ (; 107 ;) (param $0 i32)
  (local $1 i32)
  local.get $0
  i32.const 560
  local.get $0
  local.get $0
  i32.load8_u offset=73
  i32.const 7
  i32.and
  call $src/assembly/Z80Cpu/Z80Cpu#getReg8
  local.tee $1
  local.get $0
  i32.load16_u
  i32.const 8
  i32.shr_u
  i32.const 8
  i32.shl
  i32.add
  i32.const 65535
  i32.and
  call $~lib/array/Array<u8>#__get
  call $src/assembly/Z80Cpu/Z80Cpu#set:f
  local.get $0
  local.get $0
  i32.load16_u
  i32.const 8
  i32.shr_u
  local.get $1
  i32.sub
  call $src/assembly/Z80Cpu/Z80Cpu#set:a
 )
 (func $src/assembly/Z80Cpu/SubAHli (; 108 ;) (param $0 i32)
  (local $1 i32)
  local.get $0
  local.get $0
  i32.load16_u offset=6
  call $src/assembly/Z80Cpu/Z80Cpu#readMemory
  local.set $1
  local.get $0
  local.get $0
  i64.load offset=32
  i64.const 3
  i64.add
  i64.store offset=32
  local.get $0
  i32.const 560
  local.get $0
  i32.load16_u
  i32.const 8
  i32.shr_u
  i32.const 8
  i32.shl
  local.get $1
  i32.add
  i32.const 65535
  i32.and
  call $~lib/array/Array<u8>#__get
  call $src/assembly/Z80Cpu/Z80Cpu#set:f
  local.get $0
  local.get $0
  i32.load16_u
  i32.const 8
  i32.shr_u
  local.get $1
  i32.sub
  call $src/assembly/Z80Cpu/Z80Cpu#set:a
 )
 (func $src/assembly/Z80Cpu/SbcAQ (; 109 ;) (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  local.get $0
  i32.const 560
  local.get $0
  local.get $0
  i32.load8_u offset=73
  i32.const 7
  i32.and
  call $src/assembly/Z80Cpu/Z80Cpu#getReg8
  local.tee $1
  local.get $0
  i32.load16_u
  i32.const 1
  i32.and
  if (result i32)
   i32.const 1
  else
   i32.const 0
  end
  local.tee $2
  i32.const 16
  i32.shl
  local.get $0
  i32.load16_u
  i32.const 8
  i32.shr_u
  i32.const 8
  i32.shl
  i32.add
  i32.add
  call $~lib/array/Array<u8>#__get
  call $src/assembly/Z80Cpu/Z80Cpu#set:f
  local.get $0
  local.get $0
  i32.load16_u
  i32.const 8
  i32.shr_u
  local.get $1
  local.get $2
  i32.add
  i32.sub
  call $src/assembly/Z80Cpu/Z80Cpu#set:a
 )
 (func $src/assembly/Z80Cpu/SbcAHli (; 110 ;) (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  local.get $0
  local.get $0
  i32.load16_u offset=6
  call $src/assembly/Z80Cpu/Z80Cpu#readMemory
  local.set $1
  local.get $0
  local.get $0
  i64.load offset=32
  i64.const 3
  i64.add
  i64.store offset=32
  local.get $0
  i32.const 560
  local.get $0
  i32.load16_u
  i32.const 1
  i32.and
  if (result i32)
   i32.const 1
  else
   i32.const 0
  end
  local.tee $2
  i32.const 16
  i32.shl
  local.get $0
  i32.load16_u
  i32.const 8
  i32.shr_u
  i32.const 8
  i32.shl
  i32.add
  local.get $1
  i32.add
  call $~lib/array/Array<u8>#__get
  call $src/assembly/Z80Cpu/Z80Cpu#set:f
  local.get $0
  local.get $0
  i32.load16_u
  i32.const 8
  i32.shr_u
  local.get $1
  local.get $2
  i32.add
  i32.sub
  call $src/assembly/Z80Cpu/Z80Cpu#set:a
 )
 (func $src/assembly/Z80Cpu/AndAQ (; 111 ;) (param $0 i32)
  local.get $0
  local.get $0
  local.get $0
  i32.load8_u offset=73
  i32.const 7
  i32.and
  call $src/assembly/Z80Cpu/Z80Cpu#getReg8
  local.get $0
  i32.load16_u
  i32.const 8
  i32.shr_u
  i32.and
  call $src/assembly/Z80Cpu/Z80Cpu#set:a
  local.get $0
  i32.const 608
  local.get $0
  i32.load16_u
  i32.const 8
  i32.shr_u
  call $~lib/array/Array<u8>#__get
  i32.const 16
  i32.or
  call $src/assembly/Z80Cpu/Z80Cpu#set:f
 )
 (func $src/assembly/Z80Cpu/AndAHli (; 112 ;) (param $0 i32)
  (local $1 i32)
  local.get $0
  local.get $0
  i32.load16_u offset=6
  call $src/assembly/Z80Cpu/Z80Cpu#readMemory
  local.set $1
  local.get $0
  local.get $0
  i64.load offset=32
  i64.const 3
  i64.add
  i64.store offset=32
  local.get $0
  local.get $0
  i32.load16_u
  i32.const 8
  i32.shr_u
  local.get $1
  i32.and
  call $src/assembly/Z80Cpu/Z80Cpu#set:a
  local.get $0
  i32.const 608
  local.get $0
  i32.load16_u
  i32.const 8
  i32.shr_u
  call $~lib/array/Array<u8>#__get
  i32.const 16
  i32.or
  call $src/assembly/Z80Cpu/Z80Cpu#set:f
 )
 (func $src/assembly/Z80Cpu/XorAQ (; 113 ;) (param $0 i32)
  local.get $0
  local.get $0
  local.get $0
  i32.load8_u offset=73
  i32.const 7
  i32.and
  call $src/assembly/Z80Cpu/Z80Cpu#getReg8
  local.get $0
  i32.load16_u
  i32.const 8
  i32.shr_u
  i32.xor
  call $src/assembly/Z80Cpu/Z80Cpu#set:a
  local.get $0
  i32.const 608
  local.get $0
  i32.load16_u
  i32.const 8
  i32.shr_u
  call $~lib/array/Array<u8>#__get
  call $src/assembly/Z80Cpu/Z80Cpu#set:f
 )
 (func $src/assembly/Z80Cpu/XorAHli (; 114 ;) (param $0 i32)
  (local $1 i32)
  local.get $0
  local.get $0
  i32.load16_u offset=6
  call $src/assembly/Z80Cpu/Z80Cpu#readMemory
  local.set $1
  local.get $0
  local.get $0
  i64.load offset=32
  i64.const 3
  i64.add
  i64.store offset=32
  local.get $0
  local.get $0
  i32.load16_u
  i32.const 8
  i32.shr_u
  local.get $1
  i32.xor
  call $src/assembly/Z80Cpu/Z80Cpu#set:a
  local.get $0
  i32.const 608
  local.get $0
  i32.load16_u
  i32.const 8
  i32.shr_u
  call $~lib/array/Array<u8>#__get
  call $src/assembly/Z80Cpu/Z80Cpu#set:f
 )
 (func $src/assembly/Z80Cpu/OrAQ (; 115 ;) (param $0 i32)
  local.get $0
  local.get $0
  local.get $0
  i32.load8_u offset=73
  i32.const 7
  i32.and
  call $src/assembly/Z80Cpu/Z80Cpu#getReg8
  local.get $0
  i32.load16_u
  i32.const 8
  i32.shr_u
  i32.or
  call $src/assembly/Z80Cpu/Z80Cpu#set:a
  local.get $0
  i32.const 608
  local.get $0
  i32.load16_u
  i32.const 8
  i32.shr_u
  call $~lib/array/Array<u8>#__get
  call $src/assembly/Z80Cpu/Z80Cpu#set:f
 )
 (func $src/assembly/Z80Cpu/OrAHli (; 116 ;) (param $0 i32)
  (local $1 i32)
  local.get $0
  local.get $0
  i32.load16_u offset=6
  call $src/assembly/Z80Cpu/Z80Cpu#readMemory
  local.set $1
  local.get $0
  local.get $0
  i64.load offset=32
  i64.const 3
  i64.add
  i64.store offset=32
  local.get $0
  local.get $0
  i32.load16_u
  i32.const 8
  i32.shr_u
  local.get $1
  i32.or
  call $src/assembly/Z80Cpu/Z80Cpu#set:a
  local.get $0
  i32.const 608
  local.get $0
  i32.load16_u
  i32.const 8
  i32.shr_u
  call $~lib/array/Array<u8>#__get
  call $src/assembly/Z80Cpu/Z80Cpu#set:f
 )
 (func $src/assembly/Z80Cpu/CpAQ (; 117 ;) (param $0 i32)
  local.get $0
  i32.const 560
  local.get $0
  local.get $0
  i32.load8_u offset=73
  i32.const 7
  i32.and
  call $src/assembly/Z80Cpu/Z80Cpu#getReg8
  local.get $0
  i32.load16_u
  i32.const 8
  i32.shr_u
  i32.const 8
  i32.shl
  i32.add
  i32.const 65535
  i32.and
  local.tee $0
  call $~lib/array/Array<u8>#__get
  i32.const -41
  i32.and
  local.get $0
  i32.const 40
  i32.and
  i32.or
  call $src/assembly/Z80Cpu/Z80Cpu#set:f
 )
 (func $src/assembly/Z80Cpu/CpAHli (; 118 ;) (param $0 i32)
  (local $1 i32)
  local.get $0
  local.get $0
  i32.load16_u offset=6
  call $src/assembly/Z80Cpu/Z80Cpu#readMemory
  local.set $1
  local.get $0
  local.get $0
  i64.load offset=32
  i64.const 3
  i64.add
  i64.store offset=32
  local.get $0
  i32.const 560
  local.get $0
  i32.load16_u
  i32.const 8
  i32.shr_u
  i32.const 8
  i32.shl
  local.get $1
  i32.add
  i32.const 65535
  i32.and
  local.tee $0
  call $~lib/array/Array<u8>#__get
  i32.const -41
  i32.and
  local.get $0
  i32.const 40
  i32.and
  i32.or
  call $src/assembly/Z80Cpu/Z80Cpu#set:f
 )
 (func $src/assembly/Z80Cpu/RetNz (; 119 ;) (param $0 i32)
  local.get $0
  local.get $0
  i64.load offset=32
  i64.const 1
  i64.add
  i64.store offset=32
  local.get $0
  i32.load16_u
  i32.const 64
  i32.and
  if
   return
  end
  local.get $0
  local.get $0
  local.get $0
  i32.load16_u offset=20
  call $src/assembly/Z80Cpu/Z80Cpu#readMemory
  call $src/assembly/Z80Cpu/Z80Cpu#set:wz
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
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:sp
  local.get $0
  local.get $0
  i32.load16_u offset=26
  local.get $0
  local.get $0
  i32.load16_u offset=20
  call $src/assembly/Z80Cpu/Z80Cpu#readMemory
  i32.const 8
  i32.shl
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:wz
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
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:sp
  local.get $0
  local.get $0
  i32.load16_u offset=26
  call $src/assembly/Z80Cpu/Z80Cpu#set:pc
 )
 (func $src/assembly/Z80Cpu/PopBc (; 120 ;) (param $0 i32)
  (local $1 i32)
  local.get $0
  local.get $0
  i32.load16_u offset=20
  call $src/assembly/Z80Cpu/Z80Cpu#readMemory
  local.set $1
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
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:sp
  local.get $0
  local.get $1
  local.get $0
  local.get $0
  i32.load16_u offset=20
  call $src/assembly/Z80Cpu/Z80Cpu#readMemory
  i32.const 8
  i32.shl
  i32.or
  call $src/assembly/Z80Cpu/Z80Cpu#set:bc
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
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:sp
 )
 (func $src/assembly/Z80Cpu/JpNz (; 121 ;) (param $0 i32)
  local.get $0
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#readCodeMemory
  call $src/assembly/Z80Cpu/Z80Cpu#set:wz
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
  local.get $0
  local.get $0
  i32.load16_u offset=26
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#readCodeMemory
  i32.const 8
  i32.shl
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:wz
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
  local.get $0
  i32.load16_u
  i32.const 64
  i32.and
  if
   return
  end
  local.get $0
  local.get $0
  i32.load16_u offset=26
  call $src/assembly/Z80Cpu/Z80Cpu#set:pc
 )
 (func $src/assembly/Z80Cpu/Jp (; 122 ;) (param $0 i32)
  local.get $0
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#readCodeMemory
  call $src/assembly/Z80Cpu/Z80Cpu#set:wz
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
  local.get $0
  local.get $0
  i32.load16_u offset=26
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#readCodeMemory
  i32.const 8
  i32.shl
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:wz
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
  local.get $0
  local.get $0
  i32.load16_u offset=26
  call $src/assembly/Z80Cpu/Z80Cpu#set:pc
 )
 (func $src/assembly/Z80Cpu/CallNz (; 123 ;) (param $0 i32)
  local.get $0
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#readCodeMemory
  call $src/assembly/Z80Cpu/Z80Cpu#set:wz
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
  local.get $0
  local.get $0
  i32.load16_u offset=26
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#readCodeMemory
  i32.const 8
  i32.shl
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:wz
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
  local.get $0
  i32.load16_u
  i32.const 64
  i32.and
  if
   return
  end
  local.get $0
  i32.load8_u offset=44
  i32.eqz
  if
   local.get $0
   local.get $0
   i32.load16_u offset=18
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
  i32.load16_u offset=20
  i32.const 1
  i32.sub
  call $src/assembly/Z80Cpu/Z80Cpu#set:sp
  local.get $0
  local.get $0
  i32.load16_u offset=20
  local.get $0
  i32.load16_u offset=18
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
  i32.load16_u offset=20
  i32.const 1
  i32.sub
  call $src/assembly/Z80Cpu/Z80Cpu#set:sp
  local.get $0
  local.get $0
  i32.load16_u offset=20
  local.get $0
  i32.load16_u offset=18
  call $src/assembly/Z80Cpu/Z80Cpu#writeMemory
  local.get $0
  local.get $0
  i64.load offset=32
  i64.const 3
  i64.add
  i64.store offset=32
  local.get $0
  local.get $0
  i32.load16_u offset=26
  call $src/assembly/Z80Cpu/Z80Cpu#set:pc
 )
 (func $src/assembly/Z80Cpu/PushBc (; 124 ;) (param $0 i32)
  (local $1 i32)
  local.get $0
  i32.load16_u offset=2
  local.set $1
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
  local.get $0
  i32.load16_u offset=20
  local.get $1
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
  i32.load16_u offset=20
  i32.const 1
  i32.sub
  call $src/assembly/Z80Cpu/Z80Cpu#set:sp
  local.get $0
  local.get $0
  i32.load16_u offset=20
  local.get $1
  call $src/assembly/Z80Cpu/Z80Cpu#writeMemory
  local.get $0
  local.get $0
  i64.load offset=32
  i64.const 3
  i64.add
  i64.store offset=32
 )
 (func "$~lib/array/Array<(cpu: src/assembly/Z80Cpu/Z80Cpu, value: u8, carry: bool) => void>#__unchecked_get" (; 125 ;) (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 2
  i32.shl
  i32.add
  i32.load
 )
 (func "$~lib/array/Array<(cpu: src/assembly/Z80Cpu/Z80Cpu, value: u8, carry: bool) => void>#__get" (; 126 ;) (param $0 i32) (result i32)
  local.get $0
  i32.const 1132
  i32.load
  i32.ge_u
  if
   i32.const 240
   i32.const 304
   i32.const 93
   i32.const 41
   call $~lib/builtins/abort
   unreachable
  end
  i32.const 1120
  local.get $0
  call "$~lib/array/Array<(cpu: src/assembly/Z80Cpu/Z80Cpu, value: u8, carry: bool) => void>#__unchecked_get"
  local.tee $0
  i32.eqz
  if
   i32.const 1216
   i32.const 304
   i32.const 97
   i32.const 39
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
 )
 (func $src/assembly/Z80Cpu/AluAN (; 127 ;) (param $0 i32)
  (local $1 i32)
  (local $2 i32)
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
  call $src/assembly/Z80Cpu/Z80Cpu#set:pc
  local.get $0
  i32.load8_u offset=73
  i32.const 56
  i32.and
  i32.const 3
  i32.shr_u
  call "$~lib/array/Array<(cpu: src/assembly/Z80Cpu/Z80Cpu, value: u8, carry: bool) => void>#__get"
  local.set $2
  i32.const 3
  global.set $~argumentsLength
  local.get $0
  local.get $1
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#get:cFlag
  local.get $2
  call_indirect (type $i32_i32_i32_=>_none)
 )
 (func $src/assembly/Z80Cpu/RstN (; 128 ;) (param $0 i32)
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
  local.get $0
  i32.load16_u offset=20
  local.get $0
  i32.load16_u offset=18
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
  i32.load16_u offset=20
  i32.const 1
  i32.sub
  call $src/assembly/Z80Cpu/Z80Cpu#set:sp
  local.get $0
  local.get $0
  i32.load16_u offset=20
  local.get $0
  i32.load16_u offset=18
  call $src/assembly/Z80Cpu/Z80Cpu#writeMemory
  local.get $0
  local.get $0
  i64.load offset=32
  i64.const 3
  i64.add
  i64.store offset=32
  local.get $0
  local.get $0
  i32.load8_u offset=73
  i32.const 56
  i32.and
  call $src/assembly/Z80Cpu/Z80Cpu#set:wz
  local.get $0
  local.get $0
  i32.load16_u offset=26
  call $src/assembly/Z80Cpu/Z80Cpu#set:pc
 )
 (func $src/assembly/Z80Cpu/RetZ (; 129 ;) (param $0 i32)
  local.get $0
  local.get $0
  i64.load offset=32
  i64.const 1
  i64.add
  i64.store offset=32
  local.get $0
  i32.load16_u
  i32.const 64
  i32.and
  i32.eqz
  if
   return
  end
  local.get $0
  local.get $0
  local.get $0
  i32.load16_u offset=20
  call $src/assembly/Z80Cpu/Z80Cpu#readMemory
  call $src/assembly/Z80Cpu/Z80Cpu#set:wz
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
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:sp
  local.get $0
  local.get $0
  i32.load16_u offset=26
  local.get $0
  local.get $0
  i32.load16_u offset=20
  call $src/assembly/Z80Cpu/Z80Cpu#readMemory
  i32.const 8
  i32.shl
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:wz
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
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:sp
  local.get $0
  local.get $0
  i32.load16_u offset=26
  call $src/assembly/Z80Cpu/Z80Cpu#set:pc
 )
 (func $src/assembly/Z80Cpu/Ret (; 130 ;) (param $0 i32)
  local.get $0
  local.get $0
  local.get $0
  i32.load16_u offset=20
  call $src/assembly/Z80Cpu/Z80Cpu#readMemory
  call $src/assembly/Z80Cpu/Z80Cpu#set:wz
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
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:sp
  local.get $0
  local.get $0
  i32.load16_u offset=26
  local.get $0
  local.get $0
  i32.load16_u offset=20
  call $src/assembly/Z80Cpu/Z80Cpu#readMemory
  i32.const 8
  i32.shl
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:wz
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
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:sp
  local.get $0
  local.get $0
  i32.load16_u offset=26
  call $src/assembly/Z80Cpu/Z80Cpu#set:pc
 )
 (func $src/assembly/Z80Cpu/JpZ (; 131 ;) (param $0 i32)
  local.get $0
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#readCodeMemory
  call $src/assembly/Z80Cpu/Z80Cpu#set:wz
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
  local.get $0
  local.get $0
  i32.load16_u offset=26
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#readCodeMemory
  i32.const 8
  i32.shl
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:wz
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
  local.get $0
  i32.load16_u
  i32.const 64
  i32.and
  i32.eqz
  if
   return
  end
  local.get $0
  local.get $0
  i32.load16_u offset=26
  call $src/assembly/Z80Cpu/Z80Cpu#set:pc
 )
 (func $src/assembly/Z80Cpu/CallZ (; 132 ;) (param $0 i32)
  local.get $0
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#readCodeMemory
  call $src/assembly/Z80Cpu/Z80Cpu#set:wz
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
  local.get $0
  local.get $0
  i32.load16_u offset=26
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#readCodeMemory
  i32.const 8
  i32.shl
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:wz
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
  local.get $0
  i32.load16_u
  i32.const 64
  i32.and
  i32.eqz
  if
   return
  end
  local.get $0
  i32.load8_u offset=44
  i32.eqz
  if
   local.get $0
   local.get $0
   i32.load16_u offset=18
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
  i32.load16_u offset=20
  i32.const 1
  i32.sub
  call $src/assembly/Z80Cpu/Z80Cpu#set:sp
  local.get $0
  local.get $0
  i32.load16_u offset=20
  local.get $0
  i32.load16_u offset=18
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
  i32.load16_u offset=20
  i32.const 1
  i32.sub
  call $src/assembly/Z80Cpu/Z80Cpu#set:sp
  local.get $0
  local.get $0
  i32.load16_u offset=20
  local.get $0
  i32.load16_u offset=18
  call $src/assembly/Z80Cpu/Z80Cpu#writeMemory
  local.get $0
  local.get $0
  i64.load offset=32
  i64.const 3
  i64.add
  i64.store offset=32
  local.get $0
  local.get $0
  i32.load16_u offset=26
  call $src/assembly/Z80Cpu/Z80Cpu#set:pc
 )
 (func $src/assembly/Z80Cpu/Call (; 133 ;) (param $0 i32)
  local.get $0
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#readCodeMemory
  call $src/assembly/Z80Cpu/Z80Cpu#set:wz
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
  local.get $0
  local.get $0
  i32.load16_u offset=26
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#readCodeMemory
  i32.const 8
  i32.shl
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:wz
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
  local.get $0
  i32.load8_u offset=44
  i32.eqz
  if
   local.get $0
   local.get $0
   i32.load16_u offset=18
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
  i32.load16_u offset=20
  i32.const 1
  i32.sub
  call $src/assembly/Z80Cpu/Z80Cpu#set:sp
  local.get $0
  local.get $0
  i32.load16_u offset=20
  local.get $0
  i32.load16_u offset=18
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
  i32.load16_u offset=20
  i32.const 1
  i32.sub
  call $src/assembly/Z80Cpu/Z80Cpu#set:sp
  local.get $0
  local.get $0
  i32.load16_u offset=20
  local.get $0
  i32.load16_u offset=18
  call $src/assembly/Z80Cpu/Z80Cpu#writeMemory
  local.get $0
  local.get $0
  i64.load offset=32
  i64.const 3
  i64.add
  i64.store offset=32
  local.get $0
  local.get $0
  i32.load16_u offset=26
  call $src/assembly/Z80Cpu/Z80Cpu#set:pc
 )
 (func $src/assembly/Z80Cpu/RetNc (; 134 ;) (param $0 i32)
  local.get $0
  local.get $0
  i64.load offset=32
  i64.const 1
  i64.add
  i64.store offset=32
  local.get $0
  i32.load16_u
  i32.const 1
  i32.and
  if
   return
  end
  local.get $0
  local.get $0
  local.get $0
  i32.load16_u offset=20
  call $src/assembly/Z80Cpu/Z80Cpu#readMemory
  call $src/assembly/Z80Cpu/Z80Cpu#set:wz
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
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:sp
  local.get $0
  local.get $0
  i32.load16_u offset=26
  local.get $0
  local.get $0
  i32.load16_u offset=20
  call $src/assembly/Z80Cpu/Z80Cpu#readMemory
  i32.const 8
  i32.shl
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:wz
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
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:sp
  local.get $0
  local.get $0
  i32.load16_u offset=26
  call $src/assembly/Z80Cpu/Z80Cpu#set:pc
 )
 (func $src/assembly/Z80Cpu/PopDe (; 135 ;) (param $0 i32)
  (local $1 i32)
  local.get $0
  local.get $0
  i32.load16_u offset=20
  call $src/assembly/Z80Cpu/Z80Cpu#readMemory
  local.set $1
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
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:sp
  local.get $0
  local.get $1
  local.get $0
  local.get $0
  i32.load16_u offset=20
  call $src/assembly/Z80Cpu/Z80Cpu#readMemory
  i32.const 8
  i32.shl
  i32.or
  call $src/assembly/Z80Cpu/Z80Cpu#set:de
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
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:sp
 )
 (func $src/assembly/Z80Cpu/JpNc (; 136 ;) (param $0 i32)
  local.get $0
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#readCodeMemory
  call $src/assembly/Z80Cpu/Z80Cpu#set:wz
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
  local.get $0
  local.get $0
  i32.load16_u offset=26
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#readCodeMemory
  i32.const 8
  i32.shl
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:wz
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
  local.get $0
  i32.load16_u
  i32.const 1
  i32.and
  if
   return
  end
  local.get $0
  local.get $0
  i32.load16_u offset=26
  call $src/assembly/Z80Cpu/Z80Cpu#set:pc
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#writePort (; 137 ;) (param $0 i32) (param $1 i32) (param $2 i32)
  i32.const 2
  global.set $~argumentsLength
  local.get $1
  local.get $2
  local.get $0
  i32.load offset=88
  call_indirect (type $i32_i32_=>_none)
 )
 (func $src/assembly/Z80Cpu/OutNA (; 138 ;) (param $0 i32)
  (local $1 i32)
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#readCodeMemory
  local.set $1
  local.get $0
  local.get $0
  i32.load16_u offset=18
  i32.const 1
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:pc
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
  local.get $0
  i32.load16_u
  i32.const 8
  i32.shr_u
  i32.const 8
  i32.shl
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:wz
  local.get $0
  local.get $1
  local.get $0
  i32.load16_u
  i32.const 8
  i32.shr_u
  i32.const 8
  i32.shl
  i32.add
  local.get $0
  i32.load16_u
  i32.const 8
  i32.shr_u
  call $src/assembly/Z80Cpu/Z80Cpu#writePort
 )
 (func $src/assembly/Z80Cpu/CallNc (; 139 ;) (param $0 i32)
  local.get $0
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#readCodeMemory
  call $src/assembly/Z80Cpu/Z80Cpu#set:wz
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
  local.get $0
  local.get $0
  i32.load16_u offset=26
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#readCodeMemory
  i32.const 8
  i32.shl
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:wz
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
  local.get $0
  i32.load16_u
  i32.const 1
  i32.and
  if
   return
  end
  local.get $0
  i32.load8_u offset=44
  i32.eqz
  if
   local.get $0
   local.get $0
   i32.load16_u offset=18
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
  i32.load16_u offset=20
  i32.const 1
  i32.sub
  call $src/assembly/Z80Cpu/Z80Cpu#set:sp
  local.get $0
  local.get $0
  i32.load16_u offset=20
  local.get $0
  i32.load16_u offset=18
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
  i32.load16_u offset=20
  i32.const 1
  i32.sub
  call $src/assembly/Z80Cpu/Z80Cpu#set:sp
  local.get $0
  local.get $0
  i32.load16_u offset=20
  local.get $0
  i32.load16_u offset=18
  call $src/assembly/Z80Cpu/Z80Cpu#writeMemory
  local.get $0
  local.get $0
  i64.load offset=32
  i64.const 3
  i64.add
  i64.store offset=32
  local.get $0
  local.get $0
  i32.load16_u offset=26
  call $src/assembly/Z80Cpu/Z80Cpu#set:pc
 )
 (func $src/assembly/Z80Cpu/PushDe (; 140 ;) (param $0 i32)
  (local $1 i32)
  local.get $0
  i32.load16_u offset=4
  local.set $1
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
  local.get $0
  i32.load16_u offset=20
  local.get $1
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
  i32.load16_u offset=20
  i32.const 1
  i32.sub
  call $src/assembly/Z80Cpu/Z80Cpu#set:sp
  local.get $0
  local.get $0
  i32.load16_u offset=20
  local.get $1
  call $src/assembly/Z80Cpu/Z80Cpu#writeMemory
  local.get $0
  local.get $0
  i64.load offset=32
  i64.const 3
  i64.add
  i64.store offset=32
 )
 (func $src/assembly/Z80Cpu/RetC (; 141 ;) (param $0 i32)
  local.get $0
  local.get $0
  i64.load offset=32
  i64.const 1
  i64.add
  i64.store offset=32
  local.get $0
  i32.load16_u
  i32.const 1
  i32.and
  i32.eqz
  if
   return
  end
  local.get $0
  local.get $0
  local.get $0
  i32.load16_u offset=20
  call $src/assembly/Z80Cpu/Z80Cpu#readMemory
  call $src/assembly/Z80Cpu/Z80Cpu#set:wz
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
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:sp
  local.get $0
  local.get $0
  i32.load16_u offset=26
  local.get $0
  local.get $0
  i32.load16_u offset=20
  call $src/assembly/Z80Cpu/Z80Cpu#readMemory
  i32.const 8
  i32.shl
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:wz
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
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:sp
  local.get $0
  local.get $0
  i32.load16_u offset=26
  call $src/assembly/Z80Cpu/Z80Cpu#set:pc
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_bc_ (; 142 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=10
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:_bc_ (; 143 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=10
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_de_ (; 144 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=12
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:_de_ (; 145 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=12
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:_hl_ (; 146 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=14
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:_hl_ (; 147 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=14
 )
 (func $src/assembly/Z80Cpu/Exx (; 148 ;) (param $0 i32)
  (local $1 i32)
  local.get $0
  i32.load16_u offset=2
  local.set $1
  local.get $0
  local.get $0
  i32.load16_u offset=10
  call $src/assembly/Z80Cpu/Z80Cpu#set:bc
  local.get $0
  local.get $1
  call $src/assembly/Z80Cpu/Z80Cpu#set:_bc_
  local.get $0
  i32.load16_u offset=4
  local.set $1
  local.get $0
  local.get $0
  i32.load16_u offset=12
  call $src/assembly/Z80Cpu/Z80Cpu#set:de
  local.get $0
  local.get $1
  call $src/assembly/Z80Cpu/Z80Cpu#set:_de_
  local.get $0
  i32.load16_u offset=6
  local.set $1
  local.get $0
  local.get $0
  i32.load16_u offset=14
  call $src/assembly/Z80Cpu/Z80Cpu#set:hl
  local.get $0
  local.get $1
  call $src/assembly/Z80Cpu/Z80Cpu#set:_hl_
 )
 (func $src/assembly/Z80Cpu/JpC (; 149 ;) (param $0 i32)
  local.get $0
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#readCodeMemory
  call $src/assembly/Z80Cpu/Z80Cpu#set:wz
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
  local.get $0
  local.get $0
  i32.load16_u offset=26
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#readCodeMemory
  i32.const 8
  i32.shl
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:wz
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
  local.get $0
  i32.load16_u
  i32.const 1
  i32.and
  i32.eqz
  if
   return
  end
  local.get $0
  local.get $0
  i32.load16_u offset=26
  call $src/assembly/Z80Cpu/Z80Cpu#set:pc
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#readPort (; 150 ;) (param $0 i32) (param $1 i32) (result i32)
  i32.const 1
  global.set $~argumentsLength
  local.get $1
  local.get $0
  i32.load offset=84
  call_indirect (type $i32_=>_i32)
  i32.const 255
  i32.and
 )
 (func $src/assembly/Z80Cpu/InAN (; 151 ;) (param $0 i32)
  (local $1 i32)
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#readCodeMemory
  local.set $1
  local.get $0
  local.get $0
  i32.load16_u offset=18
  i32.const 1
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:pc
  local.get $0
  local.get $0
  i64.load offset=32
  i64.const 3
  i64.add
  i64.store offset=32
  local.get $0
  local.get $1
  local.get $0
  i32.load16_u
  i32.const 8
  i32.shr_u
  i32.const 8
  i32.shl
  i32.add
  local.tee $1
  local.get $0
  i32.load16_u
  i32.const 8
  i32.shr_u
  i32.const 8
  i32.shl
  i32.add
  i32.const 1
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:wz
  local.get $0
  local.get $0
  local.get $1
  call $src/assembly/Z80Cpu/Z80Cpu#readPort
  call $src/assembly/Z80Cpu/Z80Cpu#set:a
 )
 (func $src/assembly/Z80Cpu/CallC (; 152 ;) (param $0 i32)
  local.get $0
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#readCodeMemory
  call $src/assembly/Z80Cpu/Z80Cpu#set:wz
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
  local.get $0
  local.get $0
  i32.load16_u offset=26
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#readCodeMemory
  i32.const 8
  i32.shl
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:wz
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
  local.get $0
  i32.load16_u
  i32.const 1
  i32.and
  i32.eqz
  if
   return
  end
  local.get $0
  i32.load8_u offset=44
  i32.eqz
  if
   local.get $0
   local.get $0
   i32.load16_u offset=18
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
  i32.load16_u offset=20
  i32.const 1
  i32.sub
  call $src/assembly/Z80Cpu/Z80Cpu#set:sp
  local.get $0
  local.get $0
  i32.load16_u offset=20
  local.get $0
  i32.load16_u offset=18
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
  i32.load16_u offset=20
  i32.const 1
  i32.sub
  call $src/assembly/Z80Cpu/Z80Cpu#set:sp
  local.get $0
  local.get $0
  i32.load16_u offset=20
  local.get $0
  i32.load16_u offset=18
  call $src/assembly/Z80Cpu/Z80Cpu#writeMemory
  local.get $0
  local.get $0
  i64.load offset=32
  i64.const 3
  i64.add
  i64.store offset=32
  local.get $0
  local.get $0
  i32.load16_u offset=26
  call $src/assembly/Z80Cpu/Z80Cpu#set:pc
 )
 (func $src/assembly/Z80Cpu/RetPo (; 153 ;) (param $0 i32)
  local.get $0
  local.get $0
  i64.load offset=32
  i64.const 1
  i64.add
  i64.store offset=32
  local.get $0
  i32.load16_u
  i32.const 4
  i32.and
  if
   return
  end
  local.get $0
  local.get $0
  local.get $0
  i32.load16_u offset=20
  call $src/assembly/Z80Cpu/Z80Cpu#readMemory
  call $src/assembly/Z80Cpu/Z80Cpu#set:wz
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
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:sp
  local.get $0
  local.get $0
  i32.load16_u offset=26
  local.get $0
  local.get $0
  i32.load16_u offset=20
  call $src/assembly/Z80Cpu/Z80Cpu#readMemory
  i32.const 8
  i32.shl
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:wz
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
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:sp
  local.get $0
  local.get $0
  i32.load16_u offset=26
  call $src/assembly/Z80Cpu/Z80Cpu#set:pc
 )
 (func $src/assembly/Z80Cpu/PopHl (; 154 ;) (param $0 i32)
  (local $1 i32)
  local.get $0
  local.get $0
  i32.load16_u offset=20
  call $src/assembly/Z80Cpu/Z80Cpu#readMemory
  local.set $1
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
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:sp
  local.get $0
  local.get $1
  local.get $0
  local.get $0
  i32.load16_u offset=20
  call $src/assembly/Z80Cpu/Z80Cpu#readMemory
  i32.const 8
  i32.shl
  i32.or
  call $src/assembly/Z80Cpu/Z80Cpu#set:hl
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
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:sp
 )
 (func $src/assembly/Z80Cpu/JpPo (; 155 ;) (param $0 i32)
  local.get $0
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#readCodeMemory
  call $src/assembly/Z80Cpu/Z80Cpu#set:wz
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
  local.get $0
  local.get $0
  i32.load16_u offset=26
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#readCodeMemory
  i32.const 8
  i32.shl
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:wz
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
  local.get $0
  i32.load16_u
  i32.const 4
  i32.and
  if
   return
  end
  local.get $0
  local.get $0
  i32.load16_u offset=26
  call $src/assembly/Z80Cpu/Z80Cpu#set:pc
 )
 (func $src/assembly/Z80Cpu/ExSpiHl (; 156 ;) (param $0 i32)
  (local $1 i32)
  local.get $0
  local.get $0
  local.get $0
  i32.load16_u offset=20
  local.tee $1
  call $src/assembly/Z80Cpu/Z80Cpu#readMemory
  call $src/assembly/Z80Cpu/Z80Cpu#set:wz
  local.get $0
  local.get $0
  i64.load offset=32
  i64.const 3
  i64.add
  i64.store offset=32
  local.get $0
  local.get $0
  i32.load16_u offset=26
  local.get $0
  local.get $1
  i32.const 1
  i32.add
  local.tee $1
  call $src/assembly/Z80Cpu/Z80Cpu#readMemory
  i32.const 8
  i32.shl
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:wz
  local.get $0
  i32.load8_u offset=44
  if
   local.get $0
   local.get $0
   i64.load offset=32
   i64.const 4
   i64.add
   i64.store offset=32
  else
   local.get $0
   local.get $0
   i64.load offset=32
   i64.const 3
   i64.add
   i64.store offset=32
   local.get $0
   local.get $1
   call $src/assembly/Z80Cpu/Z80Cpu#readMemory
   drop
   local.get $0
   local.get $0
   i64.load offset=32
   i64.const 1
   i64.add
   i64.store offset=32
  end
  local.get $0
  local.get $1
  local.get $0
  i32.load16_u offset=6
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
  local.get $1
  i32.const 1
  i32.sub
  local.tee $1
  local.get $0
  i32.load16_u offset=6
  i32.const 255
  i32.and
  call $src/assembly/Z80Cpu/Z80Cpu#writeMemory
  local.get $0
  i32.load8_u offset=44
  if
   local.get $0
   local.get $0
   i64.load offset=32
   i64.const 5
   i64.add
   i64.store offset=32
  else
   local.get $0
   local.get $0
   i64.load offset=32
   i64.const 3
   i64.add
   i64.store offset=32
   local.get $0
   local.get $1
   local.get $0
   i32.load16_u offset=6
   i32.const 255
   i32.and
   call $src/assembly/Z80Cpu/Z80Cpu#writeMemory
   local.get $0
   local.get $0
   i64.load offset=32
   i64.const 1
   i64.add
   i64.store offset=32
   local.get $0
   local.get $1
   local.get $0
   i32.load16_u offset=6
   i32.const 255
   i32.and
   call $src/assembly/Z80Cpu/Z80Cpu#writeMemory
   local.get $0
   local.get $0
   i64.load offset=32
   i64.const 1
   i64.add
   i64.store offset=32
  end
  local.get $0
  local.get $0
  i32.load16_u offset=26
  call $src/assembly/Z80Cpu/Z80Cpu#set:hl
 )
 (func $src/assembly/Z80Cpu/CallPo (; 157 ;) (param $0 i32)
  local.get $0
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#readCodeMemory
  call $src/assembly/Z80Cpu/Z80Cpu#set:wz
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
  local.get $0
  local.get $0
  i32.load16_u offset=26
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#readCodeMemory
  i32.const 8
  i32.shl
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:wz
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
  local.get $0
  i32.load16_u
  i32.const 4
  i32.and
  if
   return
  end
  local.get $0
  i32.load8_u offset=44
  i32.eqz
  if
   local.get $0
   local.get $0
   i32.load16_u offset=18
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
  i32.load16_u offset=20
  i32.const 1
  i32.sub
  call $src/assembly/Z80Cpu/Z80Cpu#set:sp
  local.get $0
  local.get $0
  i32.load16_u offset=20
  local.get $0
  i32.load16_u offset=18
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
  i32.load16_u offset=20
  i32.const 1
  i32.sub
  call $src/assembly/Z80Cpu/Z80Cpu#set:sp
  local.get $0
  local.get $0
  i32.load16_u offset=20
  local.get $0
  i32.load16_u offset=18
  call $src/assembly/Z80Cpu/Z80Cpu#writeMemory
  local.get $0
  local.get $0
  i64.load offset=32
  i64.const 3
  i64.add
  i64.store offset=32
  local.get $0
  local.get $0
  i32.load16_u offset=26
  call $src/assembly/Z80Cpu/Z80Cpu#set:pc
 )
 (func $src/assembly/Z80Cpu/PushHl (; 158 ;) (param $0 i32)
  (local $1 i32)
  local.get $0
  i32.load16_u offset=6
  local.set $1
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
  local.get $0
  i32.load16_u offset=20
  local.get $1
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
  i32.load16_u offset=20
  i32.const 1
  i32.sub
  call $src/assembly/Z80Cpu/Z80Cpu#set:sp
  local.get $0
  local.get $0
  i32.load16_u offset=20
  local.get $1
  call $src/assembly/Z80Cpu/Z80Cpu#writeMemory
  local.get $0
  local.get $0
  i64.load offset=32
  i64.const 3
  i64.add
  i64.store offset=32
 )
 (func $src/assembly/Z80Cpu/RetPe (; 159 ;) (param $0 i32)
  local.get $0
  local.get $0
  i64.load offset=32
  i64.const 1
  i64.add
  i64.store offset=32
  local.get $0
  i32.load16_u
  i32.const 4
  i32.and
  i32.eqz
  if
   return
  end
  local.get $0
  local.get $0
  local.get $0
  i32.load16_u offset=20
  call $src/assembly/Z80Cpu/Z80Cpu#readMemory
  call $src/assembly/Z80Cpu/Z80Cpu#set:wz
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
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:sp
  local.get $0
  local.get $0
  i32.load16_u offset=26
  local.get $0
  local.get $0
  i32.load16_u offset=20
  call $src/assembly/Z80Cpu/Z80Cpu#readMemory
  i32.const 8
  i32.shl
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:wz
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
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:sp
  local.get $0
  local.get $0
  i32.load16_u offset=26
  call $src/assembly/Z80Cpu/Z80Cpu#set:pc
 )
 (func $src/assembly/Z80Cpu/JpHli (; 160 ;) (param $0 i32)
  local.get $0
  local.get $0
  i32.load16_u offset=6
  call $src/assembly/Z80Cpu/Z80Cpu#set:pc
 )
 (func $src/assembly/Z80Cpu/JpPe (; 161 ;) (param $0 i32)
  local.get $0
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#readCodeMemory
  call $src/assembly/Z80Cpu/Z80Cpu#set:wz
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
  local.get $0
  local.get $0
  i32.load16_u offset=26
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#readCodeMemory
  i32.const 8
  i32.shl
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:wz
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
  local.get $0
  i32.load16_u
  i32.const 4
  i32.and
  i32.eqz
  if
   return
  end
  local.get $0
  local.get $0
  i32.load16_u offset=26
  call $src/assembly/Z80Cpu/Z80Cpu#set:pc
 )
 (func $src/assembly/Z80Cpu/ExDeHl (; 162 ;) (param $0 i32)
  (local $1 i32)
  local.get $0
  i32.load16_u offset=4
  local.set $1
  local.get $0
  local.get $0
  i32.load16_u offset=6
  call $src/assembly/Z80Cpu/Z80Cpu#set:de
  local.get $0
  local.get $1
  call $src/assembly/Z80Cpu/Z80Cpu#set:hl
 )
 (func $src/assembly/Z80Cpu/CallPe (; 163 ;) (param $0 i32)
  local.get $0
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#readCodeMemory
  call $src/assembly/Z80Cpu/Z80Cpu#set:wz
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
  local.get $0
  local.get $0
  i32.load16_u offset=26
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#readCodeMemory
  i32.const 8
  i32.shl
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:wz
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
  local.get $0
  i32.load16_u
  i32.const 4
  i32.and
  i32.eqz
  if
   return
  end
  local.get $0
  i32.load8_u offset=44
  i32.eqz
  if
   local.get $0
   local.get $0
   i32.load16_u offset=18
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
  i32.load16_u offset=20
  i32.const 1
  i32.sub
  call $src/assembly/Z80Cpu/Z80Cpu#set:sp
  local.get $0
  local.get $0
  i32.load16_u offset=20
  local.get $0
  i32.load16_u offset=18
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
  i32.load16_u offset=20
  i32.const 1
  i32.sub
  call $src/assembly/Z80Cpu/Z80Cpu#set:sp
  local.get $0
  local.get $0
  i32.load16_u offset=20
  local.get $0
  i32.load16_u offset=18
  call $src/assembly/Z80Cpu/Z80Cpu#writeMemory
  local.get $0
  local.get $0
  i64.load offset=32
  i64.const 3
  i64.add
  i64.store offset=32
  local.get $0
  local.get $0
  i32.load16_u offset=26
  call $src/assembly/Z80Cpu/Z80Cpu#set:pc
 )
 (func $src/assembly/Z80Cpu/RetP (; 164 ;) (param $0 i32)
  local.get $0
  local.get $0
  i64.load offset=32
  i64.const 1
  i64.add
  i64.store offset=32
  local.get $0
  i32.load16_u
  i32.const 128
  i32.and
  if
   return
  end
  local.get $0
  local.get $0
  local.get $0
  i32.load16_u offset=20
  call $src/assembly/Z80Cpu/Z80Cpu#readMemory
  call $src/assembly/Z80Cpu/Z80Cpu#set:wz
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
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:sp
  local.get $0
  local.get $0
  i32.load16_u offset=26
  local.get $0
  local.get $0
  i32.load16_u offset=20
  call $src/assembly/Z80Cpu/Z80Cpu#readMemory
  i32.const 8
  i32.shl
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:wz
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
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:sp
  local.get $0
  local.get $0
  i32.load16_u offset=26
  call $src/assembly/Z80Cpu/Z80Cpu#set:pc
 )
 (func $src/assembly/Z80Cpu/PopAf (; 165 ;) (param $0 i32)
  (local $1 i32)
  local.get $0
  local.get $0
  i32.load16_u offset=20
  call $src/assembly/Z80Cpu/Z80Cpu#readMemory
  local.set $1
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
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:sp
  local.get $0
  local.get $1
  local.get $0
  local.get $0
  i32.load16_u offset=20
  call $src/assembly/Z80Cpu/Z80Cpu#readMemory
  i32.const 8
  i32.shl
  i32.or
  call $src/assembly/Z80Cpu/Z80Cpu#set:af
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
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:sp
 )
 (func $src/assembly/Z80Cpu/JpP (; 166 ;) (param $0 i32)
  local.get $0
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#readCodeMemory
  call $src/assembly/Z80Cpu/Z80Cpu#set:wz
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
  local.get $0
  local.get $0
  i32.load16_u offset=26
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#readCodeMemory
  i32.const 8
  i32.shl
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:wz
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
  local.get $0
  i32.load16_u
  i32.const 128
  i32.and
  if
   return
  end
  local.get $0
  local.get $0
  i32.load16_u offset=26
  call $src/assembly/Z80Cpu/Z80Cpu#set:pc
 )
 (func $src/assembly/Z80Cpu/Di (; 167 ;) (param $0 i32)
  local.get $0
  i32.const 0
  i32.store8 offset=45
  local.get $0
  i32.const 0
  i32.store8 offset=46
 )
 (func $src/assembly/Z80Cpu/CallP (; 168 ;) (param $0 i32)
  local.get $0
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#readCodeMemory
  call $src/assembly/Z80Cpu/Z80Cpu#set:wz
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
  local.get $0
  local.get $0
  i32.load16_u offset=26
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#readCodeMemory
  i32.const 8
  i32.shl
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:wz
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
  local.get $0
  i32.load16_u
  i32.const 128
  i32.and
  if
   return
  end
  local.get $0
  i32.load8_u offset=44
  i32.eqz
  if
   local.get $0
   local.get $0
   i32.load16_u offset=18
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
  i32.load16_u offset=20
  i32.const 1
  i32.sub
  call $src/assembly/Z80Cpu/Z80Cpu#set:sp
  local.get $0
  local.get $0
  i32.load16_u offset=20
  local.get $0
  i32.load16_u offset=18
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
  i32.load16_u offset=20
  i32.const 1
  i32.sub
  call $src/assembly/Z80Cpu/Z80Cpu#set:sp
  local.get $0
  local.get $0
  i32.load16_u offset=20
  local.get $0
  i32.load16_u offset=18
  call $src/assembly/Z80Cpu/Z80Cpu#writeMemory
  local.get $0
  local.get $0
  i64.load offset=32
  i64.const 3
  i64.add
  i64.store offset=32
  local.get $0
  local.get $0
  i32.load16_u offset=26
  call $src/assembly/Z80Cpu/Z80Cpu#set:pc
 )
 (func $src/assembly/Z80Cpu/PushAf (; 169 ;) (param $0 i32)
  (local $1 i32)
  local.get $0
  i32.load16_u
  local.set $1
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
  local.get $0
  i32.load16_u offset=20
  local.get $1
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
  i32.load16_u offset=20
  i32.const 1
  i32.sub
  call $src/assembly/Z80Cpu/Z80Cpu#set:sp
  local.get $0
  local.get $0
  i32.load16_u offset=20
  local.get $1
  call $src/assembly/Z80Cpu/Z80Cpu#writeMemory
  local.get $0
  local.get $0
  i64.load offset=32
  i64.const 3
  i64.add
  i64.store offset=32
 )
 (func $src/assembly/Z80Cpu/RetM (; 170 ;) (param $0 i32)
  local.get $0
  local.get $0
  i64.load offset=32
  i64.const 1
  i64.add
  i64.store offset=32
  local.get $0
  i32.load16_u
  i32.const 128
  i32.and
  i32.eqz
  if
   return
  end
  local.get $0
  local.get $0
  local.get $0
  i32.load16_u offset=20
  call $src/assembly/Z80Cpu/Z80Cpu#readMemory
  call $src/assembly/Z80Cpu/Z80Cpu#set:wz
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
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:sp
  local.get $0
  local.get $0
  i32.load16_u offset=26
  local.get $0
  local.get $0
  i32.load16_u offset=20
  call $src/assembly/Z80Cpu/Z80Cpu#readMemory
  i32.const 8
  i32.shl
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:wz
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
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:sp
  local.get $0
  local.get $0
  i32.load16_u offset=26
  call $src/assembly/Z80Cpu/Z80Cpu#set:pc
 )
 (func $src/assembly/Z80Cpu/LdSpHl (; 171 ;) (param $0 i32)
  local.get $0
  local.get $0
  i32.load16_u offset=6
  call $src/assembly/Z80Cpu/Z80Cpu#set:sp
  local.get $0
  local.get $0
  i64.load offset=32
  i64.const 2
  i64.add
  i64.store offset=32
 )
 (func $src/assembly/Z80Cpu/JpM (; 172 ;) (param $0 i32)
  local.get $0
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#readCodeMemory
  call $src/assembly/Z80Cpu/Z80Cpu#set:wz
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
  local.get $0
  local.get $0
  i32.load16_u offset=26
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#readCodeMemory
  i32.const 8
  i32.shl
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:wz
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
  local.get $0
  i32.load16_u
  i32.const 128
  i32.and
  i32.eqz
  if
   return
  end
  local.get $0
  local.get $0
  i32.load16_u offset=26
  call $src/assembly/Z80Cpu/Z80Cpu#set:pc
 )
 (func $src/assembly/Z80Cpu/Ei (; 173 ;) (param $0 i32)
  local.get $0
  i32.const 1
  i32.store8 offset=48
  local.get $0
  i32.const 1
  i32.store8 offset=45
  local.get $0
  i32.const 1
  i32.store8 offset=46
 )
 (func $src/assembly/Z80Cpu/CallM (; 174 ;) (param $0 i32)
  local.get $0
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#readCodeMemory
  call $src/assembly/Z80Cpu/Z80Cpu#set:wz
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
  local.get $0
  local.get $0
  i32.load16_u offset=26
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#readCodeMemory
  i32.const 8
  i32.shl
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:wz
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
  local.get $0
  i32.load16_u
  i32.const 128
  i32.and
  i32.eqz
  if
   return
  end
  local.get $0
  i32.load8_u offset=44
  i32.eqz
  if
   local.get $0
   local.get $0
   i32.load16_u offset=18
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
  i32.load16_u offset=20
  i32.const 1
  i32.sub
  call $src/assembly/Z80Cpu/Z80Cpu#set:sp
  local.get $0
  local.get $0
  i32.load16_u offset=20
  local.get $0
  i32.load16_u offset=18
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
  i32.load16_u offset=20
  i32.const 1
  i32.sub
  call $src/assembly/Z80Cpu/Z80Cpu#set:sp
  local.get $0
  local.get $0
  i32.load16_u offset=20
  local.get $0
  i32.load16_u offset=18
  call $src/assembly/Z80Cpu/Z80Cpu#writeMemory
  local.get $0
  local.get $0
  i64.load offset=32
  i64.const 3
  i64.add
  i64.store offset=32
  local.get $0
  local.get $0
  i32.load16_u offset=26
  call $src/assembly/Z80Cpu/Z80Cpu#set:pc
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:iy (; 175 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=24
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:ix (; 176 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=22
 )
 (func $src/assembly/Z80Cpu/AddIxQQ (; 177 ;) (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  local.get $0
  i32.load8_u offset=73
  i32.const 48
  i32.and
  i32.const 4
  i32.shr_u
  local.set $2
  local.get $0
  i32.load offset=68
  i32.const 2
  i32.eq
  if (result i32)
   local.get $0
   i32.load16_u offset=24
  else
   local.get $0
   i32.load16_u offset=22
  end
  i32.const 65535
  i32.and
  local.set $1
  local.get $2
  i32.const 2
  i32.eq
  if (result i32)
   local.get $1
  else
   local.get $0
   local.get $2
   call $src/assembly/Z80Cpu/Z80Cpu#getReg16
  end
  local.set $2
  local.get $0
  local.get $1
  i32.const 1
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:wz
  local.get $0
  local.get $1
  local.get $2
  call $src/assembly/Z80Cpu/Z80Cpu#aluAddHL
  local.set $1
  local.get $0
  i32.load offset=68
  i32.const 2
  i32.eq
  if
   local.get $0
   local.get $1
   call $src/assembly/Z80Cpu/Z80Cpu#set:iy
  else
   local.get $0
   local.get $1
   call $src/assembly/Z80Cpu/Z80Cpu#set:ix
  end
  local.get $0
  local.get $0
  i64.load offset=32
  i64.const 7
  i64.add
  i64.store offset=32
 )
 (func $src/assembly/Z80Cpu/LdBcNNIdx (; 178 ;) (param $0 i32) (param $1 i32)
  nop
 )
 (func $start:src/assembly/Z80Cpu (; 179 ;)
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
          call $~lib/array/Array<u16>#__set
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
        local.get $5
        i32.const 24
        i32.shl
        i32.const 24
        i32.shr_s
        local.get $1
        i32.const 24
        i32.shl
        i32.const 24
        i32.shr_s
        i32.add
        i32.const 16
        i32.shl
        i32.const 16
        i32.shr_s
        local.get $0
        i32.add
        local.tee $3
        i32.const 16
        i32.shl
        i32.const 16
        i32.shr_s
        i32.const 128
        i32.ge_s
        if (result i32)
         i32.const 1
        else
         local.get $3
         i32.const 16
         i32.shl
         i32.const 16
         i32.shr_s
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
        i32.const 24
        i32.shl
        i32.const 24
        i32.shr_s
        local.get $1
        i32.const 24
        i32.shl
        i32.const 24
        i32.shr_s
        i32.sub
        i32.const 16
        i32.shl
        i32.const 16
        i32.shr_s
        local.get $0
        i32.sub
        local.tee $2
        i32.const 16
        i32.shl
        i32.const 16
        i32.shr_s
        i32.const 128
        i32.ge_s
        if (result i32)
         i32.const 1
        else
         local.get $2
         i32.const 16
         i32.shl
         i32.const 16
         i32.shr_s
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
 (func $~lib/arraybuffer/ArrayBufferView#constructor (; 180 ;) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  local.get $1
  i32.const 1073741808
  local.get $2
  i32.shr_u
  i32.gt_u
  if
   i32.const 352
   i32.const 6688
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
 (func $~lib/typedarray/Uint8Array#constructor (; 181 ;) (param $0 i32) (result i32)
  i32.const 12
  i32.const 12
  call $~lib/rt/tlsf/__alloc
  call $~lib/rt/pure/__retain
  local.get $0
  i32.const 0
  call $~lib/arraybuffer/ArrayBufferView#constructor
 )
 (func $~lib/typedarray/Uint32Array#constructor (; 182 ;) (param $0 i32) (result i32)
  i32.const 12
  i32.const 8
  call $~lib/rt/tlsf/__alloc
  call $~lib/rt/pure/__retain
  local.get $0
  i32.const 2
  call $~lib/arraybuffer/ArrayBufferView#constructor
 )
 (func $src/assembly/MemoryStatusArray/MemoryStatusArray#clearAll (; 183 ;) (param $0 i32)
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
 (func $src/assembly/MemoryStatusArray/MemoryStatusArray#constructor (; 184 ;) (result i32)
  (local $0 i32)
  i32.const 4
  i32.const 7
  call $~lib/rt/tlsf/__alloc
  call $~lib/rt/pure/__retain
  local.tee $0
  i32.const 2048
  call $~lib/typedarray/Uint32Array#constructor
  i32.store
  local.get $0
  call $src/assembly/MemoryStatusArray/MemoryStatusArray#clearAll
  local.get $0
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#turnOn (; 185 ;) (param $0 i32)
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
  i32.const 65535
  i32.store16 offset=22
  local.get $0
  i32.const 65535
  i32.store16 offset=24
  local.get $0
  i32.const 65535
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
  i32.load offset=52
  call $src/assembly/MemoryStatusArray/MemoryStatusArray#clearAll
  local.get $0
  i32.load offset=56
  call $src/assembly/MemoryStatusArray/MemoryStatusArray#clearAll
  local.get $0
  i32.load offset=60
  call $src/assembly/MemoryStatusArray/MemoryStatusArray#clearAll
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
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#constructor~anonymous|0 (; 186 ;) (param $0 i32) (result i32)
  i32.const 255
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#constructor (; 187 ;) (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  i32.eqz
  if
   i32.const 92
   i32.const 6
   call $~lib/rt/tlsf/__alloc
   call $~lib/rt/pure/__retain
   local.set $0
  end
  local.get $0
  i32.const 0
  i32.store16
  local.get $0
  i32.const 0
  i32.store16 offset=2
  local.get $0
  i32.const 0
  i32.store16 offset=4
  local.get $0
  i32.const 0
  i32.store16 offset=6
  local.get $0
  i32.const 0
  i32.store16 offset=8
  local.get $0
  i32.const 0
  i32.store16 offset=10
  local.get $0
  i32.const 0
  i32.store16 offset=12
  local.get $0
  i32.const 0
  i32.store16 offset=14
  local.get $0
  i32.const 0
  i32.store8 offset=16
  local.get $0
  i32.const 0
  i32.store8 offset=17
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
  i32.store16 offset=24
  local.get $0
  i32.const 0
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
  i32.const 0
  i32.store8 offset=73
  local.get $0
  local.get $1
  i32.store8 offset=74
  local.get $0
  i32.const 0
  i32.store offset=76
  local.get $0
  i32.const 0
  i32.store offset=80
  local.get $0
  i32.const 0
  i32.store offset=84
  local.get $0
  i32.const 0
  i32.store offset=88
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#turnOn
  local.get $0
  i32.const 110
  i32.store offset=76
  local.get $0
  i32.const 111
  i32.store offset=80
  local.get $0
  i32.const 112
  i32.store offset=84
  local.get $0
  i32.const 113
  i32.store offset=88
  local.get $0
 )
 (func $~lib/typedarray/Uint8Array#__set (; 188 ;) (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $1
  local.get $0
  i32.load offset=8
  i32.ge_u
  if
   i32.const 240
   i32.const 1152
   i32.const 163
   i32.const 44
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  local.get $0
  i32.load offset=4
  i32.add
  local.get $2
  i32.store8
 )
 (func $~lib/rt/__allocArray (; 189 ;) (param $0 i32) (param $1 i32) (result i32)
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
 (func $src/assembly/test-machine/test-devices/clearMemoryAccessLog (; 190 ;)
  (local $0 i32)
  i32.const 14
  i32.const 6848
  call $~lib/rt/__allocArray
  call $~lib/rt/pure/__retain
  global.get $src/assembly/test-machine/test-devices/memoryAccessLog
  call $~lib/rt/pure/__release
  global.set $src/assembly/test-machine/test-devices/memoryAccessLog
 )
 (func $src/assembly/test-machine/test-devices/resetMemory (; 191 ;)
  (local $0 i32)
  loop $for-loop|0
   local.get $0
   i32.const 65536
   i32.lt_s
   if
    global.get $src/assembly/test-machine/test-devices/simpleMemory
    local.get $0
    i32.const 255
    call $~lib/typedarray/Uint8Array#__set
    local.get $0
    i32.const 1
    i32.add
    local.set $0
    br $for-loop|0
   end
  end
  call $src/assembly/test-machine/test-devices/clearMemoryAccessLog
 )
 (func $src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine#reset (; 192 ;) (param $0 i32)
  local.get $0
  i32.const 0
  i32.store16 offset=4
  local.get $0
  i32.const 4
  i32.store offset=8
  local.get $0
  i32.load
  call $src/assembly/Z80Cpu/Z80Cpu#turnOn
  call $src/assembly/test-machine/test-devices/resetMemory
 )
 (func $~lib/typedarray/Uint8Array#__get (; 193 ;) (param $0 i32) (param $1 i32) (result i32)
  local.get $1
  local.get $0
  i32.load offset=8
  i32.ge_u
  if
   i32.const 240
   i32.const 1152
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
 (func $~lib/array/Array<src/assembly/test-machine/test-devices/MemoryOp>#push (; 194 ;) (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  local.get $0
  local.get $0
  i32.load offset=12
  local.tee $2
  i32.const 1
  i32.add
  local.tee $3
  i32.const 2
  call $~lib/array/ensureSize
  local.get $0
  i32.load offset=4
  local.get $2
  i32.const 2
  i32.shl
  i32.add
  local.get $1
  call $~lib/rt/pure/__retain
  i32.store
  local.get $0
  local.get $3
  i32.store offset=12
 )
 (func $src/assembly/test-machine/test-devices/readSimpleMemory (; 195 ;) (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  global.get $src/assembly/test-machine/test-devices/simpleMemory
  local.get $0
  i32.const 65535
  i32.and
  call $~lib/typedarray/Uint8Array#__get
  local.set $2
  global.get $src/assembly/test-machine/test-devices/memoryAccessLog
  i32.const 4
  i32.const 13
  call $~lib/rt/tlsf/__alloc
  call $~lib/rt/pure/__retain
  local.tee $1
  local.get $0
  i32.store16
  local.get $1
  local.get $2
  i32.store8 offset=2
  local.get $1
  i32.const 0
  i32.store8 offset=3
  local.get $1
  call $~lib/array/Array<src/assembly/test-machine/test-devices/MemoryOp>#push
  local.get $1
  call $~lib/rt/pure/__release
  local.get $2
 )
 (func $src/assembly/test-machine/test-devices/writeSimpleMemory (; 196 ;) (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  global.get $src/assembly/test-machine/test-devices/simpleMemory
  local.get $0
  i32.const 65535
  i32.and
  local.get $1
  i32.const 255
  i32.and
  call $~lib/typedarray/Uint8Array#__set
  global.get $src/assembly/test-machine/test-devices/memoryAccessLog
  i32.const 4
  i32.const 13
  call $~lib/rt/tlsf/__alloc
  call $~lib/rt/pure/__retain
  local.tee $2
  local.get $0
  i32.store16
  local.get $2
  local.get $1
  i32.store8 offset=2
  local.get $2
  i32.const 1
  i32.store8 offset=3
  local.get $2
  call $~lib/array/Array<src/assembly/test-machine/test-devices/MemoryOp>#push
  local.get $2
  call $~lib/rt/pure/__release
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#delay (; 197 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $0
  i64.load offset=32
  local.get $1
  i64.extend_i32_s
  i64.add
  i64.store offset=32
 )
 (func $src/assembly/test-machine/test-devices/writeSimpleIo (; 198 ;) (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  global.get $src/assembly/test-machine/test-devices/ioAccessLog
  i32.const 4
  i32.const 15
  call $~lib/rt/tlsf/__alloc
  call $~lib/rt/pure/__retain
  local.tee $2
  local.get $0
  i32.store16
  local.get $2
  local.get $1
  i32.store8 offset=2
  local.get $2
  i32.const 1
  i32.store8 offset=3
  local.get $2
  call $~lib/array/Array<src/assembly/test-machine/test-devices/MemoryOp>#push
  global.get $src/assembly/test-machine/test-devices/cpu
  i32.const 4
  call $src/assembly/Z80Cpu/Z80Cpu#delay
  local.get $2
  call $~lib/rt/pure/__release
 )
 (func $src/assembly/test-machine/test-devices/readSimpleIo (; 199 ;) (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  global.get $src/assembly/test-machine/test-devices/inputIndex
  i32.const 0
  i32.lt_s
  if (result i32)
   i32.const 1
  else
   global.get $src/assembly/test-machine/test-devices/inputIndex
   global.get $src/assembly/test-machine/test-devices/fakeInput
   i32.load offset=8
   i32.ge_s
  end
  if (result i32)
   i32.const 255
  else
   global.get $src/assembly/test-machine/test-devices/inputIndex
   local.tee $1
   i32.const 1
   i32.add
   global.set $src/assembly/test-machine/test-devices/inputIndex
   global.get $src/assembly/test-machine/test-devices/fakeInput
   local.get $1
   call $~lib/typedarray/Uint8Array#__get
  end
  local.set $2
  global.get $src/assembly/test-machine/test-devices/cpu
  i32.const 4
  call $src/assembly/Z80Cpu/Z80Cpu#delay
  global.get $src/assembly/test-machine/test-devices/ioAccessLog
  i32.const 4
  i32.const 15
  call $~lib/rt/tlsf/__alloc
  call $~lib/rt/pure/__retain
  local.tee $1
  local.get $0
  i32.store16
  local.get $1
  local.get $2
  i32.store8 offset=2
  local.get $1
  i32.const 0
  i32.store8 offset=3
  local.get $1
  call $~lib/array/Array<src/assembly/test-machine/test-devices/MemoryOp>#push
  local.get $1
  call $~lib/rt/pure/__release
  local.get $2
 )
 (func $src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine#constructor (; 200 ;) (result i32)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  i32.const 12
  i32.const 17
  call $~lib/rt/tlsf/__alloc
  call $~lib/rt/pure/__retain
  local.tee $0
  i32.const 0
  i32.store
  local.get $0
  i32.const 0
  i32.store16 offset=4
  local.get $0
  i32.const 0
  i32.store offset=8
  i32.const 0
  i32.const 0
  call $src/assembly/Z80Cpu/Z80Cpu#constructor
  local.set $1
  local.get $0
  i32.load
  call $~lib/rt/pure/__release
  local.get $0
  local.get $1
  i32.store
  local.get $0
  call $src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine#reset
  local.get $0
  i32.load
  i32.const 114
  i32.store offset=76
  local.get $0
  i32.load
  i32.const 115
  i32.store offset=80
  local.get $0
  i32.load
  i32.const 116
  i32.store offset=88
  local.get $0
  i32.load
  i32.const 117
  i32.store offset=84
  local.get $0
  i32.load
  local.tee $1
  global.get $src/assembly/test-machine/test-devices/cpu
  local.tee $2
  i32.ne
  if
   local.get $1
   call $~lib/rt/pure/__retain
   local.set $1
   local.get $2
   call $~lib/rt/pure/__release
  end
  local.get $1
  global.set $src/assembly/test-machine/test-devices/cpu
  local.get $0
 )
 (func $src/assembly/index/initTestMachine (; 201 ;)
  global.get $src/assembly/test-machine/WaTestZ80Machine/waTestZ80Machine
  call $src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine#reset
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#constructor (; 202 ;) (param $0 i32) (result i32)
  local.get $0
  i32.eqz
  if
   i32.const 58
   i32.const 18
   call $~lib/rt/tlsf/__alloc
   call $~lib/rt/pure/__retain
   local.set $0
  end
  local.get $0
  i32.const 0
  i32.store16
  local.get $0
  i32.const 0
  i32.store16 offset=2
  local.get $0
  i32.const 0
  i32.store16 offset=4
  local.get $0
  i32.const 0
  i32.store16 offset=6
  local.get $0
  i32.const 0
  i32.store16 offset=8
  local.get $0
  i32.const 0
  i32.store16 offset=10
  local.get $0
  i32.const 0
  i32.store16 offset=12
  local.get $0
  i32.const 0
  i32.store16 offset=14
  local.get $0
  i32.const 0
  i32.store8 offset=16
  local.get $0
  i32.const 0
  i32.store8 offset=17
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
  i32.store16 offset=24
  local.get $0
  i32.const 0
  i32.store16 offset=26
  local.get $0
  i32.const 0
  i32.store offset=28
  local.get $0
  i32.const 0
  i32.store offset=32
  local.get $0
  i32.const 0
  i32.store offset=36
  local.get $0
  i32.const 0
  i32.store8 offset=40
  local.get $0
  i32.const 0
  i32.store8 offset=41
  local.get $0
  i32.const 0
  i32.store8 offset=42
  local.get $0
  i32.const 0
  i32.store8 offset=43
  local.get $0
  i32.const 0
  i32.store8 offset=44
  local.get $0
  i32.const 0
  i32.store8 offset=45
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
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:i (; 203 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=16
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:xh (; 204 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $0
  i32.load16_u offset=22
  i32.const 255
  i32.and
  local.get $1
  i32.const 255
  i32.and
  i32.const 8
  i32.shl
  i32.or
  i32.store16 offset=22
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:xl (; 205 ;) (param $0 i32) (param $1 i32)
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
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:yh (; 206 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $0
  i32.load16_u offset=24
  i32.const 255
  i32.and
  local.get $1
  i32.const 255
  i32.and
  i32.const 8
  i32.shl
  i32.or
  i32.store16 offset=24
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:yl (; 207 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $0
  i32.load16_u offset=24
  i32.const 65280
  i32.and
  local.get $1
  i32.const 255
  i32.and
  i32.or
  i32.store16 offset=24
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:r (; 208 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=17
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:wl (; 209 ;) (param $0 i32) (param $1 i32)
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
 (func $src/assembly/Z80Cpu/Z80Cpu#getCpuState (; 210 ;) (param $0 i32) (result i32)
  (local $1 i32)
  i32.const 0
  call $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#constructor
  local.tee $1
  local.get $0
  i32.load16_u
  i32.const 8
  i32.shr_u
  call $src/assembly/Z80Cpu/Z80Cpu#set:a
  local.get $1
  local.get $0
  i32.load16_u
  i32.const 255
  i32.and
  call $src/assembly/Z80Cpu/Z80Cpu#set:f
  local.get $1
  local.get $0
  i32.load16_u
  call $src/assembly/Z80Cpu/Z80Cpu#set:af
  local.get $1
  local.get $0
  i32.load16_u offset=8
  call $src/assembly/Z80Cpu/Z80Cpu#set:_af_
  local.get $1
  local.get $0
  i32.load16_u offset=2
  i32.const 8
  i32.shr_u
  call $src/assembly/Z80Cpu/Z80Cpu#set:b
  local.get $1
  local.get $0
  i32.load16_u offset=2
  i32.const 255
  i32.and
  call $src/assembly/Z80Cpu/Z80Cpu#set:c
  local.get $1
  local.get $0
  i32.load16_u offset=2
  call $src/assembly/Z80Cpu/Z80Cpu#set:bc
  local.get $1
  local.get $0
  i32.load16_u offset=10
  call $src/assembly/Z80Cpu/Z80Cpu#set:_bc_
  local.get $1
  local.get $0
  i32.load16_u offset=4
  i32.const 8
  i32.shr_u
  call $src/assembly/Z80Cpu/Z80Cpu#set:d
  local.get $1
  local.get $0
  i32.load16_u offset=4
  i32.const 255
  i32.and
  call $src/assembly/Z80Cpu/Z80Cpu#set:e
  local.get $1
  local.get $0
  i32.load16_u offset=4
  call $src/assembly/Z80Cpu/Z80Cpu#set:de
  local.get $1
  local.get $0
  i32.load16_u offset=12
  call $src/assembly/Z80Cpu/Z80Cpu#set:_de_
  local.get $1
  local.get $0
  i32.load16_u offset=6
  i32.const 8
  i32.shr_u
  call $src/assembly/Z80Cpu/Z80Cpu#set:h
  local.get $1
  local.get $0
  i32.load16_u offset=6
  i32.const 255
  i32.and
  call $src/assembly/Z80Cpu/Z80Cpu#set:l
  local.get $1
  local.get $0
  i32.load16_u offset=6
  call $src/assembly/Z80Cpu/Z80Cpu#set:hl
  local.get $1
  local.get $0
  i32.load16_u offset=14
  call $src/assembly/Z80Cpu/Z80Cpu#set:_hl_
  local.get $1
  local.get $0
  i32.load8_u offset=16
  call $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:i
  local.get $1
  local.get $0
  i32.load8_u offset=45
  i32.store8 offset=41
  local.get $1
  local.get $0
  i32.load8_u offset=46
  i32.store8 offset=42
  local.get $1
  local.get $0
  i32.load offset=68
  i32.store offset=52
  local.get $1
  local.get $0
  i32.load8_u offset=47
  i32.store8 offset=43
  local.get $1
  local.get $0
  i32.load8_u offset=49
  i32.store8 offset=45
  local.get $1
  local.get $0
  i32.load8_u offset=48
  i32.store8 offset=44
  local.get $1
  local.get $0
  i32.load16_u offset=22
  i32.const 8
  i32.shr_u
  call $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:xh
  local.get $1
  local.get $0
  i32.load16_u offset=22
  i32.const 255
  i32.and
  call $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:xl
  local.get $1
  local.get $0
  i32.load16_u offset=22
  call $src/assembly/Z80Cpu/Z80Cpu#set:ix
  local.get $1
  local.get $0
  i32.load16_u offset=24
  i32.const 8
  i32.shr_u
  call $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:yh
  local.get $1
  local.get $0
  i32.load16_u offset=24
  i32.const 255
  i32.and
  call $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:yl
  local.get $1
  local.get $0
  i32.load16_u offset=24
  call $src/assembly/Z80Cpu/Z80Cpu#set:iy
  local.get $1
  local.get $0
  i32.load8_u offset=72
  i32.store8 offset=56
  local.get $1
  local.get $0
  i32.load8_u offset=73
  i32.store8 offset=57
  local.get $1
  local.get $0
  i32.load16_u offset=18
  call $src/assembly/Z80Cpu/Z80Cpu#set:pc
  local.get $1
  local.get $0
  i32.load offset=64
  i32.store offset=48
  local.get $1
  local.get $0
  i32.load8_u offset=17
  call $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:r
  local.get $1
  local.get $0
  i32.load16_u offset=20
  call $src/assembly/Z80Cpu/Z80Cpu#set:sp
  local.get $1
  local.get $0
  i32.load offset=40
  i32.store offset=36
  local.get $1
  local.get $0
  i64.load offset=32
  i64.const 32
  i64.shr_u
  i64.store32 offset=32
  local.get $1
  local.get $0
  i64.load offset=32
  i64.store32 offset=28
  local.get $1
  local.get $0
  i32.load8_u offset=44
  i32.store8 offset=40
  local.get $1
  local.get $0
  i32.load16_u offset=26
  i32.const 8
  i32.shr_u
  call $src/assembly/Z80Cpu/Z80Cpu#set:wh
  local.get $1
  local.get $0
  i32.load16_u offset=26
  i32.const 255
  i32.and
  call $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:wl
  local.get $1
  local.get $0
  i32.load16_u offset=26
  call $src/assembly/Z80Cpu/Z80Cpu#set:wz
  local.get $1
 )
 (func $src/assembly/index/getTestMachineState (; 211 ;) (result i32)
  global.get $src/assembly/test-machine/WaTestZ80Machine/waTestZ80Machine
  i32.load
  call $src/assembly/Z80Cpu/Z80Cpu#getCpuState
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:a (; 212 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u
  i32.const 8
  i32.shr_u
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:af (; 213 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:f (; 214 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u
  i32.const 255
  i32.and
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:b (; 215 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=2
  i32.const 8
  i32.shr_u
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:c (; 216 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=2
  i32.const 255
  i32.and
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:bc (; 217 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=2
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:e (; 218 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=4
  i32.const 255
  i32.and
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:de (; 219 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=4
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:h (; 220 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=6
  i32.const 8
  i32.shr_u
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:l (; 221 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=6
  i32.const 255
  i32.and
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:hl (; 222 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=6
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:i (; 223 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=16
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:xh (; 224 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=22
  i32.const 8
  i32.shr_u
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:xl (; 225 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=22
  i32.const 255
  i32.and
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:ix (; 226 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=22
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:yh (; 227 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=24
  i32.const 8
  i32.shr_u
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:yl (; 228 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=24
  i32.const 255
  i32.and
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:iy (; 229 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=24
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:pc (; 230 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=18
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:r (; 231 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=17
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:sp (; 232 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=20
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:wh (; 233 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=26
  i32.const 8
  i32.shr_u
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:wl (; 234 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=26
  i32.const 255
  i32.and
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:wz (; 235 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=26
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#updateCpuState (; 236 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  call $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:a
  call $src/assembly/Z80Cpu/Z80Cpu#set:a
  local.get $0
  local.get $1
  call $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:f
  call $src/assembly/Z80Cpu/Z80Cpu#set:f
  local.get $0
  local.get $1
  i32.load16_u
  call $src/assembly/Z80Cpu/Z80Cpu#set:af
  local.get $0
  local.get $1
  i32.load16_u offset=8
  call $src/assembly/Z80Cpu/Z80Cpu#set:_af_
  local.get $0
  local.get $1
  call $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:b
  call $src/assembly/Z80Cpu/Z80Cpu#set:b
  local.get $0
  local.get $1
  call $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:c
  call $src/assembly/Z80Cpu/Z80Cpu#set:c
  local.get $0
  local.get $1
  i32.load16_u offset=2
  call $src/assembly/Z80Cpu/Z80Cpu#set:bc
  local.get $0
  local.get $1
  i32.load16_u offset=10
  call $src/assembly/Z80Cpu/Z80Cpu#set:_bc_
  local.get $0
  local.get $0
  i32.load16_u offset=4
  i32.const 8
  i32.shr_u
  call $src/assembly/Z80Cpu/Z80Cpu#set:d
  local.get $0
  local.get $1
  call $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:e
  call $src/assembly/Z80Cpu/Z80Cpu#set:e
  local.get $0
  local.get $1
  i32.load16_u offset=4
  call $src/assembly/Z80Cpu/Z80Cpu#set:de
  local.get $0
  local.get $1
  i32.load16_u offset=12
  call $src/assembly/Z80Cpu/Z80Cpu#set:_de_
  local.get $0
  local.get $1
  call $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:h
  call $src/assembly/Z80Cpu/Z80Cpu#set:h
  local.get $0
  local.get $1
  call $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:l
  call $src/assembly/Z80Cpu/Z80Cpu#set:l
  local.get $0
  local.get $1
  i32.load16_u offset=6
  call $src/assembly/Z80Cpu/Z80Cpu#set:hl
  local.get $0
  local.get $1
  i32.load16_u offset=14
  call $src/assembly/Z80Cpu/Z80Cpu#set:_hl_
  local.get $0
  local.get $1
  i32.load8_u offset=16
  call $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:i
  local.get $0
  local.get $1
  i32.load8_u offset=41
  i32.store8 offset=45
  local.get $0
  local.get $1
  i32.load8_u offset=42
  i32.store8 offset=46
  local.get $0
  local.get $1
  i32.load offset=52
  i32.store offset=68
  local.get $0
  local.get $1
  i32.load8_u offset=43
  i32.store8 offset=47
  local.get $0
  local.get $1
  i32.load8_u offset=44
  i32.store8 offset=49
  local.get $0
  local.get $1
  i32.load8_u offset=44
  i32.store8 offset=48
  local.get $0
  local.get $1
  call $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:xh
  call $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:xh
  local.get $0
  local.get $1
  call $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:xl
  call $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:xl
  local.get $0
  local.get $1
  i32.load16_u offset=22
  call $src/assembly/Z80Cpu/Z80Cpu#set:ix
  local.get $0
  local.get $1
  call $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:yh
  call $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:yh
  local.get $0
  local.get $1
  call $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:yl
  call $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:yl
  local.get $0
  local.get $1
  i32.load16_u offset=24
  call $src/assembly/Z80Cpu/Z80Cpu#set:iy
  local.get $0
  local.get $1
  i32.load8_u offset=56
  i32.store8 offset=72
  local.get $0
  local.get $1
  i32.load8_u offset=57
  i32.store8 offset=73
  local.get $0
  local.get $1
  i32.load16_u offset=18
  call $src/assembly/Z80Cpu/Z80Cpu#set:pc
  local.get $0
  local.get $1
  i32.load offset=48
  i32.store offset=64
  local.get $0
  local.get $1
  i32.load8_u offset=17
  call $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:r
  local.get $0
  local.get $1
  i32.load16_u offset=20
  call $src/assembly/Z80Cpu/Z80Cpu#set:sp
  local.get $0
  local.get $1
  i32.load offset=36
  i32.store offset=40
  local.get $0
  local.get $1
  i32.load offset=32
  i32.const 32
  i32.shl
  i64.extend_i32_u
  local.get $1
  i32.load offset=28
  i64.extend_i32_u
  i64.or
  i64.store offset=32
  local.get $0
  local.get $1
  i32.load8_u offset=40
  i32.store8 offset=44
  local.get $0
  local.get $1
  call $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:wh
  call $src/assembly/Z80Cpu/Z80Cpu#set:wh
  local.get $0
  local.get $1
  call $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:wl
  call $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:wl
  local.get $0
  local.get $1
  i32.load16_u offset=26
  call $src/assembly/Z80Cpu/Z80Cpu#set:wz
 )
 (func $src/assembly/index/updateTestMachineState (; 237 ;) (param $0 i32)
  global.get $src/assembly/test-machine/WaTestZ80Machine/waTestZ80Machine
  i32.load
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#updateCpuState
 )
 (func $src/assembly/index/getTestMachineMemory (; 238 ;) (result i32)
  global.get $src/assembly/test-machine/test-devices/simpleMemory
  call $~lib/rt/pure/__retain
 )
 (func $src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine#set:memory (; 239 ;) (param $0 i32)
  (local $1 i32)
  loop $for-loop|0
   local.get $1
   global.get $src/assembly/test-machine/test-devices/simpleMemory
   i32.load offset=8
   i32.lt_s
   if
    global.get $src/assembly/test-machine/test-devices/simpleMemory
    local.get $1
    local.get $0
    local.get $1
    call $~lib/typedarray/Uint8Array#__get
    call $~lib/typedarray/Uint8Array#__set
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
 )
 (func $src/assembly/index/updateTestMachineMemory (; 240 ;) (param $0 i32)
  local.get $0
  call $src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine#set:memory
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#executeReset (; 241 ;) (param $0 i32)
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
  call $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:i
  local.get $0
  i32.const 0
  call $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:r
  local.get $0
  i32.const 0
  i32.store8 offset=49
  local.get $0
  i64.const 0
  i64.store offset=32
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#reset (; 242 ;) (param $0 i32)
  local.get $0
  call $src/assembly/Z80Cpu/Z80Cpu#executeReset
 )
 (func $src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine#initCode (; 243 ;) (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  local.get $1
  local.set $3
  i32.const 0
  local.set $1
  loop $for-loop|0
   local.get $1
   local.get $3
   i32.load offset=8
   i32.lt_s
   if
    local.get $2
    local.tee $4
    i32.const 1
    i32.add
    local.set $2
    local.get $4
    local.get $3
    local.get $1
    call $~lib/typedarray/Uint8Array#__get
    call $src/assembly/test-machine/test-devices/writeSimpleMemory
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
  local.get $0
  local.get $2
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
    local.get $2
    i32.const 0
    call $src/assembly/test-machine/test-devices/writeSimpleMemory
    br $while-continue|1
   end
  end
  local.get $0
  i32.load
  call $src/assembly/Z80Cpu/Z80Cpu#executeReset
  local.get $0
  i32.load
  i32.const 0
  call $src/assembly/Z80Cpu/Z80Cpu#set:pc
 )
 (func $src/assembly/index/initTestMachineCode (; 244 ;) (param $0 i32) (param $1 i32)
  global.get $src/assembly/test-machine/WaTestZ80Machine/waTestZ80Machine
  local.get $0
  i32.store offset=8
  global.get $src/assembly/test-machine/WaTestZ80Machine/waTestZ80Machine
  local.get $1
  call $src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine#initCode
 )
 (func $src/assembly/test-machine/test-devices/setTestInput (; 245 ;) (param $0 i32)
  (local $1 i32)
  local.get $0
  i32.load offset=8
  i32.const 0
  i32.gt_s
  if
   local.get $0
   global.get $src/assembly/test-machine/test-devices/fakeInput
   local.tee $1
   i32.ne
   if
    local.get $0
    call $~lib/rt/pure/__retain
    local.set $0
    local.get $1
    call $~lib/rt/pure/__release
   end
   local.get $0
   global.set $src/assembly/test-machine/test-devices/fakeInput
   i32.const 0
   global.set $src/assembly/test-machine/test-devices/inputIndex
  end
 )
 (func $src/assembly/index/initTestMachineInput (; 246 ;) (param $0 i32)
  local.get $0
  call $src/assembly/test-machine/test-devices/setTestInput
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#executeInterrupt (; 247 ;) (param $0 i32)
  (local $1 i32)
  (local $2 i32)
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
  local.get $0
  i32.load16_u offset=20
  local.get $0
  i32.load16_u offset=18
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
  i32.load16_u offset=20
  i32.const 1
  i32.sub
  call $src/assembly/Z80Cpu/Z80Cpu#set:sp
  local.get $0
  local.get $0
  i32.load16_u offset=20
  local.get $0
  i32.load16_u offset=18
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
   i32.const 0
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
   call $src/assembly/Z80Cpu/Z80Cpu#readMemory
   local.set $1
   local.get $0
   local.get $0
   i64.load offset=32
   i64.const 3
   i64.add
   i64.store offset=32
   local.get $0
   local.get $1
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
  end
  local.get $0
  local.get $0
  i32.load16_u offset=26
  call $src/assembly/Z80Cpu/Z80Cpu#set:pc
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#refreshMemory (; 248 ;) (param $0 i32)
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
  call $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:r
  local.get $0
  local.get $0
  i64.load offset=32
  i64.const 1
  i64.add
  i64.store offset=32
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#executeNmi (; 249 ;) (param $0 i32)
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
  local.get $0
  i32.load16_u offset=20
  local.get $0
  i32.load16_u offset=18
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
  i32.load16_u offset=20
  i32.const 1
  i32.sub
  call $src/assembly/Z80Cpu/Z80Cpu#set:sp
  local.get $0
  local.get $0
  i32.load16_u offset=20
  local.get $0
  i32.load16_u offset=18
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
 (func $src/assembly/Z80Cpu/Z80Cpu#processCpuSignals (; 250 ;) (param $0 i32) (result i32)
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
 (func "$~lib/array/Array<((cpu: src/assembly/Z80Cpu/Z80Cpu) => void) | null>#__get" (; 251 ;) (param $0 i32) (param $1 i32) (result i32)
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
  call "$~lib/array/Array<(cpu: src/assembly/Z80Cpu/Z80Cpu, value: u8, carry: bool) => void>#__unchecked_get"
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#processStandardOrIndexedOperations (; 252 ;) (param $0 i32)
  (local $1 i32)
  local.get $0
  i32.load offset=68
  if (result i32)
   i32.const 5584
   local.get $0
   i32.load8_u offset=73
   call "$~lib/array/Array<((cpu: src/assembly/Z80Cpu/Z80Cpu) => void) | null>#__get"
  else
   i32.const 2368
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
 (func $src/assembly/Z80Cpu/Z80Cpu#processCBPrefixedOperations (; 253 ;) (param $0 i32)
  (local $1 i32)
  local.get $0
  i32.load offset=68
  i32.eqz
  if
   i32.const 4512
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
   local.get $0
   i32.load16_u offset=18
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
  i32.load16_u offset=18
  i32.const 1
  i32.add
  call $src/assembly/Z80Cpu/Z80Cpu#set:pc
  i32.const 6656
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
 (func $src/assembly/Z80Cpu/Z80Cpu#processEDOperations (; 254 ;) (param $0 i32)
  (local $1 i32)
  i32.const 3440
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
 (func $src/assembly/Z80Cpu/Z80Cpu#executeCpuCycle (; 255 ;) (param $0 i32)
  (local $1 i32)
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
  block $folding-inner0
   local.get $0
   i32.load offset=64
   i32.eqz
   if
    block $case4|0
     block $case3|0
      block $case2|0
       block $case1|0
        local.get $1
        i32.const 221
        i32.ne
        if
         local.get $1
         i32.const 253
         i32.eq
         br_if $case1|0
         local.get $1
         i32.const 203
         i32.eq
         br_if $case2|0
         local.get $1
         i32.const 237
         i32.eq
         br_if $case3|0
         br $case4|0
        end
        local.get $0
        i32.const 1
        i32.store offset=68
        br $folding-inner0
       end
       local.get $0
       i32.const 2
       i32.store offset=68
       br $folding-inner0
      end
      local.get $0
      i32.const 2
      i32.store offset=64
      br $folding-inner0
     end
     local.get $0
     i32.const 1
     i32.store offset=64
     br $folding-inner0
    end
    local.get $0
    i32.const 0
    i32.store8 offset=48
    local.get $0
    local.get $1
    i32.store8 offset=73
    local.get $0
    call $src/assembly/Z80Cpu/Z80Cpu#processStandardOrIndexedOperations
    local.get $0
    i32.const 0
    i32.store offset=64
    local.get $0
    i32.const 0
    i32.store offset=68
    local.get $0
    i32.const 0
    i32.store8 offset=49
    return
   end
   local.get $0
   i32.load offset=64
   i32.const 2
   i32.eq
   if
    local.get $0
    i32.const 0
    i32.store8 offset=48
    local.get $0
    local.get $1
    i32.store8 offset=73
    local.get $0
    call $src/assembly/Z80Cpu/Z80Cpu#processCBPrefixedOperations
    local.get $0
    i32.const 0
    i32.store offset=68
    local.get $0
    i32.const 0
    i32.store offset=64
    local.get $0
    i32.const 0
    i32.store8 offset=49
    return
   end
   local.get $0
   i32.load offset=64
   i32.const 1
   i32.eq
   if
    local.get $0
    i32.const 0
    i32.store8 offset=48
    local.get $0
    local.get $1
    i32.store8 offset=73
    local.get $0
    call $src/assembly/Z80Cpu/Z80Cpu#processEDOperations
    local.get $0
    i32.const 0
    i32.store offset=68
    local.get $0
    i32.const 0
    i32.store offset=64
    local.get $0
    i32.const 0
    i32.store8 offset=49
   end
   return
  end
  local.get $0
  i32.const 1
  i32.store8 offset=48
  local.get $0
  i32.const 1
  i32.store8 offset=49
 )
 (func $src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine#run (; 256 ;) (param $0 i32)
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
 (func $src/assembly/index/runTestMachine (; 257 ;)
  global.get $src/assembly/test-machine/WaTestZ80Machine/waTestZ80Machine
  call $src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine#run
 )
 (func $src/assembly/index/resetMemoryAccessLog (; 258 ;)
  call $src/assembly/test-machine/test-devices/clearMemoryAccessLog
 )
 (func $src/assembly/index/resetIoAccessLog (; 259 ;)
  (local $0 i32)
  i32.const 16
  i32.const 6864
  call $~lib/rt/__allocArray
  call $~lib/rt/pure/__retain
  global.get $src/assembly/test-machine/test-devices/ioAccessLog
  call $~lib/rt/pure/__release
  global.set $src/assembly/test-machine/test-devices/ioAccessLog
 )
 (func $~lib/array/Array<src/assembly/test-machine/test-devices/IoOp>#__get (; 260 ;) (param $0 i32) (param $1 i32) (result i32)
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
  local.tee $0
  i32.eqz
  if
   local.get $0
   call $~lib/rt/pure/__release
   i32.const 1216
   i32.const 304
   i32.const 97
   i32.const 39
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
 )
 (func $src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine#get:ioAccessLog (; 261 ;) (result i32)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  global.get $src/assembly/test-machine/test-devices/ioAccessLog
  i32.load offset=12
  call $~lib/typedarray/Uint32Array#constructor
  local.set $2
  loop $for-loop|0
   local.get $0
   global.get $src/assembly/test-machine/test-devices/ioAccessLog
   i32.load offset=12
   i32.lt_s
   if
    local.get $2
    local.get $0
    global.get $src/assembly/test-machine/test-devices/ioAccessLog
    local.get $0
    call $~lib/array/Array<src/assembly/test-machine/test-devices/IoOp>#__get
    local.tee $1
    i32.load16_u
    i32.const 16
    i32.shl
    local.get $1
    i32.load8_u offset=2
    i32.const 8
    i32.shl
    i32.or
    local.get $1
    i32.load8_u offset=3
    if (result i32)
     i32.const 1
    else
     i32.const 0
    end
    i32.or
    call $~lib/typedarray/Uint32Array#__set
    local.get $1
    call $~lib/rt/pure/__release
    local.get $0
    i32.const 1
    i32.add
    local.set $0
    br $for-loop|0
   end
  end
  local.get $2
 )
 (func $src/assembly/index/getTestMachineIoAccessLog (; 262 ;) (result i32)
  call $src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine#get:ioAccessLog
 )
 (func $src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine#get:memoryAccessLog (; 263 ;) (result i32)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  global.get $src/assembly/test-machine/test-devices/memoryAccessLog
  i32.load offset=12
  call $~lib/typedarray/Uint32Array#constructor
  local.set $2
  loop $for-loop|0
   local.get $0
   global.get $src/assembly/test-machine/test-devices/memoryAccessLog
   i32.load offset=12
   i32.lt_s
   if
    local.get $2
    local.get $0
    global.get $src/assembly/test-machine/test-devices/memoryAccessLog
    local.get $0
    call $~lib/array/Array<src/assembly/test-machine/test-devices/IoOp>#__get
    local.tee $1
    i32.load16_u
    i32.const 16
    i32.shl
    local.get $1
    i32.load8_u offset=2
    i32.const 8
    i32.shl
    i32.or
    local.get $1
    i32.load8_u offset=3
    if (result i32)
     i32.const 1
    else
     i32.const 0
    end
    i32.or
    call $~lib/typedarray/Uint32Array#__set
    local.get $1
    call $~lib/rt/pure/__release
    local.get $0
    i32.const 1
    i32.add
    local.set $0
    br $for-loop|0
   end
  end
  local.get $2
 )
 (func $src/assembly/index/getTestMachineMemoryAccessLog (; 264 ;) (result i32)
  call $src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine#get:memoryAccessLog
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:tacts (; 265 ;) (param $0 i32) (result i64)
  local.get $0
  i64.load offset=32
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:tacts (; 266 ;) (param $0 i32) (param $1 i64)
  local.get $0
  local.get $1
  i64.store offset=32
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:stateFlags (; 267 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=40
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:stateFlags (; 268 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store offset=40
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:useGateArrayContention (; 269 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=44
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:useGateArrayContention (; 270 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=44
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:iff1 (; 271 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=45
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:iff1 (; 272 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=45
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:iff2 (; 273 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=46
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:iff2 (; 274 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=46
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:interruptMode (; 275 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=47
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:interruptMode (; 276 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=47
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:isInterruptBlocked (; 277 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=48
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:isInterruptBlocked (; 278 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=48
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:isInOpExecution (; 279 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=49
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:isInOpExecution (; 280 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=49
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:executionFlowStatus (; 281 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=52
  call $~lib/rt/pure/__retain
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:memoryReadStatus (; 282 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=56
  call $~lib/rt/pure/__retain
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:memoryWriteStatus (; 283 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=60
  call $~lib/rt/pure/__retain
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:prefixMode (; 284 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=64
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:prefixMode (; 285 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store offset=64
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:indexMode (; 286 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=68
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:indexMode (; 287 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store offset=68
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:maskableInterruptModeEntered (; 288 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=72
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:maskableInterruptModeEntered (; 289 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=72
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:opCode (; 290 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=73
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:opCode (; 291 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=73
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:allowExtendedInstructionSet (; 292 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=74
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:allowExtendedInstructionSet (; 293 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=74
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:memoryReader (; 294 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=76
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:memoryReader (; 295 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store offset=76
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:memoryWriter (; 296 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=80
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:memoryWriter (; 297 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store offset=80
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:portReader (; 298 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=84
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:portReader (; 299 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store offset=84
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:portWriter (; 300 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=88
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#set:portWriter (; 301 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store offset=88
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:d (; 302 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=4
  i32.const 8
  i32.shr_u
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#getIndexReg (; 303 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=68
  i32.const 2
  i32.eq
  if (result i32)
   local.get $0
   i32.load16_u offset=24
  else
   local.get $0
   i32.load16_u offset=22
  end
  i32.const 65535
  i32.and
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#setIndexReg (; 304 ;) (param $0 i32) (param $1 i32)
  local.get $0
  i32.load offset=68
  i32.const 2
  i32.eq
  if
   local.get $0
   local.get $1
   call $src/assembly/Z80Cpu/Z80Cpu#set:iy
  else
   local.get $0
   local.get $1
   call $src/assembly/Z80Cpu/Z80Cpu#set:ix
  end
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:sFlag (; 305 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u
  i32.const 128
  i32.and
  i32.const 0
  i32.ne
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:zFlag (; 306 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u
  i32.const 64
  i32.and
  i32.const 0
  i32.ne
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:r5Flag (; 307 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u
  i32.const 32
  i32.and
  i32.const 0
  i32.ne
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:hFlag (; 308 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u
  i32.const 16
  i32.and
  i32.const 0
  i32.ne
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:r3Flag (; 309 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u
  i32.const 8
  i32.and
  i32.const 0
  i32.ne
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:pvFlag (; 310 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u
  i32.const 4
  i32.and
  i32.const 0
  i32.ne
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#get:nFlag (; 311 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u
  i32.const 2
  i32.and
  i32.const 0
  i32.ne
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#getCallInstructionLength (; 312 ;) (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  local.get $0
  i32.load16_u offset=18
  call $src/assembly/Z80Cpu/Z80Cpu#readMemory
  local.tee $1
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
  i32.load16_u offset=18
  i32.const 1
  i32.add
  i32.const 65535
  i32.and
  call $src/assembly/Z80Cpu/Z80Cpu#readMemory
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
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:tactsL (; 313 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=28
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:tactsL (; 314 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store offset=28
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:tactsH (; 315 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=32
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:tactsH (; 316 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store offset=32
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:stateFlags (; 317 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=36
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:stateFlags (; 318 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store offset=36
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:useGateArrayContention (; 319 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=40
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:useGateArrayContention (; 320 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=40
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:iff1 (; 321 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=41
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:iff1 (; 322 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=41
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:iff2 (; 323 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=42
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:iff2 (; 324 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=42
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:interruptMode (; 325 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=43
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:interruptMode (; 326 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=43
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:prefixMode (; 327 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=48
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:prefixMode (; 328 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store offset=48
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:indexMode (; 329 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load offset=52
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:indexMode (; 330 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store offset=52
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:maskableInterruptModeEntered (; 331 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=56
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:maskableInterruptModeEntered (; 332 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=56
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#get:opCode (; 333 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=57
 )
 (func $src/assembly/test-machine/TestZ80MachineState/TestZ80MachineState#set:opCode (; 334 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=57
 )
 (func $~start (; 335 ;)
  call $start:src/assembly/Z80Cpu
  i32.const 65536
  call $~lib/typedarray/Uint8Array#constructor
  global.set $src/assembly/test-machine/test-devices/simpleMemory
  i32.const 0
  call $~lib/typedarray/Uint8Array#constructor
  global.set $src/assembly/test-machine/test-devices/fakeInput
  call $src/assembly/test-machine/WaTestZ80Machine/WaTestZ80Machine#constructor
  global.set $src/assembly/test-machine/WaTestZ80Machine/waTestZ80Machine
 )
 (func $~lib/rt/pure/__collect (; 336 ;)
  nop
 )
 (func $~lib/rt/pure/decrement (; 337 ;) (param $0 i32)
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
   call $~lib/rt/__visit_members
   local.get $2
   i32.const -2147483648
   i32.and
   if
    i32.const 0
    i32.const 144
    i32.const 126
    i32.const 17
    call $~lib/builtins/abort
    unreachable
   end
   global.get $~lib/rt/tlsf/ROOT
   local.get $0
   call $~lib/rt/tlsf/freeBlock
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
   local.get $1
   i32.const 1
   i32.sub
   local.get $2
   i32.const -268435456
   i32.and
   i32.or
   i32.store offset=4
  end
 )
 (func $~lib/rt/pure/__visit (; 338 ;) (param $0 i32)
  local.get $0
  i32.const 7028
  i32.lt_u
  if
   return
  end
  local.get $0
  i32.const 16
  i32.sub
  call $~lib/rt/pure/decrement
 )
 (func $~lib/array/Array<src/assembly/test-machine/test-devices/MemoryOp>#__visit_impl (; 339 ;) (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  local.get $0
  i32.load offset=4
  local.tee $1
  local.get $0
  i32.load offset=12
  i32.const 2
  i32.shl
  i32.add
  local.set $0
  loop $while-continue|0
   local.get $1
   local.get $0
   i32.lt_u
   if
    local.get $1
    i32.load
    local.tee $2
    if
     local.get $2
     call $~lib/rt/pure/__visit
    end
    local.get $1
    i32.const 4
    i32.add
    local.set $1
    br $while-continue|0
   end
  end
 )
 (func $~lib/rt/__visit_members (; 340 ;) (param $0 i32)
  (local $1 i32)
  block $block$4$break
   block $switch$1$default
    block $switch$1$case$18
     block $switch$1$case$16
      block $switch$1$case$8
       block $switch$1$case$2
        local.get $0
        i32.const 8
        i32.sub
        i32.load
        br_table $switch$1$case$2 $switch$1$case$2 $block$4$break $block$4$break $block$4$break $block$4$break $switch$1$case$8 $block$4$break $block$4$break $block$4$break $block$4$break $block$4$break $block$4$break $switch$1$case$2 $switch$1$case$16 $switch$1$case$2 $switch$1$case$18 $block$4$break $switch$1$case$2 $block$4$break $switch$1$default
       end
       return
      end
      local.get $0
      i32.load offset=52
      local.tee $1
      if
       local.get $1
       call $~lib/rt/pure/__visit
      end
      local.get $0
      i32.load offset=56
      local.tee $1
      if
       local.get $1
       call $~lib/rt/pure/__visit
      end
      local.get $0
      i32.load offset=60
      local.tee $0
      if
       local.get $0
       call $~lib/rt/pure/__visit
      end
      return
     end
     local.get $0
     call $~lib/array/Array<src/assembly/test-machine/test-devices/MemoryOp>#__visit_impl
     br $block$4$break
    end
    local.get $0
    call $~lib/array/Array<src/assembly/test-machine/test-devices/MemoryOp>#__visit_impl
    br $block$4$break
   end
   unreachable
  end
  local.get $0
  i32.load
  local.tee $0
  if
   local.get $0
   call $~lib/rt/pure/__visit
  end
 )
 (func $src/assembly/Z80Cpu/Z80Cpu#constructor|trampoline (; 341 ;) (param $0 i32) (param $1 i32) (result i32)
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
