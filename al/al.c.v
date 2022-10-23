module al

fn C.alEnable(capability int)
fn C.alDisable(capability int)
fn C.alIsEnabled(capability int) u8

fn C.alGetBooleanv(param int, data &u8)
fn C.alGetIntegerv(param int, data &int)
fn C.alGetFloatv(param int, data &f32)
fn C.alGetDoublev(param int, data &f64)

fn C.alGetString(param int) &char
fn C.alGetBoolean(param int) u8
fn C.alGetInteger(param int) int
fn C.alGetFloat(param int) f32
fn C.alGetDouble(param int) f64

fn C.alIsExtensionPresent(extname &char) u8
fn C.alGetProcAddress(fname &char) voidptr
fn C.alGetEnumValue(ename &char) int
