module test

import alc

fn test_open_device() ! {
	mut device := alc.create_device()
	device.open(alc.default_device)!
	assert device.close()!
}

fn test_extensions() {
	mut device := alc.create_device()
	device.open_default()!
	//
	assert device.is_extension_present('ALC_ENUMERATION_EXT')! == true
	assert device.is_extension_present('abc')! == false
	//
	assert device.get_string(alc.alc_extentions)! != ''
	//
	assert device.close()!
}

fn test_string_properties() ! {
	mut device := alc.create_device()
	device.open(alc.default_device)!
	//
	device.get_string(alc.alc_default_device_specifier)!
	device.get_string(alc.alc_device_specifier)!
	//
	assert device.close()!
}

fn test_integer_properties() ! {
	mut device := alc.create_device()
	device.open(alc.default_device)!
	//
	mut res := device.get_integers(alc.alc_major_version, 1)!
	assert res.len == 1
	assert res[0] == 1
	//
	res = device.get_integers(alc.alc_minor_version, 1)!
	assert res.len == 1
	assert res[0] == 1
	//
	assert device.close()!
}

fn test_misc() {
	mut device := alc.create_device()
	device.open_default()!
	//
	device.get_proc_addr('')!
	device.get_enum_value('')!
	//
	assert device.close()!
}
