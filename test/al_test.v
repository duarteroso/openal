module test

import duarteroso.semver
import al

fn test_al_version() {
	sv := al.version()
	assert sv.major == al.al_major_version
	assert sv.minor == al.al_minor_version
	assert sv.patch == 0
	assert sv.stage == semver.Stage.release
}

fn test_type_getter() ! {
	test := fn () ! {
		values := [
			int(al.DistanceParameter.model),
			int(al.DopplerParameter.speed_of_sound),
			int(al.DopplerParameter.factor),
		]

		for value in values {
			al.get_boolean(value)!
			al.get_double(value)!
			al.get_float(value)!
			al.get_integer(value)!
		}
	}
	//
	do_test(test)
}

fn test_type_getter_vector() ! {
	test := fn () ! {
		values := [
			int(al.DistanceParameter.model),
			int(al.DopplerParameter.speed_of_sound),
			int(al.DopplerParameter.factor),
		]

		mut barr := [3]bool{}
		mut darr := [3]f64{}
		mut farr := [3]f32{}
		mut iarr := [3]int{}
		for value in values {
			al.get_booleanv(value, mut barr)!
			al.get_doublev(value, mut darr)!
			al.get_floatv(value, mut farr)!
			al.get_integerv(value, mut iarr)!
		}
	}
	//
	do_test(test)
}

fn test_type_string() ! {
	test := fn () ! {
		al.get_string(int(al.Al.version))!
	}
	//
	do_test(test)
}

fn test_type_enum() ! {
	test := fn () ! {
		al.get_enum_value('AL_EAX_RAM_SIZE')!
	}
	//
	do_test(test)
}
