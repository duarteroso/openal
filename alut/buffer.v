module alut

import novuloj.vopenal.al

// Forward declaration
fn C.alutCreateBufferFromFile(fileName charptr) u32
fn C.alutCreateBufferFromFileImage(data voidptr, length int) u32
fn C.alutCreateBufferHelloWorld() u32
fn C.alutCreateBufferWaveform(waveshape int, frequency f32, phase f32, duration f32) u32

// create_buffer_from_file creates a buffer from a file,
// specified by its path
pub fn create_buffer_from_file(path string) al.Buffer {
	id := C.alutCreateBufferFromFile(path.str)
	check_error()
	return al.Buffer{
		id: id
	}
}

// create_buffer_from_file_image creates a buffer by loading
// in-memory data
pub fn create_buffer_from_file_image(data voidptr, length int) al.Buffer {
	id := C.alutCreateBufferFromFileImage(data, length)
	check_error()
	return al.Buffer{
		id: id
	}
}

// create_buffer_for_debug creates a buffer for testing purposes
pub fn create_buffer_for_debug() al.Buffer {
	id := C.alutCreateBufferHelloWorld()
	check_error()
	return al.Buffer{
		id: id
	}
}

// create_buffer_waveform creates a buffer 
// with a synthesized waveform sound
pub fn create_buffer_waveform(waveshape int, frequency f32, phase f32, duration f32) al.Buffer {
	id := C.alutCreateBufferWaveform(waveshape, frequency, phase, duration)
	check_error()
	return al.Buffer{
		id: id
	}
}
