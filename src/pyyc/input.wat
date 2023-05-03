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
    (import "cruntime" "clear" (func $clear
    ))
    (import "cruntime" "color" (func $color
        (param  i32)
        (param  i32)
        (param  i32)
    ))
    (import "cruntime" "fill_rectangle" (func $fill_rectangle
        (param  i32)
        (param  i32)
        (param  i32)
        (param  i32)
    ))
    (import "cruntime" "fill_circle" (func $fill_circle
        (param  i32)
        (param  i32)
        (param  i32)
    ))
    (import "cruntime" "rotate" (func $rotate
        (param  i32)
    ))
    (import "cruntime" "line" (func $line
        (param  i32)
        (param  i32)
        (param  i32)
        (param  i32)
        (param  i32)
    ))
    (func $display
        (local $_window_width i32)
        (local $_window_height i32)
        (local $_mid_x i32)
        (local $_mid_y i32)
        (local $_head_size i32)
        (local $tmp0 i32)
        (local $tmp1 i32)
        (local.set $_window_width
            (i32.const 1024)
        )
        (local.set $_window_height
            (i32.const 712)
        )
        (local.set $_mid_x
            (i32.div_u
                (local.get $_window_width)
                (i32.const 2)
            )
        )
        (local.set $_mid_y
            (i32.div_u
                (local.get $_window_height)
                (i32.const 2)
            )
        )
        (local.set $_head_size
            (i32.div_u
                (local.get $_window_height)
                (i32.const 3)
            )
        )
        (call $circle
            (local.get $_mid_x)
            (local.get $_mid_y)
            (local.get $_head_size)
        )
        (call $rotate
            (i32.const 45)
        )
        (local.set $tmp0
            (i32.div_u
                (local.get $_head_size)
                (i32.const 2)
            )
        )
        (local.set $tmp1
            (i32.add
                (local.get $_mid_y)
                (local.get $tmp0)
            )
        )
        (call $fill_rectangle
            (local.get $_mid_x)
            (local.get $tmp1)
            (i32.const 20)
            (i32.const 100)
        )
    )
    (export "run" (func $display))
)
