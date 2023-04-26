(;;

(module
  (import "js" "mem" (memory 16))
  (type $t0 (func (param f32 f32) (result f32)))
  (func $line (param $x f32) (param $y f32) (result f32)
    local.get $x
    f32.const 2.0
    f32.add
  )
  (export "run" (func $line))
)

::)

(;;

(module
  (import "js" "mem" (memory 16))
  (func $line
    ;; declare local variables
    (local $addr i32)
    (local $x i32)
    (local $y i32)

    ;; addr = 0
    i32.const 0
    local.set $addr

    ;; x = 0
    i32.const 0
    local.set $x

    loop                     ;; start loop block

        ;; y = x + 2
        local.get $x
        i32.const 2
        i32.add
        local.set $y

        local.get $addr      ;; read target address from local variable
        local.get $y         ;; read value of y from local variable
        i32.store            ;; write to memory

        ;; addr += 4
        local.get $addr
        i32.const 4
        i32.add
        local.set $addr

        ;; x += 1
        local.get $x
        i32.const 1
        i32.add
        local.set $x

        ;; if( x != 513 ) then continue looping
        local.get $x
        i32.const 513
        i32.ne               ;; is x != 513 ?
        br_if 0              ;; if yes then continue 0th (current) block

    end

  )
  (export "run" (func $line))
)
::)


