module vopenal

import duarteroso.vsemver
import novuloj.vopenal.al
import novuloj.vopenal.alc

// Linux
#flag linux -lopenal
// Includes
#include <AL/al.h>
#include <AL/alc.h>
// load_module loads OpenAL module
// Used to force the compiler to include the C pragmas
pub fn load_module() {
}

// unload_module unloads OpenAL module
pub fn unload_module() {
}

// module_version returns the module semantic version
pub fn module_version() vsemver.SemVer {
	return vsemver.SemVer{
		major: 0
		minor: 2
		patch: 0
		stage: .alpha
	}
}

// openal_version returns the AL semantic version
pub fn openal_version() vsemver.SemVer {
	return vsemver.SemVer{
		major: 1
		minor: 1
		patch: 0
	}
}

// openalc_version returns the ALC semantic version
pub fn alc_version() vsemver.SemVer {
	return vsemver.SemVer{
		major: alc.alc_major_version
		minor: alc.alc_minor_version
		patch: 0
	}
}
