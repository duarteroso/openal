module test

import al
import rand
import time

fn test_source_create() {
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

fn test_source_create_multiple() {
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

fn test_source_id() {
	test := fn () ! {
		mut source := al.create_source()
		source.generate()!
		assert source.is_valid()
		assert source.get_id() == 1
		//
		source.release()!
		source.generate()!
		assert source.is_valid()
		assert source.get_id() == 1
		//
		source.release()!
	}
	//
	do_test(test)
}

fn test_source_multiple_id() {
	test := fn () ! {
		mut s1 := al.create_source()
		mut s2 := al.create_source()
		//
		s1.generate()!
		s2.generate()!
		//
		assert s1.get_id() == 1
		assert s2.get_id() == 2
		//
		s1.release()!
		s2.release()!
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
		source.attach_buffer(buffer)!
		assert source.get_attached_buffer()! == int(buffer.get_id())
		//
		source.get_buffers_queued()!
		source.get_buffers_processed()!
		//
		source.detach_buffer()!
		source.release()!
		buffer.release()!
	}
	//
	do_test(test)
}

fn test_source_relative() {
	test := fn () ! {
		mut source := al.create_source()
		source.generate()!
		//
		source.set_relative(true)!
		assert source.is_relative()! == true
		//
		source.set_relative(false)!
		assert source.is_relative()! == false
		//
		source.release()!
	}
	//
	do_test(test)
}

fn test_source_undertermined_type() {
	test := fn () ! {
		mut source := al.create_source()
		source.generate()!
		//
		assert source.get_type()! == al.SourceType.source_undetermined
		//
		source.release()!
	}
	//
	do_test(test)
}

fn test_source_static_type() {
	test := fn () ! {
		mut buffer := al.create_buffer()
		buffer.generate()!
		//
		data := []u8{len: 10, init: -1}
		buffer.set_unsigned_data(al.UnsignedBufferFormat.mono, data, 60)!
		//
		mut source := al.create_source()
		source.generate()!
		source.attach_buffer(buffer)!
		//
		assert source.get_type()! == al.SourceType.source_static
		//
		source.release()!
		buffer.release()!
	}
	//
	do_test(test)
}

fn test_source_streaming_type() {
	test := fn () ! {
		create_buffer := fn () !al.Buffer {
			mut buffer := al.create_buffer()
			buffer.generate()!
			//
			data := []u8{len: 10, init: -1}
			buffer.set_unsigned_data(al.UnsignedBufferFormat.mono, data, 60)!
			return buffer
		}
		//
		b1 := create_buffer()!
		b2 := create_buffer()!
		//
		mut source := al.create_source()
		source.generate()!
		//
		source.queue_buffer(b1)!
		source.queue_buffer(b2)!
		assert source.get_buffers_queued()! == 2
		//
		assert source.get_type()! == al.SourceType.source_streaming
		//
		source.play()!
		time.sleep(500 * time.millisecond)
		assert source.get_buffers_processed()! == 2
		//
		ub1 := source.unqueue_buffer()!
		assert ub1.get_id() == b1.get_id()
		//
		ub2 := source.unqueue_buffer()!
		assert ub2.get_id() == b2.get_id()
		//
		source.release()!
		b2.release()!
		b1.release()!
	}
	//
	do_test(test)
}

fn test_source_state() {
	test := fn () ! {
		mut buffer := al.create_buffer()
		buffer.generate()!
		data := []u8{len: 10, init: -1}
		buffer.set_unsigned_data(al.UnsignedBufferFormat.mono, data, 60)!
		//
		mut source := al.create_source()
		source.generate()!
		source.attach_buffer(buffer)!
		assert source.get_state()! == al.SourceState.initial
		//
		source.loop(false)!
		assert source.is_looping()! == false
		source.loop(true)!
		assert source.is_looping()! == true
		//
		source.play()!
		assert source.get_state()! == al.SourceState.playing
		//
		source.pause()!
		assert source.get_state()! == al.SourceState.paused
		//
		source.play()!
		assert source.get_state()! == al.SourceState.playing
		//
		source.stop()!
		assert source.get_state()! == al.SourceState.stopped
		//
		source.rewind()!
		assert source.get_state()! == al.SourceState.initial
		//
		source.detach_buffer()!
		source.release()!
		buffer.release()!
	}
	//
	do_test(test)
}

fn test_source_pitch() {
	test := fn () ! {
		mut source := al.create_source()
		source.generate()!
		//
		pitch := rand.f32()
		source.set_pitch(pitch)!
		assert source.get_pitch()! == pitch
		//
		source.release()!
	}
	//
	do_test(test)
}

fn test_source_gain() {
	test := fn () ! {
		mut source := al.create_source()
		source.generate()!
		//
		gain := rand.f32()
		source.set_gain(gain)!
		assert source.get_gain()! ==gain
		//
		source.release()!
	}
	//
	do_test(test)
}

fn test_source_gain_bounds() {
	test := fn () ! {
		mut source := al.create_source()
		source.generate()!
		//
		min1 := rand.f32()
		max1 := rand.f32()
		source.set_gain_bounds(min1, max1)!
		min2, max2 := source.get_gain_bounds()!
		assert min1 == min2
		assert max1 == max2
		//
		source.release()!
	}
	//
	do_test(test)
}

fn test_source_max_distance() {
	test := fn () ! {
		mut source := al.create_source()
		source.generate()!
		//
		max := rand.f32()
		source.set_max_distance(max)!
		assert source.get_max_distance()! == max
		//
		source.release()!
	}
	//
	do_test(test)
}

fn test_source_rolloff() {
	test := fn () ! {
		mut source := al.create_source()
		source.generate()!
		//
		factor := rand.f32()
		source.set_rolloff(factor)!
		assert source.get_rolloff()! == factor
		//
		source.release()!
	}
	//
	do_test(test)
}

fn test_source_cone_outer_gain() {
	test := fn () ! {
		mut source := al.create_source()
		source.generate()!
		//
		gain := rand.f32()
		source.set_cone_outer_gain(gain)!
		assert source.get_cone_outer_gain()! == gain
		//
		source.release()!
	}
	//
	do_test(test)
}

fn test_source_cone_inner_angle() {
	test := fn () ! {
		mut source := al.create_source()
		source.generate()!
		//
		angle := rand.f32n(360)!
		source.set_cone_inner_angle(angle)!
		assert source.get_cone_inner_angle()! == angle
		//
		source.release()!
	}
	//
	do_test(test)
}

fn test_source_cone_outer_angle() {
	test := fn () ! {
		mut source := al.create_source()
		source.generate()!
		//
		angle := rand.f32n(360)!
		source.set_cone_outer_angle(angle)!
		assert source.get_cone_outer_angle()! == angle
		//
		source.release()!
	}
	//
	do_test(test)
}

fn test_source_reference_distance() {
	test := fn () ! {
		mut source := al.create_source()
		source.generate()!
		//
		dist := rand.f32()
		source.set_reference_distance(dist)!
		assert source.get_reference_distance()! == dist
		//
		source.release()!
	}
	//
	do_test(test)
}

fn test_source_position() {
	test := fn () ! {
		mut source := al.create_source()
		source.generate()!
		//
		x1, y1, z1 := 11, 22, 33
		source.set_position(x1, y1, z1)!
		x2, y2, z2 := source.get_position()!
		assert x1 == x2
		assert y1 == y2
		assert z1 == z2
		//
		source.release()!
	}
	//
	do_test(test)
}

fn test_source_velocity() {
	test := fn () ! {
		mut source := al.create_source()
		source.generate()!
		//
		x1, y1, z1 := 11, 22, 33
		source.set_velocity(x1, y1, z1)!
		x2, y2, z2 := source.get_velocity()!
		assert x1 == x2
		assert y1 == y2
		assert z1 == z2
		//
		source.release()!
	}
	//
	do_test(test)
}

fn test_source_direction() {
	test := fn () ! {
		mut source := al.create_source()
		source.generate()!
		//
		x1, y1, z1 := 11, 22, 33
		source.set_direction(x1, y1, z1)!
		x2, y2, z2 := source.get_direction()!
		assert x1 == x2
		assert y1 == y2
		assert z1 == z2
		//
		source.release()!
	}
	//
	do_test(test)
}

fn test_source_multiple_playback() {
	test := fn () ! {
		amount := 5
		mut buffers := []al.Buffer{len: amount}
		al.generate_buffers(mut buffers)!
		//
		mut sources := []al.Source{len: amount}
		al.create_sources(mut sources)!
		//
		for idx in 0 .. amount {
			buffers[idx].generate()!
			sources[idx].generate()!
			sources[idx].attach_buffer(buffers[idx])!
		}
		//
		al.play_sources(sources)!
		al.pause_sources(sources)!
		al.play_sources(sources)!
		al.stop_sources(sources)!
		al.rewind_sources(sources)!
		//
		al.release_sources(sources)!
		al.release_buffers(buffers)!
	}
	//
	do_test(test)
}