(module
 (table 0 anyfunc)
 (memory $0 1)
 (data (i32.const 4) "P\'\00\00")
 (export "memory" (memory $0))
 (export "getMemory" (func $getMemory))
 (export "getMemorySize" (func $getMemorySize))
 (export "calc" (func $calc))
 (func $getMemory (result i32)
  (i32.const 16)
 )
 (func $getMemorySize (result i32)
  (i32.const 10)
 )
 (func $calc (result i32)
  (local $0 i32)
  (i32.store offset=12
   (tee_local $0
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 16)
    )
   )
   (i32.const 0)
  )
  (i32.store offset=8
   (get_local $0)
   (i32.const 0)
  )
  (block $label$0
   (loop $label$1
    (br_if $label$0
     (i32.gt_s
      (i32.load offset=8
       (get_local $0)
      )
      (i32.const 9)
     )
    )
    (i32.store offset=12
     (get_local $0)
     (i32.add
      (i32.load offset=12
       (get_local $0)
      )
      (i32.load
       (i32.add
        (i32.shl
         (i32.load offset=8
          (get_local $0)
         )
         (i32.const 2)
        )
        (i32.const 16)
       )
      )
     )
    )
    (i32.store offset=8
     (get_local $0)
     (i32.add
      (i32.load offset=8
       (get_local $0)
      )
      (i32.const 1)
     )
    )
    (br $label$1)
   )
  )
  (i32.load offset=12
   (get_local $0)
  )
 )
)
