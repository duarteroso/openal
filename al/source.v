module al

fn C.alGenSources(size ALsizei, sources &ALuint)
fn C.alDeleteSources(size ALsizei, sources &ALuint)

fn C.alIsSource(source ALuint) ALboolean

fn C.alSourcef(source ALuint, param ALenum, value ALfloat)
fn C.alSource3f(source ALuint, param ALenum, value1 ALfloat, value2 ALfloat, value3 ALfloat)
fn C.alSourcefv(source ALuint, param ALenum, values ALfloatptr)
fn C.alSourcei(source ALuint, param ALenum, value ALint)
fn C.alSource3i(source ALuint, param ALenum, value1 ALint, value2 ALint, value3 ALint)
fn C.alSourceiv(source ALuint, param ALenum, values &ALint)

fn C.alGetSourcef(source ALuint, param ALenum, value &ALfloat)
fn C.alGetSource3f(sourece ALuint, param ALenum, value1 &ALfloat, value2 &ALfloat, value3 &ALfloat)
fn C.alGetSourcefv(source ALuint, param ALenum, values ALfloatptr)
fn C.alGetSourcei(source ALuint, param ALenum, value &ALint)
fn C.alGetSource3i(source ALuint, param ALenum, value1 &ALint, value2 &ALint, value3 &ALint)
fn C.alGetSourceiv(source ALuint, param ALenum, values &ALint)

fn C.alSourcePlay(source ALuint)
fn C.alSourcePlayv(n ALsizei, sources &ALuint)
fn C.alSourcePause(source ALuint)
fn C.alSourcePausev(n ALsizei, values &ALuint)
fn C.alSourceStop(source ALuint)
fn C.alSourceStopv(n ALsizei, sources &ALuint)
fn C.alSourceRewind(source ALuint)
fn C.alSourceRewindv(n ALsizei, sources &ALuint)
fn C.alSourceQueueBuffers(source ALuint, n ALsizei, buffers &ALuint)
fn C.alSourceUnqueueBuffers(source ALuint, n ALsizei, buffers &ALuint)
