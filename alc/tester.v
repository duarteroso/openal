module alc

// do_test is used to test functionality
pub fn do_test(cb fn ()) {
	$if test {
		mut device := new_device()
		device.open_default()
		defer {
			device.close()
		}
		//
		mut context := new_context()
		context.create(device)
		defer {
			context.destroy()
		}
		context.make_current()
		//
		cb()
	}
}