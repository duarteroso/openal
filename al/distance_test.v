module al

import duarteroso.vopenal.alc

fn test_distance_model() {
	test := fn () {
		models := [
			DistanceModel.inverse_distance,
			DistanceModel.inverse_distance_clamped,
			DistanceModel.linear_distance,
			DistanceModel.linear_ditance_clamped,
			DistanceModel.exponent_distance,
			DistanceModel.exponent_distance_clamped,
		]
		for model in models {
			distance_model(model)
		}
	}
	alc.do_test(test)
}
