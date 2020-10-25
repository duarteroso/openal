module alut

// Forward declaration
fn C.alutGetError() int
fn C.alutGetErrorString(error int) charptr

// Error defines a code and message for a particular error
pub struct Error {
pub mut:
	code int
	msg  string
}

// has_error returns true if there is a pending ALUT error
pub fn has_error() bool {
	return C.alutGetError() != alut_error_no_error
}

// check_error checks and panics on error
pub fn check_error() {
	if has_error() {
		err := get_error()
		panic(err.str())
	}
}

// get_error returns the pending ALUT error
pub fn get_error() Error {
	return new_error()
}

// get_error_string returns the pending ALUT error as a string
pub fn get_error_string() string {
	code := C.alutGetError()
	return tos3(C.alutGetErrorString(code))
}

// new_error creates a new Error
fn new_error() Error {
	code := C.alutGetError()
	return Error{
		code: code
		msg: tos3(C.alutGetErrorString(code))
	}
}

// code_str returns an error code as string
pub fn (err &Error) code_str() string {
	return match err.code {
		alut_error_out_of_memory { 'ALUT_ERROR_OUT_OF_MEMORY' }
		alut_error_invalid_enum { 'ALUT_ERROR_INVALID_ENUM' }
		alut_error_invalid_value { 'ALUT_ERROR_INVALID_VALUE' }
		alut_error_invalid_operation { 'ALUT_ERROR_INVALID_OPERATION' }
		alut_error_no_current_context { 'ALUT_ERROR_NO_CURRENT_CONTEXT' }
		alut_error_al_error_on_entry { 'ALUT_ERROR_AL_ERROR_ON_ENTRY' }
		alut_error_alc_no_entry_point { 'ALUT_ERROR_ALC_ERROR_ON_ENTRY' }
		alut_error_open_device { 'ALUT_ERROR_OPEN_DEVICE' }
		alut_error_close_device { 'ALUT_ERROR_CLOSE_DEVICE' }
		alut_error_create_context { 'ALUT_ERROR_CREATE_CONTEXT' }
		alut_error_make_context_current { 'ALUT_ERROR_MAKE_CONTEXT_CURRENT' }
		alut_error_destroy_context { 'ALUT_ERROR_DESTROY_CONTEXT' }
		alut_error_gen_buffers { 'ALUT_ERROR_GEN_BUFFERS' }
		alut_error_buffer_data { 'ALUT_ERROR_BUFFER_DATA' }
		alut_error_io_error { 'ALUT_ERROR_IO_ERROR' }
		alut_error_unsupported_file_type { 'ALUT_ERROR_UNSUPPORTED_FILE_TYPE' }
		alut_error_unsupported_file_subtype { 'ALUT_ERROR_UNSUPPORTED_FILE_SUBTYPE' }
		alut_error_corrupt_or_truncated_data { 'ALUT_ERROR_CORRUPT_OR_TRUNCATED_DATA' }
		else { 'ALUT_ERROR_NO_ERROR' }
	}
}   
    
// code_msg returns an error code as a human readable string
[deprecated]
pub fn (err &Error) code_msg() string {
	return match err.code {
		alut_error_out_of_memory { 'ALUT ran out of memory.' }
		alut_error_invalid_enum { 'ALUT was given an invalid enumeration token.' }
		alut_error_invalid_value { 'ALUT was given an invalid value.' }
		alut_error_invalid_operation { 'The operation is invalid in the current ALUT state.' }
		alut_error_no_current_context { 'There is no current AL context.' }
		alut_error_al_error_on_entry { 'There was already an AL error on entry to an ALUT function.' }
		alut_error_alc_no_entry_point { 'There was already an ALC error on entry to an ALUT function.' }
		alut_error_open_device { 'There was an error opening the ALC device.' }
		alut_error_close_device { 'There was an error closing the ALC device.' }
		alut_error_create_context { 'There was an error creating an ALC context.' }
		alut_error_make_context_current { 'Could not change the current ALC context.' }
		alut_error_destroy_context { 'There was an error destroying the ALC context.' }
		alut_error_gen_buffers { 'There was an error generating an AL buffer.' }
		alut_error_buffer_data { 'There was an error passing buffer data to AL.' }
		alut_error_io_error { ' I/O error, consult errno for more details.' }
		alut_error_unsupported_file_type { 'Unsupported file type.' }
		alut_error_unsupported_file_subtype { 'Unsupported mode within an otherwise usable file type.' }
		alut_error_corrupt_or_truncated_data { 'The sound data was corrupt or truncated.' }
		else { 'No ALUT error found.' }
	}
}

pub fn (err &Error) str() string {
	return '$err.code_str() - $err.msg'
}
