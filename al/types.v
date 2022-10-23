module al

pub enum SourceParameter {
	source_relative = 0x202
	cone_inner_angle = 0x1001
	cone_outer_angle = 0x1002
	pitch = 0x1003
	position = 0x1004
	direction = 0x1005
	velocity = 0x1006
	looping = 0x1007
	buffer = 0x1009
	gain = 0x100A
	min_gain = 0x100D
	max_gain = 0x100E
	orientation = 0x100F
	source_state = 0x1010
}

pub enum SourceState {
	initial = 0x1011
	playing = 0x1012
	paused = 0x1013
	stopped = 0x1014
	undetermined = 0x1015
}

pub enum SourceProperties {
	reference_distance = 0x1020
	rolloff_factor = 0x1021
	cone_outer_gain = 0x1022
	max_distance = 0x1023
	sec_offset = 0x1024
	sample_offset = 0x1025
	byte_offset = 0x1026
}

// Source type value
pub enum SourceType {
	type_of = 0x1027
	fixed = 0x1028
	streaming = 0x1029
	undetermined = 0x1030
}

// Buffer format specifier
pub enum BufferFormat {
	mono8 = 0x1100
	mono16 = 0x1101
	stereo8 = 0x1102
	stereo16 = 0x1103
}

// Buffer parameter values
pub enum BufferParameter {
	frequency = 0x2001
	bits = 0x2002
	channels = 0x2003
	size = 0x2004
}

pub enum BuffersQueryParameter {
	queued = 0x1015
	processed = 0x1016
}

// Buffer state
pub enum BufferState {
	unused = 0x2010
	pending = 0x2011
	processed = 0x2012
}

// Doppler values
pub enum DopplerParameter {
	factor = 0xC000
	velocity = 0xC001
	speed_of_sound = 0xC003
}

// Distance model values
pub enum DistanceParameter {
	model = 0xD000
	inverse = 0xD001
	inverse_clamped = 0xD002
	linear = 0xD003
	linear_clamped = 0xD004
	exponent = 0xD005
	exponent_clamped = 0xD006
}
