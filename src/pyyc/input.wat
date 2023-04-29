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
    (func $display
        (local $_x i32)
        (local $_y i32)
        (local $_size i32)
        (local $_xdir i32)
        (local $_ydir i32)
        (local $_i i32)
        (local $tmp0 i32)
        (local $tmp1 i32)
        (local $tmp2 i32)
        (local.set $_x
            (i32.const 200)
        )
        (local.set $_y
            (i32.const 200)
        )
        (local.set $_size
            (i32.const 50)
        )
        (local.set $_xdir
            (i32.const 1)
        )
        (local.set $_ydir
            (i32.const 1)
        )
        (local.set $_i
            (i32.const 0)
        )
        (local.set $tmp0
            (i32.lt_u
                (local.get $_i)
                (i32.const 10000)
            )
        )
        (block
            (i32.eq
            (local.get $tmp0)
            (i32.const 0)
            )
            br_if 0
                (loop
                (local.set $tmp1
                    (i32.gt_u
                        (local.get $_x)
                        (i32.const 400)
                    )
                )
                (if
                    (i32.eq
                    (local.get $tmp1)
                    (i32.const 1)
                    )
                        (then
                            (local.set $_xdir
                                (i32.sub
                                    (i32.const 0)
                                    (i32.const 1)
                                )
                            )
                        )
                        (else
                        )
                )
                (local.set $tmp2
                    (i32.lt_u
                        (local.get $_x)
                        (i32.const 100)
                    )
                )
                (if
                    (i32.eq
                    (local.get $tmp2)
                    (i32.const 1)
                    )
                        (then
                            (local.set $_xdir
                                (i32.const 1)
                            )
                        )
                        (else
                        )
                )
                (call $clear
                )
                (call $color
                    (i32.const 100)
                    (i32.const 200)
                    (i32.const 150)
                )
                (call $fill_circle
                    (local.get $_x)
                    (local.get $_y)
                    (local.get $_size)
                )
                (local.set $_x
                    (i32.add
                        (local.get $_x)
                        (local.get $_xdir)
                    )
                )
                (local.set $_i
                    (i32.add
                        (local.get $_i)
                        (i32.const 1)
                    )
                )
                (local.set $tmp0
                    (i32.lt_u
                        (local.get $_i)
                        (i32.const 10000)
                    )
                )
                (i32.eq
                (local.get $tmp0)
                (i32.const 0)
                )
                br_if 1
                br 0
                )
        )
    )
    (export "run" (func $display))
)
