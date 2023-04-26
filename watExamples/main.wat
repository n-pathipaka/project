(module

    ;; Import 16 pages of memory for the pixel data, plus another page in which to store 
    ;; the colour palette
    (import "js" "mem" (memory 17))

    ;; Define the colour palette
    (data (i32.const 0x100000) "\00\00\00\ff")
    (data (i32.const 0x100004) "\00\59\ff\ff")
    (data (i32.const 0x100008) "\00\b0\ff\ff")
    (data (i32.const 0x10000c) "\00\d9\ff\ff")
    (data (i32.const 0x100010) "\00\ff\e7\ff")
    (data (i32.const 0x100014) "\50\ff\00\ff")
    (data (i32.const 0x100018) "\9d\ff\00\ff")
    (data (i32.const 0x10001c) "\d7\ff\00\ff")

    (func $mandelbrot

        ;; define some local variables :

        ;; current pixel x coord (real part)
        (local $x0 f64)

        ;; current pixel y coord (imaginary part)
        (local $y0 f64)

        ;; current iteration x coord (real part)
        (local $ox f64)

        ;; current iteration y coord (imaginary part)
        (local $oy f64)

        ;; ox^2
        (local $ox2 f64)

        ;; oy^2
        (local $oy2 f64)

        ;; x * y
        (local $oxy f64)

        ;; current pixel address
        (local $addr i32)

        ;; current pixel index
        (local $a i32)

        ;; iteration counter for mandelbrot algorithm
        (local $iteration i32)

        ;; code starts here :

        ;; addr = 0
        i32.const 0
        local.set $addr

        loop ;; loop through all pixels in the image

            ;; mem[addr] = colour (start)
            local.get $addr

            ;; a = addr / 4
            local.get $addr
            i32.const 4
            i32.div_u
            local.set $a

            ;; x = a % W
            local.get $a
            i32.const 512
            i32.rem_u

            ;; scale and translate x to fit the canvas
            f64.convert_i32_u
            f64.const 176.0
            f64.div
            f64.const 2.00
            f64.sub
            local.set $x0

            ;; y = a / W
            local.get $a
            i32.const 512
            i32.div_u

            ;; scale and translate y to fit the canvas
            f64.convert_i32_u
            f64.const 176.0
            f64.div
            f64.const 1.45
            f64.sub
            local.set $y0

            ;; iteration = 0
            i32.const 0
            local.set $iteration

            ;; ox = 0
            f64.const 0.0
            local.set $ox

            ;; oy = 0
            f64.const 0.0
            local.set $oy

            loop ;; the mandelbrot iteration loop

                ;; ox2 = ox*ox
                local.get $ox
                local.get $ox
                f64.mul
                local.set $ox2

                ;; oy2 = oy*oy
                local.get $oy
                local.get $oy
                f64.mul
                local.set $oy2

                ;; ox*ox - oy*oy + x0
                local.get $ox2
                local.get $oy2
                f64.sub
                local.get $x0
                f64.add

                ;; y = 2*x*y + y0
                local.get $ox
                local.get $oy
                f64.mul
                f64.const 2
                f64.mul
                local.get $y0
                f64.add
                local.set $oy

                ;; x = xtemp
                local.set $ox

                ;; iteration = iteration + 1
                local.get $iteration
                i32.const 1
                i32.add
                local.set $iteration

                ;; if( iteration < max_iteration
                local.get $iteration
                i32.const 1024
                i32.lt_u

                ;; AND ox*ox + oy*oy <= 2*2)
                local.get $ox2
                local.get $oy2
                f64.add
                f64.const 4.0
                f64.le

                i32.and

                ;; loop back and continue
                br_if 0

            end

            ;; use 3 least significant bits of iteration count to select colour from palette
            local.get $iteration
            i32.const 0x7
            i32.and

            ;; calculate offset into palette data
            i32.const 4
            i32.mul

            ;; load RGBA value from palette
            i32.load offset=0x100000

            ;; set mem[addr] = colour
            i32.store

            ;; addr += 4
            local.get $addr
            i32.const 4
            i32.add
            local.set $addr

            ;; if( addr != W*W*4 ) continue
            local.get $addr
            i32.const 0x100000
            i32.lt_u
            br_if 0

        end

    )
    (export "run" (func $mandelbrot))

)