module al

// Forward declaration
fn C.alGenBuffers(size int, buffers voidptr)

fn C.alDeleteBuffers(sze int, buffer voidptr)

fn C.alIsBuffer(buffer u32) int

fn C.alBufferData(buffer u32, format int, data voidptr, size int, freq int)

fn C.alBufferf(buffer u32, param int, value f32)

fn C.alBuffer3f(buffer u32, param int, v1 f32, v2 f32, v3 f32)

fn C.alBufferfv(buffer u32, param int, values voidptr)

fn C.alBufferi(buffer u32, param int, value int)

fn C.alBuffer3i(buffer u32, param int, v1 int, v2 int, v3 int)

fn C.alBufferiv(buffer u32, param int, values voidptr)

fn C.alGetBufferf(buffer u32, param int, value &f32)

fn C.alGetBuffer3f(bufer u32, param int, v1 &f32, v2 &f32, v3 &f32)

fn C.alGetBufferfv(buffer u32, param int, values voidptr)

fn C.alGetBufferi(buffer u32, param int, value &int)

fn C.alGetBuffer3i(buffer u32, param int, v1 &int, v2 &int, v3 &int)

fn C.alGetBufferiv(buffer u32, param int, values voidptr)

// Buffer wraps the functionality of an OpenAL buffer
pub struct Buffer {
mut:
	id u32
}

// BufferFormat defines the different buffer data types
pub enum BufferFormat {
	mono8
	mono16
	stereo8
	stereo16
}

// create_buffers creates multiple instances of Buffer
pub fn create_buffers(n int) []Buffer {
	values := []u32{len: n}
	C.alGenBuffers(n, &values)
	check_error()
	//
	mut buffers := []Buffer{len: n}
	for i in 0 .. n {
		buffers[i] = Buffer{
			id: values[i]
		}
	}
	//
	return buffers
}

// release_buffers deletes multiple instances of Buffer
pub fn release_buffers(b []Buffer) {
	mut values := []u32{len: b.len}
	for i in 0 .. b.len {
		values[i] = b[i].id
	}
	C.alDeleteBuffers(b.len, values.data)
	check_error()
}

// is_buffer validates if Buffer is valid
pub fn (b &Buffer) is_valid() bool {
	ok := C.alIsBuffer(b.id)
	check_error()
	return ok != 0
}

// get_frequency returns the frequency of the buffer
pub fn (b &Buffer) get_frequency() int {
	return b.get_bufferi(frequency)
}

// set_frequency sets the frequency of the buffer
pub fn (b &Buffer) set_frequency(value int) {
	b.bufferi(frequency, value)
}

// get_bits returns the bits of the buffer
pub fn (b &Buffer) get_bits() int {
	return b.get_bufferi(bits)
}

// set_bits sets the bits of the buffer
pub fn (b &Buffer) set_bits(value int) {
	b.bufferi(bits, value)
}

// get_channels returns the number channels of the buffer
pub fn (b &Buffer) get_channels() int {
	return b.get_bufferi(channels)
}

// set_channels sets the number of channels of the buffer
pub fn (b &Buffer) set_channels(value int) {
	b.bufferi(channels, value)
}

// get_size returns the size of the buffer
pub fn (b &Buffer) get_size() int {
	return b.get_bufferi(size)
}

// set_size sets the size of the buffer
pub fn (b &Buffer) set_size(value int) {
	b.bufferi(size, value)
}

// set_data sets the data on the buffer
pub fn (b &Buffer) set_data(format BufferFormat, data []byte) {
	value := match format {
		.mono8 { format_mono8 }
		.mono16 { format_mono16 }
		.stereo8 { format_stereo8 }
		.stereo16 { format_stereo16 }
	}
	C.alBufferData(b.id, value, data.data, data.len, b.get_frequency())
	check_error()
}

// bufferf sets a buffer parameter value as float
pub fn (b &Buffer) bufferf(param int, value f32) {
	C.alBufferf(b.id, param, value)
	check_error()
}

// buffer3f sets a buffer parameter value as vector of floats 
pub fn (b &Buffer) buffer3f(param int, v1 f32, v2 f32, v3 f32) {
	C.alBuffer3f(b.id, param, v1, v2, v3)
	check_error()
}

// bufferfv sets a buffer parameter value as vector of floats
pub fn (b &Buffer) bufferfv(param int, values []f32) {
	C.alBufferfv(b.id, param, values.data)
	check_error()
}

// bufferi sets a buffer parameter value as integer
pub fn (b &Buffer) bufferi(param int, value int) {
	C.alBufferi(b.id, param, value)
	check_error()
}

// buffer3i sets a buffer parameter value as vector of integers
pub fn (b &Buffer) buffer3i(param int, v1 int, v2 int, v3 int) {
	C.alBuffer3i(b.id, param, v1, v2, v3)
	check_error()
}

// bufferiv sets a buffer parameter value as vector of integers
pub fn (b &Buffer) bufferiv(param int, values []int) {
	C.alBufferiv(b.id, param, values.data)
	check_error()
}

// get_bufferf returns a buffer parameter value as float
pub fn (b &Buffer) get_bufferf(param int) f32 {
	mut value := f32(0)
	C.alGetBufferf(b.id, param, &value)
	check_error()
	return value
}

// get_buffer3f returns a buffer parameter value as vector of floats
pub fn (b &Buffer) get_buffer3f(param int) (f32, f32, f32) {
	v1 := f32(0)
	v2 := f32(0)
	v3 := f32(0)
	C.alGetBuffer3f(b.id, param, &v1, &v2, &v3)
	check_error()
	return v1, v2, v3
}

// get_bufferfv returns a buffer parameter value as vector of floats
pub fn (b &Buffer) get_bufferfv(param int) []f32 {
	mut values := []f32{}
	C.alGetBufferfv(b.id, param, &values)
	check_error()
	return values
}

// get_bufferi returns a buffer parameter value as integer
pub fn (b &Buffer) get_bufferi(param int) int {
	mut value := int(0)
	C.alGetBufferi(b.id, param, &value)
	check_error()
	return value
}

// get_buffer3i returns a buffer parameter value as vector of integers
pub fn (b &Buffer) get_buffer3i(param int) (int, int, int) {
	v1 := int(0)
	v2 := int(0)
	v3 := int(0)
	C.alGetBuffer3i(b.id, param, &v1, &v2, &v3)
	check_error()
	return v1, v2, v3
}

// get_bufferiv returns a buffer parameter value as vector of integers
pub fn (b &Buffer) get_bufferiv(param int) []int {
	mut values := []int{}
	C.alGetBufferiv(b.id, param, &values)
	check_error()
	return values
}
