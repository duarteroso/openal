module alc

[typedef]
struct C.ALCdevice {
}

fn C.alcOpenDevice(devicename &char) &C.ALCdevice
fn C.alcCloseDevice(device &C.ALCdevice) u8

fn C.alcGetError(device &C.ALCdevice) int

fn C.alcIsExtensionPresent(device &C.ALCdevice, extname &char) u8
fn C.alcGetProcAddress(device &C.ALCdevice, funcname &char) voidptr
fn C.alcGetEnumValue(device &C.ALCdevice, enumname &char) int

fn C.alcGetString(device &C.ALCdevice, param int) &char
fn C.alcGetIntegerv(device &C.ALCdevice, param int, size int, values &int)

pub const default_device = ''
