	.text
	.file	"test.c"
	.hidden	getMemory
	.globl	getMemory
	.type	getMemory,@function
getMemory:                              # @getMemory
	.result 	i32
# BB#0:                                 # %entry
	i32.const	$push0=, mem
                                        # fallthrough-return: $pop0
	.endfunc
.Lfunc_end0:
	.size	getMemory, .Lfunc_end0-getMemory

	.hidden	getMemorySize
	.globl	getMemorySize
	.type	getMemorySize,@function
getMemorySize:                          # @getMemorySize
	.result 	i32
# BB#0:                                 # %entry
	i32.const	$push0=, 10
                                        # fallthrough-return: $pop0
	.endfunc
.Lfunc_end1:
	.size	getMemorySize, .Lfunc_end1-getMemorySize

	.hidden	calc
	.globl	calc
	.type	calc,@function
calc:                                   # @calc
	.result 	i32
	.local  	i32
# BB#0:                                 # %entry
	i32.const	$push13=, 0
	i32.load	$push12=, __stack_pointer($pop13)
	i32.const	$push14=, 16
	i32.sub 	$push17=, $pop12, $pop14
	tee_local	$push16=, $0=, $pop17
	i32.const	$push0=, 0
	i32.store	12($pop16), $pop0
	i32.const	$push15=, 0
	i32.store	8($0), $pop15
.LBB2_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	block   	
	loop    	                # label1:
	i32.load	$push1=, 8($0)
	i32.const	$push21=, 9
	i32.gt_s	$push2=, $pop1, $pop21
	br_if   	1, $pop2        # 1: down to label0
# BB#2:                                 # %for.body
                                        #   in Loop: Header=BB2_1 Depth=1
	i32.load	$push8=, 12($0)
	i32.load	$push4=, 8($0)
	i32.const	$push20=, 2
	i32.shl 	$push5=, $pop4, $pop20
	i32.const	$push19=, mem
	i32.add 	$push6=, $pop5, $pop19
	i32.load	$push7=, 0($pop6)
	i32.add 	$push9=, $pop8, $pop7
	i32.store	12($0), $pop9
	i32.load	$push10=, 8($0)
	i32.const	$push18=, 1
	i32.add 	$push11=, $pop10, $pop18
	i32.store	8($0), $pop11
	br      	0               # 0: up to label1
.LBB2_3:                                # %for.end
	end_loop
	end_block                       # label0:
	i32.load	$push3=, 12($0)
                                        # fallthrough-return: $pop3
	.endfunc
.Lfunc_end2:
	.size	calc, .Lfunc_end2-calc

	.hidden	mem                     # @mem
	.type	mem,@object
	.bss
	.globl	mem
	.p2align	4
mem:
	.skip	40
	.size	mem, 40


	.ident	"clang version 5.0.0 (http://llvm.org/git/clang.git 01734df77696b4d9ba1debc1823b29673cae6a6c) (http://llvm.org/git/llvm.git c67ef6aaf75865024462576a5b790e46ccc2e75e)"
