module alc

// Error defines a code and message for a particular error
pub struct Error {
pub mut:
	code int
	msg  string
}

// create_error creates a new Error
pub fn new_error(code int) Error {
	mut err := Error{}
	err.code = code
	err.msg = err.code_msg()
	return err
}

// code_str returns an error code as string
pub fn (err &Error) code_str() string {
	return match err.code {
		alc_invalid_device { 'ALC_INVALID_DEVICE' }
		alc_invalid_context { 'ALC_INVALID_CONTEXT' }
		alc_invalid_enum { 'ALC_INVALID_ENUM' }
		alc_invalid_value { 'ALC_INVALID_VALUE' }
		alc_out_of_memory { 'ALC_OUT_OF_MEMORY' }
		else { 'ALC_NO_ERROR' }
	}
}

// code_msg returns an error code as a human readable string
pub fn (err &Error) code_msg() string {
	return match err.code {
		alc_invalid_device { 'A bad device was passed to an OpenAL function' }
		alc_invalid_context { 'A bad context was passed to an OpenAL function' }
		alc_invalid_enum { 'An unknown enum was passed to an OpenAL function' }
		alc_invalid_value { 'An invalid value was passed to an OpenAL function' }
		alc_out_of_memory { 'The requested operation resulted in OpenAL running out of memory' }
		else { 'There is not currently an error ' }
	}
}

// str converts error to string
pub fn (err &Error) str() string {
	return '$err.code_str() - $err.code_msg()'
}
