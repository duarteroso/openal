module test

import al

fn test_buffer_creation() {
	test := fn () ? {
		mut buffer := al.create_buffer()
		buffer.generate()?
		assert buffer.is_valid()
		//
		buffer.release()?
		assert buffer.is_valid() == false
	}
	//
	do_test(test)
}

fn test_batch_buffer_creation() {
	test := fn () ? {
		mut buffers := []al.Buffer{len: 3}
		mut valid := false
		//
		al.generate_buffers(mut buffers)?
		for buffer in buffers {
			assert buffer.is_valid()
		}
		//
		al.release_buffers(buffers)?
		for buffer in buffers {
			assert buffer.is_valid() == false
		}
	}
	//
	do_test(test)
}

fn test_buffer_getters() {
	test := fn () ? {
		mut buffer := al.create_buffer()
		buffer.generate()?
		//
		buffer.get_frequency()?
		buffer.get_bits()?
		buffer.get_channels()?
		buffer.get_size()?
		//
		buffer.release()?
	}
	//
	do_test(test)
}

fn test_buffer_attributes() {
	test := fn () ? {
		mut buffer := al.create_buffer()
		buffer.generate()?
		//
		buffer.get_bufferi(al.al_frequency)?
		buffer.get_bufferi(al.al_bits)?
		buffer.get_bufferi(al.al_channels)?
		buffer.get_bufferi(al.al_size)?
		//
		buffer.release()?
	}
	//
	do_test(test)
}

fn test_buffer_data() ? {
	test := fn () ? {
		mut buffer := al.create_buffer()
		buffer.generate()?
		//
		mono_data := []u32{len: 10, init: -1}
		buffer.set_data(.mono8, mono_data.data, mono_data.len, 60.0)?
		buffer.set_data(.mono16, mono_data.data, mono_data.len, 60.0)?
		//
		stereo_data := []int{len: 20, init: 10}
		buffer.set_data(.stereo8, stereo_data.data, stereo_data.len, 60.0)?
		buffer.set_data(.stereo16, stereo_data.data, stereo_data.len, 60.0)?
		//
		buffer.release()?
	}
	//
	do_test(test)
}
