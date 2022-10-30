module test

import al

fn test_buffer_create() {
	test := fn () ! {
		mut buffer := al.create_buffer()
		buffer.generate()!
		assert buffer.is_valid()
		//
		buffer.release()!
		assert buffer.is_valid() == false
	}
	//
	do_test(test)
}

fn test_buffer_create_multiple() {
	test := fn () ! {
		mut buffers := []al.Buffer{len: 3}
		mut valid := false
		//
		al.generate_buffers(mut buffers)!
		for buffer in buffers {
			assert buffer.is_valid()
		}
		//
		al.release_buffers(buffers)!
		for buffer in buffers {
			assert buffer.is_valid() == false
		}
	}
	//
	do_test(test)
}

fn test_buffer_id() {
	test := fn () ! {
		mut buffer := al.create_buffer()
		buffer.generate()!
		assert buffer.get_id() == 1
		buffer.release()!
		//
		buffer.generate()!
		assert buffer.get_id() == 1
		buffer.release()!
	}
	//
	do_test(test)
}

fn test_multiple_buffer_id() {
	test := fn () ! {
		mut buffer := al.create_buffer()
		mut buffer2 := al.create_buffer()
		//
		buffer.generate()!
		buffer2.generate()!
		//
		assert buffer.get_id() == 1
		assert buffer2.get_id() == 2
		//
		buffer.release()!
		buffer2.release()!
	}
	//
	do_test(test)
}

fn test_buffer_frequency() {
	test := fn () ! {
		mut buffer := al.create_buffer()
		buffer.generate()!
		//
		freq := int(60)
		mono := []u8{len: 10, init: -1}
		buffer.set_unsigned_data(al.UnsignedBufferFormat.mono, mono, freq)!
		assert buffer.get_frequency()! == freq
		//
		buffer.release()!
	}
	//
	do_test(test)
}

fn test_buffer_8bit_depth() {
	test := fn () ! {
		mut buffer := al.create_buffer()
		buffer.generate()!
		//
		mono := []u8{len: 10, init: -1}
		buffer.set_unsigned_data(al.UnsignedBufferFormat.mono, mono, 60)!
		assert buffer.get_bits()! == 8
		//
		buffer.release()!
	}
	//
	do_test(test)
}

fn test_buffer_16bit_depth() {
	test := fn () ! {
		mut buffer := al.create_buffer()
		buffer.generate()!
		//
		mono := []u16{len: 10, init: -1}
		buffer.set_signed_data(al.SignedBufferFormat.mono, mono, 60)!
		assert buffer.get_bits()! == 16
		//
		buffer.release()!
	}
	//
	do_test(test)
}

fn test_buffer_mono_channel() {
	test := fn () ! {
		mut buffer := al.create_buffer()
		buffer.generate()!
		//
		mono := []u8{len: 10, init: -1}
		buffer.set_unsigned_data(al.UnsignedBufferFormat.mono, mono, 60)!
		assert buffer.get_channels()! == 1
		//
		buffer.release()!
	}
	//
	do_test(test)
}

fn test_buffer_stereo_channel() {
	test := fn () ! {
		mut buffer := al.create_buffer()
		buffer.generate()!
		//
		mono := []u8{len: 10, init: -1}
		buffer.set_unsigned_data(al.UnsignedBufferFormat.stereo, mono, 60)!
		assert buffer.get_channels()! == 2
		//
		buffer.release()!
	}
	//
	do_test(test)
}

fn test_buffer_size() {
	test := fn () ! {
		mut buffer := al.create_buffer()
		buffer.generate()!
		//
		size := 10
		mono := []u8{len: size, init: -1}
		buffer.set_unsigned_data(al.UnsignedBufferFormat.mono, mono, 60)!
		assert buffer.get_size()! == size
		//
		buffer.release()!
	}
	//
	do_test(test)
}

fn test_buffer_unsigned_data() {
	test := fn () ! {
		mut buffer := al.create_buffer()
		buffer.generate()!
		//		
		mono := []u8{len: 10, init: -1}
		buffer.set_unsigned_data(al.UnsignedBufferFormat.mono, mono, 60)!
		buffer.set_unsigned_data(al.UnsignedBufferFormat.stereo, mono, 60)!
		//
		buffer.release()!
	}
	//
	do_test(test)
}

fn test_buffer_signed_data() {
	test := fn () ! {
		mut buffer := al.create_buffer()
		buffer.generate()!
		//		
		mono := []u16{len: 20, init: -1}
		buffer.set_signed_data(al.SignedBufferFormat.mono, mono, 60)!
		buffer.set_signed_data(al.SignedBufferFormat.stereo, mono, 60)!
		//
		buffer.release()!
	}
	//
	do_test(test)
}
