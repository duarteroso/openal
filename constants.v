module vopenal

pub const(
	al_none = 0
	al_false = 0
	al_true = 1
)

// Source values
pub const(
	al_source_relative = 0x202
 	al_cone_inner_angle = 0x1001
	al_cone_outer_angle = 0x1002
	al_pitch = 0x1003
 	al_position = 0x1004
 	al_direction = 0x1005
 	al_velocity = 0x1006
	al_looping = 0x1007
 	al_buffer = 0x1009
 	al_gain = 0x100A
 	al_min_gain = 0x100D
 	al_max_gain = 0x100E
 	al_orientation = 0x100F
 	al_source_state = 0x1010
)

// Source state values
pub const(
	al_initial = 0x1011
	al_playing = 0x1012
	al_paused = 0x1013
	al_stopped = 0x1014
)

// Buffer
pub const(
 	al_buffers_queued = 0x1015
	al_buffers_processed = 0x1016
)

// Source buffer position
pub const(
	al_reference_distance = 0x1020
	al_rolloff_factor = 0x1021
 	al_cone_outer_gain = 0x1022
	al_max_distance = 0x1023
	al_sec_offset = 0x1024
	al_sample_offset = 0x1025
	al_byte_offset = 0x1026
)

// Source type value
pub const(
 	al_source_type = 0x1027
	al_static = 0x1028
	al_streaming = 0x1029
	al_undetermined = 0x1030
)

// Buffer format specifier
pub const(
	al_format_mono8 = 0x1100
	al_format_mono16 = 0x1101
	al_format_stereo8 = 0x1102
	al_format_stereo16 = 0x1103
)

// Buffer query
pub const(
	al_frequency = 0x2001
	al_bits = 0x2002
	al_channels = 0x2003
	al_size = 0x2004
)

// Buffer state
pub const(
	al_unused = 0x2010
	al_pending = 0x2011
	al_processed = 0x2012
)

// AlError values
pub const (
	al_no_error = 0
	al_invalid_name = 0xA001
	al_invalid_enum = 0xA002
	al_invalid_value = 0xA003
	al_invalid_operation = 0xA004
	al_out_of_memory = 0xA005
)

// Context values
pub const(
	al_vendor = 0xB001
	al_version = 0xB002
	al_renderer = 0xB003
	al_extensions = 0xB004
)

// Doppler values
pub const(
	al_doppler_factor = 0xC000
	al_doppler_velocity = 0xC001
	al_speed_of_sound = 0xC003
)

// Distance model values
pub const(
 	al_distance_model = 0xD000
	al_inverse_distance = 0xD001
	al_inverse_distance_clamped = 0xD002
	al_linear_distance = 0xD003
	al_linear_distance_clamped = 0xD004
	al_exponent_distance = 0xD005
	al_exponent_distance_clamped = 0xD006
)

//
pub const(
	alc_false = 0
	alc_true = 1
)

// Context attribute
pub const(
	alc_frequency = 0x1007
	alc_refresh = 0x1008
	alc_sync = 0x1009
	alc_mono_sources = 0x1010
	alc_stereo_sources = 0x1011
)

// Error
pub const(
	alc_no_error = 0
	alc_invalid_device = 0xA001
	alc_invalid_context = 0xA002
	alc_invalid_enum = 0xA003
	alc_invalid_value = 0xA004
	alc_out_of_memory = 0xA005
)

// Runtime ALC version
pub const(
	alc_major_version = 0x1000
	alc_minor_version = 0x1001
)

// Context attribute list properties
pub const(
	alc_attributes_size = 0x1002
	alc_all_attributes = 0x1003
)

// Device specifier
pub const( 
	alc_default_device_specifier = 0x1004
	alc_device_specifier = 0x1005
	alc_extentions = 0x1006
)

// Capture extension
pub const(
	alc_ext_capture = 1
	alc_capture_device_specifier = 0x310
	alc_capture_default_devie_specifier = 0x311
	alc_capture_samples = 0x312
)

// Enumerate All extension
pub const(
	alc_enumerate_all_ext = 1
	alc_default_all_devices_specifier = 0x1012
	alc_all_devices_specifier = 0x1013
)