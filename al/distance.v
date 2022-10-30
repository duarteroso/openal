module al

// distance_model sets the distance model
pub fn distance_model(model DistanceModel) ! {
	value := match model {
		.inverse_distance { DistanceParameter.inverse }
		.inverse_distance_clamped { DistanceParameter.inverse_clamped }
		.linear_distance { DistanceParameter.linear }
		.linear_ditance_clamped { DistanceParameter.linear_clamped }
		.exponent_distance { DistanceParameter.exponent }
		.exponent_distance_clamped { DistanceParameter.exponent_clamped }
	}
	C.alDistanceModel(int(value))
	check_error()!
}

// doppler_factor sets the doppler factor
pub fn doppler_factor(value f32) ! {
	C.alDopplerFactor(value)
	check_error()!
}

// speed_sound sets the speed of sound
pub fn speed_sound(value f32) ! {
	C.alSpeedOfSound(value)
	check_error()!
}
