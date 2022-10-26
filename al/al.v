module al

// enable an OpenAL capability
pub fn enable(capability int) ! {
	C.alEnable(capability)
	check_error()!
}

// disable an OpenAL capability
pub fn disable(capability int) ! {
	C.alDisable(capability)
	check_error()!
}

// is_enabled checks if a capability is enabled
pub fn is_enabled(capability int) !bool {
	enabled := C.alIsEnabled(capability)
	check_error()!
	return enabled == al_true
}

// get_boolean returns the boolean value of a parameter
pub fn get_boolean(param int) !bool {
	value := C.alGetBoolean(param)
	check_error()!
	return value == al_true
}

// get_double returns the double value of a parameter
pub fn get_double(param int) !f64 {
	value := C.alGetDouble(param)
	check_error()!
	return value
}

// get_float returns the float value of a parameter
pub fn get_float(param int) !f32 {
	value := C.alGetFloat(param)
	check_error()!
	return value
}

// get_integer returns the integer value of a parameter
pub fn get_integer(param int) !int {
	value := C.alGetInteger(param)
	check_error()!
	return value
}

// get_booleanv retrieves the boolean values of a parameter
pub fn get_booleanv(param int, mut values [3]bool) ! {
	mut bytes := [3]u8{}
	C.alGetBooleanv(param, &bytes[0])
	for i in 0 .. 3 {
		values[i] = bytes[i] == al_true
	}
	check_error()!
}

// get_doublev retrieves the double values of a parameter
pub fn get_doublev(param int, mut values [3]f64) ! {
	C.alGetDoublev(param, &values[0])
	check_error()!
}

// get_floatv retrieves the float values a parameter
pub fn get_floatv(param int, mut values [3]f32) ! {
	C.alGetFloatv(param, &values[0])
	check_error()!
}

// get_integerv retrieves the integer values a parameter
pub fn get_integerv(param int, mut values [3]int) ! {
	C.alGetIntegerv(param, &values[0])
	check_error()!
}

// get_string returns the string value a parameter
pub fn get_string(param int) !string {
	s := C.alGetString(param)
	check_error()!
	return unsafe { cstring_to_vstring(s) }
}

// is_extension_present checks wether an extension is present
pub fn is_extension_present(ext string) !bool {
	ok := C.alIsExtensionPresent(ext.str)
	check_error()!
	return ok == al_true
}

// get_proc_addr returns the process address
pub fn get_proc_addr(fname string) !voidptr {
	addr := C.alGetProcAddress(fname.str)
	check_error()!
	return addr
}

// get_enum_value returns an enumeration value
pub fn get_enum_value(ename string) !int {
	value := C.alGetEnumValue(ename.str)
	check_error()!
	return value
}
