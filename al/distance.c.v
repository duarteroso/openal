module al

fn C.alDistanceModel(value int)
fn C.alDopplerFactor(value f32)
fn C.alSpeedOfSound(value f32)

// Distance model formulae
pub enum DistanceModel {
	inverse_distance
	inverse_distance_clamped
	linear_distance
	linear_ditance_clamped
	exponent_distance
	exponent_distance_clamped
}
