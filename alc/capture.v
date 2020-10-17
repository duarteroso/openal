module alc

// Forward declarations
fn C.alcCaptureOpenDevice(devicename charptr, frequency u32, format int, buffersize int) &C.ALCdevice

fn C.alcCaptureCloseDevice(device &C.ALCdevice) byte

fn C.alcCaptureStart(device &C.ALCdevice)

fn C.alcCaptureStop(device &C.ALCdevice)

fn C.alcCaptureSamples(device &C.ALCdevice, buffer voidptr, samples int)

// CaptureDevice wraps functionality around OpenALC capture device
pub struct CaptureDevice {
mut:
	data &C.ALCdevice = &C.ALCdevice(0)
}

// open_device opens the capture device
pub fn (mut c CaptureDevice) open_device(name string, frequency u32, format int, buffersize int) {
	c.data = C.alcCaptureOpenDevice(name.str, frequency, format, buffersize)
	check_error(&C.ALCdevice(0))
}

// close_device closes capture devce
pub fn (c &CaptureDevice) close_device() bool {
	ok := C.alcCaptureCloseDevice(c.data)
	check_error(c.data)
	return ok == alc_true
}

// start capture
pub fn (c &CaptureDevice) start() {
	C.alcCaptureStart(c.data)
	check_error(c.data)
}

// stop capture
pub fn (c &CaptureDevice) stop() {
	C.alcCaptureStop(c.data)
	check_error(c.data)
}

// samples of the capture
pub fn (c &CaptureDevice) samples(samples int) []byte {
	buffer := []byte{len: samples}
	C.alcCaptureSamples(c.data, buffer.data, samples)
	check_error(c.data)
	return buffer
}
