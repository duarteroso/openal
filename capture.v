module vopenal

// Forward declarations
fn C.alcCaptureOpenDevice(devicename charptr, frequency u32, format int, buffersize int) voidptr
fn C.alcCaptureCloseDevice(device voidptr) byte
fn C.alcCaptureStart(device voidptr)
fn C.alcCaptureStop(device voidptr)
fn C.alcCaptureSamples(device voidptr, buffer voidptr, samples int)

// CaptureDevice
pub struct CaptureDevice {
mut:
	data voidptr
}

// open_device
pub fn (mut c CaptureDevice) open_device(name string, frequency u32, format int, buffersize int) {
	c.data = C.alcCaptureOpenDevice(name.str, frequency, format, buffersize)
	alc_check_error()
}

// close_device
pub fn (c &CaptureDevice) close_device() bool {
	ok := C.alcCaptureCloseDevice(c.data)
	alc_check_error()
	return ok != 0
}

// start
pub fn (c &CaptureDevice) start() {
	C.alcCaptureStart(c.data)
	alc_check_error()
}

// stop
pub fn (c &CaptureDevice) stop() {
	C.alcCaptureStop(c.data)
	alc_check_error()
}

// samples
pub fn (c &CaptureDevice) samples(samples int) voidptr {
	buffer := []byte{ len: samples }
	C.alcCaptureSamples(c.data, buffer.data, samples)
	alc_check_error()
	return buffer
}