module al

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

// get_error returns the pending AL error
pub fn get_error() Error {
	c := C.alGetError()
	mut err := new_error(c)
	return err
}

// check_error checks and panics on error
pub fn check_error() {
	err := get_error()
	if err.code != al_no_error {
		panic(err.str())
	}
}

// enable an OpenAL capability
pub fn enable(capability int) {
	C.alEnable(capability)
	check_error()
}

// disable an OpenAL capability
pub fn disable(capability int) {
	C.alDisable(capability)
	check_error()
}

// is_enabled checks if a capability is enabled
pub fn is_enabled(capability int) bool {
	ok := C.alIsEnabled(capability)
	check_error()
	return ok != 0
}

// get_boolean returns a parameter boolean value
pub fn get_boolean(param int) bool {
	ok := C.alGetBoolean(param)
	check_error()
	return ok != 0
}

// get_double returns a parameter double value
pub fn get_double(param int) f64 {
	value := C.alGetDouble(param)
	check_error()
	return value
}

// get_float returns a parameter float value
pub fn get_float(param int) f32 {
	value := C.alGetFloat(param)
	check_error()
	return value
}

// get_integer returns a parameter integer value
pub fn get_integer(param int) int {
	value := C.alGetInteger(param)
	check_error()
	return value
}

// get_booleanv returns a parameter boolean values
pub fn get_booleanv(param int) []bool {
	values := []bool{}
	C.alGetBooleanv(param, &values.data)
	check_error()
	return values
}

// get_doublev returns a parameter double values
pub fn get_doublev(param int) []f64 {
	values := []f64{}
	C.alGetDoublev(param, &values.data)
	check_error()
	return values
}

// get_floatv returns a parameter float values
pub fn get_floatv(param int) []f32 {
	values := []f32{}
	C.alGetFloatv(param, &values.data)
	check_error()
	return values
}

// get_integerv returns a parameter integer values
pub fn get_integerv(param int) []int {
	values := []int{}
	C.alGetIntegerv(param, &values.data)
	check_error()
	return values
}

// get_string returns a parameter string value
pub fn get_string(param int) string {
	s := C.alGetString(param)
	check_error()
	return tos3(s)
}

// is_extension_present checks wether an extension is present
pub fn is_extension_present(ext string) bool {
	ok := C.alIsExtensionPresent(ext.str)
	check_error()
	return ok != 0
}

// get_proc_addr returns the process address
pub fn get_proc_addr(fname string) voidptr {
	addr := C.alGetProcAddress(fname.str)
	check_error()
	return addr
}

// get_enum_value returns an enumeration value
pub fn get_enum_value(ename string) int {
	value := C.alGetEnumValue(ename.str)
	check_error()
	return value
}
