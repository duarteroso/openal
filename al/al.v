module al

fn C.alEnable(capability int)
fn C.alDisable(capability int)
fn C.alIsEnabled(capability int) byte

fn C.alGetBooleanv(param int, data &byte)
fn C.alGetIntegerv(param int, data &int)
fn C.alGetFloatv(param int, data &f32)
fn C.alGetDoublev(param int, data &f64)

fn C.alGetString(param int) &char
fn C.alGetBoolean(param int) byte
fn C.alGetInteger(param int) int
fn C.alGetFloat(param int) f32
fn C.alGetDouble(param int) f64

fn C.alIsExtensionPresent(extname &char) byte
fn C.alGetProcAddress(fname &char) voidptr
fn C.alGetEnumValue(ename &char) int
