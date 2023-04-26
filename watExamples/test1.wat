(module
(import "js" "drawCircle" (func $drawCircle (param $x i32) (param $y i32) (param $r i32)))
(import "js" "mem" (memory 16))
   (func $display
    (local $x i32)
    (local $y i32)
    (local $r i32)
    i32.const 0
    local.set $x
    i32.const 0
    local.set $y
    i32.const 10
    local.set $r
    local.get $x
    local.get $y
    local.get $r
    call $drawCircle
   )
   (export "run" (func $display))

)