module alc

import duarteroso.semver

// alc_version returns the ALC semantic version
pub fn alc_version() semver.SemVer {
	return semver.SemVer{
		major: alc_major_version
		minor: alc_minor_version
		patch: 0
		stage: semver.Stage.release
	}
}
