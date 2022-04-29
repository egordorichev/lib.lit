#include "lib.h"

int main(int argc, const char** argv) {
	LitState* state = lit_new_state();

	lit_open_libraries(state);
	lib_open_library(state);
	lit_interpret_file(state, "test.lit");
	lit_event_loop(state);

	lit_free_state(state);
}