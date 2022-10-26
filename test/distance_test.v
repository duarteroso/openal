module test

import al

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
	do_test(test)
}
