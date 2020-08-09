module vopenal

// Forward declarations
fn C.alcOpenDevice(devicename charptr) voidptr 
fn C.alcCloseDevice(device voidptr) byte
fn C.alcIsExtensionPresent(device voidptr, extname charptr) byte
fn C.alcGetProcAddress(device voidptr, funcname charptr) voidptr
fn C.alcGetEnumValue(device voidptr, enumname charptr) int

// Device Structure grouping device functions
pub struct Device {
mut:
	data voidptr
}

// create_device
pub fn create_device(data voidptr) &Device {
	return &Device{
		data: data
	}
}

// open_device
pub fn (mut d Device) open_device(name string) {
	d.data = C.alcOpenDevice(name.str)
	alc_check_error()
}

// close_device
pub fn (d &Device) close_device() bool {
	ok := C.alcCloseDevice(d.data)
	alc_check_error()
	return ok != 0
}

// get_data
pub fn (d &Device) get_data() voidptr {
	return d.data
}

// is_extension_present
pub fn (d &Device) is_extension_present(name string) bool {
	ok := C.alcIsExtensionPresent(d.data, name.str)
	alc_check_error()
	return ok != 0
}

// get_proc_addr
pub fn (d &Device) get_proc_addr(name string) voidptr {
	ptr := C.alcGetProcAddress(d.data, name.str)
	alc_check_error()
	return ptr
}

// get_enum_value
pub fn (d &Device) get_enum_value(name string) int {
	value := C.alcGetEnumValue(d.data, name.str)
	alc_check_error()
	return value
}