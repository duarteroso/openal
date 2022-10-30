module test

import duarteroso.semver
import alc

fn test_alc_version() {
	sv := alc.version()
	assert sv.major == alc.alc_major_version
	assert sv.minor == alc.alc_minor_version
	assert sv.patch == 0
	assert sv.stage == semver.Stage.release
}

fn test_alc_context() {
	mut device := alc.create_device()
	device.open_default()!
	//
	context := alc.create_context_from_device(device)!
	assert context.make_current()!
	current := alc.get_current_context()!
	//
	assert alc.remove_current_context()
	current.destroy()!
	context.destroy()!
	//
	device.close()!
}

fn test_extensions_list() {
	exts := alc.get_all_extensions()!
	assert exts.len != 0
}

fn test_device_list() {
	list := alc.get_all_devices()!
	assert list.len != 0
}

fn test_capture_device_list() ! {
	list := alc.get_all_capture_devices()!
	assert list.len != 0
}
