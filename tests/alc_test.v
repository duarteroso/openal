module tests

import alc

fn test_alc_basic() {
	mut device := alc.new_device()
	assert device.open()
	//
	mut context := alc.new_context()
	assert context.create(device)
	assert context.make_current()
	//
	context.destroy()
	assert device.close()
}

fn test_alc_full() {
	mut device := alc.new_device()
	assert device.open()
	//
	mut context := alc.new_context()
	mut other_context := alc.new_context()
	//
	assert context.create(device)
	assert other_context.create(device)
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
	//
	context.destroy()
	other_context.destroy()
	//
	assert device.close()
}
