module alc

fn test_alc() {
	mut device := new_device()
	assert device.open_default()
	defer {
		assert device.close()
	}
	//
	mut context := new_context()
	mut other_context := new_context()
	//
	assert context.create(device)
	defer {
		context.destroy()
	}
	assert other_context.create(device)
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
