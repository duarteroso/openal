module al

fn C.alListenerf(param ALenum, value ALfloat)
fn C.alListener3f(param ALenum, value1 ALfloat, value2 ALfloat, value3 ALfloat)
fn C.alListenerfv(param ALenum, value ALfloatptr)

fn C.alListeneri(param ALenum, value &ALint)
fn C.alListener3i(param ALenum, value1 ALint, value2 ALint, value3 ALint)
fn C.alListeneriv(param ALenum, value &ALint)

fn C.alGetListenerf(param ALenum, value &ALfloat)
fn C.alGetListener3f(param ALenum, value1 &ALfloat, value2 &ALfloat, value3 &ALfloat)
fn C.alGetListenerfv(param ALenum, value ALfloatptr)

fn C.alGetListeneri(param ALenum, value &ALint)
fn C.alGetListener3i(param ALenum, value1 &ALint, value2 &ALint, value3 &ALint)
fn C.alGetListeneriv(param ALenum, value &ALint)
