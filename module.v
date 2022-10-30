module openal

import v.vmod

$if !linux {
	$compile_error('Only Linux is currently supported')
}

// manifest of module
pub fn manifest() !vmod.Manifest {
	return vmod.decode(@VMOD_FILE) or { err }
}
