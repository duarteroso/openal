module alc

// Context wraps functionality around OpenALC context
pub struct Context {
mut:
	data   &C.ALCcontext = &C.ALCcontext(0)
	device &Device       = &Device(0)
}

// create_context creates an instance of Context
pub fn create_context_from_device(d &Device) !&Context {
	mut c := &Context{}
	unsafe {
		c.device = d
	}
	c.data = C.alcCreateContext(d.get_data(), unsafe { nil })
	c.check_error()!
	return c
}

// create_context_from_data creates an instance of Context from data
pub fn create_context_from_data(context &C.ALCcontext) !&Context {
	data := C.alcGetContextsDevice(context)
	device := create_device_from_data(data)
	//
	return create_context_from_device(device)
}

// make_current marks a context as current
pub fn (c &Context) make_current() !bool {
	ok := C.alcMakeContextCurrent(c.data)
	c.check_error()!
	return ok == alc_true
}

// process context
pub fn (c &Context) process() ! {
	C.alcProcessContext(c.data)
	c.check_error()!
}

// suspend context
pub fn (c &Context) suspend() ! {
	C.alcSuspendContext(c.data)
	c.check_error()!
}

// destroy context
pub fn (c &Context) destroy() ! {
	C.alcDestroyContext(c.data)
	c.check_error()!
}

// get_device returns device linked to context
pub fn (c &Context) get_device() &Device {
	return c.device
}

// check_error checks if device context has an error
fn (c &Context) check_error() ! {
	check_error(c.device)!
}
