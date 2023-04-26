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
        (call $rectangle
            (i32.const 100)
            (i32.const 100)
            (i32.const 300)
            (i32.const 300)
        )
    )
    (export "run" (func $display))
)
