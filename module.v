module vopenal

import duarteroso.vsemver

// Linux
#flag linux -lopenal

// Includes
#include <AL/al.h>
#include <AL/alc.h>

// Module init function
fn init() {}

// module_version Get module semantic versionin
pub fn module_version() vsemver.SemVer {
	return vsemver.SemVer{
		major: 1
		minor: 0
		patch: 0
	}
}

// al_version Get OpenAL semantic versioning
pub fn al_version() vsemver.SemVer {
	return vsemver.SemVer {
		major: 1
		minor: 1
		patch: 0
	}
}
