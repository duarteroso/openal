module al

fn C.alGetError() ALenum

// Err defines an error code for a particular error
pub struct Err {
mut:
	code int
}

// new_error creates a new Err
fn new_error(code int) Err {
	return Err{
		code: code
	}
}

// check_error checks and panics on error
pub fn check_error() {
	code := C.alGetError()
	if code == al_no_error {
		return
	}
	//
	err := new_error(code)
	panic(err.str())
}

// code_as_string returns an error code as string
fn code_as_string(code int) string {
	return match code {
		al_invalid_name { 'AL_INVALID_NAME' }
		al_invalid_enum { 'AL_INVALID_ENUM' }
		al_invalid_value { 'AL_INVALID_VALUE' }
		al_invalid_operation { 'AL_INVALID_OPERATION' }
		al_out_of_memory { 'AL_OUT_OF_MEMORY' }
		else { 'AL_NO_ERROR' }
	}
}

// message_from_code returns an error code as a human readable string
fn message_from_code(code int) string {
	return match code {
		al_invalid_name { 'A bad name (ID) was passed to an OpenAL function' }
		al_invalid_enum { 'An invalid enum value was passed to an OpenAL function' }
		al_invalid_value { 'An invalid value was passed to an OpenAL function' }
		al_invalid_operation { 'The requested operation is not valid' }
		al_out_of_memory { 'The requested operation resulted in OpenAL running out of memory' }
		else { 'There is not currently an error ' }
	}
}

// str formats the error into a string
pub fn (err &Err) str() string {
	return '${code_as_string(err.code)} - ${message_from_code(err.code)}'
}
