module vopenal

// Forwar declarations
fn C.alcCreateContext(device voidptr, attrlist voidptr) voidptr
fn C.alcMakeContextCurrent(context voidptr) byte
fn C.alcProcessContext(context voidptr)
fn C.alcSuspendContext(context voidptr)
fn C.alcDestroyContext(context voidptr)
fn C.alcGetContextsDevice(context voidptr) voidptr

// Context Structure grouping context functions
pub struct Context{
mut:
	data voidptr
}

// create_context
pub fn create_context(data voidptr) &Context {
	return &Context{
		data: data
	}
}

// create
pub fn (mut c Context) create(d Device) {
	c.data = C.alcCreateContext(d.get_data())
	alc_check_error()
}

// make_current
pub fn (c &Context) make_current() bool {
	ok := C.alcMakeContextCurrent(c.data)
	alc_check_error()
	return ok != 0
}

// process
pub fn (c &Context) process() {
	C.alcProcessContext(c.data)
	alc_check_error()
}

// suspend
pub fn (c &Context) suspend() {
	C.alcSuspendContext(c.data)
	alc_check_error()
}

// destroy
pub fn (c &Context) destroy() {
	C.alcDestroyContext(c.data)
	alc_check_error()
}

// get_device
pub fn (c &Context) get_device() &Device {
	ptr := C.alcGetContextsDevice(c.data)
	alc_check_error()
	return create_device(ptr)
}