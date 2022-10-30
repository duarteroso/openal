module test

import al
import math

fn test_distance_model() ! {
	test := fn () ! {
		models := [
			al.DistanceModel.inverse_distance,
			al.DistanceModel.inverse_distance_clamped,
			al.DistanceModel.linear_distance,
			al.DistanceModel.linear_ditance_clamped,
			al.DistanceModel.exponent_distance,
			al.DistanceModel.exponent_distance_clamped,
		]
		for model in models {
			al.distance_model(model)!
		}
	}
	//
	do_test(test)
}

fn test_doppler_factor() ! {
	test := fn () ! {
		al.doppler_factor(math.max_f32)!
	}
	//
	do_test(test)
}

fn test_invalid_doppler_factor() {
	test := fn () ! {
		al.doppler_factor(-1 * math.max_f32) or { return }
		assert false
	}
	//
	do_test(test)
}

fn test_speed_sound() ! {
	test := fn () ! {
		al.speed_sound(math.max_f32)!
	}
	//
	do_test(test)
}

fn test_invalid_speed_sound() {
	test := fn () ! {
		al.speed_sound(math.smallest_non_zero_f32) or { return }
		assert false
	}
	//
	do_test(test)
}
