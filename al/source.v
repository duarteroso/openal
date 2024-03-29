module al

import math

// Source wraps functionality around an OpenAL source
pub struct Source {
mut:
	id u32
}

// create_source returns a new instance of Source
pub fn create_source() Source {
	return Source{}
}

// create_sources generates multiple instances of Source
pub fn create_sources(mut sources []Source) ! {
	assert sources.len > 0
	//
	n := sources.len
	mut values := []u32{len: n}
	C.alGenSources(n, values.data)
	check_error()!
	//
	for i in 0 .. n {
		sources[i] = Source{
			id: values[i]
		}
	}
}

// release_sources deletes multiple instances of Source
pub fn release_sources(s []Source) ! {
	values := convert_source_array(s)
	C.alDeleteSources(s.len, values.data)
	check_error()!
}

// convert_source_array transforms a Source array into an u32 array
fn convert_source_array(s []Source) []u32 {
	mut values := []u32{len: s.len}
	for i in 0 .. s.len {
		values[i] = s[i].id
	}
	return values
}

// generate source
pub fn (mut s Source) generate() ! {
	mut values := []u32{len: 1}
	C.alGenSources(values.len, values.data)
	check_error()!
	s.id = values[0]
}

// release source
pub fn (s Source) release() ! {
	values := [s.id]
	C.alDeleteSources(values.len, values.data)
	check_error()!
}

// get_id returns the id of the source
pub fn (s Source) get_id() u32 {
	return s.id
}

// is_valid returns true if source is valid
pub fn (s Source) is_valid() bool {
	ok := C.alIsSource(s.id)
	check_error() or {
		println('Failed to validate source: $err')
		return false
	}
	return ok == al_true
}

// attach_buffer attaches the buffer to the source
pub fn (s Source) attach_buffer(b &Buffer) ! {
	s.sourcei(int(SourceParameter.buffer), int(b.get_id()))!
}

// detach_buffer detaches a buffer from the source
pub fn (s Source) detach_buffer() ! {
	s.sourcei(int(SourceParameter.buffer), 0)!
}

// get_attached_buffer returns the attached buffer
pub fn (s Source) get_attached_buffer() !int {
	return s.get_sourcei(int(SourceParameter.buffer))!
}

// get_buffer_id returns the buffer id linked to the source
pub fn (s Source) get_buffer_id() !int {
	return s.get_sourcei(int(SourceParameter.buffer))
}

// set_relative sets the source as relative to the listener
pub fn (s Source) set_relative(rel bool) ! {
	v := if rel { al_true } else { al_false }
	s.sourcei(int(SourceParameter.source_relative), v)!
}

// is_relative returns true if source position is relative to listener
pub fn (s Source) is_relative() !bool {
	ret := s.get_sourcei(int(SourceParameter.source_relative))!
	return ret == al_true
}

// get_type returns a source type
pub fn (s Source) get_type() !SourceType {
	value := s.get_sourcei(int(SourceType.source_type))!
	return match value {
		int(SourceType.source_static), int(SourceType.source_streaming) { unsafe { SourceType(value) } }
		int(SourceType.source_undetermined) { SourceType.source_undetermined }
		else { SourceType.source_undetermined }
	}
}

// get_state returns a source state
pub fn (s Source) get_state() !SourceState {
	value := s.get_sourcei(int(SourceParameter.source_state))!
	return match value {
		int(SourceState.initial) { SourceState.initial }
		int(SourceState.playing) { SourceState.playing }
		int(SourceState.paused) { SourceState.paused }
		int(SourceState.stopped) { SourceState.stopped }
		else { SourceState.undetermined }
	}
}

// get_offset_time returns the playback position offset in seconds
pub fn (s Source) get_offset_time() !f32 {
	return s.get_sourcef(int(SourceProperty.sec_offset))
}

// get_offset_sample returns the playback position offset in samples
pub fn (s Source) get_offset_sample() !f32 {
	return s.get_sourcef(int(SourceProperty.sample_offset))
}

// get_offset_byte returns the playback position offset in byte
pub fn (s Source) get_offset_byte() !f32 {
	return s.get_sourcef(int(SourceProperty.byte_offset))
}

// get_buffers_queued returns the number of buffers queued in the source
pub fn (s Source) get_buffers_queued() !int {
	return s.get_sourcei(int(BuffersQueryParameter.queued))
}

// get_buffers_processed returns the number of buffers in the queue that have been processed
pub fn (s Source) get_buffers_processed() !int {
	return s.get_sourcei(int(BuffersQueryParameter.processed))
}

// get_pitch retuns the pitch of the source
pub fn (s Source) get_pitch() !f32 {
	return s.get_sourcef(int(SourceParameter.pitch))
}

// set_pitch sets the pitch of the source
pub fn (s Source) set_pitch(value f32) ! {
	s.sourcef(int(SourceParameter.pitch), value)!
}

// get_gain returns the gain of the source
pub fn (s Source) get_gain() !f32 {
	return s.get_sourcef(int(SourceParameter.gain))
}

// set_gain sets the gain of the source
pub fn (s Source) set_gain(value f32) ! {
	s.sourcef(int(SourceParameter.gain), value)!
}

// get_gain_bounds returns the min/max gain of the source
pub fn (s Source) get_gain_bounds() !(f32, f32) {
	min := s.get_sourcef(int(SourceParameter.min_gain))!
	max := s.get_sourcef(int(SourceParameter.max_gain))!
	return min, max
}

// set_gain_bounds sets the min/max gain of the source
pub fn (s Source) set_gain_bounds(min f32, max f32) ! {
	s.sourcef(int(SourceParameter.min_gain), min)!
	s.sourcef(int(SourceParameter.max_gain), max)!
}

// get_max_distance returns max distance of the source
pub fn (s Source) get_max_distance() !f32 {
	return s.get_sourcef(int(SourceProperty.max_distance))
}

// set_max_distance sets the max distance of the source
pub fn (s Source) set_max_distance(value f32) ! {
	s.sourcef(int(SourceProperty.max_distance), value)!
}

// get_rolloff returns the rolloff factor of the source
pub fn (s Source) get_rolloff() !f32 {
	return s.get_sourcef(int(SourceProperty.rolloff_factor))
}

// set_rolloff sets the rolloff factor of the source
pub fn (s Source) set_rolloff(value f32) ! {
	s.sourcef(int(SourceProperty.rolloff_factor), value)!
}

// get_cone_outer_gain returns the cone outer gain of the source
pub fn (s Source) get_cone_outer_gain() !f32 {
	return s.get_sourcef(int(SourceProperty.cone_outer_gain))
}

// set_cone_outer_gain sets the cone outer gain of the source
pub fn (s Source) set_cone_outer_gain(value f32) ! {
	s.sourcef(int(SourceProperty.cone_outer_gain), value)!
}

// get_cone_inner_angle returns the cone inner angle of the source
pub fn (s Source) get_cone_inner_angle() !f32 {
	return s.get_sourcef(int(SourceParameter.cone_inner_angle))
}

// set_cone_inner_angle sets the cone inner angle of the source
pub fn (s Source) set_cone_inner_angle(value f32) ! {
	s.sourcef(int(SourceParameter.cone_inner_angle), value)!
}

// get_cone_outer_angle returns the cone outer angle of the source
pub fn (s Source) get_cone_outer_angle() !f32 {
	return s.get_sourcef(int(SourceParameter.cone_outer_angle))
}

// set_cone_outer_angle sets the cone outer angle of the source
pub fn (s Source) set_cone_outer_angle(value f32) ! {
	s.sourcef(int(SourceParameter.cone_outer_angle), value)!
}

// get_reference_distance Get source reference distance
pub fn (s Source) get_reference_distance() !f32 {
	return s.get_sourcef(int(SourceProperty.reference_distance))
}

// set_reference_distance sets the reference distance of the source
pub fn (s Source) set_reference_distance(value f32) ! {
	s.sourcef(int(SourceProperty.reference_distance), value)!
}

// get_position returns the position of the source
pub fn (s Source) get_position() !(f32, f32, f32) {
	return s.get_source3f(int(SourceParameter.position))
}

// set_position sets the position of the source
pub fn (s Source) set_position(v1 f32, v2 f32, v3 f32) ! {
	s.source3f(int(SourceParameter.position), v1, v2, v3)!
}

// get_velocity returns the velocity of the source
pub fn (s Source) get_velocity() !(f32, f32, f32) {
	return s.get_source3f(int(SourceParameter.velocity))
}

// set_velocity sets the velocity of the source
pub fn (s Source) set_velocity(v1 f32, v2 f32, v3 f32) ! {
	s.source3f(int(SourceParameter.velocity), v1, v2, v3)!
}

// get_direction returns the direction of the source
pub fn (s Source) get_direction() !(f32, f32, f32) {
	return s.get_source3f(int(SourceParameter.direction))
}

// set_direction sets the direction of the source
pub fn (s Source) set_direction(v1 f32, v2 f32, v3 f32) ! {
	s.source3f(int(SourceParameter.direction), v1, v2, v3)!
}

// sourcef sets a source parameter value as float
pub fn (s Source) sourcef(param int, value f32) ! {
	C.alSourcef(s.id, param, value)
	check_error()!
}

// source3f sets a source parameter value as vector of floats
pub fn (s Source) source3f(param int, v1 f32, v2 f32, v3 f32) ! {
	C.alSource3f(s.id, param, v1, v2, v3)
	check_error()!
}

// sourcefv sets a source parameter value as vector of floats
pub fn (s Source) sourcefv(param int, values []f32) ! {
	C.alSourcefv(s.id, param, values.data)
	check_error()!
}

// sourcei sets a source parameter value as integer
pub fn (s Source) sourcei(param int, value int) ! {
	C.alSourcei(s.id, param, value)
	check_error()!
}

// source3i sets a source parameter value as vector of integers
pub fn (s Source) source3i(param int, v1 int, v2 int, v3 int) ! {
	C.alSource3i(s.id, param, v1, v2, v3)
	check_error()!
}

// sourceiv sets a source parameter value as vector of integers
pub fn (s Source) sourceiv(param int, values []int) ! {
	C.alSourceiv(s.id, param, values.data)
	check_error()!
}

// get_sourcef returns a source parameter value as float
fn (s Source) get_sourcef(param int) !f32 {
	value := f32(0)
	C.alGetSourcef(s.id, param, &value)
	check_error()!
	return value
}

// get_source3f returns a source parameter value as vector of floats
fn (s Source) get_source3f(param int) !(f32, f32, f32) {
	v1 := f32(0)
	v2 := f32(0)
	v3 := f32(0)
	C.alGetSource3f(s.id, param, &v1, &v2, &v3)
	check_error()!
	return v1, v2, v3
}

// get_sourcefv returns a source parameter value as vector of floats
fn (s Source) get_sourcefv(param int) ![]f32 {
	values := []f32{}
	C.alGetSourcefv(s.id, param, values.data)
	check_error()!
	return values
}

// get_sourcei returns a source parameter value as integer
fn (s Source) get_sourcei(param int) !int {
	value := int(0)
	C.alGetSourcei(s.id, param, &value)
	check_error()!
	return value
}

// get_source3i returns a source parameter value as vector of integers
fn (s Source) get_source3i(param int) !(int, int, int) {
	v1 := int(0)
	v2 := int(0)
	v3 := int(0)
	C.alGetSource3i(s.id, param, &v1, &v2, &v3)
	check_error()!
	return v1, v2, v3
}

// get_sourceiv returns a source parameter value as vector of integers
fn (s Source) get_sourceiv(param int) ![]int {
	values := []int{}
	C.alGetSourceiv(s.id, param, values.data)
	check_error()!
	return values
}

// play the source
pub fn (s Source) play() ! {
	C.alSourcePlay(s.id)
	check_error()!
}

// pause the source
pub fn (s Source) pause() ! {
	C.alSourcePause(s.id)
	check_error()!
}

// stop the source
pub fn (s Source) stop() ! {
	C.alSourceStop(s.id)
	check_error()!
}

// loop sets source to a looping state
pub fn (s Source) loop(loop bool) ! {
	value := if loop { al_true } else { al_false }
	s.sourcei(int(SourceParameter.looping), value)!
}

// is_looping returns true if source is set to loop
pub fn (s Source) is_looping() !bool {
	ret := s.get_sourcei(int(SourceParameter.looping))!
	return ret == al_true
}

// rewind the source
pub fn (s Source) rewind() ! {
	C.alSourceRewind(s.id)
	check_error()!
}

// play_sources plays multiple sources at once
pub fn play_sources(s []Source) ! {
	values := convert_source_array(s)
	C.alSourcePlayv(values.len, values.data)
	check_error()!
}

// pause_sources pauses multiple sources at once
pub fn pause_sources(s []Source) ! {
	values := convert_source_array(s)
	C.alSourcePausev(values.len, values.data)
	check_error()!
}

// stop_sources stops multiple sources at once
pub fn stop_sources(s []Source) ! {
	values := convert_source_array(s)
	C.alSourceStopv(values.len, values.data)
	check_error()!
}

// rewind_sources rewinds multiple sources at once
pub fn rewind_sources(s []Source) ! {
	values := convert_source_array(s)
	C.alSourceRewindv(values.len, values.data)
	check_error()!
}

// queue_buffer adds a buffer into the source's queue
pub fn (s Source) queue_buffer(b Buffer) ! {
	C.alSourceQueueBuffers(s.id, 1, &b.id)
	check_error()!
}

// queue_buffers adds buffers into the source's queue
pub fn (s Source) queue_buffers(b []Buffer) ! {
	values := convert_buffer_array(b)
	C.alSourceQueueBuffers(s.id, values.len, values.data)
	check_error()!
}

// unqueue_buffer removes a buffer fron the source's queue
pub fn (s Source) unqueue_buffer() !Buffer {
	tmp := []u32{len: 1}
	C.alSourceUnqueueBuffers(s.id, 1, &tmp[0])
	check_error()!
	return create_buffer_from_id(tmp[0])
}

// unqueue_buffers removes buffers from the source's queue
pub fn (s Source) unqueue_buffers(size int) ![]Buffer {
	total_queued := s.get_buffers_queued()!
	to_unqueue := math.min(size, total_queued)
	//
	tmp := []u32{len: to_unqueue}
	C.alSourceUnqueueBuffers(s.id, to_unqueue, tmp.data)
	check_error()!
	//
	mut buffers := []Buffer{len: tmp.len}
	for idx in 0 .. tmp.len {
		buffers[idx] = create_buffer_from_id(tmp[idx])
	}
	//
	return buffers
}

pub fn (s Source) unqueue_all() ! {
	total := s.get_buffers_queued()!
	buffers := s.unqueue_buffers(total)!
	release_buffers(buffers)!
}
