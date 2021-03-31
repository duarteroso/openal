module al

import duarteroso.vsemver
import alc

fn test_al_version() {
	sv := al_version()
	assert sv.major == al_major_version
	assert sv.minor == al_minor_version
	assert sv.patch == 0
	assert sv.stage == vsemver.Stage.release
}

fn test_type_getter() {
	test := fn () {
		values := [
			al_distance_model,
			al_speed_of_sound,
			al_doppler_factor,
		]

		for value in values {
			get_boolean(value)
			get_double(value)
			get_float(value)
			get_integer(value)
		}
	}
	//
	alc.do_test(test)
}

fn test_type_getter_vector() {
	test := fn () {
		values := [
			al_distance_model,
			al_speed_of_sound,
			al_doppler_factor,
		]

		for value in values {
			get_booleanv(value)
			get_doublev(value)
			get_floatv(value)
			get_integerv(value)
		}
	}
	//
	alc.do_test(test)
}

fn test_type_string() {
	test := fn () {
		get_string(al_version)
	}
	//
	alc.do_test(test)
}

fn test_type_enum() {
	test := fn () {
		get_enum_value('AL_EAX_RAM_SIZE')
	}
	//
	alc.do_test(test)
}
