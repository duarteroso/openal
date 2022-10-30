module al

// Err defines an error code for a particular error
pub struct Err {
mut:
	code int
}

// create_error creates a new Err
fn create_error(code int) Err {
	return Err{
		code: code
	}
}

// check_error checks and panics on error
pub fn check_error() ! {
	code := C.alGetError()
	if code == int(AlError.no_error) {
		return
	}
	//
	err := create_error(code)
	return error(err.str())
}

// code_as_string returns an error code as string
fn code_as_string(code int) string {
	return match code {
		int(AlError.invalid_name) { 'AL_INVALID_NAME' }
		int(AlError.invalid_enum) { 'AL_INVALID_ENUM' }
		int(AlError.invalid_value) { 'AL_INVALID_VALUE' }
		int(AlError.invalid_operation) { 'AL_INVALID_OPERATION' }
		int(AlError.out_of_memory) { 'AL_OUT_OF_MEMORY' }
		else { 'AL_NO_ERROR' }
	}
}

// message_from_code returns an error code as a human readable string
fn message_from_code(code int) string {
	return match code {
		int(AlError.invalid_name) { 'A bad name (ID) was passed to an OpenAL function' }
		int(AlError.invalid_enum) { 'An invalid enum value was passed to an OpenAL function' }
		int(AlError.invalid_value) { 'An invalid value was passed to an OpenAL function' }
		int(AlError.invalid_operation) { 'The requested operation is not valid' }
		int(AlError.out_of_memory) { 'The requested operation resulted in OpenAL running out of memory' }
		else { 'There is not currently an error ' }
	}
}

// str formats the error into a string
pub fn (err &Err) str() string {
	return '${code_as_string(err.code)} - ${message_from_code(err.code)}'
}
