module al

import duarteroso.vsemver

// al_version returns the AL semantic version
pub fn al_version() vsemver.SemVer {
	return vsemver.SemVer{
		major: al_major_version
		minor: al_minor_version
		patch: 0
		stage: vsemver.Stage.release
	}
}
