module test

import alc

fn test_context() ! {
	mut device := alc.create_device()
	device.open_default()!
	//
	mut context := alc.create_context_from_device(device)!
	assert context.make_current()!
	assert alc.remove_current_context()
	//
	context.destroy()!
	assert device.close()!
}

fn test_context_switching() ! {
	mut device := alc.create_device()
	device.open_default()!
	//
	mut first := alc.create_context_from_device(device)!
	mut second := alc.create_context_from_device(device)!
	//
	assert second.make_current()!
	alc.get_current_context()!
	second.process()!
	second.suspend()!
	assert alc.remove_current_context()
	second.destroy()!
	//
	assert first.make_current()!
	alc.get_current_context()!
	first.process()!
	first.suspend()!
	assert alc.remove_current_context()
	first.destroy()!
	//
	assert device.close()!
}
