(module
  (import "js" "mem" (memory 16))
  (func $setAllPixels

    ;; declare local variable
    (local $addr i32)

    ;; addr = 0
    i32.const 0
    local.set $addr

    loop                     ;; start loop block

        local.get $addr      ;; read target address from local variable
        i32.const 0xff880088 ;; RGBA colour little-endian = 0xAABBGGRR
        i32.store            ;; write to memory

        ;; addr += 4
        local.get $addr
        i32.const 4
        i32.add
        local.set $addr

        ;; if( addr != W*H*4 ) then continue looping
        local.get $addr
        i32.const 0x100000
        i32.lt_u             ;; is $addr < 0x100000 ?
        br_if 0              ;; if yes then continue 0th (current) block

    end

  )
  (export "run" (func $setAllPixels))
)