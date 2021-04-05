module al

import duarteroso.semver

// al_version returns the AL semantic version
pub fn al_version() semver.SemVer {
	return semver.SemVer{
		major: al_major_version
		minor: al_minor_version
		patch: 0
		stage: semver.Stage.release
	}
}
