module alc

// Err defines a code and message for a particular error
pub struct Err {
pub mut:
	code int
}

// new_error creates an instance of Err
fn new_error(code int) Err {
	return Err {
		code: code
	}
}

// check_error checks and panics on errors
pub fn check_error(d &Device) {
	code := C.alcGetError(d.data)
	if code == alc_no_error {
		return
	}
	//
	err := new_error(code)
	panic(err.str())
}

// code_as_string returns an error code as string
fn code_as_string(code int) string {
	return match code {
		alc_invalid_device { 'ALC_INVALID_DEVICE' }
		alc_invalid_context { 'ALC_INVALID_CONTEXT' }
		alc_invalid_enum { 'ALC_INVALID_ENUM' }
		alc_invalid_value { 'ALC_INVALID_VALUE' }
		alc_out_of_memory { 'ALC_OUT_OF_MEMORY' }
		else { 'ALC_NO_ERROR' }
	}
}

// message_from_code returns an error code as a human readable string
fn message_from_code(code int) string {
	return match code {
		alc_invalid_device { 'A bad device was passed to an OpenAL function' }
		alc_invalid_context { 'A bad context was passed to an OpenAL function' }
		alc_invalid_enum { 'An unknown enum was passed to an OpenAL function' }
		alc_invalid_value { 'An invalid value was passed to an OpenAL function' }
		alc_out_of_memory { 'The requested operation resulted in OpenAL running out of memory' }
		else { 'There is not currently an error ' }
	}
}

// str formats the error into a string
pub fn (err &Err) str() string {
	return '${code_as_string(err.code)} - ${message_from_code(err.code)}'
}
