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
	data   &C.ALCcontext = &C.ALCcontext(0)
	device &Device       = &Device(0)
}

// new_context creates an instance of Context
pub fn new_context(data &C.ALCcontext) &Context {
	return &Context{
		data: data
	}
}

// create context
pub fn (mut c Context) create(d &Device) {
	c.data = C.alcCreateContext(d.get_data(), voidptr(0))
	c.device.check_error()
	c.device = d
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
	c.device.check_error()
}

// suspend context
pub fn (c &Context) suspend() {
	C.alcSuspendContext(c.data)
	c.device.check_error()
}

// destroy context
pub fn (c &Context) destroy() {
	C.alcDestroyContext(c.data)
	c.device.check_error()
}

// get_device returns device linked to context
pub fn (c &Context) get_device() &Device {
	device := C.alcGetContextsDevice(c.data)
	check_error()
	return new_device(device)
}
