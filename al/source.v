module al

fn C.alGenSources(size int, sources &u32)
fn C.alDeleteSources(size int, sources &u32)

fn C.alIsSource(source u32) byte

fn C.alSourcef(source u32, param int, value f32)
fn C.alSource3f(source u32, param int, value1 f32, value2 f32, value3 f32)
fn C.alSourcefv(source u32, param int, values &f32)
fn C.alSourcei(source u32, param int, value int)
fn C.alSource3i(source u32, param int, value1 int, value2 int, value3 int)
fn C.alSourceiv(source u32, param int, values &int)

fn C.alGetSourcef(source u32, param int, value &f32)
fn C.alGetSource3f(sourece u32, param int, value1 &f32, value2 &f32, value3 &f32)
fn C.alGetSourcefv(source u32, param int, values &f32)
fn C.alGetSourcei(source u32, param int, value &int)
fn C.alGetSource3i(source u32, param int, value1 &int, value2 &int, value3 &int)
fn C.alGetSourceiv(source u32, param int, values &int)

fn C.alSourcePlay(source u32)
fn C.alSourcePlayv(n int, sources &u32)
fn C.alSourcePause(source u32)
fn C.alSourcePausev(n int, values &u32)
fn C.alSourceStop(source u32)
fn C.alSourceStopv(n int, sources &u32)
fn C.alSourceRewind(source u32)
fn C.alSourceRewindv(n int, sources &u32)
fn C.alSourceQueueBuffers(source u32, n int, buffers &u32)
fn C.alSourceUnqueueBuffers(source u32, n int, buffers &u32)
