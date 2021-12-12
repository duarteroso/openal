module al

fn C.alGenBuffers(n ALsizei, buffers &ALuint)
fn C.alDeleteBuffers(n ALsizei, buffers &ALuint)
fn C.alIsBuffer(buffer ALuint) ALboolean
fn C.alBufferData(buffer ALuint, format ALenum, data voidptr, size ALsizei, freq ALsizei)

fn C.alBufferf(buffer ALuint, param ALenum, value ALfloat)
fn C.alBuffer3f(buffer ALuint, param ALenum, value1 ALfloat, value2 ALfloat, value3 ALfloat)
fn C.alBufferfv(buffer ALuint, param ALenum, values ALfloatptr)
fn C.alBufferi(buffer ALuint, param ALenum, value ALint)
fn C.alBuffer3i(buffer ALuint, param ALenum, value1 ALint, value2 ALint, value3 ALint)
fn C.alBufferiv(buffer ALuint, param ALenum, values &ALint)

fn C.alGetBufferf(buffer ALuint, param ALenum, value &ALfloat)
fn C.alGetBuffer3f(bufer ALuint, param ALenum, value1 &ALfloat, value2 &ALfloat, value3 &ALfloat)
fn C.alGetBufferfv(buffer ALuint, param ALenum, values ALfloatptr)
fn C.alGetBufferi(buffer ALuint, param ALenum, value &ALint)
fn C.alGetBuffer3i(buffer ALuint, param ALenum, value1 &ALint, value2 &ALint, value3 &ALint)
fn C.alGetBufferiv(buffer ALuint, param ALenum, values &ALint)
