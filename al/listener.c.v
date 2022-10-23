module al

fn C.alListenerf(param int, value f32)
fn C.alListener3f(param int, value1 f32, value2 f32, value3 f32)
fn C.alListenerfv(param int, value &f32)

fn C.alListeneri(param int, value &int)
fn C.alListener3i(param int, value1 int, value2 int, value3 int)
fn C.alListeneriv(param int, value &int)

fn C.alGetListenerf(param int, value &f32)
fn C.alGetListener3f(param int, value1 &f32, value2 &f32, value3 &f32)
fn C.alGetListenerfv(param int, value &f32)

fn C.alGetListeneri(param int, value &int)
fn C.alGetListener3i(param int, value1 &int, value2 &int, value3 &int)
fn C.alGetListeneriv(param int, value &int)
