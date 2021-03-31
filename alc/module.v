module alc

import duarteroso.vsemver

// alc_version returns the ALC semantic version
pub fn alc_version() vsemver.SemVer {
	return vsemver.SemVer{
		major: alc_major_version
		minor: alc_minor_version
		patch: 0
		stage: vsemver.Stage.release
	}
}
