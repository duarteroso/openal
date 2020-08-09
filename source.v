module vopenal

// Forward declaration
fn C.alGenSources(size int, sources voidptr)
fn C.alDeleteSources(size int, sources voidptr)
fn C.alIsSource(source u32) int
fn C.alSourcef(source u32, param int, value f32)
fn C.alSource3f(source u32, param int, v1, v2, v3 f32)
fn C.alSourcefv(source u32, param int, values voidptr)
fn C.alSourcei(source u32, param int, value int)
fn C.alSource3i(source u32, param int, v1, v2, v3 int)
fn C.alSourceiv(source u32, param int, values voidptr)
fn C.alGetSourcef(source u32, param int, value &f32)
fn C.alGetSource3f(sourece u32, param int, v1, v2, v3 &f32)
fn C.alGetSourcefv(source u32, param int, values voidptr)
fn C.alGetSourcei(source u32, param int, value &int)
fn C.alGetSource3i(source u32, param int, v1, v2, v3 &int)
fn C.alGetSourceiv(source u32, param int, values voidptr)
fn C.alSourcePlay(source u32)
fn C.alSourcePlayv(n int, sources voidptr)
fn C.alSourcePause(source u32)
fn C.alSourcePausev(n int, values voidptr)
fn C.alSourceStop(source u32)
fn C.alSourceStopv(n int, sources voidptr)
fn C.alSourceRewind(source u32)
fn C.alSourceRewindv(n int, sources voidptr)
fn C.alSourceQueueBuffers(source u32, n int, buffers voidptr)
fn C.alSourceUnqueueBufers(source u32, n int, buffers voidptr)

// Source Structure grouping source functions
pub struct Source {
mut:
	id u32
}

// Source type
pub enum SourceType {
	statik
	streaming
	undetermined
}

// Source state
pub enum SourceState {
	initial 
	playing
	paused 
	stopped
	undetermined
}

// generate_sources Generate multiple sources
pub fn generate_sources(n int) []Source {
	values := []u32 { len: n }
	C.alGenSources(n, &values)
	al_check_error()
	//
	mut sources := []Source { len: n }
	for i in 0..n {
		sources[i] = Source{
			id: values[i]
		}
	}
	//
	return sources
}

// release_sources Delete multiple sources
pub fn release_sources(s []Source) {
	mut values := []u32 { len: s.len }
	for i in 0..s.len {
		values[i] = s[i].id
	}
	C.alDeleteSources(s.len, values)
	al_check_error()
}

// generate Generate source
pub fn (mut s Source) generate() {
	values := [1]u32
	C.alGenSources(1, values)
	al_check_error()
	s.id = values[0]
}

// release Release source
pub fn (s &Source) release() {
	values := [ s.id ]
	C.alDeleteSources(1, values)
	al_check_error()
}

// is_valid Check if source is valid
pub fn (s &Source) is_valid() bool {
	ok := C.alIsSource(s.id) == al_true
	al_check_error()
	return ok
}

// is_relative Return true if source position is relative to listener
pub fn (s &Source) is_relative() bool {
	return s.get_sourcei(al_source_relative) == al_true
}

// loop Set source looping state
pub fn (s &Source) loop(loop bool) {
	value := if loop {
		al_true
	}
	else {
		al_false
	}
	s.sourcei(al_looping, value)
}

// get_type Get source type
pub fn (s &Source) get_type() SourceType {
	value := s.get_sourcei(al_source_type)
	return match value {
		al_static { SourceType.statik }
		al_streaming { SourceType.streaming }
		else { SourceType.undetermined }
	}
}

// get_state Get source state
pub fn (s &Source) get_state() SourceState {
	value := s.get_sourcei(al_source_state)
	return match value {
		al_initial { SourceState.initial }
		al_playing { SourceState.playing }
		al_paused { SourceState.paused }
		al_stopped { SourceState.stopped }
		else { SourceState.undetermined }
	}
}

// get_offset_time Get playback position in seconds
pub fn (s &Source) get_offset_time() f32 {
	return s.get_sourcef(al_sec_offset)
}

// get_offset_sample Get playback position in samples
pub fn (s &Source) get_offset_sample() f32 {
	return s.get_sourcef(al_sample_offset)
}

// get_offset_byte Get playback position in byte
pub fn (s &Source) get_offset_byte() f32 {
	return s.get_sourcef(al_byte_offset)
}

// get_buffer_id Get source buffer id
pub fn (s &Source) get_buffer_id() int {
	return s.get_sourcei(al_buffer)
}

// get_buffers_queued Get number of buffers queued in the source
pub fn (s &Source) get_buffers_queued() int {
	return s.get_sourcei(al_buffers_queued)
}

// get_buffers_processed Get number of buffers in the queue that have been processed
pub fn (s &Source) get_buffers_processed() int {
	return s.get_sourcei(al_buffers_processed)
}

// get_pitch Get source pitch
pub fn (s &Source) get_pitch() f32 {
	return s.get_sourcef(al_pitch)
}

// set_pitch Set source pitch
pub fn (s &Source) set_pitch(value f32) {
	s.sourcef(al_pitch, value)
}

// get_gain Get source gain
pub fn (s &Source) get_gain() f32 {
	return s.get_sourcef(al_gain)
}
// set_gain Set source gain
pub fn (s &Source) set_gain(value f32) {
	s.sourcef(al_gain, value)
}

// get_gain_bounds Get source min/max gain
pub fn (s &Source) get_gain_bounds() (f32, f32) {
	min := s.get_sourcef(al_min_gain)
	max := s.get_sourcef(al_max_gain)
	return min, max
}

// set_gain_bounds Set source min/max gain
pub fn (s &Source) set_gain_bounds(min, max f32) {
	s.sourcef(al_min_gain, min)
	s.sourcef(al_max_gain, max)
}

// get_max_distance Get source max distance
pub fn (s &Source) get_max_distance() f32 {
	return s.get_sourcef(al_max_distance)
}

// set_max_distance Set source max distance
pub fn (s &Source) set_max_distance(value f32) {
	s.sourcef(al_max_distance, value)
}

// get_rolloff Get source rolloff factor
pub fn (s &Source) get_rolloff() f32 {
	return s.get_sourcef(al_rolloff_factor)
}

// set_rolloff Set source rolloff factor
pub fn (s &Source) set_rolloff(value f32) {
	s.sourcef(al_rolloff_factor, value)
}

// get_cone_outer_gain Get source cone outer gain
pub fn (s &Source) get_cone_outer_gain() f32 {
	return s.get_sourcef(al_cone_outer_gain)
}

// set_cone_outer_gain Set source cone outer gain
pub fn (s &Source) set_cone_outer_gain(value f32) {
	s.sourcef(al_cone_outer_gain, value)
}

// get_cone_inner_angle Get source cone inner angle
pub fn (s &Source) get_cone_inner_angle() f32 {
	return s.get_sourcef(al_cone_inner_angle)
}

// set_cone_inner_angle Set source cone inner angle
pub fn (s &Source) set_cone_inner_angle(value f32) {
	s.sourcef(al_cone_inner_angle, value)
}

// get_cone_outer_angle Get source cone outer angle
pub fn (s &Source) get_cone_outer_angle() f32 {
	return s.get_sourcef(al_cone_outer_angle)
}

// set_cone_outer_angle Set source cone outer angle
pub fn (s &Source) set_cone_outer_angle(value f32) {
	s.sourcef(al_cone_outer_angle, value)
}

// get_reference_distance Get source reference distance
pub fn (s &Source) get_reference_distance() f32 {
	return s.get_sourcef(al_reference_distance)
}

// set_reference_distance Set source reference distance
pub fn (s &Source) set_reference_distance(value f32) {
	s.sourcef(al_reference_distance, value)
}

// get_position Get source position
pub fn (s &Source) get_position() (f32, f32, f32) {
	return s.get_source3f(al_position)
}

// set_position Set source position
pub fn (s &Source) set_position(v1, v2, v3 f32) {
	s.source3f(al_position, v1, v2, v3)
}

// get_velocity Get source velocity
pub fn (s &Source) get_velocity() (f32, f32, f32) {
	return s.get_source3f(al_velocity)
}

// set_velocity Set source velocity
pub fn (s &Source) set_velocity(v1, v2, v3 f32) {
	s.source3f(al_velocity, v1, v2, v3)
}

// get_direction Get source direction
pub fn (s &Source) get_direction() (f32, f32, f32) {
	return s.get_source3f(al_direction)
}

// set_direction Set source direction
pub fn (s &Source) set_direction(v1, v2, v3 f32) {
	s.source3f(al_direction, v1, v2, v3)
}

// sourcef Set source parameter value
pub fn (s &Source) sourcef(param int, value f32) {
	C.alSourcef(s.id, param, value)
	al_check_error()
}

// source3f Set source parameter value
pub fn (s &Source) source3f(param int, v1, v2, v3 f32) {
	C.alSource3f(s.id, param, v1, v2, v3)
	al_check_error()
}

// sourcefv Set source parameter value
pub fn (s &Source) sourcefv(param int, values []f32) {
	C.alSourcefv(s.id, param, values.data)
	al_check_error()
}

// sourcei Set source parameter value
pub fn (s &Source) sourcei(param int, value int) {
	C.alSourcei(s.id, param, value)
	al_check_error()
}

// sourcef Set source parameter value
pub fn (s &Source) source3i(param int, v1, v2, v3 int) {
	C.alSource3i(s.id, param, v1, v2, v3)
	al_check_error()
}

// sourcef Set source parameter value
pub fn (s &Source) sourceiv(param int, values []int) {
	C.alSourceiv(s.id, param, values.data)
	al_check_error()
}

// get_sourcef Get source parameter value
fn (s &Source) get_sourcef(param int) f32 {
	value := f32(0)
	C.alSourcef(s.id, param, &value)
	al_check_error()
	return value
}

// get_source3f Get source parameter value
fn (s &Source) get_source3f(param int) (f32, f32, f32) {
	v1 := f32(0)
	v2 := f32(0)
	v3 := f32(0)
	C.alSource3f(s.id, param, &v1, &v2, &v3)
	al_check_error()
	return v1, v2, v3
}

// get_sourcefv Get source parameter value
fn (s &Source) get_sourcefv(param int) []f32 {
	values := []f32{}
	C.alSourcefv(s.id, param, &values.data)
	al_check_error()
	return values
}

// get_sourcei Get source parameter value
fn (s &Source) get_sourcei(param int) int {
	value := int(0)
	C.alSourcei(s.id, param, &value)
	al_check_error()
	return value
}

// get_source3i Get source parameter value
fn (s &Source) get_source3i(param int) (int, int, int) {
	v1 := int(0)
	v2 := int(0)
	v3 := int(0)
	C.alSource3i(s.id, param, &v1, &v2, &v3)
	al_check_error()
	return v1, v2, v3
}

// get_sourceiv Get source parameter value
fn (s &Source) get_sourceiv(param int) []int {
	values := []int{}
	C.alSourceiv(s.id, param, &values.data)
	al_check_error()
	return values
}
