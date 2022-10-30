module test

import alc

type AnonOptionalFun = fn () !

// do_test is used to test functionality
pub fn do_test(cb AnonOptionalFun) {
	$if test {
		concrete_test(cb) or { panic(err) }
	} $else {
		dummy_test()
	}
}

fn dummy_test() {
}

fn concrete_test(cb AnonOptionalFun) ! {
	mut device := alc.create_device()
	device.open_default()!
	mut context := alc.create_context_from_device(device)!
	context.make_current()!
	//
	cb()!
	//
	assert alc.remove_current_context()
	context.destroy()!
	assert device.close()!
}
