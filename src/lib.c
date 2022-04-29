#include "lib.h"
#include "lit/lit.h"

LIT_NATIVE(test) {
	printf("Hello, test world!\n");
	return NUMBER_VALUE(10);
}

extern const char lit_lib[];

void lib_open_library(LitState* state) {
	lit_define_native(state, "test", test_native);
	lit_interpret(state, "lib", (char*) lit_lib);
}