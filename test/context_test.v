module test

import alc

fn test_context() ? {
	mut device := alc.create_device()
	device.open(alc.default_device)?
	//
	mut context := alc.create_context_from_device(device)?
	mut other_context := alc.create_context_from_device(device)?
	//
	assert other_context.make_current()?
	assert alc.remove_current_context()
	//
	assert context.make_current()?
	other_context.destroy()?
	//
	_ := alc.get_current_context()?
	_ := context.get_device()
	//
	context.process()?
	context.suspend()?
	//
	context.destroy()?
	device.close()?
}
