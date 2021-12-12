module alc

fn C.alcCaptureOpenDevice(devicename &ALCchar, frequency ALCuint, format ALCenum, buffersize ALCsizei) &C.ALCdevice
fn C.alcCaptureCloseDevice(device &C.ALCdevice) ALCboolean
fn C.alcCaptureStart(device &C.ALCdevice)
fn C.alcCaptureStop(device &C.ALCdevice)
fn C.alcCaptureSamples(device &C.ALCdevice, buffer voidptr, samples ALCsizei)
