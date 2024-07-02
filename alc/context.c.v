module alc

@[typedef]
struct C.ALCcontext {
}

fn C.alcCreateContext(device &C.ALCdevice, attrlist &int) &C.ALCcontext
fn C.alcMakeContextCurrent(context &C.ALCcontext) u8
fn C.alcProcessContext(context &C.ALCcontext)
fn C.alcSuspendContext(context &C.ALCcontext)
fn C.alcDestroyContext(context &C.ALCcontext)
fn C.alcGetContextsDevice(context &C.ALCcontext) &C.ALCdevice
