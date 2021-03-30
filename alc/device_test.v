module alc

fn test_device() {
	mut device := new_device()
	assert device.open_default()
	assert device.close()
}

fn test_properties() {
	mut device := new_device()
	device.open_default()
	defer {
		device.close()
	}
	//
	device.get_data()
	device.is_extension_present('abc')
	device.get_proc_addr('')
	device.get_enum_value('')
	//
	device.get_string(alc_default_device_specifier)
	device.get_string(alc_device_specifier)
	device.get_string(alc_capture_default_device_specifier)
	device.get_string(alc_capture_device_specifier)
	device.get_string(alc_extentions)
	//
	device.get_integers(alc_major_version, 1)
	device.get_integers(alc_minor_version, 1)
}
