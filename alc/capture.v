module alc

fn C.alcCaptureOpenDevice(devicename ALCcharptr, frequency ALCuint, format ALCenum, buffersize ALCsizei) &C.ALCdevice
fn C.alcCaptureCloseDevice(device &C.ALCdevice) ALCboolean
fn C.alcCaptureStart(device &C.ALCdevice)
fn C.alcCaptureStop(device &C.ALCdevice)
fn C.alcCaptureSamples(device &C.ALCdevice, buffer voidptr, samples ALCsizei)

// CaptureDevice wraps functionality around OpenALC capture device
pub struct CaptureDevice {
mut:
	device &Device = voidptr(0)
}

// open_device opens the capture device
pub fn (mut c CaptureDevice) open_device(name string, frequency u32, format int, buffersize int) {
	data := C.alcCaptureOpenDevice(name.str, frequency, format, buffersize)
	c.device = new_device_from_data(data)
	check_error()
}

// close_device closes capture devce
pub fn (c &CaptureDevice) close_device() bool {
	ok := C.alcCaptureCloseDevice(c.device.data)
	c.device.check_error()
	return ok == alc_true
}

// start capture
pub fn (c &CaptureDevice) start() {
	C.alcCaptureStart(c.device.data)
	c.device.check_error()
}

// stop capture
pub fn (c &CaptureDevice) stop() {
	C.alcCaptureStop(c.device.data)
	c.device.check_error()
}

// samples of the capture
pub fn (c &CaptureDevice) samples(samples int) []byte {
	buffer := []byte{len: samples}
	C.alcCaptureSamples(c.device.data, buffer.data, samples)
	c.device.check_error()
	return buffer
}
