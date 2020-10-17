module alc

// Forward declarations
fn C.alcGetError(device &C.ALCdevice) int

fn C.alcGetCurrentContext() &C.ALCcontext

fn C.alcGetString(device &C.ALCdevice, param int) charptr

fn C.alcGetIntegerv(device &C.ALCdevice, param int, size int, values voidptr)

// get_error returns the pending ALC error
pub fn get_error(device &C.ALCdevice) Error {
	c := C.alcGetError(device)
	mut err := new_error(c)
	return err
}

// check_error checks and panics on errors
pub fn check_error(device &C.ALCdevice) {
	err := get_error(device)
	if err.code != alc_no_error {
		panic(err.str())
	}
}

// get_current_context returns the current context
pub fn get_current_context() &Context {
	ptr := C.alcGetCurrentContext()
	check_error(&C.ALCdevice(0))
	return new_context(ptr)
}

// remove_current_context removes the current context
pub fn remove_current_context() bool {
	ok := C.alcMakeContextCurrent(voidptr(0))
	check_error(&C.ALCdevice(0))
	return ok != 0
}
