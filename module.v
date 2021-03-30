module vopenal

import duarteroso.vsemver
import al
import alc
import alut

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
		minor: 4
		patch: 0
		stage: .beta
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
