module alc

// Device wraps functionality around ALCdevice
pub struct Device {
mut:
	data &C.ALCdevice = &C.ALCdevice(0)
}

// create_device creates an instance of Device
pub fn create_device() &Device {
	return create_device_from_data(unsafe { nil })
}

// create_device_from_data creates an instance of Device from data
pub fn create_device_from_data(data &C.ALCdevice) &Device {
	unsafe {
		return &Device{
			data: data
		}
	}
}

// open audio device by name
pub fn (mut d Device) open(name string) ! {
	d.data = C.alcOpenDevice(&char(name.str))
	if isnil(d.data) {
		return error('failed to open ALC device')
	}
}

pub fn (mut d Device) open_default() ! {
	d.open(default_device)!
}

// close device
pub fn (d &Device) close() !bool {
	ok := C.alcCloseDevice(d.data)
	if ok == alc_false {
		return error('failed to close ALC device: contexts or buffer attached')
	}
	return ok == alc_true
}

// get_data returns data from the device
pub fn (d &Device) get_data() &C.ALCdevice {
	return d.data
}

// is_extension_present checks if a certain extension is present
pub fn (d &Device) is_extension_present(name string) !bool {
	ok := C.alcIsExtensionPresent(d.data, name.str)
	check_error(d)!
	return ok == alc_true
}

// get_proc_addr returns the process address
pub fn (d &Device) get_proc_addr(name string) !voidptr {
	ptr := C.alcGetProcAddress(d.data, name.str)
	check_error(d)!
	return ptr
}

// get_enum_value returns an enumeration value
pub fn (d &Device) get_enum_value(name string) !int {
	value := C.alcGetEnumValue(d.data, name.str)
	check_error(d)!
	return value
}

// get_string returns a device parameter as string
pub fn (d &Device) get_string(param int) !string {
	s := C.alcGetString(d.data, param)
	check_error(d)!
	return unsafe { cstring_to_vstring(s) }
}

// get_integers returns a device parameters as vector of strings
pub fn (d &Device) get_integers(param int, size int) ![]int {
	values := []int{len: size, init: 0}
	C.alcGetIntegerv(d.data, param, size, values.data)
	check_error(d)!
	return values
}
