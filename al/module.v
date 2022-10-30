module al

import duarteroso.semver

#flag linux -lopenal

#flag darwin -I/usr/local/opt/openal-soft/include
#flag darwin -L/usr/local/opt/openal-soft/lib
#flag darwin -lopenal

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
