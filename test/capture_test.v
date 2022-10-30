module test

import time
import al
import alc

const freq = 60

const buffer_size = 128

fn test_open_default_capture() ! {
	mut device := alc.create_capture_device()
	device.open_default(test.freq, al.BufferFormat.mono16, test.buffer_size)!
	assert device.close()!
}

fn test_open_capture() ! {
	mut device := alc.create_capture_device()
	device.open(alc.default_device, test.freq, al.BufferFormat.mono16, test.buffer_size)!
	assert device.close()!
}

fn test_open_capture_mono() ! {
	mut device := alc.create_capture_device()
	device.open_default(test.freq, al.BufferFormat.mono8, test.buffer_size)!
	assert device.close()!
	//
	device.open_default(test.freq, al.BufferFormat.mono16, test.buffer_size)!
	assert device.close()!
}

fn test_open_capture_stereo() ! {
	mut device := alc.create_capture_device()
	device.open_default(test.freq, al.BufferFormat.stereo8, test.buffer_size)!
	assert device.close()!
	//
	device.open_default(test.freq, al.BufferFormat.stereo16, test.buffer_size)!
	assert device.close()!
}

fn test_capture() ! {
	mut device := alc.create_capture_device()
	device.open_default(test.freq, al.BufferFormat.mono16, test.buffer_size)!
	device.start()!
	//
	mut sample_count := 0
	for sample_count == 0 {
		time.sleep(60 * time.millisecond)
		sample_count = device.get_sample_count()!
	}
	samples := device.samples(10)!
	assert samples.len > 0
	//
	device.stop()!
	assert device.close()!
}

fn test_capture_properties() ! {
	mut device := alc.create_capture_device()
	device.open_default(test.freq, al.BufferFormat.mono16, test.buffer_size)!
	//
	device.get_string(alc.alc_capture_default_device_specifier)!
	device.get_string(alc.alc_capture_device_specifier)!
	//
	assert device.close()!
}
