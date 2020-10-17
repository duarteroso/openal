module al

// Forward declaration
fn C.alGenSources(size int, sources voidptr)

fn C.alDeleteSources(size int, sources voidptr)

fn C.alIsSource(source u32) int

fn C.alSourcef(source u32, param int, value f32)

fn C.alSource3f(source u32, param int, v1, v2, v3 f32)

fn C.alSourcefv(source u32, param int, values voidptr)

fn C.alSourcei(source u32, param, value int)

fn C.alSource3i(source u32, param, v1, v2, v3 int)

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

// Source wraps functionality around an OpenAL source
pub struct Source {
mut:
	id u32
}

// SourceType defines the types of a source
pub enum SourceType {
	static
	streaming
	undetermined
}

// SourceState defines the states of a source
pub enum SourceState {
	initial
	playing
	paused
	stopped
	undetermined
}

// generate_sources generates multiple instances of Source
pub fn generate_sources(n int) []Source {
	values := []u32{len: n}
	C.alGenSources(n, &values)
	check_error()
	//
	mut sources := []Source{len: n}
	for i in 0 .. n {
		sources[i] = Source{
			id: values[i]
		}
	}
	//
	return sources
}

// release_sources deletes multiple instances of Source
pub fn release_sources(s []Source) {
	mut values := []u32{len: s.len}
	for i in 0 .. s.len {
		values[i] = s[i].id
	}
	C.alDeleteSources(s.len, values.data)
	check_error()
}

// generate source
pub fn (mut s Source) generate() {
	values := [1]u32{}
	C.alGenSources(1, values)
	check_error()
	s.id = values[0]
}

// release source
pub fn (s &Source) release() {
	values := [s.id]
	C.alDeleteSources(1, values.data)
	check_error()
}

// is_valid returns true if source is valid
pub fn (s &Source) is_valid() bool {
	ok := C.alIsSource(s.id) == al_true
	check_error()
	return ok
}

// is_relative returns true if source position is relative to listener
pub fn (s &Source) is_relative() bool {
	return s.get_sourcei(source_relative) == al_true
}

// loop sets source to a looping state
pub fn (s &Source) loop(loop bool) {
	value := if loop { al_true } else { al_false }
	s.sourcei(al_looping, value)
}

// get_type returns a source type
pub fn (s &Source) get_type() SourceType {
	value := s.get_sourcei(source_type)
	return match value {
		al_source_static { SourceType.static }
		al_source_streaming { SourceType.streaming }
		else { SourceType.undetermined }
	}
}

// get_state returns a source state
pub fn (s &Source) get_state() SourceState {
	value := s.get_sourcei(source_state)
	return match value {
		al_initial { SourceState.initial }
		al_playing { SourceState.playing }
		al_paused { SourceState.paused }
		al_stopped { SourceState.stopped }
		else { SourceState.undetermined }
	}
}

// get_offset_time returns the playback position offset in seconds
pub fn (s &Source) get_offset_time() f32 {
	return s.get_sourcef(al_sec_offset)
}

// get_offset_sample returns the playback position offset in samples
pub fn (s &Source) get_offset_sample() f32 {
	return s.get_sourcef(al_sample_offset)
}

// get_offset_byte returns the playback position offset in byte
pub fn (s &Source) get_offset_byte() f32 {
	return s.get_sourcef(al_byte_offset)
}

// get_buffer_id returns the buffer id linked to the source
pub fn (s &Source) get_buffer_id() int {
	return s.get_sourcei(al_buffer)
}

// get_buffers_queued returns the number of buffers queued in the source
pub fn (s &Source) get_buffers_queued() int {
	return s.get_sourcei(al_buffers_queued)
}

// get_buffers_processed returns the number of buffers in the queue that have been processed
pub fn (s &Source) get_buffers_processed() int {
	return s.get_sourcei(al_buffers_processed)
}

// get_pitch retuns the pitch of the source
pub fn (s &Source) get_pitch() f32 {
	return s.get_sourcef(al_pitch)
}

// set_pitch sets the pitch of the source
pub fn (s &Source) set_pitch(value f32) {
	s.sourcef(al_pitch, value)
}

// get_gain returns the gain of the source
pub fn (s &Source) get_gain() f32 {
	return s.get_sourcef(al_gain)
}

// set_gain sets the gain of the source
pub fn (s &Source) set_gain(value f32) {
	s.sourcef(al_gain, value)
}

// get_gain_bounds returns the min/max gain of the source
pub fn (s &Source) get_gain_bounds() (f32, f32) {
	min := s.get_sourcef(al_min_gain)
	max := s.get_sourcef(al_max_gain)
	return min, max
}

// set_gain_bounds sets the min/max gain of the source
pub fn (s &Source) set_gain_bounds(min, max f32) {
	s.sourcef(al_min_gain, min)
	s.sourcef(al_max_gain, max)
}

// get_max_distance returns max distance of the source
pub fn (s &Source) get_max_distance() f32 {
	return s.get_sourcef(al_max_distance)
}

// set_max_distance sets the max distance of the source
pub fn (s &Source) set_max_distance(value f32) {
	s.sourcef(al_max_distance, value)
}

// get_rolloff returns the rolloff factor of the source
pub fn (s &Source) get_rolloff() f32 {
	return s.get_sourcef(al_rolloff_factor)
}

// set_rolloff sets the rolloff factor of the source
pub fn (s &Source) set_rolloff(value f32) {
	s.sourcef(al_rolloff_factor, value)
}

// get_cone_outer_gain returns the cone outer gain of the source
pub fn (s &Source) get_cone_outer_gain() f32 {
	return s.get_sourcef(al_cone_outer_gain)
}

// set_cone_outer_gain sets the cone outer gain of the source
pub fn (s &Source) set_cone_outer_gain(value f32) {
	s.sourcef(al_cone_outer_gain, value)
}

// get_cone_inner_angle returns the cone inner angle of the source
pub fn (s &Source) get_cone_inner_angle() f32 {
	return s.get_sourcef(al_cone_inner_angle)
}

// set_cone_inner_angle sets the cone inner angle of the source
pub fn (s &Source) set_cone_inner_angle(value f32) {
	s.sourcef(al_cone_inner_angle, value)
}

// get_cone_outer_angle returns the cone outer angle of the source
pub fn (s &Source) get_cone_outer_angle() f32 {
	return s.get_sourcef(al_cone_outer_angle)
}

// set_cone_outer_angle sets the cone outer angle of the source
pub fn (s &Source) set_cone_outer_angle(value f32) {
	s.sourcef(al_cone_outer_angle, value)
}

// get_reference_distance Get source reference distance
pub fn (s &Source) get_reference_distance() f32 {
	return s.get_sourcef(al_reference_distance)
}

// set_reference_distance sets the reference distance of the source
pub fn (s &Source) set_reference_distance(value f32) {
	s.sourcef(al_reference_distance, value)
}

// get_position returns the position of the source
pub fn (s &Source) get_position() (f32, f32, f32) {
	return s.get_source3f(al_position)
}

// set_position sets the position of the source
pub fn (s &Source) set_position(v1, v2, v3 f32) {
	s.source3f(al_position, v1, v2, v3)
}

// get_velocity returns the velocity of the source
pub fn (s &Source) get_velocity() (f32, f32, f32) {
	return s.get_source3f(al_velocity)
}

// set_velocity sets the velocity of the source
pub fn (s &Source) set_velocity(v1, v2, v3 f32) {
	s.source3f(al_velocity, v1, v2, v3)
}

// get_direction returns the direction of the source
pub fn (s &Source) get_direction() (f32, f32, f32) {
	return s.get_source3f(al_direction)
}

// set_direction sets the direction of the source
pub fn (s &Source) set_direction(v1, v2, v3 f32) {
	s.source3f(al_direction, v1, v2, v3)
}

// sourcef sets a source parameter value as float
pub fn (s &Source) sourcef(param int, value f32) {
	C.alSourcef(s.id, param, value)
	check_error()
}

// source3f sets a source parameter value as vector of floats
pub fn (s &Source) source3f(param int, v1, v2, v3 f32) {
	C.alSource3f(s.id, param, v1, v2, v3)
	check_error()
}

// sourcefv sets a source parameter value as vector of floats
pub fn (s &Source) sourcefv(param int, values []f32) {
	C.alSourcefv(s.id, param, values.data)
	check_error()
}

// sourcei sets a source parameter value as integer
pub fn (s &Source) sourcei(param, value int) {
	C.alSourcei(s.id, param, value)
	check_error()
}

// source3i sets a source parameter value as vector of integers
pub fn (s &Source) source3i(param, v1, v2, v3 int) {
	C.alSource3i(s.id, param, v1, v2, v3)
	check_error()
}

// sourceiv sets a source parameter value as vector of integers
pub fn (s &Source) sourceiv(param int, values []int) {
	C.alSourceiv(s.id, param, values.data)
	check_error()
}

// get_sourcef returns a source parameter value as float
fn (s &Source) get_sourcef(param int) f32 {
	value := f32(0)
	C.alGetSourcef(s.id, param, &value)
	check_error()
	return value
}

// get_source3f returns a source parameter value as vector of floats
fn (s &Source) get_source3f(param int) (f32, f32, f32) {
	v1 := f32(0)
	v2 := f32(0)
	v3 := f32(0)
	C.alGetSource3f(s.id, param, &v1, &v2, &v3)
	check_error()
	return v1, v2, v3
}

// get_sourcefv returns a source parameter value as vector of floats
fn (s &Source) get_sourcefv(param int) []f32 {
	values := []f32{}
	C.alGetSourcefv(s.id, param, &values.data)
	check_error()
	return values
}

// get_sourcei returns a source parameter value as integer
fn (s &Source) get_sourcei(param int) int {
	value := int(0)
	C.alGetSourcei(s.id, param, &value)
	check_error()
	return value
}

// get_source3i returns a source parameter value as vector of integers
fn (s &Source) get_source3i(param int) (int, int, int) {
	v1 := int(0)
	v2 := int(0)
	v3 := int(0)
	C.alGetSource3i(s.id, param, &v1, &v2, &v3)
	check_error()
	return v1, v2, v3
}

// get_sourceiv returns a source parameter value as vector of integers
fn (s &Source) get_sourceiv(param int) []int {
	values := []int{}
	C.alGetSourceiv(s.id, param, &values.data)
	check_error()
	return values
}
