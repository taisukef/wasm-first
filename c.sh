clang -emit-llvm --target=wasm32 -S test.c
llc test.ll -march=wasm32
s2wasm --allocate-stack 10000 test.s > test.wast
wast2wasm -o test.wasm test.wast