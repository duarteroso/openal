module alc

// Forward declarations
[typedef] struct C.ALCdevice { }

fn C.alcOpenDevice(devicename charptr) &C.ALCdevice

fn C.alcCloseDevice(device voidptr) byte

fn C.alcIsExtensionPresent(device &C.ALCdevice, extname charptr) byte

fn C.alcGetProcAddress(device &C.ALCdevice, funcname charptr) voidptr

fn C.alcGetEnumValue(device &C.ALCdevice, enumname charptr) int

// Device wraps functionality around OpenALC device
pub struct Device {
mut:
	data &C.ALCdevice = &C.ALCdevice(0)
}

// new_device creates an instance of Device
pub fn new_device(data &C.ALCdevice) &Device {
	return &Device{
		data: data
	}
}

// open device
pub fn (mut d Device) open() bool {
	d.data = C.alcOpenDevice(charptr(0))
	return d.data != &C.ALCdevice(0)
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
	check_error(d.data)
	return ok == alc_true
}

// get_proc_addr returns the process address
pub fn (d &Device) get_proc_addr(name string) voidptr {
	ptr := C.alcGetProcAddress(d.data, name.str)
	check_error(d.data)
	return ptr
}

// get_enum_value returns an enumeration value
pub fn (d &Device) get_enum_value(name string) int {
	value := C.alcGetEnumValue(d.data, name.str)
	check_error(d.data)
	return value
}

// get_string returns a device parameter as string
pub fn (d &Device) get_string(param int) string {
	s := C.alcGetString(d.data, param)
	check_error(d.data)
	return tos3(s)
}

// get_integers returns a device parameters as vector of strings
pub fn (d &Device) get_integers(param int, size int) []int {
	values := []int{len: size}
	C.alcGetIntegerv(d.data, param, size, &values.data)
	check_error(d.data)
	return values
}