module vopenal

// Forward declaration
fn C.alGetError() int
fn C.alEnable(capability int)
fn C.alDisable(capability int)
fn C.alIsEnabled(capability int) byte
fn C.alGetBoolean(param int) byte
fn C.alGetDouble(param int) f64
fn C.alGetFloat(param int) f32
fn C.alGetInteger(param int) int
fn C.alGetBooleanv(param int, data voidptr)
fn C.alGetDoublev(param int, data voidptr)
fn C.alGetFloatv(param int, data voidptr)
fn C.alGetIntegerv(param int, data voidptr)
fn C.alGetString(param int) charptr
fn C.alIsExtensionPresent(extname charptr) byte
fn C.alGetProcAddress(fname charptr) voidptr
fn C.alGetEnumValue(ename charptr) int

// al_get_error Get AL error
pub fn al_get_error() AlError {
	c := C.alGetError()
	mut err := al_create_error(c)
	return err
}

// al_check_error Check and panics when errors
pub fn al_check_error() {
	err := al_get_error()
	if err.code != al_no_error {
		panic(err.str())
	}
} 

// enable Enable capability
pub fn enable(capability int) {
	C.alEnable(capability)
	al_check_error()
}

// disable Disable capability
pub fn disable(capability int) {
	C.alDisable(capability)
	al_check_error()
}

// is_enabled Check if capability is enabled
pub fn is_enabled(capability int) bool {
	ok := C.alIsEnabled(capability)
	al_check_error()
	return ok != 0
}

// get_boolean Get parameter value
pub fn get_boolean(param int) bool {
	ok := C.alGetBoolean(param)
	al_check_error()
	return ok != 0
}

// get_double Get parameter value
pub fn get_double(param int) f64 {
	value := C.alGetDouble(param)
	al_check_error()
	return value
}

// get_float Get parameter value
pub fn get_float(param int) f32 {
	value := C.alGetFloat(param)
	al_check_error()
	return value
}

// get_integer Get parameter value
pub fn get_integer(param int) int {
	value := C.alGetInteger(param)
	al_check_error()
	return value
}

// get_booleanv Get parameter values
pub fn get_booleanv(param int) []bool {
	values := []bool{}
	C.alGetBooleanv(param, &values.data)
	al_check_error()
	return values
}

// get_doublev Get parameter values
pub fn get_doublev(param int) []f64 {
	values := []f64{}
	C.alGetDoublev(param, &values.data)
	al_check_error()
	return values
}

// get_floatv Get parameter values
pub fn get_floatv(param int) []f32 {
	values := []f32{}
	C.alGetFloatv(param, &values.data)
	al_check_error()
	return values
}

// get_integerv Get parameter values
pub fn get_integerv(param int) []int {
	values := []int{}
	C.alGetIntegerv(param, &values.data)
	al_check_error()
	return values
}

// get_string Get parameter value
pub fn get_string(param int) string {
	s := C.alGetString(param)
	al_check_error()
	return tos3(s)
}

// is_extension_present Check wether an extension is present
pub fn is_extension_present(ext string) bool {
	ok := C.alIsExtensionPresent(ext.str)
	al_check_error()
	return ok != 0
}

// get_proc_addr
pub fn get_proc_addr(fname string) voidptr {
	addr := C.alGetProcAddress(fname.str)
	al_check_error()
	return addr
}

// get_enum_value
pub fn get_enum_value(ename string) int {
	value := C.alGetEnumValue(ename.str)
	al_check_error()
	return value
}