module test

import time
import al
import alc

fn test_capture() ! {
	mut device := alc.create_capture_device()
	assert device.open_default(60, al.al_format_mono16, 128)!
	//
	device.start()!
	time.sleep(1 * time.second)
	_ := device.samples(10)!
	device.stop()!
	//
	closed := device.close()!
	assert closed
}

fn test_default_capture() ! {
	mut device := alc.create_device()
	device.open(alc.default_device)!
	_ := device.get_string(alc.alc_capture_default_device_specifier)!
	device.close()!
	//
	mut capture_device := alc.create_capture_device()
	assert capture_device.open_default(60, al.al_format_mono16, 8)!
	assert capture_device.close()!
}
