(module
  (type (;0;) (func (param i32 i64 i64)))
  (type (;1;) (func))
  (type (;2;) (func (param i32 i32)))
  (type (;3;) (func (param i32)))
  (type (;4;) (func (result i32)))
  (type (;5;) (func (param i32 i32) (result i32)))
  (type (;6;) (func (param i32 i32 i32) (result i32)))
  (type (;7;) (func (param i64 i64 i64 i64) (result i32)))
  (type (;8;) (func (param i32 i64 i64 i64 i64)))
  (type (;9;) (func (param i64 i64) (result i32)))
  (type (;10;) (func (param i32 f64)))
  (type (;11;) (func (param i32 f32)))
  (type (;12;) (func (param i64 i64) (result f64)))
  (type (;13;) (func (param i64 i64) (result f32)))
  (type (;14;) (func (param i64 i64 i64)))
  (type (;15;) (func (param i32 i32 i32)))
  (type (;16;) (func (param i32) (result i32)))
  (import "env" "eosio_assert" (func (;0;) (type 2)))
  (import "env" "prints" (func (;1;) (type 3)))
  (import "env" "action_data_size" (func (;2;) (type 4)))
  (import "env" "read_action_data" (func (;3;) (type 5)))
  (import "env" "memcpy" (func (;4;) (type 6)))
  (import "env" "abort" (func (;5;) (type 1)))
  (import "env" "memset" (func (;6;) (type 6)))
  (import "env" "memmove" (func (;7;) (type 6)))
  (import "env" "__unordtf2" (func (;8;) (type 7)))
  (import "env" "__eqtf2" (func (;9;) (type 7)))
  (import "env" "__multf3" (func (;10;) (type 8)))
  (import "env" "__addtf3" (func (;11;) (type 8)))
  (import "env" "__subtf3" (func (;12;) (type 8)))
  (import "env" "__netf2" (func (;13;) (type 7)))
  (import "env" "__fixunstfsi" (func (;14;) (type 9)))
  (import "env" "__floatunsitf" (func (;15;) (type 2)))
  (import "env" "__fixtfsi" (func (;16;) (type 9)))
  (import "env" "__floatsitf" (func (;17;) (type 2)))
  (import "env" "__extenddftf2" (func (;18;) (type 10)))
  (import "env" "__extendsftf2" (func (;19;) (type 11)))
  (import "env" "__divtf3" (func (;20;) (type 8)))
  (import "env" "__letf2" (func (;21;) (type 7)))
  (import "env" "__trunctfdf2" (func (;22;) (type 12)))
  (import "env" "__getf2" (func (;23;) (type 7)))
  (import "env" "__trunctfsf2" (func (;24;) (type 13)))
  (import "env" "set_blockchain_parameters_packed" (func (;25;) (type 2)))
  (import "env" "get_blockchain_parameters_packed" (func (;26;) (type 5)))
  (func (;27;) (type 1))
  (func (;28;) (type 14) (param i64 i64 i64)
    (local i32 i64 i64 i32 i64 i32 i64)
    get_global 0
    i32.const 32
    i32.sub
    tee_local 3
    set_global 0
    call 27
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
        i64.eq
        br_if 0 (;@2;)
        i64.const 0
        set_local 4
        i64.const 59
        set_local 5
        i32.const 8256
        set_local 6
        i64.const 0
        set_local 7
        loop  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    get_local 4
                    i64.const 10
                    i64.gt_u
                    br_if 0 (;@8;)
                    get_local 6
                    i32.load8_u
                    tee_local 8
                    i32.const -97
                    i32.add
                    i32.const 255
                    i32.and
                    i32.const 25
                    i32.gt_u
                    br_if 1 (;@7;)
                    get_local 8
                    i32.const -91
                    i32.add
                    set_local 8
                    br 2 (;@6;)
                  end
                  i64.const 0
                  set_local 9
                  get_local 4
                  i64.const 11
                  i64.eq
                  br_if 2 (;@5;)
                  br 3 (;@4;)
                end
                get_local 8
                i32.const -48
                i32.add
                i32.const 0
                get_local 8
                i32.const -49
                i32.add
                i32.const 255
                i32.and
                i32.const 5
                i32.lt_u
                select
                set_local 8
              end
              get_local 8
              i64.extend_u/i32
              i64.const 56
              i64.shl
              i64.const 56
              i64.shr_s
              set_local 9
            end
            get_local 9
            i64.const 31
            i64.and
            get_local 5
            i64.const 4294967295
            i64.and
            i64.shl
            set_local 9
          end
          get_local 6
          i32.const 1
          i32.add
          set_local 6
          get_local 5
          i64.const 4294967291
          i64.add
          set_local 5
          get_local 9
          get_local 7
          i64.or
          set_local 7
          get_local 4
          i64.const 1
          i64.add
          tee_local 4
          i64.const 13
          i64.ne
          br_if 0 (;@3;)
        end
        get_local 7
        get_local 1
        i64.ne
        br_if 1 (;@1;)
      end
      get_local 3
      get_local 0
      i64.store offset=24
      get_local 2
      i64.const -3617168760277827584
      i64.ne
      br_if 0 (;@1;)
      get_local 3
      i32.const 0
      i32.store offset=20
      get_local 3
      i32.const 1
      i32.store offset=16
      get_local 3
      get_local 3
      i64.load offset=16
      i64.store offset=8
      get_local 3
      i32.const 24
      i32.add
      get_local 3
      i32.const 8
      i32.add
      call 30
      drop
    end
    i32.const 8268
    call 1
    i32.const 0
    call 44
    get_local 3
    i32.const 32
    i32.add
    set_global 0)
  (func (;29;) (type 0) (param i32 i64 i64)
    (local i32)
    get_global 0
    i32.const 48
    i32.sub
    tee_local 3
    set_global 0
    i32.const 8291
    call 1
    get_local 3
    call 31
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          get_local 3
          i64.load offset=8
          get_local 0
          i64.load
          i64.ne
          br_if 0 (;@3;)
          i32.const 8316
          call 1
          get_local 3
          i32.load8_u offset=32
          i32.const 1
          i32.and
          br_if 1 (;@2;)
          br 2 (;@1;)
        end
        i32.const 8320
        call 1
        get_local 3
        i32.load8_u offset=32
        i32.const 1
        i32.and
        i32.eqz
        br_if 1 (;@1;)
      end
      get_local 3
      i32.const 40
      i32.add
      i32.load
      call 39
    end
    get_local 3
    i32.const 48
    i32.add
    set_global 0)
  (func (;30;) (type 5) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i64 i64)
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
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            call 2
            tee_local 1
            i32.eqz
            br_if 0 (;@4;)
            get_local 1
            i32.const 513
            i32.lt_u
            br_if 1 (;@3;)
            get_local 1
            call 45
            set_local 2
            br 2 (;@2;)
          end
          i32.const 0
          set_local 2
          br 2 (;@1;)
        end
        get_local 2
        get_local 1
        i32.const 15
        i32.add
        i32.const -16
        i32.and
        i32.sub
        tee_local 2
        set_global 0
      end
      get_local 2
      get_local 1
      call 3
      drop
    end
    get_local 3
    i64.const 0
    i64.store offset=8
    get_local 3
    i64.const 0
    i64.store
    get_local 1
    i32.const 7
    i32.gt_u
    i32.const 8392
    call 0
    get_local 3
    get_local 2
    i32.const 8
    call 4
    drop
    get_local 1
    i32.const -8
    i32.and
    i32.const 8
    i32.ne
    i32.const 8392
    call 0
    get_local 3
    i32.const 8
    i32.add
    tee_local 6
    get_local 2
    i32.const 8
    i32.add
    i32.const 8
    call 4
    drop
    block  ;; label = @1
      get_local 1
      i32.const 513
      i32.lt_u
      br_if 0 (;@1;)
      get_local 2
      call 48
    end
    get_local 0
    get_local 4
    i32.const 1
    i32.shr_s
    i32.add
    set_local 1
    get_local 6
    i64.load
    set_local 7
    get_local 3
    i64.load
    set_local 8
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
    get_local 8
    get_local 7
    get_local 5
    call_indirect (type 0)
    get_local 3
    i32.const 16
    i32.add
    set_global 0
    i32.const 1)
  (func (;31;) (type 3) (param i32)
    (local i32 i32 i32)
    get_global 0
    tee_local 1
    set_local 2
    block  ;; label = @1
      call 2
      tee_local 3
      i32.const 513
      i32.lt_u
      br_if 0 (;@1;)
      get_local 3
      call 45
      tee_local 1
      get_local 3
      call 3
      drop
      get_local 0
      get_local 1
      get_local 3
      call 32
      get_local 2
      set_global 0
      return
    end
    get_local 1
    get_local 3
    i32.const 15
    i32.add
    i32.const -16
    i32.and
    i32.sub
    tee_local 1
    set_global 0
    get_local 1
    get_local 3
    call 3
    drop
    get_local 0
    get_local 1
    get_local 3
    call 32
    get_local 2
    set_global 0)
  (func (;32;) (type 15) (param i32 i32 i32)
    (local i32 i64 i32 i64 i32 i32)
    get_global 0
    i32.const 48
    i32.sub
    tee_local 3
    set_global 0
    get_local 0
    i64.const 0
    i64.store offset=16
    get_local 0
    i32.const 24
    i32.add
    i64.const 1398362884
    i64.store
    i32.const 1
    i32.const 8323
    call 0
    i64.const 5462355
    set_local 4
    i32.const 0
    set_local 5
    block  ;; label = @1
      block  ;; label = @2
        loop  ;; label = @3
          get_local 4
          i32.wrap/i64
          i32.const 24
          i32.shl
          i32.const -1073741825
          i32.add
          i32.const 452984830
          i32.gt_u
          br_if 1 (;@2;)
          get_local 4
          i64.const 8
          i64.shr_u
          set_local 6
          block  ;; label = @4
            get_local 4
            i64.const 65280
            i64.and
            i64.const 0
            i64.eq
            br_if 0 (;@4;)
            get_local 6
            set_local 4
            i32.const 1
            set_local 7
            get_local 5
            tee_local 8
            i32.const 1
            i32.add
            set_local 5
            get_local 8
            i32.const 6
            i32.lt_s
            br_if 1 (;@3;)
            br 3 (;@1;)
          end
          get_local 6
          set_local 4
          loop  ;; label = @4
            get_local 4
            i64.const 65280
            i64.and
            i64.const 0
            i64.ne
            br_if 2 (;@2;)
            get_local 4
            i64.const 8
            i64.shr_u
            set_local 4
            get_local 5
            i32.const 6
            i32.lt_s
            set_local 7
            get_local 5
            i32.const 1
            i32.add
            tee_local 8
            set_local 5
            get_local 7
            br_if 0 (;@4;)
          end
          i32.const 1
          set_local 7
          get_local 8
          i32.const 1
          i32.add
          set_local 5
          get_local 8
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
    i32.const 8372
    call 0
    get_local 0
    i32.const 40
    i32.add
    i32.const 0
    i32.store
    get_local 0
    i64.const 0
    i64.store offset=32 align=4
    get_local 3
    get_local 1
    i32.store offset=12
    get_local 3
    get_local 1
    i32.store offset=8
    get_local 3
    get_local 1
    get_local 2
    i32.add
    i32.store offset=16
    get_local 3
    get_local 3
    i32.const 8
    i32.add
    i32.store offset=24
    get_local 3
    get_local 0
    i32.const 8
    i32.add
    i32.store offset=36
    get_local 3
    get_local 0
    i32.store offset=32
    get_local 3
    get_local 0
    i32.const 16
    i32.add
    i32.store offset=40
    get_local 3
    get_local 0
    i32.const 32
    i32.add
    i32.store offset=44
    get_local 3
    i32.const 32
    i32.add
    get_local 3
    i32.const 24
    i32.add
    call 33
    get_local 3
    i32.const 48
    i32.add
    set_global 0)
  (func (;33;) (type 2) (param i32 i32)
    (local i32 i32 i32)
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
    i32.gt_u
    i32.const 8392
    call 0
    get_local 2
    get_local 3
    i32.load offset=4
    i32.const 8
    call 4
    drop
    get_local 3
    get_local 3
    i32.load offset=4
    i32.const 8
    i32.add
    i32.store offset=4
    get_local 0
    i32.load offset=4
    set_local 2
    get_local 1
    i32.load
    tee_local 3
    i32.load offset=8
    get_local 3
    i32.load offset=4
    i32.sub
    i32.const 7
    i32.gt_u
    i32.const 8392
    call 0
    get_local 2
    get_local 3
    i32.load offset=4
    i32.const 8
    call 4
    drop
    get_local 3
    get_local 3
    i32.load offset=4
    i32.const 8
    i32.add
    i32.store offset=4
    get_local 0
    i32.load offset=8
    set_local 2
    get_local 1
    i32.load
    tee_local 3
    i32.load offset=8
    get_local 3
    i32.load offset=4
    i32.sub
    i32.const 7
    i32.gt_u
    i32.const 8392
    call 0
    get_local 2
    get_local 3
    i32.load offset=4
    i32.const 8
    call 4
    drop
    get_local 3
    get_local 3
    i32.load offset=4
    i32.const 8
    i32.add
    tee_local 4
    i32.store offset=4
    get_local 3
    i32.load offset=8
    get_local 4
    i32.sub
    i32.const 7
    i32.gt_u
    i32.const 8392
    call 0
    get_local 2
    i32.const 8
    i32.add
    get_local 3
    i32.load offset=4
    i32.const 8
    call 4
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
    i32.load offset=12
    call 34
    drop)
  (func (;34;) (type 5) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32)
    get_global 0
    i32.const 32
    i32.sub
    tee_local 2
    set_global 0
    get_local 2
    i32.const 0
    i32.store offset=24
    get_local 2
    i64.const 0
    i64.store offset=16
    get_local 0
    get_local 2
    i32.const 16
    i32.add
    call 35
    drop
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    get_local 2
                    i32.load offset=20
                    get_local 2
                    i32.load offset=16
                    tee_local 3
                    i32.sub
                    tee_local 4
                    i32.eqz
                    br_if 0 (;@8;)
                    get_local 2
                    i32.const 8
                    i32.add
                    i32.const 0
                    i32.store
                    get_local 2
                    i64.const 0
                    i64.store
                    get_local 4
                    i32.const -16
                    i32.ge_u
                    br_if 5 (;@3;)
                    get_local 4
                    i32.const 10
                    i32.gt_u
                    br_if 1 (;@7;)
                    get_local 2
                    get_local 4
                    i32.const 1
                    i32.shl
                    i32.store8
                    get_local 2
                    i32.const 1
                    i32.or
                    set_local 5
                    br 2 (;@6;)
                  end
                  get_local 1
                  i32.load8_u
                  i32.const 1
                  i32.and
                  br_if 2 (;@5;)
                  get_local 1
                  i32.const 0
                  i32.store16
                  get_local 1
                  i32.const 8
                  i32.add
                  set_local 3
                  br 3 (;@4;)
                end
                get_local 4
                i32.const 16
                i32.add
                i32.const -16
                i32.and
                tee_local 6
                call 37
                set_local 5
                get_local 2
                get_local 6
                i32.const 1
                i32.or
                i32.store
                get_local 2
                get_local 5
                i32.store offset=8
                get_local 2
                get_local 4
                i32.store offset=4
              end
              get_local 4
              set_local 7
              get_local 5
              set_local 6
              loop  ;; label = @6
                get_local 6
                get_local 3
                i32.load8_u
                i32.store8
                get_local 6
                i32.const 1
                i32.add
                set_local 6
                get_local 3
                i32.const 1
                i32.add
                set_local 3
                get_local 7
                i32.const -1
                i32.add
                tee_local 7
                br_if 0 (;@6;)
              end
              get_local 5
              get_local 4
              i32.add
              i32.const 0
              i32.store8
              block  ;; label = @6
                block  ;; label = @7
                  get_local 1
                  i32.load8_u
                  i32.const 1
                  i32.and
                  br_if 0 (;@7;)
                  get_local 1
                  i32.const 0
                  i32.store16
                  br 1 (;@6;)
                end
                get_local 1
                i32.load offset=8
                i32.const 0
                i32.store8
                get_local 1
                i32.const 0
                i32.store offset=4
              end
              get_local 1
              i32.const 0
              call 42
              get_local 1
              i32.const 8
              i32.add
              get_local 2
              i32.const 8
              i32.add
              i32.load
              i32.store
              get_local 1
              get_local 2
              i64.load
              i64.store align=4
              get_local 2
              i32.load offset=16
              tee_local 3
              i32.eqz
              br_if 4 (;@1;)
              br 3 (;@2;)
            end
            get_local 1
            i32.load offset=8
            i32.const 0
            i32.store8
            get_local 1
            i32.const 0
            i32.store offset=4
            get_local 1
            i32.const 8
            i32.add
            set_local 3
          end
          get_local 1
          i32.const 0
          call 42
          get_local 3
          i32.const 0
          i32.store
          get_local 1
          i64.const 0
          i64.store align=4
          get_local 2
          i32.load offset=16
          tee_local 3
          br_if 1 (;@2;)
          br 2 (;@1;)
        end
        get_local 2
        call 41
        unreachable
      end
      get_local 2
      get_local 3
      i32.store offset=20
      get_local 3
      call 39
    end
    get_local 2
    i32.const 32
    i32.add
    set_global 0
    get_local 0)
  (func (;35;) (type 5) (param i32 i32) (result i32)
    (local i32 i32 i64 i32 i32 i32)
    get_local 0
    i32.load offset=4
    set_local 2
    i32.const 0
    set_local 3
    i64.const 0
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
      get_local 2
      get_local 5
      i32.load
      i32.lt_u
      i32.const 8397
      call 0
      get_local 6
      i32.load
      tee_local 2
      i32.load8_u
      set_local 7
      get_local 6
      get_local 2
      i32.const 1
      i32.add
      tee_local 2
      i32.store
      get_local 4
      get_local 7
      i32.const 127
      i32.and
      get_local 3
      i32.const 255
      i32.and
      tee_local 3
      i32.shl
      i64.extend_u/i32
      i64.or
      set_local 4
      get_local 3
      i32.const 7
      i32.add
      set_local 3
      get_local 7
      i32.const 128
      i32.and
      br_if 0 (;@1;)
    end
    block  ;; label = @1
      block  ;; label = @2
        get_local 1
        i32.load offset=4
        tee_local 3
        get_local 1
        i32.load
        tee_local 7
        i32.sub
        tee_local 5
        get_local 4
        i32.wrap/i64
        tee_local 6
        i32.ge_u
        br_if 0 (;@2;)
        get_local 1
        get_local 6
        get_local 5
        i32.sub
        call 36
        get_local 0
        i32.const 4
        i32.add
        i32.load
        set_local 2
        get_local 1
        i32.const 4
        i32.add
        i32.load
        set_local 3
        get_local 1
        i32.load
        set_local 7
        br 1 (;@1;)
      end
      get_local 5
      get_local 6
      i32.le_u
      br_if 0 (;@1;)
      get_local 1
      i32.const 4
      i32.add
      get_local 7
      get_local 6
      i32.add
      tee_local 3
      i32.store
    end
    get_local 0
    i32.const 8
    i32.add
    i32.load
    get_local 2
    i32.sub
    get_local 3
    get_local 7
    i32.sub
    tee_local 2
    i32.ge_u
    i32.const 8392
    call 0
    get_local 7
    get_local 0
    i32.const 4
    i32.add
    tee_local 3
    i32.load
    get_local 2
    call 4
    drop
    get_local 3
    get_local 3
    i32.load
    get_local 2
    i32.add
    i32.store
    get_local 0)
  (func (;36;) (type 2) (param i32 i32)
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
              call 37
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
        call 43
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
        call 4
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
      call 39
      return
    end)
  (func (;37;) (type 16) (param i32) (result i32)
    (local i32 i32)
    block  ;; label = @1
      get_local 0
      i32.const 1
      get_local 0
      select
      tee_local 1
      call 45
      tee_local 0
      br_if 0 (;@1;)
      loop  ;; label = @2
        i32.const 0
        set_local 0
        i32.const 0
        i32.load offset=8404
        tee_local 2
        i32.eqz
        br_if 1 (;@1;)
        get_local 2
        call_indirect (type 1)
        get_local 1
        call 45
        tee_local 0
        i32.eqz
        br_if 0 (;@2;)
      end
    end
    get_local 0)
  (func (;38;) (type 16) (param i32) (result i32)
    get_local 0
    call 37)
  (func (;39;) (type 3) (param i32)
    block  ;; label = @1
      get_local 0
      i32.eqz
      br_if 0 (;@1;)
      get_local 0
      call 48
    end)
  (func (;40;) (type 3) (param i32)
    get_local 0
    call 39)
  (func (;41;) (type 3) (param i32)
    call 5
    unreachable)
  (func (;42;) (type 2) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            get_local 1
            i32.const -16
            i32.ge_u
            br_if 0 (;@4;)
            block  ;; label = @5
              block  ;; label = @6
                get_local 0
                i32.load8_u
                tee_local 2
                i32.const 1
                i32.and
                br_if 0 (;@6;)
                get_local 2
                i32.const 1
                i32.shr_u
                set_local 3
                i32.const 10
                set_local 4
                br 1 (;@5;)
              end
              get_local 0
              i32.load
              tee_local 2
              i32.const -2
              i32.and
              i32.const -1
              i32.add
              set_local 4
              get_local 0
              i32.load offset=4
              set_local 3
            end
            i32.const 10
            set_local 5
            block  ;; label = @5
              get_local 3
              get_local 1
              get_local 3
              get_local 1
              i32.gt_u
              select
              tee_local 1
              i32.const 11
              i32.lt_u
              br_if 0 (;@5;)
              get_local 1
              i32.const 16
              i32.add
              i32.const -16
              i32.and
              i32.const -1
              i32.add
              set_local 5
            end
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  get_local 5
                  get_local 4
                  i32.eq
                  br_if 0 (;@7;)
                  block  ;; label = @8
                    get_local 5
                    i32.const 10
                    i32.ne
                    br_if 0 (;@8;)
                    i32.const 1
                    set_local 6
                    get_local 0
                    i32.const 1
                    i32.add
                    set_local 1
                    get_local 0
                    i32.load offset=8
                    set_local 4
                    i32.const 0
                    set_local 7
                    i32.const 1
                    set_local 8
                    get_local 2
                    i32.const 1
                    i32.and
                    br_if 3 (;@5;)
                    br 5 (;@3;)
                  end
                  get_local 5
                  i32.const 1
                  i32.add
                  call 37
                  set_local 1
                  get_local 5
                  get_local 4
                  i32.gt_u
                  br_if 1 (;@6;)
                  get_local 1
                  br_if 1 (;@6;)
                end
                return
              end
              block  ;; label = @6
                get_local 0
                i32.load8_u
                tee_local 2
                i32.const 1
                i32.and
                br_if 0 (;@6;)
                i32.const 1
                set_local 7
                get_local 0
                i32.const 1
                i32.add
                set_local 4
                i32.const 0
                set_local 6
                i32.const 1
                set_local 8
                get_local 2
                i32.const 1
                i32.and
                i32.eqz
                br_if 3 (;@3;)
                br 1 (;@5;)
              end
              get_local 0
              i32.load offset=8
              set_local 4
              i32.const 1
              set_local 6
              i32.const 1
              set_local 7
              i32.const 1
              set_local 8
              get_local 2
              i32.const 1
              i32.and
              i32.eqz
              br_if 2 (;@3;)
            end
            get_local 0
            i32.load offset=4
            i32.const 1
            i32.add
            tee_local 2
            i32.eqz
            br_if 3 (;@1;)
            br 2 (;@2;)
          end
          call 5
          unreachable
        end
        get_local 2
        i32.const 254
        i32.and
        get_local 8
        i32.shr_u
        i32.const 1
        i32.add
        tee_local 2
        i32.eqz
        br_if 1 (;@1;)
      end
      get_local 1
      get_local 4
      get_local 2
      call 4
      drop
    end
    block  ;; label = @1
      get_local 6
      i32.eqz
      br_if 0 (;@1;)
      get_local 4
      call 39
    end
    block  ;; label = @1
      get_local 7
      i32.eqz
      br_if 0 (;@1;)
      get_local 0
      get_local 3
      i32.store offset=4
      get_local 0
      get_local 1
      i32.store offset=8
      get_local 0
      get_local 5
      i32.const 1
      i32.add
      i32.const 1
      i32.or
      i32.store
      return
    end
    get_local 0
    get_local 3
    i32.const 1
    i32.shl
    i32.store8)
  (func (;43;) (type 3) (param i32)
    call 5
    unreachable)
  (func (;44;) (type 3) (param i32))
  (func (;45;) (type 16) (param i32) (result i32)
    i32.const 8416
    get_local 0
    call 46)
  (func (;46;) (type 5) (param i32 i32) (result i32)
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
              call 47
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
            i32.const 16812
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
  (func (;47;) (type 16) (param i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32)
    get_local 0
    i32.load offset=8388
    set_local 1
    block  ;; label = @1
      block  ;; label = @2
        i32.const 0
        i32.load8_u offset=8408
        i32.eqz
        br_if 0 (;@2;)
        i32.const 0
        i32.load offset=8412
        set_local 2
        br 1 (;@1;)
      end
      memory.size
      set_local 2
      i32.const 0
      i32.const 1
      i32.store8 offset=8408
      i32.const 0
      get_local 2
      i32.const 16
      i32.shl
      tee_local 2
      i32.store offset=8412
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
            i32.load offset=8412
            set_local 3
          end
          i32.const 0
          set_local 5
          i32.const 0
          get_local 3
          i32.store offset=8412
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
            i32.load8_u offset=8408
            br_if 0 (;@4;)
            memory.size
            set_local 3
            i32.const 0
            i32.const 1
            i32.store8 offset=8408
            i32.const 0
            get_local 3
            i32.const 16
            i32.shl
            tee_local 3
            i32.store offset=8412
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
            i32.load offset=8412
            set_local 6
          end
          i32.const 0
          get_local 6
          get_local 7
          i32.add
          i32.store offset=8412
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
  (func (;48;) (type 3) (param i32)
    (local i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        get_local 0
        i32.eqz
        br_if 0 (;@2;)
        i32.const 0
        i32.load offset=16800
        tee_local 1
        i32.const 1
        i32.lt_s
        br_if 0 (;@2;)
        i32.const 16608
        set_local 2
        get_local 1
        i32.const 12
        i32.mul
        i32.const 16608
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
  (table (;0;) 2 2 anyfunc)
  (memory (;0;) 1)
  (global (;0;) (mut i32) (i32.const 8192))
  (global (;1;) i32 (i32.const 16898))
  (global (;2;) i32 (i32.const 16898))
  (export "memory" (memory 0))
  (export "__heap_base" (global 1))
  (export "__data_end" (global 2))
  (export "apply" (func 28))
  (export "_ZdlPv" (func 39))
  (export "_Znwj" (func 37))
  (export "_Znaj" (func 38))
  (export "_ZdaPv" (func 40))
  (elem (i32.const 1) 29)
  (data (i32.const 8192) "onerror action's are only valid from the \22eosio\22 system account\00")
  (data (i32.const 8256) "eosio.token\00")
  (data (i32.const 8268) "end of notified::apply\00")
  (data (i32.const 8291) "in notified::transfer - \00")
  (data (i32.const 8316) "yes\00")
  (data (i32.const 8320) "no\00")
  (data (i32.const 8323) "magnitude of asset amount must be less than 2^62\00")
  (data (i32.const 8372) "invalid symbol name\00")
  (data (i32.const 8392) "read\00")
  (data (i32.const 8397) "get\00")
  (data (i32.const 16812) "malloc_from_freed was designed to only be called after _heap was completely allocated\00"))
