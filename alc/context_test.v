module alc

fn test_context() {
	mut device := alc.new_device()
	device.open()
	defer { device.close() }
	//
	mut context := alc.new_context()
	mut other_context := alc.new_context()
	//
	assert context.create(device)
	defer { context.destroy() }
	assert other_context.create(device)
	defer { other_context.destroy() }
	//
	assert other_context.make_current()
	assert alc.remove_current_context()
	//
	assert context.make_current()
	//
	_ := alc.get_current_context()
	_ := context.get_device()
	//
	context.process()
	context.suspend()
}