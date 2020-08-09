module vopenal

// Forward declarations
fn C.alcGetError() int
fn C.alcGetCurrentContext() voidptr
fn C.alcGetString(device voidptr, param int) charptr
fn C.alcGetIntegerv(device voidptr, param int, size int, values voidptr)


// alc_get_error Get AL error
pub fn alc_get_error() AlcError {
	c := C.alcGetError()
	mut err := alc_create_error(c)
	return err
}

// alc_check_error Check and panics when errors
pub fn alc_check_error() {
	err := alc_get_error()
	if err.code != alc_no_error {
		panic(err.str())
	}
}

// get_current_context
pub fn get_current_context() &Context {
	ptr := C.alcGetCurrentContext()
	alc_check_error()
	return create_context(ptr)
}

// get_string
pub fn get_string(device voidptr, param int) string {
	s := C.alcGetString(device, param)
	alc_check_error()
	return tos3(s)
}

// get_integers
pub fn get_integers(device voidptr, param, size int) []int {
	values := []int { len: size }
	C.alcGetIntegerv(device, param, size, &values.data)
	alc_check_error()
	return values
}