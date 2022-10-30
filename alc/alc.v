module alc

import arrays

// get_current_context returns the current context
pub fn get_current_context() !&Context {
	data := C.alcGetCurrentContext()
	return create_context_from_data(data)
}

// remove_current_context removes the current context
pub fn remove_current_context() bool {
	ok := C.alcMakeContextCurrent(unsafe { nil })
	return ok == alc_true
}

pub fn get_all_extensions() ![]string {
	mut exts := []string{}
	device := create_device()
	str := device.get_string(alc_extentions)!
	exts = str.split(' ')
	return exts
}

pub fn get_all_devices() ![]string {
	device := create_device()
	str := device.get_string(alc_device_specifier)!
	array := str.split('\0')
	return arrays.filter_indexed<string>(array, fn (idx int, elem string) bool {
		return elem != ''
	})
}

pub fn get_all_capture_devices() ![]string {
	device := create_device()
	str := device.get_string(alc_capture_device_specifier)!
	array := str.split('\0')
	return arrays.filter_indexed<string>(array, fn (idx int, elem string) bool {
		return elem != ''
	})
}
