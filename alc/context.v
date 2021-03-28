module alc

[typedef]
struct C.ALCcontext {
}

fn C.alcCreateContext(device &C.ALCdevice, attrlist ALCintptr) &C.ALCcontext
fn C.alcMakeContextCurrent(context &C.ALCcontext) ALCboolean
fn C.alcProcessContext(context &C.ALCcontext)
fn C.alcSuspendContext(context &C.ALCcontext)
fn C.alcDestroyContext(context &C.ALCcontext)
fn C.alcGetContextsDevice(context &C.ALCcontext) &C.ALCdevice

// Context wraps functionality around OpenALC context
pub struct Context {
mut:
	data   &C.ALCcontext = voidptr(0)
	device &Device       = &Device(0)
}

// new_context creates an instance of Context
pub fn new_context() &Context {
	return new_context_from_data(voidptr(0))
}

// new_context_from_data creates an instance of Context from data
pub fn new_context_from_data(data &C.ALCcontext) &Context {
	return &Context {
		data: data
	}
}

// create context
pub fn (mut c Context) create(d &Device) bool {
	c.data = C.alcCreateContext(d.get_data(), voidptr(0))
	d.check_error()
	c.device = d
	return !isnil(c.data)
}

// make_current marks a context as current
pub fn (c &Context) make_current() bool {
	ok := C.alcMakeContextCurrent(c.data)
	c.device.check_error()
	return ok != 0
}

// process context
pub fn (c &Context) process() {
	C.alcProcessContext(c.data)
	check_error()
}

// suspend context
pub fn (c &Context) suspend() {
	C.alcSuspendContext(c.data)
	check_error()
}

// destroy context
pub fn (c &Context) destroy() {
	C.alcDestroyContext(c.data)
	check_error()
}

// get_device returns device linked to context
pub fn (c &Context) get_device() &Device {
	device_data := C.alcGetContextsDevice(c.data)
	check_error()
	return new_device_from_data(device_data)
}
