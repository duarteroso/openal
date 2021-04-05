module al

import alc

fn test_source_creation() {
	test := fn () {
		mut source := new_source()
		source.generate()
		assert source.is_valid()
		//
		source.release()
		assert source.is_valid() == false
	}
	//
	alc.do_test(test)
}

fn test_batch_source_creation() {
	test := fn () {
		sources := new_sources(3)
		assert sources.len == 3
		for source in sources {
			assert source.is_valid()
		}
		//
		release_sources(sources)
		for source in sources {
			assert source.is_valid() == false
		}
	}
	//
	alc.do_test(test)
}

fn test_source_properties() {
	test := fn () {
		mut source := new_source()
		source.generate()
		defer {
			source.release()
		}
		//
		source.sourcei(al_source_relative, al_true)
		assert source.is_relative() == true
		source.sourcei(al_source_relative, al_false)
		assert source.get_sourcei(al_source_relative) == al_false
		//
		source.loop(true)
		assert source.is_looping()
		source.loop(false)
		assert source.is_looping() == false
		//
		assert source.get_type() == SourceType.undetermined
		assert source.get_state() == SourceState.initial
		//
		source.get_offset_time()
		source.get_offset_sample()
		source.get_offset_byte()
		//
		value := f32(0.123)
		//
		source.set_pitch(value)
		assert source.get_pitch() == value
		//
		source.set_gain(value)
		assert source.get_gain() == value
		//
		source.set_gain_bounds(value, value + 1)
		bmin, bmax := source.get_gain_bounds()
		assert bmin == value && bmax == value + 1
		//
		source.set_max_distance(value)
		assert source.get_max_distance() == value
		//
		source.set_rolloff(value)
		assert source.get_rolloff() == value
		//
		source.set_cone_outer_gain(value)
		source.set_cone_outer_angle(value)
		source.set_cone_inner_angle(value)
		assert source.get_cone_outer_gain() == value
		assert source.get_cone_outer_angle() == value
		assert source.get_cone_inner_angle() == value
		//
		source.set_reference_distance(value)
		assert source.get_reference_distance() == value
		//
		p := [f32(1), 2, 3]
		v := [f32(3), 2, 1]
		d := [f32(1), 0, 0]
		mut t := [f32(0), 0, 0]
		//
		source.set_position(p[0], p[1], p[2])
		t[0], t[1], t[2] = source.get_position()
		assert p == t
		//
		source.set_velocity(v[0], v[1], v[2])
		t[0], t[1], t[2] = source.get_velocity()
		assert v == t
		//
		source.set_direction(d[0], d[1], d[2])
		t[0], t[1], t[2] = source.get_direction()
		assert d == t
	}
	//
	alc.do_test(test)
}

fn test_source_buffer() {
	test := fn () {
		mut buffer := new_buffer()
		buffer.generate()
		defer {
			buffer.release()
		}
		//
		mut source := new_source()
		source.generate()
		defer {
			source.release()
		}
		//
		id := int(buffer.get_id())
		source.link_to_buffer(buffer)
		assert source.get_sourcei(al_buffer) == id
		//
		source.get_buffer_id()
		source.get_buffers_queued()
		source.get_buffers_processed()
	}
	//
	alc.do_test(test)
}

fn test_source_playback() {
	test := fn () {
		mut buffer := new_buffer()
		buffer.generate()
		defer {
			buffer.release()
		}
		//
		mut source := new_source()
		source.generate()
		defer {
			source.release()
		}
		//
		source.link_to_buffer(buffer)
		source.play()
		source.pause()
		source.play()
		source.rewind()
		source.stop()
	}
	//
	alc.do_test(test)
}

fn test_multiple_source_playback() {
	test := fn () {
		amount := 5
		mut buffers := new_buffers(amount)
		for mut buffer in buffers {
			buffer.generate()
		}
		defer {
			release_buffers(buffers)
		}
		//
		mut sources := new_sources(amount)
		for mut source in sources {
			source.generate()
		}
		defer {
			release_sources(sources)
		}
		//
		for i in 0 .. amount {
			sources[i].link_to_buffer(buffers[i])
		}
		//
		play_sources(sources)
		pause_sources(sources)
		play_sources(sources)
		rewind_sources(sources)
		stop_sources(sources)
	}
	//
	alc.do_test(test)
}
