module alc

//
pub const (
	alc_false = 0
	alc_true  = 1
)

// Context attribute
pub const (
	alc_frequency      = 0x1007
	alc_refresh        = 0x1008
	alc_sync           = 0x1009
	alc_mono_sources   = 0x1010
	alc_stereo_sources = 0x1011
)

// AlcError error codes
pub const (
	alc_no_error        = 0
	alc_invalid_device  = 0xA001
	alc_invalid_context = 0xA002
	alc_invalid_enum    = 0xA003
	alc_invalid_value   = 0xA004
	alc_out_of_memory   = 0xA005
)

// Runtime ALC version
pub const (
	alc_major_version = 0x1000
	alc_minor_version = 0x1001
)

// Context attribute list properties
pub const (
	alc_attributes_size = 0x1002
	alc_all_attributes  = 0x1003
)

// Device specifier
pub const (
	alc_default_device_specifier = 0x1004
	alc_device_specifier         = 0x1005
	alc_extentions               = 0x1006
)

// Capture extension
pub const (
	alc_ext_capture                     = 1
	alc_capture_device_specifier        = 0x310
	alc_capture_default_device_specifier = 0x311
	alc_capture_samples                 = 0x312
)

// Enumerate extension
pub const (
	alc_enumerate_all_ext             = 1
	alc_default_all_devices_specifier = 0x1012
	alc_all_devices_specifier         = 0x1013
)
