module alc

fn test_context() {
	mut device := new_device()
	device.open(default_device)
	defer {
		device.close()
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
	_ := context.get_device()
	//
	context.process()
	context.suspend()
}
