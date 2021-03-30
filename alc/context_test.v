module alc

fn test_context() {
	mut device := new_device()
	device.open_default()
	defer {
		device.close()
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
	_ := context.get_device()
	//
	context.process()
	context.suspend()
}
