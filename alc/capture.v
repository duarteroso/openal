module alc

import al

// CaptureDevice wraps functionality around OpenALC capture device
pub struct CaptureDevice {
mut:
	device &Device = &Device(0)
}

// create_capture_device creates a new instance of CaptureDevice
pub fn create_capture_device() &CaptureDevice {
	return &CaptureDevice{}
}

// open_default opens the default audio device
pub fn (mut c CaptureDevice) open_default(frequency u32, format al.BufferFormat, size int) ! {
	c.open(default_device, frequency, format, size)!
}

// open_device opens the capture device
pub fn (mut c CaptureDevice) open(name string, frequency u32, format al.BufferFormat, size int) ! {
	data := C.alcCaptureOpenDevice(name.str, frequency, int(format), size)
	if isnil(data) {
		return error('Failed to open capture device')
	}
	//
	c.device = create_device_from_data(data)
}

// close closes capture devce
pub fn (c &CaptureDevice) close() !bool {
	ok := C.alcCaptureCloseDevice(c.device.data)
	c.check_error()!
	return ok == alc_true
}

// get_device returns a reference to the underlying device
pub fn (c &CaptureDevice) get_device() &Device {
	return c.device
}

// start capture
pub fn (c &CaptureDevice) start() ! {
	C.alcCaptureStart(c.device.data)
	c.check_error()!
}

// stop capture
pub fn (c &CaptureDevice) stop() ! {
	C.alcCaptureStop(c.device.data)
	c.check_error()!
}

pub fn (c &CaptureDevice) get_sample_count() !int {
	count := c.device.get_integers(alc_capture_samples, 1)!
	c.check_error()!
	return count[0]
}

// samples of the capture
pub fn (c &CaptureDevice) samples(samples int) ![]u8 {
	mut buffer := []u8{len: samples, init: 0}
	C.alcCaptureSamples(c.device.data, buffer.data, samples)
	c.check_error()!
	return buffer
}

// check_error checks if device context has an error
fn (c &CaptureDevice) check_error() ! {
	check_error(c.device)!
}

// get_string returns a device parameter as string
pub fn (c &CaptureDevice) get_string(param int) !string {
	s := c.device.get_string(param)!
	c.check_error()!
	return s
}
