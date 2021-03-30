module alc

fn test_alc() {
	mut device := alc.new_device()
	assert device.open()
	defer { assert device.close() }
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
	//
	context.process()
	context.suspend()
	//
	used_device := context.get_device()
	assert device == used_device	
}
