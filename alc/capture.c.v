module alc

fn C.alcCaptureOpenDevice(devicename &char, frequency u32, format int, buffersize int) &C.ALCdevice
fn C.alcCaptureCloseDevice(device &C.ALCdevice) u8
fn C.alcCaptureStart(device &C.ALCdevice)
fn C.alcCaptureStop(device &C.ALCdevice)
fn C.alcCaptureSamples(device &C.ALCdevice, buffer voidptr, samples int)
