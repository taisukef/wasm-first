/usr/local/opt/llvm/bin/clang --target=wasm32 -O3 -nostdlib -Wl,--no-entry -Wl,--export-all \
  test.c -o test.wasm
