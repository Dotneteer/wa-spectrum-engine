(module
 (type $i32_=>_i32 (func (param i32) (result i32)))
 (type $i32_i32_=>_none (func (param i32 i32)))
 (type $i32_=>_none (func (param i32)))
 (type $i32_i32_i32_=>_none (func (param i32 i32 i32)))
 (type $none_=>_i32 (func (result i32)))
 (type $none_=>_none (func))
 (type $i32_i32_=>_i32 (func (param i32 i32) (result i32)))
 (type $i32_i32_i32_=>_i32 (func (param i32 i32 i32) (result i32)))
 (type $i32_i32_i32_i32_=>_none (func (param i32 i32 i32 i32)))
 (import "env" "abort" (func $~lib/builtins/abort (param i32 i32 i32 i32)))
 (memory $0 1)
 (data (i32.const 16) "\1e\00\00\00\01\00\00\00\01\00\00\00\1e\00\00\00~\00l\00i\00b\00/\00r\00t\00/\00t\00l\00s\00f\00.\00t\00s")
 (data (i32.const 64) "(\00\00\00\01\00\00\00\01\00\00\00(\00\00\00a\00l\00l\00o\00c\00a\00t\00i\00o\00n\00 \00t\00o\00o\00 \00l\00a\00r\00g\00e")
 (data (i32.const 128) "\1e\00\00\00\01\00\00\00\01\00\00\00\1e\00\00\00~\00l\00i\00b\00/\00r\00t\00/\00p\00u\00r\00e\00.\00t\00s")
 (data (i32.const 180) "\01")
 (data (i32.const 192) "\10\00\00\00\01\00\00\00\03\00\00\00\10\00\00\00\c0\00\00\00\c0")
 (data (i32.const 228) "\01")
 (data (i32.const 240) "\10\00\00\00\01\00\00\00\05\00\00\00\10\00\00\00\f0\00\00\00\f0")
 (data (i32.const 272) "$\00\00\00\01\00\00\00\01\00\00\00$\00\00\00I\00n\00d\00e\00x\00 \00o\00u\00t\00 \00o\00f\00 \00r\00a\00n\00g\00e")
 (data (i32.const 336) "\1a\00\00\00\01\00\00\00\01\00\00\00\1a\00\00\00~\00l\00i\00b\00/\00a\00r\00r\00a\00y\00.\00t\00s")
 (data (i32.const 384) "\1c\00\00\00\01\00\00\00\01\00\00\00\1c\00\00\00I\00n\00v\00a\00l\00i\00d\00 \00l\00e\00n\00g\00t\00h")
 (data (i32.const 432) "\06\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\10\00\00\00\00\00\00\003\00\00\00\02\00\00\00\10\00\00\00\00\00\00\00\930\00\00\02")
 (global $~lib/rt/tlsf/ROOT (mut i32) (i32.const 0))
 (global $~lib/rt/tlsf/collectLock (mut i32) (i32.const 0))
 (global $~argumentsLength (mut i32) (i32.const 0))
 (global $~lib/rt/__rtti_base i32 (i32.const 432))
 (global $src/shared/Z80CpuEngine/Z80CpuEngine i32 (i32.const 4))
 (export "__setArgumentsLength" (func $~setArgumentsLength))
 (export "memory" (memory $0))
 (export "__alloc" (func $~lib/rt/tlsf/__alloc))
 (export "__retain" (func $~lib/rt/pure/__retain))
 (export "__release" (func $~lib/rt/pure/__release))
 (export "__collect" (func $~lib/rt/pure/__collect))
 (export "__rtti_base" (global $~lib/rt/__rtti_base))
 (export "getCpuPoolMaxSize" (func $src/assembly/index/getCpuPoolMaxSize))
 (export "resetCpuPool" (func $src/assembly/index/resetCpuPool))
 (export "createCpu" (func $src/assembly/index/createCpu))
 (export "releaseCpu" (func $src/assembly/index/releaseCpu))
 (export "getCpu" (func $src/assembly/index/getCpu))
 (export "longOp" (func $src/assembly/index/longOp))
 (export "Z80CpuEngine" (global $src/shared/Z80CpuEngine/Z80CpuEngine))
 (export "Z80CpuEngine#get:a" (func $src/shared/Z80CpuEngine/Z80CpuEngine#get:_a))
 (export "Z80CpuEngine#set:a" (func $src/shared/Z80CpuEngine/Z80CpuEngine#set:a))
 (export "Z80CpuEngine#get:f" (func $src/shared/Z80CpuEngine/Z80CpuEngine#get:_f))
 (export "Z80CpuEngine#set:f" (func $src/shared/Z80CpuEngine/Z80CpuEngine#set:f))
 (export "Z80CpuEngine#get:af" (func $src/shared/Z80CpuEngine/Z80CpuEngine#get:af))
 (export "Z80CpuEngine#set:af" (func $src/shared/Z80CpuEngine/Z80CpuEngine#set:af))
 (export "Z80CpuEngine#get:b" (func $src/shared/Z80CpuEngine/Z80CpuEngine#get:_b))
 (export "Z80CpuEngine#set:b" (func $src/shared/Z80CpuEngine/Z80CpuEngine#set:b))
 (export "Z80CpuEngine#get:c" (func $src/shared/Z80CpuEngine/Z80CpuEngine#get:_c))
 (export "Z80CpuEngine#set:c" (func $src/shared/Z80CpuEngine/Z80CpuEngine#set:c))
 (export "Z80CpuEngine#get:bc" (func $src/shared/Z80CpuEngine/Z80CpuEngine#get:_bc))
 (export "Z80CpuEngine#set:bc" (func $src/shared/Z80CpuEngine/Z80CpuEngine#set:bc))
 (export "Z80CpuEngine#get:d" (func $src/shared/Z80CpuEngine/Z80CpuEngine#get:_d))
 (export "Z80CpuEngine#set:d" (func $src/shared/Z80CpuEngine/Z80CpuEngine#set:d))
 (export "Z80CpuEngine#get:e" (func $src/shared/Z80CpuEngine/Z80CpuEngine#get:_e))
 (export "Z80CpuEngine#set:e" (func $src/shared/Z80CpuEngine/Z80CpuEngine#set:e))
 (export "Z80CpuEngine#get:de" (func $src/shared/Z80CpuEngine/Z80CpuEngine#get:_de))
 (export "Z80CpuEngine#set:de" (func $src/shared/Z80CpuEngine/Z80CpuEngine#set:de))
 (export "Z80CpuEngine#get:h" (func $src/shared/Z80CpuEngine/Z80CpuEngine#get:_h))
 (export "Z80CpuEngine#set:h" (func $src/shared/Z80CpuEngine/Z80CpuEngine#set:h))
 (export "Z80CpuEngine#get:l" (func $src/shared/Z80CpuEngine/Z80CpuEngine#get:_l))
 (export "Z80CpuEngine#set:l" (func $src/shared/Z80CpuEngine/Z80CpuEngine#set:l))
 (export "Z80CpuEngine#get:hl" (func $src/shared/Z80CpuEngine/Z80CpuEngine#get:_hl))
 (export "Z80CpuEngine#set:hl" (func $src/shared/Z80CpuEngine/Z80CpuEngine#set:hl))
 (export "Z80CpuEngine#get:_af_" (func $src/shared/Z80CpuEngine/Z80CpuEngine#get:_af_sec))
 (export "Z80CpuEngine#get:_bc_" (func $src/shared/Z80CpuEngine/Z80CpuEngine#get:_bc_sec))
 (export "Z80CpuEngine#get:_de_" (func $src/shared/Z80CpuEngine/Z80CpuEngine#get:_de_sec))
 (export "Z80CpuEngine#get:_hl_" (func $src/shared/Z80CpuEngine/Z80CpuEngine#get:_hl_sec))
 (export "Z80CpuEngine#get:i" (func $src/shared/Z80CpuEngine/Z80CpuEngine#get:_i))
 (export "Z80CpuEngine#set:i" (func $src/shared/Z80CpuEngine/Z80CpuEngine#set:_i))
 (export "Z80CpuEngine#get:r" (func $src/shared/Z80CpuEngine/Z80CpuEngine#get:_r))
 (export "Z80CpuEngine#set:r" (func $src/shared/Z80CpuEngine/Z80CpuEngine#set:_r))
 (export "Z80CpuEngine#get:pc" (func $src/shared/Z80CpuEngine/Z80CpuEngine#get:_pc))
 (export "Z80CpuEngine#set:pc" (func $src/shared/Z80CpuEngine/Z80CpuEngine#set:_pc))
 (export "Z80CpuEngine#get:sp" (func $src/shared/Z80CpuEngine/Z80CpuEngine#get:_sp))
 (export "Z80CpuEngine#set:sp" (func $src/shared/Z80CpuEngine/Z80CpuEngine#set:_sp))
 (export "Z80CpuEngine#longOp" (func $src/shared/Z80CpuEngine/Z80CpuEngine#longOp))
 (export "Z80CpuEngine#constructor" (func $src/shared/Z80CpuEngine/Z80CpuEngine#constructor))
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
   i32.const 496
   local.tee $0
   i32.const 0
   i32.store
   i32.const 2064
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
     i32.const 496
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
       i32.const 496
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
   i32.const 496
   i32.const 2080
   memory.size
   i32.const 16
   i32.shl
   call $~lib/rt/tlsf/addMemory
   i32.const 496
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
  i32.const 484
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
  i32.const 484
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
  i32.const 484
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
    i32.const 400
    i32.const 352
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
 (func $~lib/array/Array<bool>#__set (; 20 ;) (param $0 i32) (param $1 i32)
  (local $2 i32)
  local.get $0
  i32.const 220
  i32.load
  i32.ge_u
  if
   local.get $0
   i32.const 0
   i32.lt_s
   if
    i32.const 288
    i32.const 352
    i32.const 109
    i32.const 21
    call $~lib/builtins/abort
    unreachable
   end
   i32.const 208
   local.get $0
   i32.const 1
   i32.add
   local.tee $2
   i32.const 0
   call $~lib/array/ensureSize
   i32.const 220
   local.get $2
   i32.store
  end
  local.get $0
  i32.const 212
  i32.load
  i32.add
  local.get $1
  i32.store8
 )
 (func $~lib/array/Array<src/shared/Z80CpuEngine/Z80CpuEngine | null>#__unchecked_set (; 21 ;) (param $0 i32) (param $1 i32)
  (local $2 i32)
  local.get $1
  i32.const 260
  i32.load
  local.get $0
  i32.const 2
  i32.shl
  i32.add
  local.tee $0
  i32.load
  local.tee $2
  i32.ne
  if
   local.get $0
   local.get $1
   call $~lib/rt/pure/__retain
   i32.store
   local.get $2
   call $~lib/rt/pure/__release
  end
 )
 (func $~lib/array/Array<src/shared/Z80CpuEngine/Z80CpuEngine | null>#__set (; 22 ;) (param $0 i32) (param $1 i32)
  (local $2 i32)
  local.get $0
  i32.const 268
  i32.load
  i32.ge_u
  if
   local.get $0
   i32.const 0
   i32.lt_s
   if
    i32.const 288
    i32.const 352
    i32.const 109
    i32.const 21
    call $~lib/builtins/abort
    unreachable
   end
   i32.const 256
   local.get $0
   i32.const 1
   i32.add
   local.tee $2
   i32.const 2
   call $~lib/array/ensureSize
   i32.const 268
   local.get $2
   i32.store
  end
  local.get $0
  local.get $1
  call $~lib/array/Array<src/shared/Z80CpuEngine/Z80CpuEngine | null>#__unchecked_set
 )
 (func $src/assembly/index/resetCpuPool (; 23 ;)
  (local $0 i32)
  loop $for-loop|0
   local.get $0
   i32.const 100
   i32.lt_s
   if
    local.get $0
    i32.const 0
    call $~lib/array/Array<bool>#__set
    local.get $0
    i32.const 0
    call $~lib/array/Array<src/shared/Z80CpuEngine/Z80CpuEngine | null>#__set
    local.get $0
    i32.const 1
    i32.add
    local.set $0
    br $for-loop|0
   end
  end
 )
 (func $src/assembly/index/getCpuPoolMaxSize (; 24 ;) (result i32)
  i32.const 100
 )
 (func $~setArgumentsLength (; 25 ;) (param $0 i32)
  local.get $0
  global.set $~argumentsLength
 )
 (func $~lib/array/Array<bool>#findIndex (; 26 ;) (result i32)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  i32.const 220
  i32.load
  local.set $1
  loop $for-loop|0
   local.get $0
   local.get $1
   i32.const 220
   i32.load
   local.tee $2
   local.get $1
   local.get $2
   i32.lt_s
   select
   i32.lt_s
   if
    i32.const 3
    global.set $~argumentsLength
    local.get $0
    i32.const 212
    i32.load
    i32.add
    i32.load8_u
    i32.eqz
    if
     local.get $0
     return
    end
    local.get $0
    i32.const 1
    i32.add
    local.set $0
    br $for-loop|0
   end
  end
  i32.const -1
 )
 (func $src/shared/Z80CpuEngine/Z80CpuEngine#constructor (; 27 ;) (param $0 i32) (result i32)
  local.get $0
  i32.eqz
  if
   i32.const 30
   i32.const 4
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
 )
 (func $src/assembly/index/createCpu (; 28 ;) (result i32)
  (local $0 i32)
  (local $1 i32)
  call $~lib/array/Array<bool>#findIndex
  local.tee $0
  i32.const 0
  i32.lt_s
  if
   i32.const -1
   return
  end
  local.get $0
  i32.const 0
  call $src/shared/Z80CpuEngine/Z80CpuEngine#constructor
  local.tee $1
  call $~lib/array/Array<src/shared/Z80CpuEngine/Z80CpuEngine | null>#__set
  local.get $0
  i32.const 1
  call $~lib/array/Array<bool>#__set
  local.get $1
  call $~lib/rt/pure/__release
  local.get $0
 )
 (func $~lib/array/Array<bool>#__get (; 29 ;) (param $0 i32) (result i32)
  local.get $0
  i32.const 220
  i32.load
  i32.ge_u
  if
   i32.const 288
   i32.const 352
   i32.const 93
   i32.const 41
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  i32.const 212
  i32.load
  i32.add
  i32.load8_u
 )
 (func $src/assembly/index/releaseCpu (; 30 ;) (param $0 i32) (result i32)
  local.get $0
  call $~lib/array/Array<bool>#__get
  i32.eqz
  if
   i32.const 0
   return
  end
  local.get $0
  i32.const 0
  call $~lib/array/Array<bool>#__set
  local.get $0
  i32.const 0
  call $~lib/array/Array<src/shared/Z80CpuEngine/Z80CpuEngine | null>#__set
  i32.const 1
 )
 (func $~lib/array/Array<src/shared/Z80CpuEngine/Z80CpuEngine | null>#__get (; 31 ;) (param $0 i32) (result i32)
  local.get $0
  i32.const 268
  i32.load
  i32.ge_u
  if
   i32.const 288
   i32.const 352
   i32.const 93
   i32.const 41
   call $~lib/builtins/abort
   unreachable
  end
  i32.const 260
  i32.load
  local.get $0
  i32.const 2
  i32.shl
  i32.add
  i32.load
  call $~lib/rt/pure/__retain
 )
 (func $src/assembly/index/getCpu (; 32 ;) (param $0 i32) (result i32)
  local.get $0
  call $~lib/array/Array<src/shared/Z80CpuEngine/Z80CpuEngine | null>#__get
 )
 (func $src/shared/Z80CpuEngine/Z80CpuEngine#longOp (; 33 ;) (param $0 i32)
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
 (func $src/shared/Z80CpuEngine/Z80CpuEngine#get:af (; 34 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=2
 )
 (func $src/assembly/index/longOp (; 35 ;) (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  call $~lib/array/Array<src/shared/Z80CpuEngine/Z80CpuEngine | null>#__get
  local.tee $0
  i32.eqz
  if
   local.get $0
   call $~lib/rt/pure/__release
   i32.const -1
   return
  end
  local.get $0
  call $src/shared/Z80CpuEngine/Z80CpuEngine#longOp
  local.get $0
  i32.load16_u offset=2
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $src/shared/Z80CpuEngine/Z80CpuEngine#get:_a (; 36 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u
 )
 (func $src/shared/Z80CpuEngine/Z80CpuEngine#get:_f (; 37 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=1
 )
 (func $src/shared/Z80CpuEngine/Z80CpuEngine#get:_b (; 38 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=4
 )
 (func $src/shared/Z80CpuEngine/Z80CpuEngine#get:_c (; 39 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=5
 )
 (func $src/shared/Z80CpuEngine/Z80CpuEngine#get:_bc (; 40 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=6
 )
 (func $src/shared/Z80CpuEngine/Z80CpuEngine#get:_d (; 41 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=8
 )
 (func $src/shared/Z80CpuEngine/Z80CpuEngine#get:_e (; 42 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=9
 )
 (func $src/shared/Z80CpuEngine/Z80CpuEngine#get:_de (; 43 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=10
 )
 (func $src/shared/Z80CpuEngine/Z80CpuEngine#get:_h (; 44 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=12
 )
 (func $src/shared/Z80CpuEngine/Z80CpuEngine#get:_l (; 45 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=13
 )
 (func $src/shared/Z80CpuEngine/Z80CpuEngine#get:_hl (; 46 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=14
 )
 (func $src/shared/Z80CpuEngine/Z80CpuEngine#get:_af_sec (; 47 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=16
 )
 (func $src/shared/Z80CpuEngine/Z80CpuEngine#get:_bc_sec (; 48 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=18
 )
 (func $src/shared/Z80CpuEngine/Z80CpuEngine#get:_de_sec (; 49 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=20
 )
 (func $src/shared/Z80CpuEngine/Z80CpuEngine#get:_hl_sec (; 50 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=22
 )
 (func $src/shared/Z80CpuEngine/Z80CpuEngine#get:_i (; 51 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=24
 )
 (func $src/shared/Z80CpuEngine/Z80CpuEngine#set:_i (; 52 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=24
 )
 (func $src/shared/Z80CpuEngine/Z80CpuEngine#get:_r (; 53 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load8_u offset=25
 )
 (func $src/shared/Z80CpuEngine/Z80CpuEngine#set:_r (; 54 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store8 offset=25
 )
 (func $src/shared/Z80CpuEngine/Z80CpuEngine#get:_pc (; 55 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=26
 )
 (func $src/shared/Z80CpuEngine/Z80CpuEngine#set:_pc (; 56 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=26
 )
 (func $src/shared/Z80CpuEngine/Z80CpuEngine#get:_sp (; 57 ;) (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=28
 )
 (func $src/shared/Z80CpuEngine/Z80CpuEngine#set:_sp (; 58 ;) (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store16 offset=28
 )
 (func $src/shared/Z80CpuEngine/Z80CpuEngine#set:a (; 59 ;) (param $0 i32) (param $1 i32)
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
 (func $src/shared/Z80CpuEngine/Z80CpuEngine#set:f (; 60 ;) (param $0 i32) (param $1 i32)
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
 (func $src/shared/Z80CpuEngine/Z80CpuEngine#set:af (; 61 ;) (param $0 i32) (param $1 i32)
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
 (func $src/shared/Z80CpuEngine/Z80CpuEngine#set:b (; 62 ;) (param $0 i32) (param $1 i32)
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
 (func $src/shared/Z80CpuEngine/Z80CpuEngine#set:c (; 63 ;) (param $0 i32) (param $1 i32)
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
 (func $src/shared/Z80CpuEngine/Z80CpuEngine#set:bc (; 64 ;) (param $0 i32) (param $1 i32)
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
 (func $src/shared/Z80CpuEngine/Z80CpuEngine#set:d (; 65 ;) (param $0 i32) (param $1 i32)
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
 (func $src/shared/Z80CpuEngine/Z80CpuEngine#set:e (; 66 ;) (param $0 i32) (param $1 i32)
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
 (func $src/shared/Z80CpuEngine/Z80CpuEngine#set:de (; 67 ;) (param $0 i32) (param $1 i32)
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
 (func $src/shared/Z80CpuEngine/Z80CpuEngine#set:h (; 68 ;) (param $0 i32) (param $1 i32)
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
 (func $src/shared/Z80CpuEngine/Z80CpuEngine#set:l (; 69 ;) (param $0 i32) (param $1 i32)
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
 (func $src/shared/Z80CpuEngine/Z80CpuEngine#set:hl (; 70 ;) (param $0 i32) (param $1 i32)
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
 (func $~start (; 71 ;)
  call $src/assembly/index/resetCpuPool
 )
 (func $~lib/rt/pure/__collect (; 72 ;)
  nop
 )
 (func $~lib/rt/pure/decrement (; 73 ;) (param $0 i32)
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
 (func $~lib/rt/pure/__visit (; 74 ;) (param $0 i32)
  local.get $0
  i32.const 484
  i32.lt_u
  if
   return
  end
  local.get $0
  i32.const 16
  i32.sub
  call $~lib/rt/pure/decrement
 )
 (func $~lib/array/Array<src/shared/Z80CpuEngine/Z80CpuEngine | null>#__visit_impl (; 75 ;) (param $0 i32)
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
 (func $~lib/rt/__visit_members (; 76 ;) (param $0 i32)
  block $block$4$break
   block $switch$1$default
    block $switch$1$case$7
     block $switch$1$case$2
      local.get $0
      i32.const 8
      i32.sub
      i32.load
      br_table $switch$1$case$2 $switch$1$case$2 $block$4$break $block$4$break $switch$1$case$2 $switch$1$case$7 $switch$1$default
     end
     return
    end
    local.get $0
    call $~lib/array/Array<src/shared/Z80CpuEngine/Z80CpuEngine | null>#__visit_impl
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
)
