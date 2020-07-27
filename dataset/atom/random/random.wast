(module
  (type (;0;) (func (param i32)))
  (type (;1;) (func (param i32 i32)))
  (type (;2;) (func))
  (type (;3;) (func (result i32)))
  (type (;4;) (func (param i32 i32) (result i32)))
  (type (;5;) (func (param i64)))
  (type (;6;) (func (param i32 i32 i32) (result i32)))
  (type (;7;) (func (param i64 i64 i64 i64) (result i32)))
  (type (;8;) (func (param i32 i64 i64 i64 i64)))
  (type (;9;) (func (param i64 i64) (result i32)))
  (type (;10;) (func (param i32 f64)))
  (type (;11;) (func (param i32 f32)))
  (type (;12;) (func (param i64 i64) (result f64)))
  (type (;13;) (func (param i64 i64) (result f32)))
  (type (;14;) (func (param i64 i64 i64)))
  (type (;15;) (func (param i32) (result i32)))
  (import "env" "eosio_assert" (func (;0;) (type 1)))
  (import "env" "action_data_size" (func (;1;) (type 3)))
  (import "env" "read_action_data" (func (;2;) (type 4)))
  (import "env" "tapos_block_num" (func (;3;) (type 3)))
  (import "env" "printi" (func (;4;) (type 5)))
  (import "env" "tapos_block_prefix" (func (;5;) (type 3)))
  (import "env" "memcpy" (func (;6;) (type 6)))
  (import "env" "prints" (func (;7;) (type 0)))
  (import "env" "send_inline" (func (;8;) (type 1)))
  (import "env" "logfile" (func (;9;) (type 0)))
  (import "env" "abort" (func (;10;) (type 2)))
  (import "env" "memset" (func (;11;) (type 6)))
  (import "env" "memmove" (func (;12;) (type 6)))
  (import "env" "__unordtf2" (func (;13;) (type 7)))
  (import "env" "__eqtf2" (func (;14;) (type 7)))
  (import "env" "__multf3" (func (;15;) (type 8)))
  (import "env" "__addtf3" (func (;16;) (type 8)))
  (import "env" "__subtf3" (func (;17;) (type 8)))
  (import "env" "__netf2" (func (;18;) (type 7)))
  (import "env" "__fixunstfsi" (func (;19;) (type 9)))
  (import "env" "__floatunsitf" (func (;20;) (type 1)))
  (import "env" "__fixtfsi" (func (;21;) (type 9)))
  (import "env" "__floatsitf" (func (;22;) (type 1)))
  (import "env" "__extenddftf2" (func (;23;) (type 10)))
  (import "env" "__extendsftf2" (func (;24;) (type 11)))
  (import "env" "__divtf3" (func (;25;) (type 8)))
  (import "env" "__letf2" (func (;26;) (type 7)))
  (import "env" "__trunctfdf2" (func (;27;) (type 12)))
  (import "env" "__getf2" (func (;28;) (type 7)))
  (import "env" "__trunctfsf2" (func (;29;) (type 13)))
  (import "env" "set_blockchain_parameters_packed" (func (;30;) (type 1)))
  (import "env" "get_blockchain_parameters_packed" (func (;31;) (type 4)))
  (func (;32;) (type 2))
  (func (;33;) (type 14) (param i64 i64 i64)
    (local i32 i64)
    get_global 0
    i32.const 112
    i32.sub
    tee_local 3
    set_global 0
    call 32
    i64.const 7
    set_local 4
    loop  ;; label = @1
      get_local 4
      i64.const 1
      i64.add
      tee_local 4
      i64.const 13
      i64.ne
      br_if 0 (;@1;)
    end
    block  ;; label = @1
      i64.const -6569208335818555392
      get_local 2
      i64.ne
      br_if 0 (;@1;)
      i64.const 5
      set_local 4
      loop  ;; label = @2
        get_local 4
        i64.const 1
        i64.add
        tee_local 4
        i64.const 13
        i64.ne
        br_if 0 (;@2;)
      end
      i64.const 6138663577826885632
      get_local 1
      i64.eq
      i32.const 8192
      call 0
    end
    block  ;; label = @1
      block  ;; label = @2
        get_local 1
        get_local 0
        i64.eq
        br_if 0 (;@2;)
        i64.const 7
        set_local 4
        loop  ;; label = @3
          get_local 4
          i64.const 1
          i64.add
          tee_local 4
          i64.const 13
          i64.ne
          br_if 0 (;@3;)
        end
        i64.const -6569208335818555392
        get_local 2
        i64.ne
        br_if 1 (;@1;)
      end
      get_local 3
      get_local 0
      i64.store offset=104
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                get_local 2
                i64.const -3665743729458675713
                i64.gt_s
                br_if 0 (;@6;)
                get_local 2
                i64.const -7945346999727947776
                i64.eq
                br_if 1 (;@5;)
                get_local 2
                i64.const -7015482319536390144
                i64.eq
                br_if 2 (;@4;)
                get_local 2
                i64.const -5920905901241270272
                i64.ne
                br_if 5 (;@1;)
                get_local 3
                i32.const 0
                i32.store offset=92
                get_local 3
                i32.const 1
                i32.store offset=88
                get_local 3
                get_local 3
                i64.load offset=88
                i64.store offset=16
                get_local 3
                i32.const 104
                i32.add
                get_local 3
                i32.const 16
                i32.add
                call 35
                drop
                br 5 (;@1;)
              end
              get_local 2
              i64.const -3665743729458675712
              i64.eq
              br_if 2 (;@3;)
              get_local 2
              i64.const 7112092489258893312
              i64.eq
              br_if 3 (;@2;)
              get_local 2
              i64.const 7684013976526520320
              i64.ne
              br_if 4 (;@1;)
              get_local 3
              i32.const 0
              i32.store offset=76
              get_local 3
              i32.const 2
              i32.store offset=72
              get_local 3
              get_local 3
              i64.load offset=72
              i64.store offset=32
              get_local 3
              i32.const 104
              i32.add
              get_local 3
              i32.const 32
              i32.add
              call 35
              drop
              br 4 (;@1;)
            end
            get_local 3
            i32.const 0
            i32.store offset=84
            get_local 3
            i32.const 3
            i32.store offset=80
            get_local 3
            get_local 3
            i64.load offset=80
            i64.store offset=24
            get_local 3
            i32.const 104
            i32.add
            get_local 3
            i32.const 24
            i32.add
            call 38
            drop
            br 3 (;@1;)
          end
          get_local 3
          i32.const 0
          i32.store offset=100
          get_local 3
          i32.const 4
          i32.store offset=96
          get_local 3
          get_local 3
          i64.load offset=96
          i64.store offset=8
          get_local 3
          i32.const 104
          i32.add
          get_local 3
          i32.const 8
          i32.add
          call 35
          drop
          br 2 (;@1;)
        end
        get_local 3
        i32.const 0
        i32.store offset=68
        get_local 3
        i32.const 5
        i32.store offset=64
        get_local 3
        get_local 3
        i64.load offset=64
        i64.store offset=40
        get_local 3
        i32.const 104
        i32.add
        get_local 3
        i32.const 40
        i32.add
        call 35
        drop
        br 1 (;@1;)
      end
      get_local 3
      i32.const 0
      i32.store offset=60
      get_local 3
      i32.const 6
      i32.store offset=56
      get_local 3
      get_local 3
      i64.load offset=56
      i64.store offset=48
      get_local 3
      i32.const 104
      i32.add
      get_local 3
      i32.const 48
      i32.add
      call 35
      drop
    end
    i32.const 0
    call 54
    get_local 3
    i32.const 112
    i32.add
    set_global 0)
  (func (;34;) (type 0) (param i32)
    call 5
    i64.extend_s/i32
    call 4)
  (func (;35;) (type 4) (param i32 i32) (result i32)
    (local i32 i32 i32 i32)
    get_global 0
    tee_local 2
    set_local 3
    get_local 1
    i32.load offset=4
    set_local 4
    get_local 1
    i32.load
    set_local 1
    block  ;; label = @1
      call 1
      tee_local 5
      i32.eqz
      br_if 0 (;@1;)
      block  ;; label = @2
        get_local 5
        i32.const 512
        i32.le_u
        br_if 0 (;@2;)
        get_local 5
        call 56
        tee_local 2
        get_local 5
        call 2
        drop
        get_local 2
        call 59
        br 1 (;@1;)
      end
      get_local 2
      get_local 5
      i32.const 15
      i32.add
      i32.const -16
      i32.and
      i32.sub
      tee_local 2
      set_global 0
      get_local 2
      get_local 5
      call 2
      drop
    end
    get_local 0
    get_local 4
    i32.const 1
    i32.shr_s
    i32.add
    set_local 5
    block  ;; label = @1
      get_local 4
      i32.const 1
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      get_local 5
      i32.load
      get_local 1
      i32.add
      i32.load
      set_local 1
    end
    get_local 5
    get_local 1
    call_indirect (type 0)
    get_local 3
    set_global 0
    i32.const 1)
  (func (;36;) (type 0) (param i32)
    i32.const 8264
    call 7)
  (func (;37;) (type 1) (param i32 i32)
    block  ;; label = @1
      get_local 1
      i32.eqz
      br_if 0 (;@1;)
      call 3
      i64.extend_s/i32
      call 4
      return
    end
    i32.const 8256
    call 7)
  (func (;38;) (type 4) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32)
    get_global 0
    i32.const 16
    i32.sub
    tee_local 2
    set_local 3
    get_local 2
    set_global 0
    get_local 1
    i32.load offset=4
    set_local 4
    get_local 1
    i32.load
    set_local 5
    i32.const 0
    set_local 6
    block  ;; label = @1
      call 1
      tee_local 1
      i32.eqz
      br_if 0 (;@1;)
      block  ;; label = @2
        block  ;; label = @3
          get_local 1
          i32.const 513
          i32.lt_u
          br_if 0 (;@3;)
          get_local 1
          call 56
          set_local 6
          br 1 (;@2;)
        end
        get_local 2
        get_local 1
        i32.const 15
        i32.add
        i32.const -16
        i32.and
        i32.sub
        tee_local 6
        set_global 0
      end
      get_local 6
      get_local 1
      call 2
      drop
    end
    get_local 1
    i32.const 0
    i32.ne
    i32.const 8417
    call 0
    get_local 3
    i32.const 15
    i32.add
    get_local 6
    i32.const 1
    call 6
    drop
    get_local 3
    i32.load8_u offset=15
    set_local 2
    block  ;; label = @1
      get_local 1
      i32.const 513
      i32.lt_u
      br_if 0 (;@1;)
      get_local 6
      call 59
    end
    get_local 0
    get_local 4
    i32.const 1
    i32.shr_s
    i32.add
    set_local 1
    block  ;; label = @1
      get_local 4
      i32.const 1
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      get_local 1
      i32.load
      get_local 5
      i32.add
      i32.load
      set_local 5
    end
    get_local 1
    get_local 2
    i32.const 255
    i32.and
    i32.const 0
    i32.ne
    get_local 5
    call_indirect (type 1)
    get_local 3
    i32.const 16
    i32.add
    set_global 0
    i32.const 1)
  (func (;39;) (type 0) (param i32)
    call 3
    i64.extend_s/i32
    call 4)
  (func (;40;) (type 0) (param i32)
    (local i32 i64 i64 i64 i32 i64 i32 i64 i64 i32)
    get_global 0
    i32.const 144
    i32.sub
    tee_local 1
    set_global 0
    call 5
    i64.extend_s/i32
    call 4
    get_local 0
    i64.load
    set_local 2
    i64.const 6
    set_local 3
    loop  ;; label = @1
      get_local 3
      i64.const 1
      i64.add
      tee_local 3
      i64.const 13
      i64.ne
      br_if 0 (;@1;)
    end
    i64.const 0
    set_local 3
    i64.const 59
    set_local 4
    i32.const 8276
    set_local 5
    i64.const 0
    set_local 6
    loop  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                get_local 3
                i64.const 10
                i64.gt_u
                br_if 0 (;@6;)
                get_local 5
                i32.load8_u
                tee_local 7
                i32.const -97
                i32.add
                i32.const 255
                i32.and
                i32.const 25
                i32.gt_u
                br_if 1 (;@5;)
                get_local 7
                i32.const -91
                i32.add
                set_local 7
                br 2 (;@4;)
              end
              i64.const 0
              set_local 8
              get_local 3
              i64.const 11
              i64.eq
              br_if 2 (;@3;)
              br 3 (;@2;)
            end
            get_local 7
            i32.const -48
            i32.add
            i32.const 0
            get_local 7
            i32.const -49
            i32.add
            i32.const 255
            i32.and
            i32.const 5
            i32.lt_u
            select
            set_local 7
          end
          get_local 7
          i64.extend_u/i32
          i64.const 56
          i64.shl
          i64.const 56
          i64.shr_s
          set_local 8
        end
        get_local 8
        i64.const 31
        i64.and
        get_local 4
        i64.const 4294967295
        i64.and
        i64.shl
        set_local 8
      end
      get_local 5
      i32.const 1
      i32.add
      set_local 5
      get_local 4
      i64.const 4294967291
      i64.add
      set_local 4
      get_local 8
      get_local 6
      i64.or
      set_local 6
      get_local 3
      i64.const 1
      i64.add
      tee_local 3
      i64.const 13
      i64.ne
      br_if 0 (;@1;)
    end
    i64.const 0
    set_local 3
    i64.const 59
    set_local 4
    i32.const 8288
    set_local 5
    i64.const 0
    set_local 9
    loop  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                get_local 3
                i64.const 7
                i64.gt_u
                br_if 0 (;@6;)
                get_local 5
                i32.load8_u
                tee_local 7
                i32.const -97
                i32.add
                i32.const 255
                i32.and
                i32.const 25
                i32.gt_u
                br_if 1 (;@5;)
                get_local 7
                i32.const -91
                i32.add
                set_local 7
                br 2 (;@4;)
              end
              i64.const 0
              set_local 8
              get_local 3
              i64.const 11
              i64.le_u
              br_if 2 (;@3;)
              br 3 (;@2;)
            end
            get_local 7
            i32.const -48
            i32.add
            i32.const 0
            get_local 7
            i32.const -49
            i32.add
            i32.const 255
            i32.and
            i32.const 5
            i32.lt_u
            select
            set_local 7
          end
          get_local 7
          i64.extend_u/i32
          i64.const 56
          i64.shl
          i64.const 56
          i64.shr_s
          set_local 8
        end
        get_local 8
        i64.const 31
        i64.and
        get_local 4
        i64.const 4294967295
        i64.and
        i64.shl
        set_local 8
      end
      get_local 5
      i32.const 1
      i32.add
      set_local 5
      get_local 3
      i64.const 1
      i64.add
      set_local 3
      get_local 8
      get_local 9
      i64.or
      set_local 9
      get_local 4
      i64.const 4294967291
      i64.add
      tee_local 4
      i64.const 55834574842
      i64.ne
      br_if 0 (;@1;)
    end
    i32.const 1
    i32.const 8311
    call 0
    i64.const 5459781
    set_local 3
    i32.const 0
    set_local 5
    block  ;; label = @1
      block  ;; label = @2
        loop  ;; label = @3
          get_local 3
          i32.wrap/i64
          i32.const 24
          i32.shl
          i32.const -1073741825
          i32.add
          i32.const 452984830
          i32.gt_u
          br_if 1 (;@2;)
          get_local 3
          i64.const 8
          i64.shr_u
          set_local 8
          block  ;; label = @4
            get_local 3
            i64.const 65280
            i64.and
            i64.const 0
            i64.eq
            br_if 0 (;@4;)
            get_local 8
            set_local 3
            i32.const 1
            set_local 7
            get_local 5
            tee_local 10
            i32.const 1
            i32.add
            set_local 5
            get_local 10
            i32.const 6
            i32.lt_s
            br_if 1 (;@3;)
            br 3 (;@1;)
          end
          get_local 8
          set_local 3
          loop  ;; label = @4
            get_local 3
            i64.const 65280
            i64.and
            i64.const 0
            i64.ne
            br_if 2 (;@2;)
            get_local 3
            i64.const 8
            i64.shr_u
            set_local 3
            get_local 5
            i32.const 6
            i32.lt_s
            set_local 7
            get_local 5
            i32.const 1
            i32.add
            tee_local 10
            set_local 5
            get_local 7
            br_if 0 (;@4;)
          end
          i32.const 1
          set_local 7
          get_local 10
          i32.const 1
          i32.add
          set_local 5
          get_local 10
          i32.const 6
          i32.lt_s
          br_if 0 (;@3;)
          br 2 (;@1;)
        end
      end
      i32.const 0
      set_local 7
    end
    get_local 7
    i32.const 8360
    call 0
    get_local 1
    i32.const 16
    i32.add
    i32.const 0
    i32.store
    get_local 1
    i64.const 0
    i64.store offset=8
    block  ;; label = @1
      block  ;; label = @2
        i32.const 8297
        call 55
        tee_local 5
        i32.const -16
        i32.ge_u
        br_if 0 (;@2;)
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              get_local 5
              i32.const 11
              i32.ge_u
              br_if 0 (;@5;)
              get_local 1
              get_local 5
              i32.const 1
              i32.shl
              i32.store8 offset=8
              get_local 1
              i32.const 8
              i32.add
              i32.const 1
              i32.or
              set_local 7
              get_local 5
              br_if 1 (;@4;)
              br 2 (;@3;)
            end
            get_local 5
            i32.const 16
            i32.add
            i32.const -16
            i32.and
            tee_local 10
            call 48
            set_local 7
            get_local 1
            get_local 10
            i32.const 1
            i32.or
            i32.store offset=8
            get_local 1
            get_local 7
            i32.store offset=16
            get_local 1
            get_local 5
            i32.store offset=12
          end
          get_local 7
          i32.const 8297
          get_local 5
          call 6
          drop
        end
        get_local 7
        get_local 5
        i32.add
        i32.const 0
        i32.store8
        get_local 1
        i32.const 24
        i32.add
        i32.const 24
        i32.add
        i64.const 1397703940
        i64.store
        get_local 1
        i32.const 64
        i32.add
        get_local 1
        i32.const 16
        i32.add
        tee_local 5
        i32.load
        i32.store
        get_local 5
        i32.const 0
        i32.store
        get_local 1
        i64.const 0
        i64.store offset=40
        get_local 1
        get_local 6
        i64.store offset=72
        get_local 1
        get_local 9
        i64.store offset=80
        get_local 1
        get_local 0
        i64.load
        tee_local 3
        i64.store offset=24
        get_local 1
        get_local 3
        i64.store offset=32
        get_local 1
        get_local 1
        i64.load offset=8
        i64.store offset=56
        get_local 1
        i64.const 0
        i64.store offset=8
        i32.const 16
        call 48
        tee_local 5
        get_local 2
        i64.store
        get_local 5
        i64.const 3617214756542218240
        i64.store offset=8
        get_local 1
        i32.const 72
        i32.add
        i32.const 36
        i32.add
        i32.const 0
        i32.store
        get_local 1
        i32.const 72
        i32.add
        i32.const 24
        i32.add
        get_local 5
        i32.const 16
        i32.add
        tee_local 7
        i32.store
        get_local 1
        i32.const 92
        i32.add
        get_local 7
        i32.store
        get_local 1
        get_local 5
        i32.store offset=88
        get_local 1
        i64.const 0
        i64.store offset=100 align=4
        get_local 1
        i32.const 24
        i32.add
        i32.const 36
        i32.add
        i32.load
        get_local 1
        i32.load8_u offset=56
        tee_local 5
        i32.const 1
        i32.shr_u
        get_local 5
        i32.const 1
        i32.and
        select
        tee_local 7
        i32.const 32
        i32.add
        set_local 5
        get_local 7
        i64.extend_u/i32
        set_local 3
        get_local 1
        i32.const 100
        i32.add
        set_local 7
        loop  ;; label = @3
          get_local 5
          i32.const 1
          i32.add
          set_local 5
          get_local 3
          i64.const 7
          i64.shr_u
          tee_local 3
          i64.const 0
          i64.ne
          br_if 0 (;@3;)
        end
        block  ;; label = @3
          block  ;; label = @4
            get_local 5
            i32.eqz
            br_if 0 (;@4;)
            get_local 7
            get_local 5
            call 42
            get_local 1
            i32.const 104
            i32.add
            i32.load
            set_local 7
            get_local 1
            i32.const 100
            i32.add
            i32.load
            set_local 5
            br 1 (;@3;)
          end
          i32.const 0
          set_local 7
          i32.const 0
          set_local 5
        end
        get_local 1
        get_local 5
        i32.store offset=116
        get_local 1
        get_local 5
        i32.store offset=112
        get_local 1
        get_local 7
        i32.store offset=120
        get_local 1
        get_local 1
        i32.const 112
        i32.add
        i32.store offset=128
        get_local 1
        get_local 1
        i32.const 24
        i32.add
        i32.store offset=136
        get_local 1
        i32.const 136
        i32.add
        get_local 1
        i32.const 128
        i32.add
        call 43
        get_local 1
        i32.const 112
        i32.add
        get_local 1
        i32.const 72
        i32.add
        call 44
        get_local 1
        i32.load offset=112
        tee_local 5
        get_local 1
        i32.load offset=116
        get_local 5
        i32.sub
        call 8
        block  ;; label = @3
          get_local 1
          i32.load offset=112
          tee_local 5
          i32.eqz
          br_if 0 (;@3;)
          get_local 1
          get_local 5
          i32.store offset=116
          get_local 5
          call 50
        end
        block  ;; label = @3
          get_local 1
          i32.load offset=100
          tee_local 5
          i32.eqz
          br_if 0 (;@3;)
          get_local 1
          i32.const 104
          i32.add
          get_local 5
          i32.store
          get_local 5
          call 50
        end
        block  ;; label = @3
          get_local 1
          i32.load offset=88
          tee_local 5
          i32.eqz
          br_if 0 (;@3;)
          get_local 1
          i32.const 92
          i32.add
          get_local 5
          i32.store
          get_local 5
          call 50
        end
        block  ;; label = @3
          block  ;; label = @4
            get_local 1
            i32.const 56
            i32.add
            i32.load8_u
            i32.const 1
            i32.and
            br_if 0 (;@4;)
            get_local 1
            i32.load8_u offset=8
            i32.const 1
            i32.and
            br_if 1 (;@3;)
            br 3 (;@1;)
          end
          get_local 1
          i32.const 64
          i32.add
          i32.load
          call 50
          get_local 1
          i32.load8_u offset=8
          i32.const 1
          i32.and
          i32.eqz
          br_if 2 (;@1;)
        end
        get_local 1
        i32.const 16
        i32.add
        i32.load
        call 50
        get_local 1
        i32.const 144
        i32.add
        set_global 0
        return
      end
      get_local 1
      i32.const 8
      i32.add
      call 52
      unreachable
    end
    get_local 1
    i32.const 144
    i32.add
    set_global 0)
  (func (;41;) (type 0) (param i32)
    i32.const 8386
    call 9)
  (func (;42;) (type 1) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              get_local 0
              i32.load offset=8
              tee_local 2
              get_local 0
              i32.load offset=4
              tee_local 3
              i32.sub
              get_local 1
              i32.ge_u
              br_if 0 (;@5;)
              get_local 3
              get_local 0
              i32.load
              tee_local 4
              i32.sub
              tee_local 5
              get_local 1
              i32.add
              tee_local 6
              i32.const -1
              i32.le_s
              br_if 2 (;@3;)
              i32.const 2147483647
              set_local 7
              block  ;; label = @6
                get_local 2
                get_local 4
                i32.sub
                tee_local 2
                i32.const 1073741822
                i32.gt_u
                br_if 0 (;@6;)
                get_local 6
                get_local 2
                i32.const 1
                i32.shl
                tee_local 2
                get_local 2
                get_local 6
                i32.lt_u
                select
                tee_local 7
                i32.eqz
                br_if 2 (;@4;)
              end
              get_local 7
              call 48
              set_local 2
              br 3 (;@2;)
            end
            get_local 0
            i32.const 4
            i32.add
            set_local 0
            loop  ;; label = @5
              get_local 3
              i32.const 0
              i32.store8
              get_local 0
              get_local 0
              i32.load
              i32.const 1
              i32.add
              tee_local 3
              i32.store
              get_local 1
              i32.const -1
              i32.add
              tee_local 1
              br_if 0 (;@5;)
              br 4 (;@1;)
            end
          end
          i32.const 0
          set_local 7
          i32.const 0
          set_local 2
          br 1 (;@2;)
        end
        get_local 0
        call 53
        unreachable
      end
      get_local 2
      get_local 7
      i32.add
      set_local 7
      get_local 3
      get_local 1
      i32.add
      get_local 4
      i32.sub
      set_local 4
      get_local 2
      get_local 5
      i32.add
      tee_local 5
      set_local 3
      loop  ;; label = @2
        get_local 3
        i32.const 0
        i32.store8
        get_local 3
        i32.const 1
        i32.add
        set_local 3
        get_local 1
        i32.const -1
        i32.add
        tee_local 1
        br_if 0 (;@2;)
      end
      get_local 2
      get_local 4
      i32.add
      set_local 4
      get_local 5
      get_local 0
      i32.const 4
      i32.add
      tee_local 6
      i32.load
      get_local 0
      i32.load
      tee_local 1
      i32.sub
      tee_local 3
      i32.sub
      set_local 2
      block  ;; label = @2
        get_local 3
        i32.const 1
        i32.lt_s
        br_if 0 (;@2;)
        get_local 2
        get_local 1
        get_local 3
        call 6
        drop
        get_local 0
        i32.load
        set_local 1
      end
      get_local 0
      get_local 2
      i32.store
      get_local 6
      get_local 4
      i32.store
      get_local 0
      i32.const 8
      i32.add
      get_local 7
      i32.store
      get_local 1
      i32.eqz
      br_if 0 (;@1;)
      get_local 1
      call 50
      return
    end)
  (func (;43;) (type 1) (param i32 i32)
    (local i32 i32)
    get_local 0
    i32.load
    set_local 2
    get_local 1
    i32.load
    tee_local 3
    i32.load offset=8
    get_local 3
    i32.load offset=4
    i32.sub
    i32.const 7
    i32.gt_s
    i32.const 8380
    call 0
    get_local 3
    i32.load offset=4
    get_local 2
    i32.const 8
    call 6
    drop
    get_local 3
    get_local 3
    i32.load offset=4
    i32.const 8
    i32.add
    i32.store offset=4
    get_local 0
    i32.load
    set_local 0
    get_local 1
    i32.load
    tee_local 3
    i32.load offset=8
    get_local 3
    i32.load offset=4
    i32.sub
    i32.const 7
    i32.gt_s
    i32.const 8380
    call 0
    get_local 3
    i32.load offset=4
    get_local 0
    i32.const 8
    i32.add
    i32.const 8
    call 6
    drop
    get_local 3
    get_local 3
    i32.load offset=4
    i32.const 8
    i32.add
    i32.store offset=4
    get_local 1
    i32.load
    tee_local 3
    i32.load offset=8
    get_local 3
    i32.load offset=4
    i32.sub
    i32.const 7
    i32.gt_s
    i32.const 8380
    call 0
    get_local 3
    i32.load offset=4
    get_local 0
    i32.const 16
    i32.add
    i32.const 8
    call 6
    drop
    get_local 3
    get_local 3
    i32.load offset=4
    i32.const 8
    i32.add
    tee_local 2
    i32.store offset=4
    get_local 3
    i32.load offset=8
    get_local 2
    i32.sub
    i32.const 7
    i32.gt_s
    i32.const 8380
    call 0
    get_local 3
    i32.load offset=4
    get_local 0
    i32.const 24
    i32.add
    i32.const 8
    call 6
    drop
    get_local 3
    get_local 3
    i32.load offset=4
    i32.const 8
    i32.add
    i32.store offset=4
    get_local 1
    i32.load
    get_local 0
    i32.const 32
    i32.add
    call 45
    drop)
  (func (;44;) (type 1) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32 i64)
    get_global 0
    i32.const 16
    i32.sub
    tee_local 2
    set_global 0
    get_local 0
    i32.const 0
    i32.store offset=8
    get_local 0
    i64.const 0
    i64.store align=4
    i32.const 16
    set_local 3
    get_local 1
    i32.const 16
    i32.add
    set_local 4
    get_local 1
    i32.const 20
    i32.add
    i32.load
    tee_local 5
    get_local 1
    i32.load offset=16
    tee_local 6
    i32.sub
    tee_local 7
    i32.const 4
    i32.shr_s
    i64.extend_u/i32
    set_local 8
    loop  ;; label = @1
      get_local 3
      i32.const 1
      i32.add
      set_local 3
      get_local 8
      i64.const 7
      i64.shr_u
      tee_local 8
      i64.const 0
      i64.ne
      br_if 0 (;@1;)
    end
    block  ;; label = @1
      get_local 6
      get_local 5
      i32.eq
      br_if 0 (;@1;)
      get_local 7
      i32.const -16
      i32.and
      get_local 3
      i32.add
      set_local 3
    end
    get_local 1
    i32.load offset=28
    tee_local 5
    get_local 3
    i32.sub
    get_local 1
    i32.const 32
    i32.add
    i32.load
    tee_local 6
    i32.sub
    set_local 3
    get_local 1
    i32.const 28
    i32.add
    set_local 7
    get_local 6
    get_local 5
    i32.sub
    i64.extend_u/i32
    set_local 8
    loop  ;; label = @1
      get_local 3
      i32.const -1
      i32.add
      set_local 3
      get_local 8
      i64.const 7
      i64.shr_u
      tee_local 8
      i64.const 0
      i64.ne
      br_if 0 (;@1;)
    end
    i32.const 0
    set_local 5
    block  ;; label = @1
      block  ;; label = @2
        get_local 3
        i32.eqz
        br_if 0 (;@2;)
        get_local 0
        i32.const 0
        get_local 3
        i32.sub
        call 42
        get_local 0
        i32.const 4
        i32.add
        i32.load
        set_local 5
        get_local 0
        i32.load
        set_local 3
        br 1 (;@1;)
      end
      i32.const 0
      set_local 3
    end
    get_local 2
    get_local 3
    i32.store
    get_local 2
    get_local 5
    i32.store offset=8
    get_local 5
    get_local 3
    i32.sub
    tee_local 0
    i32.const 7
    i32.gt_s
    i32.const 8380
    call 0
    get_local 3
    get_local 1
    i32.const 8
    call 6
    drop
    get_local 0
    i32.const -8
    i32.add
    i32.const 7
    i32.gt_s
    i32.const 8380
    call 0
    get_local 3
    i32.const 8
    i32.add
    get_local 1
    i32.const 8
    i32.add
    i32.const 8
    call 6
    drop
    get_local 2
    get_local 3
    i32.const 16
    i32.add
    i32.store offset=4
    get_local 2
    get_local 4
    call 46
    get_local 7
    call 47
    drop
    get_local 2
    i32.const 16
    i32.add
    set_global 0)
  (func (;45;) (type 4) (param i32 i32) (result i32)
    (local i32 i32 i64 i32 i32 i32 i32)
    get_global 0
    i32.const 16
    i32.sub
    tee_local 2
    set_global 0
    get_local 1
    i32.load offset=4
    get_local 1
    i32.load8_u
    tee_local 3
    i32.const 1
    i32.shr_u
    get_local 3
    i32.const 1
    i32.and
    select
    i64.extend_u/i32
    set_local 4
    get_local 0
    i32.load offset=4
    set_local 5
    get_local 0
    i32.const 8
    i32.add
    set_local 6
    get_local 0
    i32.const 4
    i32.add
    set_local 3
    loop  ;; label = @1
      get_local 4
      i32.wrap/i64
      set_local 7
      get_local 2
      get_local 4
      i64.const 7
      i64.shr_u
      tee_local 4
      i64.const 0
      i64.ne
      tee_local 8
      i32.const 7
      i32.shl
      get_local 7
      i32.const 127
      i32.and
      i32.or
      i32.store8 offset=15
      get_local 6
      i32.load
      get_local 5
      i32.sub
      i32.const 0
      i32.gt_s
      i32.const 8380
      call 0
      get_local 3
      i32.load
      get_local 2
      i32.const 15
      i32.add
      i32.const 1
      call 6
      drop
      get_local 3
      get_local 3
      i32.load
      i32.const 1
      i32.add
      tee_local 5
      i32.store
      get_local 8
      br_if 0 (;@1;)
    end
    block  ;; label = @1
      get_local 1
      i32.const 4
      i32.add
      i32.load
      get_local 1
      i32.load8_u
      tee_local 3
      i32.const 1
      i32.shr_u
      get_local 3
      i32.const 1
      i32.and
      tee_local 7
      select
      tee_local 3
      i32.eqz
      br_if 0 (;@1;)
      get_local 1
      i32.load offset=8
      set_local 8
      get_local 0
      i32.const 8
      i32.add
      i32.load
      get_local 5
      i32.sub
      get_local 3
      i32.ge_s
      i32.const 8380
      call 0
      get_local 0
      i32.const 4
      i32.add
      tee_local 5
      i32.load
      get_local 8
      get_local 1
      i32.const 1
      i32.add
      get_local 7
      select
      get_local 3
      call 6
      drop
      get_local 5
      get_local 5
      i32.load
      get_local 3
      i32.add
      i32.store
    end
    get_local 2
    i32.const 16
    i32.add
    set_global 0
    get_local 0)
  (func (;46;) (type 4) (param i32 i32) (result i32)
    (local i32 i64 i32 i32 i32 i32)
    get_global 0
    i32.const 16
    i32.sub
    tee_local 2
    set_global 0
    get_local 1
    i32.load offset=4
    get_local 1
    i32.load
    i32.sub
    i32.const 4
    i32.shr_s
    i64.extend_u/i32
    set_local 3
    get_local 0
    i32.load offset=4
    set_local 4
    get_local 0
    i32.const 8
    i32.add
    set_local 5
    loop  ;; label = @1
      get_local 3
      i32.wrap/i64
      set_local 6
      get_local 2
      get_local 3
      i64.const 7
      i64.shr_u
      tee_local 3
      i64.const 0
      i64.ne
      tee_local 7
      i32.const 7
      i32.shl
      get_local 6
      i32.const 127
      i32.and
      i32.or
      i32.store8 offset=15
      get_local 5
      i32.load
      get_local 4
      i32.sub
      i32.const 0
      i32.gt_s
      i32.const 8380
      call 0
      get_local 0
      i32.const 4
      i32.add
      tee_local 6
      i32.load
      get_local 2
      i32.const 15
      i32.add
      i32.const 1
      call 6
      drop
      get_local 6
      get_local 6
      i32.load
      i32.const 1
      i32.add
      tee_local 4
      i32.store
      get_local 7
      br_if 0 (;@1;)
    end
    block  ;; label = @1
      get_local 1
      i32.load
      tee_local 7
      get_local 1
      i32.const 4
      i32.add
      i32.load
      tee_local 1
      i32.eq
      br_if 0 (;@1;)
      get_local 0
      i32.const 4
      i32.add
      set_local 6
      loop  ;; label = @2
        get_local 0
        i32.const 8
        i32.add
        tee_local 5
        i32.load
        get_local 4
        i32.sub
        i32.const 7
        i32.gt_s
        i32.const 8380
        call 0
        get_local 6
        i32.load
        get_local 7
        i32.const 8
        call 6
        drop
        get_local 6
        get_local 6
        i32.load
        i32.const 8
        i32.add
        tee_local 4
        i32.store
        get_local 5
        i32.load
        get_local 4
        i32.sub
        i32.const 7
        i32.gt_s
        i32.const 8380
        call 0
        get_local 6
        i32.load
        get_local 7
        i32.const 8
        i32.add
        i32.const 8
        call 6
        drop
        get_local 6
        get_local 6
        i32.load
        i32.const 8
        i32.add
        tee_local 4
        i32.store
        get_local 7
        i32.const 16
        i32.add
        tee_local 7
        get_local 1
        i32.ne
        br_if 0 (;@2;)
      end
    end
    get_local 2
    i32.const 16
    i32.add
    set_global 0
    get_local 0)
  (func (;47;) (type 4) (param i32 i32) (result i32)
    (local i32 i64 i32 i32 i32 i32 i32)
    get_global 0
    i32.const 16
    i32.sub
    tee_local 2
    set_global 0
    get_local 1
    i32.load offset=4
    get_local 1
    i32.load
    i32.sub
    i64.extend_u/i32
    set_local 3
    get_local 0
    i32.load offset=4
    set_local 4
    get_local 0
    i32.const 8
    i32.add
    set_local 5
    get_local 0
    i32.const 4
    i32.add
    set_local 6
    loop  ;; label = @1
      get_local 3
      i32.wrap/i64
      set_local 7
      get_local 2
      get_local 3
      i64.const 7
      i64.shr_u
      tee_local 3
      i64.const 0
      i64.ne
      tee_local 8
      i32.const 7
      i32.shl
      get_local 7
      i32.const 127
      i32.and
      i32.or
      i32.store8 offset=15
      get_local 5
      i32.load
      get_local 4
      i32.sub
      i32.const 0
      i32.gt_s
      i32.const 8380
      call 0
      get_local 6
      i32.load
      get_local 2
      i32.const 15
      i32.add
      i32.const 1
      call 6
      drop
      get_local 6
      get_local 6
      i32.load
      i32.const 1
      i32.add
      tee_local 4
      i32.store
      get_local 8
      br_if 0 (;@1;)
    end
    get_local 0
    i32.const 8
    i32.add
    i32.load
    get_local 4
    i32.sub
    get_local 1
    i32.const 4
    i32.add
    i32.load
    get_local 1
    i32.load
    tee_local 7
    i32.sub
    tee_local 6
    i32.ge_s
    i32.const 8380
    call 0
    get_local 0
    i32.const 4
    i32.add
    tee_local 4
    i32.load
    get_local 7
    get_local 6
    call 6
    drop
    get_local 4
    get_local 4
    i32.load
    get_local 6
    i32.add
    i32.store
    get_local 2
    i32.const 16
    i32.add
    set_global 0
    get_local 0)
  (func (;48;) (type 15) (param i32) (result i32)
    (local i32 i32)
    block  ;; label = @1
      get_local 0
      i32.const 1
      get_local 0
      select
      tee_local 1
      call 56
      tee_local 0
      br_if 0 (;@1;)
      loop  ;; label = @2
        i32.const 0
        set_local 0
        i32.const 0
        i32.load offset=8424
        tee_local 2
        i32.eqz
        br_if 1 (;@1;)
        get_local 2
        call_indirect (type 2)
        get_local 1
        call 56
        tee_local 0
        i32.eqz
        br_if 0 (;@2;)
      end
    end
    get_local 0)
  (func (;49;) (type 15) (param i32) (result i32)
    get_local 0
    call 48)
  (func (;50;) (type 0) (param i32)
    block  ;; label = @1
      get_local 0
      i32.eqz
      br_if 0 (;@1;)
      get_local 0
      call 59
    end)
  (func (;51;) (type 0) (param i32)
    get_local 0
    call 50)
  (func (;52;) (type 0) (param i32)
    call 10
    unreachable)
  (func (;53;) (type 0) (param i32)
    call 10
    unreachable)
  (func (;54;) (type 0) (param i32))
  (func (;55;) (type 15) (param i32) (result i32)
    (local i32 i32 i32)
    get_local 0
    set_local 1
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          get_local 0
          i32.const 3
          i32.and
          i32.eqz
          br_if 0 (;@3;)
          get_local 0
          i32.load8_u
          i32.eqz
          br_if 1 (;@2;)
          get_local 0
          i32.const 1
          i32.add
          set_local 1
          loop  ;; label = @4
            get_local 1
            i32.const 3
            i32.and
            i32.eqz
            br_if 1 (;@3;)
            get_local 1
            i32.load8_u
            set_local 2
            get_local 1
            i32.const 1
            i32.add
            tee_local 3
            set_local 1
            get_local 2
            br_if 0 (;@4;)
          end
          get_local 3
          i32.const -1
          i32.add
          get_local 0
          i32.sub
          return
        end
        get_local 1
        i32.const -4
        i32.add
        set_local 1
        loop  ;; label = @3
          get_local 1
          i32.const 4
          i32.add
          tee_local 1
          i32.load
          tee_local 2
          i32.const -1
          i32.xor
          get_local 2
          i32.const -16843009
          i32.add
          i32.and
          i32.const -2139062144
          i32.and
          i32.eqz
          br_if 0 (;@3;)
        end
        get_local 2
        i32.const 255
        i32.and
        i32.eqz
        br_if 1 (;@1;)
        loop  ;; label = @3
          get_local 1
          i32.load8_u offset=1
          set_local 2
          get_local 1
          i32.const 1
          i32.add
          tee_local 3
          set_local 1
          get_local 2
          br_if 0 (;@3;)
        end
        get_local 3
        get_local 0
        i32.sub
        return
      end
      get_local 0
      get_local 0
      i32.sub
      return
    end
    get_local 1
    get_local 0
    i32.sub)
  (func (;56;) (type 15) (param i32) (result i32)
    i32.const 8436
    get_local 0
    call 57)
  (func (;57;) (type 4) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      get_local 1
      i32.eqz
      br_if 0 (;@1;)
      block  ;; label = @2
        get_local 0
        i32.load offset=8384
        tee_local 2
        br_if 0 (;@2;)
        i32.const 16
        set_local 2
        get_local 0
        i32.const 8384
        i32.add
        i32.const 16
        i32.store
      end
      get_local 1
      i32.const 8
      i32.add
      get_local 1
      i32.const 4
      i32.add
      i32.const 7
      i32.and
      tee_local 3
      i32.sub
      get_local 1
      get_local 3
      select
      set_local 3
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            get_local 0
            i32.load offset=8388
            tee_local 4
            get_local 2
            i32.ge_u
            br_if 0 (;@4;)
            get_local 0
            get_local 4
            i32.const 12
            i32.mul
            i32.add
            i32.const 8192
            i32.add
            set_local 1
            block  ;; label = @5
              get_local 4
              br_if 0 (;@5;)
              get_local 0
              i32.const 8196
              i32.add
              tee_local 2
              i32.load
              br_if 0 (;@5;)
              get_local 1
              i32.const 8192
              i32.store
              get_local 2
              get_local 0
              i32.store
            end
            get_local 3
            i32.const 4
            i32.add
            set_local 4
            loop  ;; label = @5
              block  ;; label = @6
                get_local 1
                i32.load offset=8
                tee_local 2
                get_local 4
                i32.add
                get_local 1
                i32.load
                i32.gt_u
                br_if 0 (;@6;)
                get_local 1
                i32.load offset=4
                get_local 2
                i32.add
                tee_local 2
                get_local 2
                i32.load
                i32.const -2147483648
                i32.and
                get_local 3
                i32.or
                i32.store
                get_local 1
                i32.const 8
                i32.add
                tee_local 1
                get_local 1
                i32.load
                get_local 4
                i32.add
                i32.store
                get_local 2
                get_local 2
                i32.load
                i32.const -2147483648
                i32.or
                i32.store
                get_local 2
                i32.const 4
                i32.add
                tee_local 1
                br_if 3 (;@3;)
              end
              get_local 0
              call 58
              tee_local 1
              br_if 0 (;@5;)
            end
          end
          i32.const 2147483644
          get_local 3
          i32.sub
          set_local 5
          get_local 0
          i32.const 8392
          i32.add
          set_local 6
          get_local 0
          i32.const 8384
          i32.add
          set_local 7
          get_local 0
          i32.load offset=8392
          tee_local 8
          set_local 2
          loop  ;; label = @4
            get_local 0
            get_local 2
            i32.const 12
            i32.mul
            i32.add
            tee_local 1
            i32.const 8200
            i32.add
            i32.load
            get_local 1
            i32.const 8192
            i32.add
            tee_local 9
            i32.load
            i32.eq
            i32.const 16832
            call 0
            get_local 1
            i32.const 8196
            i32.add
            i32.load
            tee_local 10
            i32.const 4
            i32.add
            set_local 2
            loop  ;; label = @5
              get_local 10
              get_local 9
              i32.load
              i32.add
              set_local 11
              get_local 2
              i32.const -4
              i32.add
              tee_local 12
              i32.load
              tee_local 13
              i32.const 2147483647
              i32.and
              set_local 1
              block  ;; label = @6
                get_local 13
                i32.const 0
                i32.lt_s
                br_if 0 (;@6;)
                block  ;; label = @7
                  get_local 1
                  get_local 3
                  i32.ge_u
                  br_if 0 (;@7;)
                  loop  ;; label = @8
                    get_local 2
                    get_local 1
                    i32.add
                    tee_local 4
                    get_local 11
                    i32.ge_u
                    br_if 1 (;@7;)
                    get_local 4
                    i32.load
                    tee_local 4
                    i32.const 0
                    i32.lt_s
                    br_if 1 (;@7;)
                    get_local 1
                    get_local 4
                    i32.const 2147483647
                    i32.and
                    i32.add
                    i32.const 4
                    i32.add
                    tee_local 1
                    get_local 3
                    i32.lt_u
                    br_if 0 (;@8;)
                  end
                end
                get_local 12
                get_local 1
                get_local 3
                get_local 1
                get_local 3
                i32.lt_u
                select
                get_local 13
                i32.const -2147483648
                i32.and
                i32.or
                i32.store
                block  ;; label = @7
                  get_local 1
                  get_local 3
                  i32.le_u
                  br_if 0 (;@7;)
                  get_local 2
                  get_local 3
                  i32.add
                  get_local 5
                  get_local 1
                  i32.add
                  i32.const 2147483647
                  i32.and
                  i32.store
                end
                get_local 1
                get_local 3
                i32.ge_u
                br_if 4 (;@2;)
              end
              get_local 2
              get_local 1
              i32.add
              i32.const 4
              i32.add
              tee_local 2
              get_local 11
              i32.lt_u
              br_if 0 (;@5;)
            end
            i32.const 0
            set_local 1
            get_local 6
            i32.const 0
            get_local 6
            i32.load
            i32.const 1
            i32.add
            tee_local 2
            get_local 2
            get_local 7
            i32.load
            i32.eq
            select
            tee_local 2
            i32.store
            get_local 2
            get_local 8
            i32.ne
            br_if 0 (;@4;)
          end
        end
        get_local 1
        return
      end
      get_local 12
      get_local 12
      i32.load
      i32.const -2147483648
      i32.or
      i32.store
      get_local 2
      return
    end
    i32.const 0)
  (func (;58;) (type 15) (param i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32)
    get_local 0
    i32.load offset=8388
    set_local 1
    block  ;; label = @1
      block  ;; label = @2
        i32.const 0
        i32.load8_u offset=8428
        i32.eqz
        br_if 0 (;@2;)
        i32.const 0
        i32.load offset=8432
        set_local 2
        br 1 (;@1;)
      end
      memory.size
      set_local 2
      i32.const 0
      i32.const 1
      i32.store8 offset=8428
      i32.const 0
      get_local 2
      i32.const 16
      i32.shl
      tee_local 2
      i32.store offset=8432
    end
    get_local 2
    set_local 3
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            get_local 2
            i32.const 65535
            i32.add
            i32.const 16
            i32.shr_u
            tee_local 4
            memory.size
            tee_local 5
            i32.le_u
            br_if 0 (;@4;)
            get_local 4
            get_local 5
            i32.sub
            memory.grow
            drop
            i32.const 0
            set_local 5
            get_local 4
            memory.size
            i32.ne
            br_if 1 (;@3;)
            i32.const 0
            i32.load offset=8432
            set_local 3
          end
          i32.const 0
          set_local 5
          i32.const 0
          get_local 3
          i32.store offset=8432
          get_local 2
          i32.const 0
          i32.lt_s
          br_if 0 (;@3;)
          get_local 1
          i32.const 12
          i32.mul
          set_local 4
          block  ;; label = @4
            block  ;; label = @5
              get_local 2
              i32.const 65535
              i32.and
              tee_local 5
              i32.const 64512
              i32.gt_u
              br_if 0 (;@5;)
              get_local 2
              i32.const 65536
              i32.add
              get_local 5
              i32.sub
              set_local 5
              br 1 (;@4;)
            end
            get_local 2
            i32.const 131072
            i32.add
            get_local 2
            i32.const 131071
            i32.and
            i32.sub
            set_local 5
          end
          get_local 0
          get_local 4
          i32.add
          set_local 4
          get_local 5
          get_local 2
          i32.sub
          set_local 2
          block  ;; label = @4
            i32.const 0
            i32.load8_u offset=8428
            br_if 0 (;@4;)
            memory.size
            set_local 3
            i32.const 0
            i32.const 1
            i32.store8 offset=8428
            i32.const 0
            get_local 3
            i32.const 16
            i32.shl
            tee_local 3
            i32.store offset=8432
          end
          get_local 4
          i32.const 8192
          i32.add
          set_local 4
          get_local 2
          i32.const 0
          i32.lt_s
          br_if 1 (;@2;)
          get_local 3
          set_local 6
          block  ;; label = @4
            get_local 2
            i32.const 7
            i32.add
            i32.const -8
            i32.and
            tee_local 7
            get_local 3
            i32.add
            i32.const 65535
            i32.add
            i32.const 16
            i32.shr_u
            tee_local 5
            memory.size
            tee_local 8
            i32.le_u
            br_if 0 (;@4;)
            get_local 5
            get_local 8
            i32.sub
            memory.grow
            drop
            get_local 5
            memory.size
            i32.ne
            br_if 2 (;@2;)
            i32.const 0
            i32.load offset=8432
            set_local 6
          end
          i32.const 0
          get_local 6
          get_local 7
          i32.add
          i32.store offset=8432
          get_local 3
          i32.const -1
          i32.eq
          br_if 1 (;@2;)
          get_local 0
          get_local 1
          i32.const 12
          i32.mul
          i32.add
          tee_local 1
          i32.const 8196
          i32.add
          i32.load
          tee_local 6
          get_local 4
          i32.load
          tee_local 5
          i32.add
          get_local 3
          i32.eq
          br_if 2 (;@1;)
          block  ;; label = @4
            get_local 5
            get_local 1
            i32.const 8200
            i32.add
            tee_local 7
            i32.load
            tee_local 1
            i32.eq
            br_if 0 (;@4;)
            get_local 6
            get_local 1
            i32.add
            tee_local 6
            get_local 6
            i32.load
            i32.const -2147483648
            i32.and
            i32.const -4
            get_local 1
            i32.sub
            get_local 5
            i32.add
            i32.or
            i32.store
            get_local 7
            get_local 4
            i32.load
            i32.store
            get_local 6
            get_local 6
            i32.load
            i32.const 2147483647
            i32.and
            i32.store
          end
          get_local 0
          i32.const 8388
          i32.add
          tee_local 4
          get_local 4
          i32.load
          i32.const 1
          i32.add
          tee_local 4
          i32.store
          get_local 0
          get_local 4
          i32.const 12
          i32.mul
          i32.add
          tee_local 0
          i32.const 8192
          i32.add
          tee_local 5
          get_local 2
          i32.store
          get_local 0
          i32.const 8196
          i32.add
          get_local 3
          i32.store
        end
        get_local 5
        return
      end
      block  ;; label = @2
        get_local 4
        i32.load
        tee_local 5
        get_local 0
        get_local 1
        i32.const 12
        i32.mul
        i32.add
        tee_local 3
        i32.const 8200
        i32.add
        tee_local 1
        i32.load
        tee_local 2
        i32.eq
        br_if 0 (;@2;)
        get_local 3
        i32.const 8196
        i32.add
        i32.load
        get_local 2
        i32.add
        tee_local 3
        get_local 3
        i32.load
        i32.const -2147483648
        i32.and
        i32.const -4
        get_local 2
        i32.sub
        get_local 5
        i32.add
        i32.or
        i32.store
        get_local 1
        get_local 4
        i32.load
        i32.store
        get_local 3
        get_local 3
        i32.load
        i32.const 2147483647
        i32.and
        i32.store
      end
      get_local 0
      get_local 0
      i32.const 8388
      i32.add
      tee_local 2
      i32.load
      i32.const 1
      i32.add
      tee_local 3
      i32.store offset=8384
      get_local 2
      get_local 3
      i32.store
      i32.const 0
      return
    end
    get_local 4
    get_local 5
    get_local 2
    i32.add
    i32.store
    get_local 4)
  (func (;59;) (type 0) (param i32)
    (local i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        get_local 0
        i32.eqz
        br_if 0 (;@2;)
        i32.const 0
        i32.load offset=16820
        tee_local 1
        i32.const 1
        i32.lt_s
        br_if 0 (;@2;)
        i32.const 16628
        set_local 2
        get_local 1
        i32.const 12
        i32.mul
        i32.const 16628
        i32.add
        set_local 3
        loop  ;; label = @3
          get_local 2
          i32.const 4
          i32.add
          i32.load
          tee_local 1
          i32.eqz
          br_if 1 (;@2;)
          block  ;; label = @4
            get_local 1
            i32.const 4
            i32.add
            get_local 0
            i32.gt_u
            br_if 0 (;@4;)
            get_local 1
            get_local 2
            i32.load
            i32.add
            get_local 0
            i32.gt_u
            br_if 3 (;@1;)
          end
          get_local 2
          i32.const 12
          i32.add
          tee_local 2
          get_local 3
          i32.lt_u
          br_if 0 (;@3;)
        end
      end
      return
    end
    get_local 0
    i32.const -4
    i32.add
    tee_local 2
    get_local 2
    i32.load
    i32.const 2147483647
    i32.and
    i32.store)
  (table (;0;) 7 7 anyfunc)
  (memory (;0;) 1)
  (global (;0;) (mut i32) (i32.const 8192))
  (global (;1;) i32 (i32.const 16918))
  (global (;2;) i32 (i32.const 16918))
  (export "memory" (memory 0))
  (export "__heap_base" (global 1))
  (export "__data_end" (global 2))
  (export "apply" (func 33))
  (export "_Znwj" (func 48))
  (export "_ZdlPv" (func 50))
  (export "_Znaj" (func 49))
  (export "_ZdaPv" (func 51))
  (elem (i32.const 1) 34 36 37 39 40 41)
  (data (i32.const 8192) "onerror action's are only valid from the \22eosio\22 system account\00")
  (data (i32.const 8256) "nothing\00")
  (data (i32.const 8264) "hello world\00")
  (data (i32.const 8276) "eosio.token\00")
  (data (i32.const 8288) "transfer\00")
  (data (i32.const 8297) "random::token\00")
  (data (i32.const 8311) "magnitude of asset amount must be less than 2^62\00")
  (data (i32.const 8360) "invalid symbol name\00")
  (data (i32.const 8380) "write\00")
  (data (i32.const 8386) "random::getnow calling logfile\00")
  (data (i32.const 8417) "read\00")
  (data (i32.const 16832) "malloc_from_freed was designed to only be called after _heap was completely allocated\00"))
