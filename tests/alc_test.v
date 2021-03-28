module tests

import time
import alc

fn test_context() {
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
	current_context := alc.get_current_context()
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
