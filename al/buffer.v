module al

type BufferDataType = []u16 | []u8

// Buffer wraps the functionality of an OpenAL buffer
pub struct Buffer {
mut:
	id u32
}

// create_buffer returns an instance of Buffer
pub fn create_buffer() Buffer {
	return Buffer{}
}

// create_buffer_from_id creates a Buffer with a specified id
pub fn create_buffer_from_id(id u32) Buffer {
	return Buffer{
		id: id
	}
}

// generate_buffers creates multiple instances of Buffer
pub fn generate_buffers(mut buffers []Buffer) ! {
	assert buffers.len > 0
	//
	n := buffers.len
	mut values := []u32{len: n, init: 0}
	C.alGenBuffers(n, values.data)
	check_error()!
	//
	for i in 0 .. n {
		buffers[i] = Buffer{
			id: values[i]
		}
	}
}

// release_buffers deletes multiple instances of Buffer
pub fn release_buffers(b []Buffer) ! {
	values := convert_buffer_array(b)
	C.alDeleteBuffers(b.len, values.data)
	check_error()!
}

// convert_buffer_array converts an array of Buffer into u32
fn convert_buffer_array(b []Buffer) []u32 {
	mut values := []u32{len: b.len}
	for i in 0 .. b.len {
		values[i] = b[i].id
	}
	//
	return values
}

// generate a buffer
pub fn (mut b Buffer) generate() ! {
	mut values := []u32{len: 1}
	C.alGenBuffers(values.len, values.data)
	check_error()!
	b.id = values[0]
}

// release buffer
pub fn (b Buffer) release() ! {
	values := [b.id]
	C.alDeleteBuffers(values.len, values.data)
	check_error()!
}

// is_valid validates Buffer
pub fn (b Buffer) is_valid() bool {
	ok := C.alIsBuffer(b.id)
	check_error() or {
		println('Failed to validate buffer: $err')
		return false
	}
	return ok == al_true
}

// get_id returns the id of the buffer
pub fn (b Buffer) get_id() u32 {
	return b.id
}

// get_frequency returns the frequency of the buffer
pub fn (b Buffer) get_frequency() !int {
	return b.get_bufferi(int(BufferParameter.frequency))
}

// get_bits returns the bits of the buffer
pub fn (b Buffer) get_bits() !int {
	return b.get_bufferi(int(BufferParameter.bits))
}

// get_channels returns the number channels of the buffer
pub fn (b Buffer) get_channels() !int {
	return b.get_bufferi(int(BufferParameter.channels))
}

// get_size returns the size of the buffer
pub fn (b Buffer) get_size() !int {
	return b.get_bufferi(int(BufferParameter.size))
}

// set_unsigned_data sets the buffer with unsigned raw data
pub fn (b Buffer) set_unsigned_data(format UnsignedBufferFormat, data []u8, frequency int) ! {
	b.set_data(BufferFormat(format), data.data, data.len, frequency)!
}

// set_signed_data sets the buffer with signed raw data
pub fn (b Buffer) set_signed_data(format SignedBufferFormat, data []i16, frequency int) ! {
	b.set_data(BufferFormat(format), data.data, data.len, frequency)!
}

// set_data sets the data on the buffer
fn (b Buffer) set_data(format BufferFormat, data voidptr, size int, frequency int) ! {
	C.alBufferData(b.id, int(format), data, size, frequency)
	check_error()!
}

// bufferf sets a buffer parameter value as float
pub fn (b Buffer) bufferf(param int, value f32) ! {
	C.alBufferf(b.id, param, value)
	check_error()!
}

// buffer3f sets a buffer parameter value as a tuple of floats
pub fn (b Buffer) buffer3f(param int, value1 f32, value2 f32, value3 f32) ! {
	C.alBuffer3f(b.id, param, value1, value2, value3)
	check_error()!
}

// bufferfv sets a buffer parameter value as a vector of floats
pub fn (b Buffer) bufferfv(param int, values []f32) ! {
	C.alBufferfv(b.id, param, values.data)
	check_error()!
}

// bufferi sets a buffer parameter value as integer
pub fn (b Buffer) bufferi(param int, value int) ! {
	C.alBufferi(b.id, param, value)
	check_error()!
}

// buffer3i sets a buffer parameter value as a tuple of integers
pub fn (b Buffer) buffer3i(param int, v1 int, v2 int, v3 int) ! {
	C.alBuffer3i(b.id, param, v1, v2, v3)
	check_error()!
}

// bufferiv sets a buffer parameter value as vector of integers
pub fn (b Buffer) bufferiv(param int, values []int) ! {
	C.alBufferiv(b.id, param, values.data)
	check_error()!
}

// get_bufferf returns a buffer parameter value as float
pub fn (b Buffer) get_bufferf(param int) !f32 {
	mut value := f32(0)
	C.alGetBufferf(b.id, param, &value)
	check_error()!
	return value
}

// get_buffer3f returns a buffer parameter value as a tuple of floats
pub fn (b Buffer) get_buffer3f(param int) !(f32, f32, f32) {
	v1 := f32(0)
	v2 := f32(0)
	v3 := f32(0)
	C.alGetBuffer3f(b.id, param, &v1, &v2, &v3)
	check_error()!
	return v1, v2, v3
}

// get_bufferfv returns a buffer parameter value as vector of floats
pub fn (b Buffer) get_bufferfv(param int, size int) ![]f32 {
	mut values := []f32{len: size}
	C.alGetBufferfv(b.id, param, values.data)
	check_error()!
	return values
}

// get_bufferi returns a buffer parameter value as integer
pub fn (b Buffer) get_bufferi(param int) !int {
	mut value := int(0)
	C.alGetBufferi(b.id, param, &value)
	check_error()!
	return value
}

// get_buffer3i returns a buffer parameter value as a tuple of integers
pub fn (b Buffer) get_buffer3i(param int) !(int, int, int) {
	v1 := int(0)
	v2 := int(0)
	v3 := int(0)
	C.alGetBuffer3i(b.id, param, &v1, &v2, &v3)
	check_error()!
	return v1, v2, v3
}

// get_bufferiv returns a buffer parameter value as vector of integers
pub fn (b Buffer) get_bufferiv(param int, size int) ![]int {
	mut values := []int{len: size}
	C.alGetBufferiv(b.id, param, values.data)
	check_error()!
	return values
}
