module al

// Forward declaration
fn C.alGetError() int

// Error defines a code and message for a particular error
pub struct Error {
pub mut:
	code int
	msg  string
}

// has_error returns true if tehre is a pending AL error
pub fn has_error() bool {
	return C.alGetError() != al_no_error
}

// check_error checks and panics on error
pub fn check_error() {
	if has_error() {
		panic(get_error().str())
	}
}

// get_error returns the pending AL error
pub fn get_error() Error {
	c := C.alGetError()
	return new_error(c)
}

// new_error creates a new Error
fn new_error(code int) Error {
	mut err := Error{
		code: code
	}
	err.msg = err.code_msg()
	return err
}

// code_str returns an error code as string
pub fn (err &Error) code_str() string {
	return match err.code {
		al_invalid_name { 'AL_INVALID_NAME' }
		al_invalid_enum { 'AL_INVALID_ENUM' }
		al_invalid_value { 'AL_INVALID_VALUE' }
		al_invalid_operation { 'AL_INVALID_OPERATION' }
		al_out_of_memory { 'AL_OUT_OF_MEMORY' }
		else { 'AL_NO_ERROR' }
	}
}

// code_msg returns an error code as a human readable string
pub fn (err &Error) code_msg() string {
	return match err.code {
		al_invalid_name { 'A bad name (ID) was passed to an OpenAL function' }
		al_invalid_enum { 'An invalid enum value was passed to an OpenAL function' }
		al_invalid_value { 'An invalid value was passed to an OpenAL function' }
		al_invalid_operation { 'The requested operation is not valid' }
		al_out_of_memory { 'The requested operation resulted in OpenAL running out of memory' }
		else { 'There is not currently an error ' }
	}
}

// str converts error to string
pub fn (err &Error) str() string {
	return '$err.code_str() - $err.code_msg()'
}
