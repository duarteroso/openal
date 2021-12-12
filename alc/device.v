module alc

[typedef]
struct C.ALCdevice {
}

fn C.alcOpenDevice(devicename &ALCchar) &C.ALCdevice
fn C.alcCloseDevice(device &C.ALCdevice) ALCboolean

fn C.alcGetError(device &C.ALCdevice) ALCenum

fn C.alcIsExtensionPresent(device &C.ALCdevice, extname &ALCchar) ALCboolean
fn C.alcGetProcAddress(device &C.ALCdevice, funcname &ALCchar) voidptr
fn C.alcGetEnumValue(device &C.ALCdevice, enumname &ALCchar) ALCenum

fn C.alcGetString(device &C.ALCdevice, param ALCenum) &ALCchar
fn C.alcGetIntegerv(device &C.ALCdevice, param ALCenum, size ALCsizei, values &ALCint)

pub const default_device = ''
