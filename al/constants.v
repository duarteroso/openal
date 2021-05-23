module al

// Runtime AL version
pub const (
	al_major_version = 1
	al_minor_version = 1
)

pub const (
	al_none  = 0
	al_false = 0
	al_true  = 1
)

// Source parameter values
pub const (
	al_source_relative  = 0x202
	al_cone_inner_angle = 0x1001
	al_cone_outer_angle = 0x1002
	al_pitch            = 0x1003
	al_position         = 0x1004
	al_direction        = 0x1005
	al_velocity         = 0x1006
	al_looping          = 0x1007
	al_buffer           = 0x1009
	al_gain             = 0x100A
	al_min_gain         = 0x100D
	al_max_gain         = 0x100E
	al_orientation      = 0x100F
	al_source_state     = 0x1010
)

// Source state values
pub const (
	al_initial = 0x1011
	al_playing = 0x1012
	al_paused  = 0x1013
	al_stopped = 0x1014
)

// Buffer state
pub const (
	al_buffers_queued    = 0x1015
	al_buffers_processed = 0x1016
)

// Source buffer position
pub const (
	al_reference_distance = 0x1020
	al_rolloff_factor     = 0x1021
	al_cone_outer_gain    = 0x1022
	al_max_distance       = 0x1023
	al_sec_offset         = 0x1024
	al_sample_offset      = 0x1025
	al_byte_offset        = 0x1026
)

// Source type value
pub const (
	al_source_type         = 0x1027
	al_source_static       = 0x1028
	al_source_streaming    = 0x1029
	al_source_undetermined = 0x1030
)

// Buffer format specifier
pub const (
	al_format_mono8    = 0x1100
	al_format_mono16   = 0x1101
	al_format_stereo8  = 0x1102
	al_format_stereo16 = 0x1103
)

// Buffer parameter values
pub const (
	al_frequency = 0x2001
	al_bits      = 0x2002
	al_channels  = 0x2003
	al_size      = 0x2004
)

// Buffer state
pub const (
	al_unused    = 0x2010
	al_pending   = 0x2011
	al_processed = 0x2012
)

// AlError values
pub const (
	al_no_error          = 0
	al_invalid_name      = 0xA001
	al_invalid_enum      = 0xA002
	al_invalid_value     = 0xA003
	al_invalid_operation = 0xA004
	al_out_of_memory     = 0xA005
)

// Context values
pub const (
	al_vendor     = 0xB001
	al_version    = 0xB002
	al_renderer   = 0xB003
	al_extensions = 0xB004
)

// Doppler values
pub const (
	al_doppler_factor   = 0xC000
	al_doppler_velocity = 0xC001
	al_speed_of_sound   = 0xC003
)

// Distance model values
pub const (
	al_distance_model            = 0xD000
	al_inverse_distance          = 0xD001
	al_inverse_distance_clamped  = 0xD002
	al_linear_distance           = 0xD003
	al_linear_distance_clamped   = 0xD004
	al_exponent_distance         = 0xD005
	al_exponent_distance_clamped = 0xD006
)
