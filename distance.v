module vopenal

// Forward declaration
fn C.alDistanceModel(value int)
fn C.alDopplerFactor(value f32)
fn C.alSpeedOfSound(value f32)

// Distance model
pub enum DistanceModel {
	inverse_distance 
	inverse_distance_clamped 
	linear_distance 
	linear_ditance_clamped 
	exponent_distance 
	exponent_distance_clamped 
}

// distance_model Set distance model
pub fn distance_model(model DistanceModel) {
	value := match model {
		.inverse_distance { al_inverse_distance }
		.inverse_distance_clamped { al_inverse_distance_clamped }
		.linear_distance { al_linear_distance }
		.linear_ditance_clamped { al_linear_distance_clamped }
		.exponent_distance { al_exponent_distance }
		.exponent_distance_clamped { al_exponent_distance_clamped }
	}
	C.alDistanceModel(value)
	al_check_error()
}

// doppler_factor Set doppler factor
pub fn doppler_factor(value f32) {
	C.alDopplerFactor(value)
	al_check_error()
}

// speed_sound Set speed of sound
pub fn speed_sound(value f32) {
	C.alSpeedOfSound(value)
	al_check_error()
}