module al

import duarteroso.semver

#flag linux -I/usr/include/AL
#flag linux -L/usr/lib64
#flag linux -lopenal

#include "AL/al.h"

// version returns the AL semantic version
pub fn version() semver.SemVer {
	return semver.SemVer{
		major: al_major_version
		minor: al_minor_version
		patch: 0
		stage: semver.Stage.release
	}
}
