module al

fn C.alGenBuffers(n int, buffers &u32)
fn C.alDeleteBuffers(n int, buffers &u32)
fn C.alIsBuffer(buffer u32) byte
fn C.alBufferData(buffer u32, format int, data voidptr, size int, freq int)

fn C.alBufferf(buffer u32, param int, value f32)
fn C.alBuffer3f(buffer u32, param int, value1 f32, value2 f32, value3 f32)
fn C.alBufferfv(buffer u32, param int, values &f32)
fn C.alBufferi(buffer u32, param int, value int)
fn C.alBuffer3i(buffer u32, param int, value1 int, value2 int, value3 int)
fn C.alBufferiv(buffer u32, param int, values &int)

fn C.alGetBufferf(buffer u32, param int, value &f32)
fn C.alGetBuffer3f(bufer u32, param int, value1 &f32, value2 &f32, value3 &f32)
fn C.alGetBufferfv(buffer u32, param int, values &f32)
fn C.alGetBufferi(buffer u32, param int, value &int)
fn C.alGetBuffer3i(buffer u32, param int, value1 &int, value2 &int, value3 &int)
fn C.alGetBufferiv(buffer u32, param int, values &int)
