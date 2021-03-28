module al

fn C.alListenerf(param ALenum, value ALfloat)
fn C.alListener3f(param ALenum, value1 ALfloat, value2 ALfloat, value3 ALfloat)
fn C.alListenerfv(param ALenum, value ALfloatptr)
fn C.alListeneri(param ALenum, value ALintptr)
fn C.alListener3i(param ALenum, value1 ALint, value2 ALint, value3 ALint)
fn C.alListeneriv(param ALenum, value ALintptr)
fn C.alGetListenerf(param ALenum, value &ALfloat)
fn C.alGetListener3f(param ALenum, value1 &ALfloat, value2 &ALfloat, value3 &ALfloat)
fn C.alGetListenerfv(param ALenum, value ALfloatptr)
fn C.alGetListeneri(param ALenum, value &ALintptr)
fn C.alGetListener3i(param ALenum, value1 &ALint, value2 &ALint, value3 &ALint)
fn C.alGetListeneriv(param ALenum, value ALintptr)

// Listener wraps functionality around an OpenAL listener
pub struct Listener {
}

// get_gain returns the gain of the listener
pub fn (l &Listener) get_gain() f32 {
	return get_listenerf(al_gain)
}

// set_gain sets the gain of the listener
pub fn (l &Listener) set_gain(value f32) {
	listenerf(al_gain, value)
}

// get_position returns the position of the listener
pub fn (l &Listener) get_position() (f32, f32, f32) {
	return get_listener3f(al_position)
}

// set_position sets the position of the listener
pub fn (l &Listener) set_position(x f32, y f32, z f32) {
	listener3f(al_position, x, y, z)
}

// get_velocity returns the velocity of the listener
pub fn (l &Listener) get_velocity() (f32, f32, f32) {
	return get_listener3f(al_velocity)
}

// set_velocity sets the velocity of the listener
pub fn (l &Listener) set_velocity(x f32, y f32, z f32) {
	listener3f(al_velocity, x, y, z)
}

// get_orientation returns the orientation of the listener
pub fn (l &Listener) get_orientation() []f32 {
	return get_listenerfv(al_orientation)
}

// set_orientation sets the orientation of the listener
pub fn (l &Listener) set_orientation(value []f32) {
	listenerfv(al_orientation, value)
}

// listenerf sets a listener parameter value as float
pub fn listenerf(param int, value f32) {
	C.alListenerf(param, value)
	check_error()
}

// listener3f sets a listener parameter value as vector of floats
pub fn listener3f(param int, v1 f32, v2 f32, v3 f32) {
	C.alListener3f(param, v1, v2, v3)
	check_error()
}

// listenefv sets a listener parameter value as vector of floats
pub fn listenerfv(param int, values []f32) {
	C.alListenerfv(param, values.data)
	check_error()
}

// listeneri sets a listener parameter value as integer
pub fn listeneri(param int, value int) {
	C.alListeneri(param, value)
	check_error()
}

// listener3i sets a listener parameter value as vector of integers
pub fn listener3i(param int, v1 int, v2 int, v3 int) {
	C.alListener3i(param, v1, v2, v3)
	check_error()
}

// listeneriv sets a listener parameter value as vector of integers
pub fn listeneriv(param int, values []int) {
	C.alListeneriv(param, values.data)
	check_error()
}

// get_listenerf returns a listener parameter value as float
pub fn get_listenerf(param int) f32 {
	value := f32(0)
	C.alGetListenerf(param, &value)
	check_error()
	return value
}

// get_listener3f returns a listener parameter value as vector of floats
pub fn get_listener3f(param int) (f32, f32, f32) {
	v1 := f32(0)
	v2 := f32(0)
	v3 := f32(0)
	C.alGetListener3f(param, &v1, &v2, &v3)
	check_error()
	return v1, v2, v3
}

// get_listenerfv returns a listener parameter value as vector of floats
pub fn get_listenerfv(param int) []f32 {
	values := []f32{}
	C.alGetListenerfv(param, &values.data)
	check_error()
	return values
}

// get_listeneri returns a listener parameter value as integer
pub fn get_listeneri(param int) int {
	value := int(0)
	C.alGetListeneri(param, &value)
	check_error()
	return value
}

// get_listener3i returns a listener parameter value as vector of integers
pub fn get_listener3i(param int) (int, int, int) {
	v1 := int(0)
	v2 := int(0)
	v3 := int(0)
	C.alGetListener3i(param, &v1, &v2, &v3)
	check_error()
	return v1, v2, v3
}

// get_listeneriv returns a listener parameter value as vector of integers
pub fn get_listeneriv(param int) []int {
	values := []int{}
	C.alGetListeneriv(param, &values.data)
	check_error()
	return values
}
