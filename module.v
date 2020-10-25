module vopenal

import duarteroso.vsemver
import novuloj.vopenal.al
import novuloj.vopenal.alc
import novuloj.vopenal.alut

// Linux
#flag linux -lopenal
#flag linux -lalut
// Includes
#include <AL/al.h>
#include <AL/alc.h>
#include <AL/alut.h>
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
		minor: 3
		patch: 0
		stage: .alpha
	}
}

// al_version returns the AL semantic version
pub fn al_version() vsemver.SemVer {
	return vsemver.SemVer{
		major: al.al_major_version
		minor: al.al_minor_version
		patch: 0
	}
}

// alc_version returns the ALC semantic version
pub fn alc_version() vsemver.SemVer {
	return vsemver.SemVer{
		major: alc.alc_major_version
		minor: alc.alc_minor_version
		patch: 0
	}
}

// alut_version returns the ALUT semantic version
pub fn alut_version() vsemver.SemVer {
	return vsemver.SemVer{
		major: alut.alut_api_major_version
		minor: alut.alut_api_minor_version
		patch: 0
	}
}