module al

import duarteroso.semver
import os

#flag linux -lopenal

#flag darwin -I/usr/local/opt/openal-soft/include
#flag darwin -L/usr/local/opt/openal-soft/lib
#flag darwin -lopenal

#include "AL/al.h"

$if !linux && !darwin {
	$compile_error('Platform currently not supported')
}

fn init() {
	$if debug {
		os.setenv('ALSOFT_LOGLEVEL', '3', true)
	} $else $if prod {
		os.setenv('ALSOFT_LOGLEVEL', '0', true)
	} $else {
		os.setenv('ALSOFT_LOGLEVEL', '2', true)
	}
}

// version returns the AL semantic version
pub fn version() semver.SemVer {
	return semver.SemVer{
		major: al_major_version
		minor: al_minor_version
		patch: 0
		stage: semver.Stage.release
	}
}
