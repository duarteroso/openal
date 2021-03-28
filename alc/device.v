module alc

// Forward declarations
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

// Device wraps functionality around OpenALC device
pub struct Device {
mut:
	data &C.ALCdevice = voidptr(0)
}

// new_device creates an instance of Device
pub fn new_device() &Device {
	return new_device_from_data(voidptr(0))
}

// new_device creates an instance of Device from data
pub fn new_device_from_data(data &C.ALCdevice) &Device {
	return &Device {
		data: data
	}
}

// open device
pub fn (mut d Device) open() bool {
	d.data = C.alcOpenDevice(voidptr(0))
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
	ok := C.alcIsExtensionPresent(d.data, name.str)
	d.check_error()
	return ok == alc_true
}

// get_proc_addr returns the process address
pub fn (d &Device) get_proc_addr(name string) voidptr {
	ptr := C.alcGetProcAddress(d.data, name.str)
	d.check_error()
	return ptr
}

// get_enum_value returns an enumeration value
pub fn (d &Device) get_enum_value(name string) int {
	value := C.alcGetEnumValue(d.data, name.str)
	d.check_error()
	return value
}

// get_string returns a device parameter as string
pub fn (d &Device) get_string(param int) string {
	s := C.alcGetString(d.data, param)
	d.check_error()
	return unsafe { tos3(s) }
}

// get_integers returns a device parameters as vector of strings
pub fn (d &Device) get_integers(param int, size int) []int {
	values := []int{len: size}
	C.alcGetIntegerv(d.data, param, size, &values.data)
	d.check_error()
	return values
}

// has_error returns true if there is a pending ALC error
pub fn (d &Device) has_error() bool {
	return C.alcGetError(d.data) != alc_no_error
}

// get_error returns the pending ALC error
pub fn (d &Device) get_error() Err {
	c := C.alcGetError(d.data)
	return new_error(c)
}

// check_error checks and panics on errors
pub fn (d &Device) check_error() {
	if d.has_error() {
		err := d.get_error()
		panic(err.str())
	}
}
