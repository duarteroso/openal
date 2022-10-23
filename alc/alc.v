module alc

// get_current_context returns the current context
pub fn get_current_context() ?&Context {
	data := C.alcGetCurrentContext()
	return create_context_from_data(data)
}

// remove_current_context removes the current context
pub fn remove_current_context() bool {
	ok := C.alcMakeContextCurrent(voidptr(0))
	return ok == alc_true
}
