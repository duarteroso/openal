module alut

import novuloj.vopenal.al

// Forward declaration
fn C.alutInit(argcp voidptr, argv &charptr) byte
fn C.alutInitWithoutContext(argcp voidptr, argv &charptr) byte
fn C.alutExit() byte

fn C.alutGetMIMETypes(loader int) charptr

fn C.alutGetMajorVersion() int
fn C.alutGetMinorVersion() int

fn C.alutSleep(duration f32) byte

// init initializes ALUT.
// Returns true if successful.
fn init() bool {
	res := C.alutInit(voidptr(0), &charptr(0))
	check_error()
	return res == al.al_true
}

// init_without_context initializes ALUT without context.
// Returns true if successful.
fn init_without_context() bool {
	res := C.alutInitWithoutContext(voidptr(0), &charptr(0))
	check_error()
	return res == al.al_true
}

// exit shutsdown ALUT. Returns true if successful
pub fn exit() bool {
	res := C.alutExit()
	check_error()
	return res == al.al_true
}

// get_mime_types returns a list of supported mime types,
// separated by a comma
pub fn get_mime_types(loader int) string {
	data := C.alutGetMIMETypes(loader)
	check_error()
	return tos3(data)
}

// get_major_version returns ALUT major version
pub fn get_major_version() int {
	return C.alutGetMajorVersion()
}

// get_minor_version returns ALUT minor version
pub fn get_minor_version() int {
	return C.alutGetMinorVersion()
}

// sleep makes ALUT thread pause by the determined seconds
pub fn sleep(duration f32) bool {
	res := C.alutSleep(duration)
	check_error()
	return res == al.al_true
}