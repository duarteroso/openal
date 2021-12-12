module al

fn C.alEnable(capability ALenum)
fn C.alDisable(capability ALenum)
fn C.alIsEnabled(capability ALenum) ALboolean

fn C.alGetBooleanv(param ALenum, data ALbooleanptr)
fn C.alGetIntegerv(param ALenum, data &ALint)
fn C.alGetFloatv(param ALenum, data ALfloatptr)
fn C.alGetDoublev(param ALenum, data ALdoubleptr)

fn C.alGetString(param ALenum) &char
fn C.alGetBoolean(param ALenum) ALboolean
fn C.alGetInteger(param ALenum) ALint
fn C.alGetFloat(param ALenum) ALfloat
fn C.alGetDouble(param ALenum) ALdouble

fn C.alIsExtensionPresent(extname &char) ALboolean
fn C.alGetProcAddress(fname &char) voidptr
fn C.alGetEnumValue(ename &char) ALenum
