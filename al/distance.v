module al

fn C.alDistanceModel(value ALenum)
fn C.alDopplerFactor(value ALfloat)
fn C.alSpeedOfSound(value ALfloat)

// Distance model formulae
pub enum DistanceModel {
	inverse_distance
	inverse_distance_clamped
	linear_distance
	linear_ditance_clamped
	exponent_distance
	exponent_distance_clamped
}
