module alc

import duarteroso.semver

#flag linux -lopenal

#include "AL/alc.h"

// version returns the ALC semantic version
pub fn version() semver.SemVer {
	return semver.SemVer{
		major: alc_major_version
		minor: alc_minor_version
		patch: 0
		stage: semver.Stage.release
	}
}
