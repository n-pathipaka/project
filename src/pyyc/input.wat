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
        (local $tmp0 i32)
        (local $tmp1 i32)
        (local $tmp2 i32)
        (local $tmp3 i32)
        (local $tmp4 i32)
        (local $tmp5 i32)
        (local $tmp6 i32)
        (local $tmp7 i32)
        (local $tmp8 i32)
        (local $tmp9 i32)
        (local $tmp10 i32)
        (local $tmp11 i32)
        (local $tmp12 i32)
        (local $_y_glasses i32)
        (local $tmp13 i32)
        (local $tmp14 i32)
        (local $tmp15 i32)
        (local $tmp16 i32)
        (local $tmp17 i32)
        (local $tmp18 i32)
        (local $tmp19 i32)
        (local $tmp20 i32)
        (local $tmp21 i32)
        (local $tmp22 i32)
        (local $tmp23 i32)
        (local $tmp24 i32)
        (local $tmp25 i32)
        (local $tmp26 i32)
        (local $tmp27 i32)
        (local $tmp28 i32)
        (local $tmp29 i32)
        (local $tmp30 i32)
        (local $tmp31 i32)
        (local $tmp32 i32)
        (local $tmp33 i32)
        (local $tmp34 i32)
        (local $tmp35 i32)
        (local $tmp36 i32)
        (local $tmp37 i32)
        (local $tmp38 i32)
        (local $tmp39 i32)
        (local $tmp40 i32)
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
        (call $color
            (i32.const 200)
            (i32.const 150)
            (i32.const 0)
        )
        (local.set $tmp0
            (i32.div_u
                (local.get $_window_height)
                (i32.const 3)
            )
        )
        (call $fill_circle
            (local.get $_mid_x)
            (local.get $_mid_y)
            (local.get $tmp0)
        )
        (call $color
            (i32.const 0)
            (i32.const 0)
            (i32.const 150)
        )
        (local.set $tmp1
            (i32.div_u
                (local.get $_window_height)
                (i32.const 8)
            )
        )
        (local.set $tmp2
            (i32.add
                (local.get $_mid_x)
                (local.get $tmp1)
            )
        )
        (local.set $tmp3
            (i32.div_u
                (local.get $_window_height)
                (i32.const 6)
            )
        )
        (local.set $tmp4
            (i32.sub
                (local.get $_mid_y)
                (local.get $tmp3)
            )
        )
        (local.set $tmp5
            (i32.div_u
                (local.get $_window_height)
                (i32.const 15)
            )
        )
        (call $fill_circle
            (local.get $tmp2)
            (local.get $tmp4)
            (local.get $tmp5)
        )
        (local.set $tmp6
            (i32.div_u
                (local.get $_window_height)
                (i32.const 8)
            )
        )
        (local.set $tmp7
            (i32.sub
                (local.get $_mid_x)
                (local.get $tmp6)
            )
        )
        (local.set $tmp8
            (i32.div_u
                (local.get $_window_height)
                (i32.const 6)
            )
        )
        (local.set $tmp9
            (i32.sub
                (local.get $_mid_y)
                (local.get $tmp8)
            )
        )
        (local.set $tmp10
            (i32.div_u
                (local.get $_window_height)
                (i32.const 15)
            )
        )
        (call $fill_circle
            (local.get $tmp7)
            (local.get $tmp9)
            (local.get $tmp10)
        )
        (local.set $tmp11
            (i32.div_u
                (local.get $_window_height)
                (i32.const 6)
            )
        )
        (local.set $tmp12
            (i32.sub
                (local.get $_mid_y)
                (local.get $tmp11)
            )
        )
        (local.set $_y_glasses
            (i32.sub
                (local.get $tmp12)
                (i32.const 50)
            )
        )
        (local.set $tmp13
            (i32.div_u
                (local.get $_window_height)
                (i32.const 8)
            )
        )
        (local.set $tmp14
            (i32.add
                (local.get $_mid_x)
                (local.get $tmp13)
            )
        )
        (local.set $tmp15
            (i32.sub
                (local.get $tmp14)
                (i32.const 60)
            )
        )
        (local.set $tmp16
            (i32.div_u
                (local.get $_window_height)
                (i32.const 5)
            )
        )
        (local.set $tmp17
            (i32.div_u
                (local.get $_window_height)
                (i32.const 7)
            )
        )
        (call $rectangle
            (local.get $tmp15)
            (local.get $_y_glasses)
            (local.get $tmp16)
            (local.get $tmp17)
        )
        (local.set $tmp18
            (i32.div_u
                (local.get $_window_height)
                (i32.const 8)
            )
        )
        (local.set $tmp19
            (i32.sub
                (local.get $_mid_x)
                (local.get $tmp18)
            )
        )
        (local.set $tmp20
            (i32.sub
                (local.get $tmp19)
                (i32.const 60)
            )
        )
        (local.set $tmp21
            (i32.div_u
                (local.get $_window_height)
                (i32.const 5)
            )
        )
        (local.set $tmp22
            (i32.div_u
                (local.get $_window_height)
                (i32.const 7)
            )
        )
        (call $rectangle
            (local.get $tmp20)
            (local.get $_y_glasses)
            (local.get $tmp21)
            (local.get $tmp22)
        )
        (call $color
            (i32.const 0)
            (i32.const 0)
            (i32.const 0)
        )
        (local.set $tmp23
            (i32.div_u
                (local.get $_window_height)
                (i32.const 8)
            )
        )
        (local.set $tmp24
            (i32.sub
                (local.get $_mid_x)
                (local.get $tmp23)
            )
        )
        (local.set $tmp25
            (i32.sub
                (local.get $tmp24)
                (i32.const 60)
            )
        )
        (local.set $tmp26
            (i32.div_u
                (local.get $_window_height)
                (i32.const 5)
            )
        )
        (local.set $tmp27
            (i32.add
                (local.get $tmp25)
                (local.get $tmp26)
            )
        )
        (call $fill_rectangle
            (local.get $tmp27)
            (local.get $_y_glasses)
            (i32.const 40)
            (i32.const 20)
        )
        (local.set $tmp28
            (i32.div_u
                (local.get $_window_height)
                (i32.const 8)
            )
        )
        (local.set $tmp29
            (i32.add
                (local.get $_mid_x)
                (local.get $tmp28)
            )
        )
        (local.set $tmp30
            (i32.sub
                (local.get $tmp29)
                (i32.const 275)
            )
        )
        (call $fill_rectangle
            (local.get $tmp30)
            (local.get $_y_glasses)
            (i32.const 50)
            (i32.const 20)
        )
        (local.set $tmp31
            (i32.div_u
                (local.get $_window_height)
                (i32.const 8)
            )
        )
        (local.set $tmp32
            (i32.add
                (local.get $_mid_x)
                (local.get $tmp31)
            )
        )
        (local.set $tmp33
            (i32.add
                (local.get $tmp32)
                (i32.const 75)
            )
        )
        (call $fill_rectangle
            (local.get $tmp33)
            (local.get $_y_glasses)
            (i32.const 50)
            (i32.const 20)
        )
        (call $color
            (i32.const 150)
            (i32.const 100)
            (i32.const 50)
        )
        (local.set $tmp34
            (i32.sub
                (local.get $_mid_x)
                (i32.const 40)
            )
        )
        (local.set $tmp35
            (i32.sub
                (local.get $_mid_y)
                (i32.const 20)
            )
        )
        (call $fill_rectangle
            (local.get $tmp34)
            (local.get $tmp35)
            (i32.const 50)
            (i32.const 50)
        )
        (call $color
            (i32.const 200)
            (i32.const 200)
            (i32.const 200)
        )
        (local.set $tmp36
            (i32.add
                (local.get $_mid_y)
                (i32.const 150)
            )
        )
        (call $fill_circle
            (local.get $_mid_x)
            (local.get $tmp36)
            (i32.const 100)
        )
        (local.set $tmp37
            (i32.add
                (local.get $_mid_x)
                (i32.const 100)
            )
        )
        (local.set $tmp38
            (i32.add
                (local.get $_mid_y)
                (i32.const 100)
            )
        )
        (call $fill_rectangle
            (local.get $tmp37)
            (local.get $tmp38)
            (i32.const 100)
            (i32.const 50)
        )
        (local.set $tmp39
            (i32.sub
                (local.get $_mid_x)
                (i32.const 200)
            )
        )
        (local.set $tmp40
            (i32.add
                (local.get $_mid_y)
                (i32.const 100)
            )
        )
        (call $fill_rectangle
            (local.get $tmp39)
            (local.get $tmp40)
            (i32.const 100)
            (i32.const 50)
        )
    )
    (export "run" (func $display))
)
