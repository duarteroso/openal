module alc

[typedef]
struct C.ALCdevice {
}

fn C.alcOpenDevice(devicename ALCcharptr) &C.ALCdevice
fn C.alcCloseDevice(device &C.ALCdevice) ALCboolean

fn C.alcGetError(device &C.ALCdevice) ALCenum

fn C.alcIsExtensionPresent(device &C.ALCdevice, extname ALCcharptr) ALCboolean
fn C.alcGetProcAddress(device &C.ALCdevice, funcname ALCcharptr) voidptr
fn C.alcGetEnumValue(device &C.ALCdevice, enumname ALCcharptr) ALCenum

fn C.alcGetString(device &C.ALCdevice, param ALCenum) ALCcharptr
fn C.alcGetIntegerv(device &C.ALCdevice, param ALCenum, size ALCsizei, values ALCintptr)

// Device wraps functionality around ALCdevice
pub struct Device {
mut:
	data &C.ALCdevice = voidptr(0)
}

// new_device creates an instance of Device
pub fn new_device() &Device {
	return new_device_from_data(voidptr(0))
}

// new_device_from_data creates an instance of Device from data
pub fn new_device_from_data(data &C.ALCdevice) &Device {
	return &Device{
		data: data
	}
}

// open_default opens the default audio device
pub fn (mut d Device) open_default() bool {
	return d.open('')
}

// open audio device by name
pub fn (mut d Device) open(name string) bool {
	d.data = C.alcOpenDevice(ALCcharptr(name.str))
	return !isnil(d.data)
}

// close device
pub fn (d &Device) close() bool {
	ok := C.alcCloseDevice(d.data)
	return ok == alc_true
}

// get_data returns data from the device
pub fn (d &Device) get_data() &C.ALCdevice {
	return d.data
}

// is_extension_present checks if a certain extension is present
pub fn (d &Device) is_extension_present(name string) bool {
	ok := C.alcIsExtensionPresent(d.data, ALCcharptr(name.str))
	check_error(d)
	return ok == alc_true
}

// get_proc_addr returns the process address
pub fn (d &Device) get_proc_addr(name string) voidptr {
	ptr := C.alcGetProcAddress(d.data, ALCcharptr(name.str))
	check_error(d)
	return ptr
}

// get_enum_value returns an enumeration value
pub fn (d &Device) get_enum_value(name string) int {
	value := C.alcGetEnumValue(d.data, ALCcharptr(name.str))
	check_error(d)
	return value
}

// get_string returns a device parameter as string
pub fn (d &Device) get_string(param int) string {
	s := C.alcGetString(d.data, param)
	check_error(d)
	return unsafe { s.vstring() }
}

// get_integers returns a device parameters as vector of strings
pub fn (d &Device) get_integers(param int, size int) []int {
	values := []int{len: size, init: 0}
	C.alcGetIntegerv(d.data, param, size, &ALCint(values.data))
	check_error(d)
	return values
}
