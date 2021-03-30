module alc

fn C.alcGetCurrentContext() &C.ALCcontext

// get_current_context returns the current context
pub fn get_current_context() &Context {
	ptr := C.alcGetCurrentContext()
	return new_context_from_data(ptr)
}

// remove_current_context removes the current context
pub fn remove_current_context() bool {
	ok := C.alcMakeContextCurrent(voidptr(0))
	return ok == alc_true
}
