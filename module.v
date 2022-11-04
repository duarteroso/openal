module openal

import v.vmod
import os

// manifest of module
pub fn manifest() !vmod.Manifest {
	return vmod.decode(@VMOD_FILE) or { err }
}

pub fn al_version() semver.SemVer {
	return al.al_version()
}

pub fn alc_version() semver.SemVer {
	return alc.alc_version()
}
