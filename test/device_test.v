module test

import alc

fn test_device() ! {
	mut device := alc.create_device()
	device.open(alc.default_device)!
	device.close()!
}

fn test_properties() ! {
	mut device := alc.create_device()
	device.open(alc.default_device)!
	//
	device.get_data()
	device.is_extension_present('abc')!
	device.get_proc_addr('')!
	device.get_enum_value('')!
	//
	device.get_string(alc.alc_default_device_specifier)!
	device.get_string(alc.alc_device_specifier)!
	device.get_string(alc.alc_capture_default_device_specifier)!
	device.get_string(alc.alc_capture_device_specifier)!
	device.get_string(alc.alc_extentions)!
	//
	device.get_integers(alc.alc_major_version, 1)!
	device.get_integers(alc.alc_minor_version, 1)!
	//
	device.close()!
}
