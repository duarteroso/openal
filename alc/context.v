module alc

// Forward declarations
[typedef] struct C.ALCcontext { }

fn C.alcCreateContext(device &C.ALCdevice, attrlist voidptr) &C.ALCcontext

fn C.alcMakeContextCurrent(context &C.ALCcontext) byte

fn C.alcProcessContext(context &C.ALCcontext)

fn C.alcSuspendContext(context &C.ALCcontext)

fn C.alcDestroyContext(context &C.ALCcontext)

fn C.alcGetContextsDevice(context &C.ALCcontext) &C.ALCdevice

// Context wraps functionality around OpenALC context
pub struct Context {
mut:
	data   &C.ALCcontext = &C.ALCcontext(0)
	device &C.ALCdevice = &C.ALCdevice(0)
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
	check_error(d.get_data())
	c.device = d.get_data()
}

// make_current marks a context as current
pub fn (c &Context) make_current() bool {
	ok := C.alcMakeContextCurrent(c.data)
	check_error(c.device)
	return ok != 0
}

// process context
pub fn (c &Context) process() {
	C.alcProcessContext(c.data)
	check_error(c.device)
}

// suspend context
pub fn (c &Context) suspend() {
	C.alcSuspendContext(c.data)
	check_error(c.device)
}

// destroy context
pub fn (c &Context) destroy() {
	C.alcDestroyContext(c.data)
	check_error(c.device)
	c.data = &C.ALCcontext(0)
}

// get_device returns device linked to context
pub fn (c &Context) get_device() &Device {
	device := C.alcGetContextsDevice(c.data)
	check_error(&C.ALCdevice(0))
	return new_device(device)
}
