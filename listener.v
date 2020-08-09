module vopenal

// Forward declaration
fn C.alListenerf(param int, value f32) 
fn C.alListener3f(param int, v1, v2, v3 f32)
fn C.alListenerfv(param int, value voidptr)
fn C.alListeneri(param int, value int)
fn C.alListener3i(param int, v1, v2, v3 int)
fn C.alListeneriv(param int, value voidptr)
fn C.alGetListenerf(param int, value &f32)
fn C.alGetListener3f(param int, v1, v2, v3 &f32)
fn C.alGetListenerfv(param int, value voidptr)
fn C.alGetListeneri(param int, value &int)
fn C.alGetListener3i(param int, v1, v2, v3 &int)
fn C.alGetListeneriv(param int, value voidptr)

// Listener Structure grouping listener functions
pub struct Listener {
}

// get_gain Get listener gain
pub fn (l &Listener) get_gain() f32 {
	return get_listenerf(al_gain)
}

// set_gain Set listener gain
pub fn (l &Listener) set_gain(value f32) {
	listenerf(al_gain, value)
}

// get_position Get listener position
pub fn (l &Listener) get_position() (f32, f32, f32) {
	return get_listener3f(al_position)
}

// set_position Set listener position
pub fn (l &Listener) set_position(x, y, z f32) {
	listener3f(al_position, x, y, z)
}

// get_velocity Get listener velocity
pub fn (l &Listener) get_velocity() (f32, f32, f32) {
	return get_listener3f(al_velocity)
}

// set_velocity Set listener velocity
pub fn (l &Listener) set_velocity(x, y, z f32) {
	listener3f(al_velocity, x, y, z)
}

// get_orientation
pub fn (l &Listener) get_orientation() []f32 {
	return get_listenerfv(al_orientation)
}

// set_orientation
pub fn (l &Listener) set_orientation(value []f32) {
	listenerfv(al_orientation, value)
}

// listenerf Set listener parameter value
pub fn listenerf(param int, value f32) {
	C.alListenerf(param, value)
	al_check_error()
}

// listenerf Set listener parameter value
pub fn listener3f(param int, v1, v2, v3 f32) {
	C.alListener3f(param, v1, v2, v3)
	al_check_error()
}

// listener3f Set listener parameter value
pub fn listenerfv(param int, values []f32) {
	C.alListenerfv(param, values.data)
	al_check_error()
}

// listeneri Set listener parameter value
pub fn listeneri(param int, value int) {
	C.alListeneri(param, value)
	al_check_error()
}

// listener3i Set listener parameter value
pub fn listener3i(param int, v1, v2, v3 int) {
	C.alListener3i(param, v1, v2, v3)
	al_check_error()
}

// listeneriv Set listener parameter value
pub fn listeneriv(param int, values []int) {
	C.alListeneriv(param, values.data)
	al_check_error()
}

// get_listenerf Get listener parameter value
pub fn get_listenerf(param int) f32 {
	value := f32(0)
	C.alGetListenerf(param, &value)
	al_check_error()
	return value
}

// get_listener3f Get listener parameter value
pub fn get_listener3f(param int) (f32, f32, f32) {
	v1 := f32(0)
	v2 := f32(0)
	v3 := f32(0)
	C.alGetListener3f(param, &v1, &v2, &v3)
	al_check_error()
	return v1, v2, v3
}

// get_listener3f Get listener parameter value
pub fn get_listenerfv(param int) []f32 {
	values := []f32{}
	C.alGetListener3f(param, &values)
	al_check_error()
	return values
}

// get_listeneri Get listener parameter value
pub fn get_listeneri(param int) int {
	value := int(0)
	C.alGetListeneri(param, &value)
	al_check_error()
	return value
}

// get_listener3i Get listener parameter value
pub fn get_listener3i(param int) (int, int, int) {
	v1 := int(0)
	v2 := int(0)
	v3 := int(0)
	C.alGetListener3i(param, &v1, &v2, &v3)
	al_check_error()
	return v1, v2, v3
}

// get_listener3f Get listener parameter value
pub fn get_listeneriv(param int) []int {
	values := []int{}
	C.alGetListeneriv(param, &values)
	al_check_error()
	return values
}
