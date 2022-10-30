module al

// Listener wraps functionality around an OpenAL listener
pub struct Listener {
}

// create_listener returns an instance of Listener
pub fn create_listener() Listener {
	return Listener{}
}

// get_gain returns the gain of the listener
pub fn (l Listener) get_gain() !f32 {
	return l.get_listenerf(int(ListenerParameter.gain))
}

// set_gain sets the gain of the listener
pub fn (l Listener) set_gain(value f32) ! {
	l.listenerf(int(ListenerParameter.gain), value)!
}

// get_position returns the position of the listener
pub fn (l Listener) get_position() !(f32, f32, f32) {
	return l.get_listener3f(int(ListenerParameter.position))
}

// set_position sets the position of the listener
pub fn (l Listener) set_position(x f32, y f32, z f32) ! {
	l.listener3f(int(ListenerParameter.position), x, y, z)!
}

// get_velocity returns the velocity of the listener
pub fn (l Listener) get_velocity() !(f32, f32, f32) {
	return l.get_listener3f(int(ListenerParameter.velocity))
}

// set_velocity sets the velocity of the listener
pub fn (l Listener) set_velocity(x f32, y f32, z f32) ! {
	l.listener3f(int(ListenerParameter.velocity), x, y, z)!
}

// get_orientation returns the orientation of the listener
pub fn (l Listener) get_orientation() ![]f32 {
	return l.get_listenerfv(int(ListenerParameter.orientation), 6)
}

// set_orientation sets the orientation of the listener
pub fn (l Listener) set_orientation(value []f32) ! {
	l.listenerfv(int(ListenerParameter.orientation), value)!
}

// listenerf sets a listener parameter value as float
pub fn (l Listener) listenerf(param int, value f32) ! {
	C.alListenerf(param, value)
	check_error()!
}

// listener3f sets a listener parameter value as vector of floats
pub fn (l Listener) listener3f(param int, v1 f32, v2 f32, v3 f32) ! {
	C.alListener3f(param, v1, v2, v3)
	check_error()!
}

// listenefv sets a listener parameter value as vector of floats
pub fn (l Listener) listenerfv(param int, values []f32) ! {
	C.alListenerfv(param, values.data)
	check_error()!
}

// listeneri sets a listener parameter value as integer
pub fn (l Listener) listeneri(param int, value int) ! {
	C.alListeneri(param, value)
	check_error()!
}

// listener3i sets a listener parameter value as vector of integers
pub fn (l Listener) listener3i(param int, v1 int, v2 int, v3 int) ! {
	C.alListener3i(param, v1, v2, v3)
	check_error()!
}

// listeneriv sets a listener parameter value as vector of integers
pub fn (l Listener) listeneriv(param int, values []int) ! {
	C.alListeneriv(param, values.data)
	check_error()!
}

// get_listenerf returns a listener parameter value as float
pub fn (l Listener) get_listenerf(param int) !f32 {
	value := f32(0)
	C.alGetListenerf(param, &value)
	check_error()!
	return value
}

// get_listener3f returns a listener parameter value as vector of floats
pub fn (l Listener) get_listener3f(param int) !(f32, f32, f32) {
	v1 := f32(0)
	v2 := f32(0)
	v3 := f32(0)
	C.alGetListener3f(param, &v1, &v2, &v3)
	check_error()!
	return v1, v2, v3
}

// get_listenerfv returns a listener parameter value as vector of floats
pub fn (l Listener) get_listenerfv(param int, size int) ![]f32 {
	values := []f32{len: size}
	C.alGetListenerfv(param, values.data)
	check_error()!
	return values
}

// get_listeneri returns a listener parameter value as integer
pub fn (l Listener) get_listeneri(param int) !int {
	value := int(0)
	C.alGetListeneri(param, &value)
	check_error()!
	return value
}

// get_listener3i returns a listener parameter value as vector of integers
pub fn (l Listener) get_listener3i(param int) !(int, int, int) {
	v1 := int(0)
	v2 := int(0)
	v3 := int(0)
	C.alGetListener3i(param, &v1, &v2, &v3)
	check_error()!
	return v1, v2, v3
}

// get_listeneriv returns a listener parameter value as vector of integers
pub fn (l Listener) get_listeneriv(param int, size int) ![]int {
	values := []int{len: size}
	C.alGetListeneriv(param, values.data)
	check_error()!
	return values
}
