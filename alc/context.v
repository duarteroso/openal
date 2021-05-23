module alc

[typedef]
struct C.ALCcontext {
}

fn C.alcCreateContext(device &C.ALCdevice, attrlist &ALCint) &C.ALCcontext
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
pub fn new_context_from_data(context &C.ALCcontext) &Context {
	return &Context{
		data: context
	}
}

// create context
pub fn (mut c Context) create(d &Device) bool {
	c.device = d
	c.data = C.alcCreateContext(d.get_data(), voidptr(0))
	c.check_error()
	return !isnil(c.data)
}

// make_current marks a context as current
pub fn (c &Context) make_current() bool {
	ok := C.alcMakeContextCurrent(c.data)
	c.check_error()
	return ok == alc_true
}

// process context
pub fn (c &Context) process() {
	C.alcProcessContext(c.data)
	c.check_error()
}

// suspend context
pub fn (c &Context) suspend() {
	C.alcSuspendContext(c.data)
	c.check_error()
}

// destroy context
pub fn (c &Context) destroy() {
	C.alcDestroyContext(c.data)
	c.check_error()
}

// get_device returns device linked to context
pub fn (c &Context) get_device() &Device {
	data := C.alcGetContextsDevice(c.data)
	device := new_device_from_data(data)
	check_error(device)
	return device
}

// check_error checks if device context has an error
fn (c &Context) check_error() {
	check_error(c.device)
}
