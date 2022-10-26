module test

import al

fn test_source_creation() {
	test := fn () ! {
		mut source := al.create_source()
		source.generate()!
		assert source.is_valid()
		//
		source.release()!
		assert source.is_valid() == false
	}
	//
	do_test(test)
}

fn test_batch_source_creation() {
	test := fn () ! {
		mut sources := []al.Source{len: 3}
		mut valid := false
		//
		al.create_sources(mut sources)!
		for source in sources {
			assert source.is_valid()
		}
		//
		al.release_sources(sources)!
		for source in sources {
			assert source.is_valid() == false
		}
	}
	//
	do_test(test)
}

fn test_source_properties() {
	test := fn () ! {
		mut source := al.create_source()
		source.generate()!
		//
		source.set_relative(true)!
		mut rel := source.is_relative()!
		assert rel
		source.set_relative(false)!
		rel = source.is_relative()!
		assert rel == false
		//
		source.loop(true)!
		mut looping := source.is_looping()!
		assert looping
		source.loop(false)!
		looping = source.is_looping()!
		assert looping == false
		//
		tp := source.get_type()!
		assert tp == al.SourceType.undetermined
		st := source.get_state()!
		assert st == al.SourceState.initial
		//
		source.get_offset_time()!
		source.get_offset_sample()!
		source.get_offset_byte()!
		//
		value := f32(0.123)
		//
		source.set_pitch(value)!
		pitch := source.get_pitch()!
		assert pitch == value
		//
		source.set_gain(value)!
		gain := source.get_gain()!
		assert gain == value
		//
		source.set_gain_bounds(value, value + 1)!
		bmin, bmax := source.get_gain_bounds()!
		assert bmin == value && bmax == value + 1
		//
		source.set_max_distance(value)!
		md := source.get_max_distance()!
		assert md == value
		//
		source.set_rolloff(value)!
		ro := source.get_rolloff()!
		assert ro == value
		//
		source.set_cone_outer_gain(value)!
		source.set_cone_outer_angle(value)!
		source.set_cone_inner_angle(value)!
		og := source.get_cone_outer_gain()!
		assert og == value
		oa := source.get_cone_outer_angle()!
		assert oa == value
		ia := source.get_cone_inner_angle()!
		assert ia == value
		//
		source.set_reference_distance(value)!
		rd := source.get_reference_distance()!
		assert rd == value
		//
		p := [f32(1), 2, 3]
		v := [f32(3), 2, 1]
		d := [f32(1), 0, 0]
		mut t := [f32(0), 0, 0]
		//
		source.set_position(p[0], p[1], p[2])!
		t[0], t[1], t[2] = source.get_position()!
		assert p == t
		//
		source.set_velocity(v[0], v[1], v[2])!
		t[0], t[1], t[2] = source.get_velocity()!
		assert v == t
		//
		source.set_direction(d[0], d[1], d[2])!
		t[0], t[1], t[2] = source.get_direction()!
		assert d == t
		//
		source.release()!
	}
	//
	do_test(test)
}

fn test_source_buffer() {
	test := fn () ! {
		mut buffer := al.create_buffer()
		buffer.generate()!
		//
		mut source := al.create_source()
		source.generate()!
		//
		id := int(buffer.get_id())
		source.link_to_buffer(buffer)!
		buffer_id := source.get_sourcei(al.al_buffer)!
		assert buffer_id == id
		//
		source.get_buffer_id()!
		source.get_buffers_queued()!
		source.get_buffers_processed()!
		//
		source.release()!
		buffer.release()!
	}
	//
	do_test(test)
}

fn test_source_playback() {
	test := fn () ! {
		mut buffer := al.create_buffer()
		buffer.generate()!
		//
		mut source := al.create_source()
		source.generate()!
		source.link_to_buffer(buffer)!
		source.play()!
		source.pause()!
		source.play()!
		source.rewind()!
		source.stop()!
		source.release()!
		//
		buffer.release()!
	}
	//
	do_test(test)
}

fn test_multiple_source_playback() {
	test := fn () ! {
		amount := 5
		mut buffers := []al.Buffer{len: amount}
		al.generate_buffers(mut buffers)!
		for mut buffer in buffers {
			buffer.generate()!
		}
		//
		mut sources := []al.Source{len: amount}
		al.create_sources(mut sources)!
		for mut source in sources {
			source.generate()!
		}
		//
		for i in 0 .. amount {
			sources[i].link_to_buffer(buffers[i])!
		}
		//
		al.play_sources(sources)!
		al.pause_sources(sources)!
		al.play_sources(sources)!
		al.rewind_sources(sources)!
		al.stop_sources(sources)!
		//
		al.release_sources(sources)!
		al.release_buffers(buffers)!
	}
	//
	do_test(test)
}
