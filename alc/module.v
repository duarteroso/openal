module alc

import semver
import os

#flag linux -lopenal

#flag darwin -I/usr/local/opt/openal-soft/include
#flag darwin -L/usr/local/opt/openal-soft/lib
#flag darwin -lopenal

#include "AL/alc.h"

fn init() {
	$if debug {
		os.setenv('ALSOFT_LOGLEVEL', '2', true)
	} $else $if prod {
		os.setenv('ALSOFT_LOGLEVEL', '0', true)
	} $else {
		os.setenv('ALSOFT_LOGLEVEL', '1', true)
	}
}

// version returns the ALC semantic version
pub fn version() semver.Version {
	major := alc_major_version
	minor := alc_minor_version
	patch := 0
	return semver.from('${major}.${minor}.${patch}') or { panic(err) }
}
