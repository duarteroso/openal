module alc

import time
import duarteroso.vopenal.al

fn test_capture() {
	mut device := new_capture_device()
	assert device.open_default(60, al.al_format_mono16, 128)
	defer {
		assert device.close()
	}
	//
	device.start()
	time.sleep(1 * time.second)
	_ := device.samples(10)
	device.stop()
}

fn test_default_capture() {
	mut device := new_device()
	device.open_default()
	_ := device.get_string(alc_capture_default_device_specifier)
	device.close()
	//
	mut capture_device := new_capture_device()
	assert capture_device.open_default(60, al.al_format_mono16, 8)
	assert capture_device.close()
}
