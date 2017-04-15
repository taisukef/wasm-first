; ModuleID = 'test.c'
source_filename = "test.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32:64-S128"
target triple = "wasm32"

@mem = hidden global [10 x i32] zeroinitializer, align 16

; Function Attrs: noinline nounwind
define hidden i32* @getMemory() #0 {
entry:
  ret i32* getelementptr inbounds ([10 x i32], [10 x i32]* @mem, i32 0, i32 0)
}

; Function Attrs: noinline nounwind
define hidden i32 @getMemorySize() #0 {
entry:
  ret i32 10
}

; Function Attrs: noinline nounwind
define hidden i32 @calc() #0 {
entry:
  %sum = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %sum, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %0, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* @mem, i32 0, i32 %1
  %2 = load i32, i32* %arrayidx, align 4
  %3 = load i32, i32* %sum, align 4
  %add = add nsw i32 %3, %2
  store i32 %add, i32* %sum, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %4 = load i32, i32* %i, align 4
  %inc = add nsw i32 %4, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %5 = load i32, i32* %sum, align 4
  ret i32 %5
}

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 5.0.0 (http://llvm.org/git/clang.git 01734df77696b4d9ba1debc1823b29673cae6a6c) (http://llvm.org/git/llvm.git c67ef6aaf75865024462576a5b790e46ccc2e75e)"}
