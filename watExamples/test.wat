(module
  (import "js" "mem" (memory 16))

  



  (func $fillBlue (param $x i32) (param $y i32)
    ;; calculate the offset
    (local $offset i32)
    
    (local.set $offset
      (i32.add
        (i32.mul
          (local.get $y)
          (i32.const 500) ;; width of the canvas
        )
        (local.get $x)
      )
    )
    ;; set the pixel to blue
    (i32.store8
      (i32.mul
        (local.get $offset)
        (i32.const 4) ;; 4 bytes per pixel
      )
      (i32.const 0) ;; red channel
    )
    (i32.store8
      (i32.add
        (i32.mul
          (local.get $offset)
          (i32.const 4) ;; 4 bytes per pixel
        )
        (i32.const 1) ;; green channel
      )
      (i32.const 0) ;; green value
    )
    (i32.store8
      (i32.add
        (i32.mul
          (local.get $offset)
          (i32.const 4) ;; 4 bytes per pixel
        )
        (i32.const 2) ;; blue channel
      )
      (i32.const 255) ;; blue value
    )
    (i32.store8
      (i32.add
        (i32.mul
          (local.get $offset)
          (i32.const 4) ;; 4 bytes per pixel
        )
        (i32.const 3) ;; alpha channel
      )
      (i32.const 255) ;; alpha value
    )
  )

  ;; draw a line for y = x + 2 
   (func $line 
     (local $x i32)
     (local $y i32)
     
     i32.const 0
     local.set  $x

     loop 
       local.get $x 
       i32.const 2 
       i32.add
       local.set $y 
       
       local.get $x
       local.get $y
       call $fillBlue
       
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