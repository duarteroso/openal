module vopenal

//
pub struct AlError {
pub mut:
	code int = 0
	msg  string = ''
}

pub fn al_create_error(code int) AlError {
	mut err := AlError {
	}
	err.code = code
	err.msg = err.code_msg()
	return err
}

// code_str Return error code as string
pub fn (err &AlError) code_str() string {
	return match err.code {
		al_invalid_name			{ 'AL_INVALID_NAME' }
		al_invalid_enum 		{ 'AL_INVALID_ENUM' }
		al_invalid_value 		{ 'AL_INVALID_VALUE' }
		al_invalid_operation	{ 'AL_INVALID_OPERATION' }
		al_out_of_memory    	{ 'AL_OUT_OF_MEMORY' }
		else					{ 'AL_NO_ERROR' }
	}
}

// code_msg()
pub fn (err &AlError) code_msg() string {
	return match err.code {
		al_invalid_name			{ 'A bad name (ID) was passed to an OpenAL function' }
		al_invalid_enum 		{ 'An invalid enum value was passed to an OpenAL function' }
		al_invalid_value 		{ 'An invalid value was passed to an OpenAL function' }
		al_invalid_operation	{ 'The requested operation is not valid' }
		al_out_of_memory    	{ 'The requested operation resulted in OpenAL running out of memory' }
		else					{ 'There is not currently an error ' }
	}
}

// str Return error as string
pub fn (err &AlError) str() string {
	return '${err.code_str()} - ${err.code_msg()}'
}