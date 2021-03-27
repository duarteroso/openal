module alut

import novuloj.vopenal.al

// Forward declaration
fn C.alutLoadMemoryFromFile(fileName charptr, format &int, size &int, frequency &f32) voidptr
fn C.alutLoadMemoryFromFileImage(data voidptr, length int, format &int, size &int, frequency &f32) voidptr
fn C.alutLoadMemoryHelloWorld(format &int, size &int, frequency &f32) voidptr
fn C.alutLoadMemoryWaveform(waveshape int, freq f32, phase f32, duration f32, format &int, size &int, frequency &f32) voidptr

// load_memory_from_file loads a sound file into OpenAL-like data
pub fn load_memory_from_file(buffer al.Buffer, path string) {
	format := int(0)
	size := int(0)
	frequency := f32(0)
	data := C.alutLoadMemoryFromFile(charptr(path.str), &format, &size, &frequency)
	check_error()
	// Set buffer data
	buffer.set_data(format, data, size, frequency)
}

// load_memory_from_image converts in-memory sound data into OpenAL-like data
pub fn load_memory_from_image(buffer al.Buffer, image voidptr, length int) {
	format := int(0)
	size := int(0)
	frequency := f32(0)
	data := C.alutLoadMemoryFromFileImage(image, length, &format, &size, &frequency)
	check_error()
	// Set buffer data
	buffer.set_data(format, data, size, frequency)
}

// load_memory_debug loads a debug sound file into OpenAL-like data
pub fn load_memory_debug(buffer al.Buffer) {
	format := int(0)
	size := int(0)
	frequency := f32(0)
	data := C.alutLoadMemoryHelloWorld(&format, &size, &frequency)
	check_error()
	// Set buffer data
	buffer.set_data(format, data, size, frequency)
}

// load_memory_waveform loads a synthesized waveform sound into OpenAL-like data
pub fn load_memory_waveform(buffer al.Buffer, waveshape int, freq f32, phase f32, duration f32) {
	format := int(0)
	size := int(0)
	frequency := f32(0)
	data := C.alutLoadMemoryWaveform(waveshape, freq, phase, duration, &format, &size,
		&frequency)
	check_error()
	// Set buffer format
	buffer.set_data(format, data, size, frequency)
}
