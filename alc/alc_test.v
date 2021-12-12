module alc

import duarteroso.semver

fn test_alc_version() {
	sv := version()
	assert sv.major == alc_major_version
	assert sv.minor == alc_minor_version
	assert sv.patch == 0
	assert sv.stage == semver.Stage.release
}

fn test_alc() {
	mut device := new_device()
	assert device.open(default_device)
	defer {
		assert device.close()
	}
	//
	mut context := new_context_from_device(device)
	defer {
		context.destroy()
	}
	mut other_context := new_context_from_device(device)
	defer {
		other_context.destroy()
	}
	//
	assert other_context.make_current()
	assert remove_current_context()
	//
	assert context.make_current()
	//
	_ := get_current_context()
	//
	context.process()
	context.suspend()
	//
	used_device := context.get_device()
	assert device == used_device
}
