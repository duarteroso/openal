module alc

// Forward declarations
fn C.alcGetCurrentContext() &C.ALCcontext

// get_current_context returns the current context
pub fn get_current_context() &Context {
	ptr := C.alcGetCurrentContext()
	check_error()
	return new_context(ptr)
}

// remove_current_context removes the current context
pub fn remove_current_context() bool {
	ok := C.alcMakeContextCurrent(voidptr(0))
	check_error()
	return ok != 0
}
