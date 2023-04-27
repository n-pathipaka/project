(module
    (import "cruntime" "circle" (func $circle
        (param  i32)
        (param  i32)
        (param  i32)
    ))
    (import "cruntime" "rectangle" (func $rectangle
        (param  i32)
        (param  i32)
        (param  i32)
        (param  i32)
    ))
    (func $display
        (local $_x i32)
        (local $tmp0 i32)
        (local.set $_x
            (i32.const 9)
        )
        (local.set $tmp0
            (i32.ge_u
                (local.get $_x)
                (i32.const 10)
            )
        )
        (if
            (i32.eq
            (local.get $tmp0)
            (i32.const 1)
            )
                (then
                    (call $circle
                        (i32.const 100)
                        (i32.const 100)
                        (i32.const 100)
                    )
                )
                (else
                )
        )
    )
    (export "run" (func $display))
)
