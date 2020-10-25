module alut

pub const(
	alut_api_major_version = 1
	alut_api_minor_version = 1
)

pub const(
	alut_error_no_error = 0
	alut_error_out_of_memory = 0x200
	alut_error_invalid_enum = 0x201
	alut_error_invalid_value = 0x202
	alut_error_invalid_operation = 0x203
	alut_error_no_current_context = 0x204
	alut_error_al_error_on_entry = 0x205
	alut_error_alc_no_entry_point= 0x206
	alut_error_open_device = 0x207
	alut_error_close_device = 0x208
	alut_error_create_context = 0x209
	alut_error_make_context_current = 0x20A
	alut_error_destroy_context = 0x20B
	alut_error_gen_buffers = 0x20C
	alut_error_buffer_data = 0x20D
	alut_error_io_error = 0x20E
	alut_error_unsupported_file_type = 0x20F
	alut_error_unsupported_file_subtype = 0x210
	alut_error_corrupt_or_truncated_data = 0x211
)

pub const(
	alut_waveform_sine = 0x100
	alut_waveform_square = 0x101
	alut_waveform_sawtooth = 0x102
	alut_waveform_whitenoise = 0x103
	alut_waveform_impulse = 0x104
)

pub const(
	alut_loader_buffer = 0x300
	alut_loader_memory = 0x301
)