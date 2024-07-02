module al

import os
import semver

#flag linux -lopenal

#flag darwin -I/usr/local/opt/openal-soft/include
#flag darwin -L/usr/local/opt/openal-soft/lib
#flag darwin -lopenal

#include "AL/al.h"

fn init() {
	$if debug {
		os.setenv('ALSOFT_LOGLEVEL', '2', true)
	} $else $if prod {
		os.setenv('ALSOFT_LOGLEVEL', '0', true)
	} $else {
		os.setenv('ALSOFT_LOGLEVEL', '1', true)
	}
}

// version returns the AL semantic version
pub fn version() semver.Version {
	major := al_major_version
	minor := al_minor_version
	patch := 0
	return semver.from('${major}.${minor}.${patch}') or { panic(err) }
}
