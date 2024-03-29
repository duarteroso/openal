# module al




## Contents
- [Constants](#Constants)
- [release_buffers](#release_buffers)
- [get_boolean](#get_boolean)
- [get_booleanv](#get_booleanv)
- [get_double](#get_double)
- [get_doublev](#get_doublev)
- [get_enum_value](#get_enum_value)
- [get_float](#get_float)
- [get_floatv](#get_floatv)
- [get_integer](#get_integer)
- [get_integerv](#get_integerv)
- [get_proc_addr](#get_proc_addr)
- [get_string](#get_string)
- [is_enabled](#is_enabled)
- [is_extension_present](#is_extension_present)
- [pause_sources](#pause_sources)
- [play_sources](#play_sources)
- [release_sources](#release_sources)
- [rewind_sources](#rewind_sources)
- [speed_sound](#speed_sound)
- [stop_sources](#stop_sources)
- [version](#version)
- [check_error](#check_error)
- [create_buffer](#create_buffer)
- [create_buffer_from_id](#create_buffer_from_id)
- [create_listener](#create_listener)
- [create_source](#create_source)
- [create_sources](#create_sources)
- [disable](#disable)
- [distance_model](#distance_model)
- [doppler_factor](#doppler_factor)
- [enable](#enable)
- [generate_buffers](#generate_buffers)
- [DistanceParameter](#DistanceParameter)
- [DopplerParameter](#DopplerParameter)
- [SourceType](#SourceType)
- [BuffersQueryParameter](#BuffersQueryParameter)
- [BufferState](#BufferState)
- [UnsignedBufferFormat](#UnsignedBufferFormat)
- [AlError](#AlError)
- [SignedBufferFormat](#SignedBufferFormat)
- [BufferFormat](#BufferFormat)
- [SourceParameter](#SourceParameter)
- [BufferParameter](#BufferParameter)
- [ListenerParameter](#ListenerParameter)
- [SourceProperty](#SourceProperty)
- [SourceState](#SourceState)
- [DistanceModel](#DistanceModel)
- [Al](#Al)
- [Err](#Err)
  - [str](#str)
- [Source](#Source)
  - [generate](#generate)
  - [release](#release)
  - [get_id](#get_id)
  - [is_valid](#is_valid)
  - [attach_buffer](#attach_buffer)
  - [detach_buffer](#detach_buffer)
  - [get_attached_buffer](#get_attached_buffer)
  - [get_buffer_id](#get_buffer_id)
  - [set_relative](#set_relative)
  - [is_relative](#is_relative)
  - [get_type](#get_type)
  - [get_state](#get_state)
  - [get_offset_time](#get_offset_time)
  - [get_offset_sample](#get_offset_sample)
  - [get_offset_byte](#get_offset_byte)
  - [get_buffers_queued](#get_buffers_queued)
  - [get_buffers_processed](#get_buffers_processed)
  - [get_pitch](#get_pitch)
  - [set_pitch](#set_pitch)
  - [get_gain](#get_gain)
  - [set_gain](#set_gain)
  - [get_gain_bounds](#get_gain_bounds)
  - [set_gain_bounds](#set_gain_bounds)
  - [get_max_distance](#get_max_distance)
  - [set_max_distance](#set_max_distance)
  - [get_rolloff](#get_rolloff)
  - [set_rolloff](#set_rolloff)
  - [get_cone_outer_gain](#get_cone_outer_gain)
  - [set_cone_outer_gain](#set_cone_outer_gain)
  - [get_cone_inner_angle](#get_cone_inner_angle)
  - [set_cone_inner_angle](#set_cone_inner_angle)
  - [get_cone_outer_angle](#get_cone_outer_angle)
  - [set_cone_outer_angle](#set_cone_outer_angle)
  - [get_reference_distance](#get_reference_distance)
  - [set_reference_distance](#set_reference_distance)
  - [get_position](#get_position)
  - [set_position](#set_position)
  - [get_velocity](#get_velocity)
  - [set_velocity](#set_velocity)
  - [get_direction](#get_direction)
  - [set_direction](#set_direction)
  - [sourcef](#sourcef)
  - [source3f](#source3f)
  - [sourcefv](#sourcefv)
  - [sourcei](#sourcei)
  - [source3i](#source3i)
  - [sourceiv](#sourceiv)
  - [play](#play)
  - [pause](#pause)
  - [stop](#stop)
  - [loop](#loop)
  - [is_looping](#is_looping)
  - [rewind](#rewind)
  - [queue_buffer](#queue_buffer)
  - [queue_buffers](#queue_buffers)
  - [unqueue_buffer](#unqueue_buffer)
  - [unqueue_buffers](#unqueue_buffers)
  - [unqueue_all](#unqueue_all)
- [Listener](#Listener)
  - [get_gain](#get_gain)
  - [set_gain](#set_gain)
  - [get_position](#get_position)
  - [set_position](#set_position)
  - [get_velocity](#get_velocity)
  - [set_velocity](#set_velocity)
  - [get_orientation](#get_orientation)
  - [set_orientation](#set_orientation)
  - [listenerf](#listenerf)
  - [listener3f](#listener3f)
  - [listenerfv](#listenerfv)
  - [listeneri](#listeneri)
  - [listener3i](#listener3i)
  - [listeneriv](#listeneriv)
  - [get_listenerf](#get_listenerf)
  - [get_listener3f](#get_listener3f)
  - [get_listenerfv](#get_listenerfv)
  - [get_listeneri](#get_listeneri)
  - [get_listener3i](#get_listener3i)
  - [get_listeneriv](#get_listeneriv)
- [Buffer](#Buffer)
  - [generate](#generate)
  - [release](#release)
  - [is_valid](#is_valid)
  - [get_id](#get_id)
  - [get_frequency](#get_frequency)
  - [get_bits](#get_bits)
  - [get_channels](#get_channels)
  - [get_size](#get_size)
  - [set_unsigned_data](#set_unsigned_data)
  - [set_signed_data](#set_signed_data)
  - [bufferf](#bufferf)
  - [buffer3f](#buffer3f)
  - [bufferfv](#bufferfv)
  - [bufferi](#bufferi)
  - [buffer3i](#buffer3i)
  - [bufferiv](#bufferiv)
  - [get_bufferf](#get_bufferf)
  - [get_buffer3f](#get_buffer3f)
  - [get_bufferfv](#get_bufferfv)
  - [get_bufferi](#get_bufferi)
  - [get_buffer3i](#get_buffer3i)
  - [get_bufferiv](#get_bufferiv)

## Constants
```v
const (
	al_major_version = 1
	al_minor_version = 1
)
```

Runtime AL version

[[Return to contents]](#Contents)

```v
const (
	al_none  = 0
	al_false = 0
	al_true  = 1
)
```


[[Return to contents]](#Contents)

## release_buffers
```v
fn release_buffers(b []Buffer) !
```

release_buffers deletes multiple instances of Buffer

[[Return to contents]](#Contents)

## get_boolean
```v
fn get_boolean(param int) !bool
```

get_boolean returns the boolean value of a parameter

[[Return to contents]](#Contents)

## get_booleanv
```v
fn get_booleanv(param int, mut values [3]bool) !
```

get_booleanv retrieves the boolean values of a parameter

[[Return to contents]](#Contents)

## get_double
```v
fn get_double(param int) !f64
```

get_double returns the double value of a parameter

[[Return to contents]](#Contents)

## get_doublev
```v
fn get_doublev(param int, mut values [3]f64) !
```

get_doublev retrieves the double values of a parameter

[[Return to contents]](#Contents)

## get_enum_value
```v
fn get_enum_value(ename string) !int
```

get_enum_value returns an enumeration value

[[Return to contents]](#Contents)

## get_float
```v
fn get_float(param int) !f32
```

get_float returns the float value of a parameter

[[Return to contents]](#Contents)

## get_floatv
```v
fn get_floatv(param int, mut values [3]f32) !
```

get_floatv retrieves the float values a parameter

[[Return to contents]](#Contents)

## get_integer
```v
fn get_integer(param int) !int
```

get_integer returns the integer value of a parameter

[[Return to contents]](#Contents)

## get_integerv
```v
fn get_integerv(param int, mut values [3]int) !
```

get_integerv retrieves the integer values a parameter

[[Return to contents]](#Contents)

## get_proc_addr
```v
fn get_proc_addr(fname string) !voidptr
```

get_proc_addr returns the process address

[[Return to contents]](#Contents)

## get_string
```v
fn get_string(param int) !string
```

get_string returns the string value a parameter

[[Return to contents]](#Contents)

## is_enabled
```v
fn is_enabled(capability int) !bool
```

is_enabled checks if a capability is enabled

[[Return to contents]](#Contents)

## is_extension_present
```v
fn is_extension_present(ext string) !bool
```

is_extension_present checks wether an extension is present

[[Return to contents]](#Contents)

## pause_sources
```v
fn pause_sources(s []Source) !
```

pause_sources pauses multiple sources at once

[[Return to contents]](#Contents)

## play_sources
```v
fn play_sources(s []Source) !
```

play_sources plays multiple sources at once

[[Return to contents]](#Contents)

## release_sources
```v
fn release_sources(s []Source) !
```

release_sources deletes multiple instances of Source

[[Return to contents]](#Contents)

## rewind_sources
```v
fn rewind_sources(s []Source) !
```

rewind_sources rewinds multiple sources at once

[[Return to contents]](#Contents)

## speed_sound
```v
fn speed_sound(value f32) !
```

speed_sound sets the speed of sound

[[Return to contents]](#Contents)

## stop_sources
```v
fn stop_sources(s []Source) !
```

stop_sources stops multiple sources at once

[[Return to contents]](#Contents)

## version
```v
fn version() semver.SemVer
```

version returns the AL semantic version

[[Return to contents]](#Contents)

## check_error
```v
fn check_error() !
```

check_error checks and panics on error

[[Return to contents]](#Contents)

## create_buffer
```v
fn create_buffer() Buffer
```

create_buffer returns an instance of Buffer

[[Return to contents]](#Contents)

## create_buffer_from_id
```v
fn create_buffer_from_id(id u32) Buffer
```

create_buffer_from_id creates a Buffer with a specified id

[[Return to contents]](#Contents)

## create_listener
```v
fn create_listener() Listener
```

create_listener returns an instance of Listener

[[Return to contents]](#Contents)

## create_source
```v
fn create_source() Source
```

create_source returns a new instance of Source

[[Return to contents]](#Contents)

## create_sources
```v
fn create_sources(mut sources []Source) !
```

create_sources generates multiple instances of Source

[[Return to contents]](#Contents)

## disable
```v
fn disable(capability int) !
```

disable an OpenAL capability

[[Return to contents]](#Contents)

## distance_model
```v
fn distance_model(model DistanceModel) !
```

distance_model sets the distance model

[[Return to contents]](#Contents)

## doppler_factor
```v
fn doppler_factor(value f32) !
```

doppler_factor sets the doppler factor

[[Return to contents]](#Contents)

## enable
```v
fn enable(capability int) !
```

enable an OpenAL capability

[[Return to contents]](#Contents)

## generate_buffers
```v
fn generate_buffers(mut buffers []Buffer) !
```

generate_buffers creates multiple instances of Buffer

[[Return to contents]](#Contents)

## DistanceParameter
```v
enum DistanceParameter {
	model = 0xD000
	inverse = 0xD001
	inverse_clamped = 0xD002
	linear = 0xD003
	linear_clamped = 0xD004
	exponent = 0xD005
	exponent_clamped = 0xD006
}
```

Distance model values

[[Return to contents]](#Contents)

## DopplerParameter
```v
enum DopplerParameter {
	factor = 0xC000
	velocity = 0xC001
	speed_of_sound = 0xC003
}
```

Doppler values

[[Return to contents]](#Contents)

## SourceType
```v
enum SourceType {
	source_type = 0x1027
	source_static = 0x1028
	source_streaming = 0x1029
	source_undetermined = 0x1030
}
```

Source type values

[[Return to contents]](#Contents)

## BuffersQueryParameter
```v
enum BuffersQueryParameter {
	queued = 0x1015
	processed = 0x1016
}
```


[[Return to contents]](#Contents)

## BufferState
```v
enum BufferState {
	unused = 0x2010
	pending = 0x2011
	processed = 0x2012
}
```

Buffer states

[[Return to contents]](#Contents)

## UnsignedBufferFormat
```v
enum UnsignedBufferFormat {
	mono = 0x1100
	stereo = 0x1102
}
```

Unsinged buffer formats

[[Return to contents]](#Contents)

## AlError
```v
enum AlError {
	no_error = 0
	invalid_name = 0xA001
	invalid_enum = 0xA002
	invalid_value = 0xA003
	invalid_operation = 0xA004
	out_of_memory = 0xA005
}
```

AL error codes

[[Return to contents]](#Contents)

## SignedBufferFormat
```v
enum SignedBufferFormat {
	mono = 0x1101
	stereo = 0x1103
}
```

Signed buffer formats

[[Return to contents]](#Contents)

## BufferFormat
```v
enum BufferFormat {
	mono8 = 0x1100
	mono16 = 0x1101
	stereo8 = 0x1102
	stereo16 = 0x1103
}
```

Buffer format specifier

[[Return to contents]](#Contents)

## SourceParameter
```v
enum SourceParameter {
	source_relative = 0x202
	cone_inner_angle = 0x1001
	cone_outer_angle = 0x1002
	pitch = 0x1003
	position = 0x1004
	direction = 0x1005
	velocity = 0x1006
	looping = 0x1007
	buffer = 0x1009
	gain = 0x100A
	min_gain = 0x100D
	max_gain = 0x100E
	orientation = 0x100F
	source_state = 0x1010
}
```

Source parameter values

[[Return to contents]](#Contents)

## BufferParameter
```v
enum BufferParameter {
	frequency = 0x2001
	bits = 0x2002
	channels = 0x2003
	size = 0x2004
}
```

Buffer parameter values

[[Return to contents]](#Contents)

## ListenerParameter
```v
enum ListenerParameter {
	gain = 0x100A
	position = 0x1004
	velocity = 0x1006
	orientation = 0x100F
}
```

Listener parameter values

[[Return to contents]](#Contents)

## SourceProperty
```v
enum SourceProperty {
	reference_distance = 0x1020
	rolloff_factor = 0x1021
	cone_outer_gain = 0x1022
	max_distance = 0x1023
	sec_offset = 0x1024
	sample_offset = 0x1025
	byte_offset = 0x1026
}
```

Source property values

[[Return to contents]](#Contents)

## SourceState
```v
enum SourceState {
	initial = 0x1011
	playing = 0x1012
	paused = 0x1013
	stopped = 0x1014
	undetermined = 0x1015
}
```

Source state values

[[Return to contents]](#Contents)

## DistanceModel
```v
enum DistanceModel {
	inverse_distance
	inverse_distance_clamped
	linear_distance
	linear_ditance_clamped
	exponent_distance
	exponent_distance_clamped
}
```

Distance model formulae

[[Return to contents]](#Contents)

## Al
```v
enum Al {
	vendor = 0xB001
	version = 0xB002
	renderer = 0xB003
	extensions = 0xB004
}
```

Context values

[[Return to contents]](#Contents)

## Err
```v
struct Err {
mut:
	code int
}
```

Err defines an error code for a particular error

[[Return to contents]](#Contents)

## str
```v
fn (err &Err) str() string
```

str formats the error into a string

[[Return to contents]](#Contents)

## Source
```v
struct Source {
mut:
	id u32
}
```

Source wraps functionality around an OpenAL source

[[Return to contents]](#Contents)

## generate
```v
fn (mut s Source) generate() !
```

generate source

[[Return to contents]](#Contents)

## release
```v
fn (s Source) release() !
```

release source

[[Return to contents]](#Contents)

## get_id
```v
fn (s Source) get_id() u32
```

get_id returns the id of the source

[[Return to contents]](#Contents)

## is_valid
```v
fn (s Source) is_valid() bool
```

is_valid returns true if source is valid

[[Return to contents]](#Contents)

## attach_buffer
```v
fn (s Source) attach_buffer(b &Buffer) !
```

attach_buffer attaches the buffer to the source

[[Return to contents]](#Contents)

## detach_buffer
```v
fn (s Source) detach_buffer() !
```

detach_buffer detaches a buffer from the source

[[Return to contents]](#Contents)

## get_attached_buffer
```v
fn (s Source) get_attached_buffer() !int
```

get_attached_buffer returns the attached buffer

[[Return to contents]](#Contents)

## get_buffer_id
```v
fn (s Source) get_buffer_id() !int
```

get_buffer_id returns the buffer id linked to the source

[[Return to contents]](#Contents)

## set_relative
```v
fn (s Source) set_relative(rel bool) !
```

set_relative sets the source as relative to the listener

[[Return to contents]](#Contents)

## is_relative
```v
fn (s Source) is_relative() !bool
```

is_relative returns true if source position is relative to listener

[[Return to contents]](#Contents)

## get_type
```v
fn (s Source) get_type() !SourceType
```

get_type returns a source type

[[Return to contents]](#Contents)

## get_state
```v
fn (s Source) get_state() !SourceState
```

get_state returns a source state

[[Return to contents]](#Contents)

## get_offset_time
```v
fn (s Source) get_offset_time() !f32
```

get_offset_time returns the playback position offset in seconds

[[Return to contents]](#Contents)

## get_offset_sample
```v
fn (s Source) get_offset_sample() !f32
```

get_offset_sample returns the playback position offset in samples

[[Return to contents]](#Contents)

## get_offset_byte
```v
fn (s Source) get_offset_byte() !f32
```

get_offset_byte returns the playback position offset in byte

[[Return to contents]](#Contents)

## get_buffers_queued
```v
fn (s Source) get_buffers_queued() !int
```

get_buffers_queued returns the number of buffers queued in the source

[[Return to contents]](#Contents)

## get_buffers_processed
```v
fn (s Source) get_buffers_processed() !int
```

get_buffers_processed returns the number of buffers in the queue that have been processed

[[Return to contents]](#Contents)

## get_pitch
```v
fn (s Source) get_pitch() !f32
```

get_pitch retuns the pitch of the source

[[Return to contents]](#Contents)

## set_pitch
```v
fn (s Source) set_pitch(value f32) !
```

set_pitch sets the pitch of the source

[[Return to contents]](#Contents)

## get_gain
```v
fn (s Source) get_gain() !f32
```

get_gain returns the gain of the source

[[Return to contents]](#Contents)

## set_gain
```v
fn (s Source) set_gain(value f32) !
```

set_gain sets the gain of the source

[[Return to contents]](#Contents)

## get_gain_bounds
```v
fn (s Source) get_gain_bounds() !(f32, f32)
```

get_gain_bounds returns the min/max gain of the source

[[Return to contents]](#Contents)

## set_gain_bounds
```v
fn (s Source) set_gain_bounds(min f32, max f32) !
```

set_gain_bounds sets the min/max gain of the source

[[Return to contents]](#Contents)

## get_max_distance
```v
fn (s Source) get_max_distance() !f32
```

get_max_distance returns max distance of the source

[[Return to contents]](#Contents)

## set_max_distance
```v
fn (s Source) set_max_distance(value f32) !
```

set_max_distance sets the max distance of the source

[[Return to contents]](#Contents)

## get_rolloff
```v
fn (s Source) get_rolloff() !f32
```

get_rolloff returns the rolloff factor of the source

[[Return to contents]](#Contents)

## set_rolloff
```v
fn (s Source) set_rolloff(value f32) !
```

set_rolloff sets the rolloff factor of the source

[[Return to contents]](#Contents)

## get_cone_outer_gain
```v
fn (s Source) get_cone_outer_gain() !f32
```

get_cone_outer_gain returns the cone outer gain of the source

[[Return to contents]](#Contents)

## set_cone_outer_gain
```v
fn (s Source) set_cone_outer_gain(value f32) !
```

set_cone_outer_gain sets the cone outer gain of the source

[[Return to contents]](#Contents)

## get_cone_inner_angle
```v
fn (s Source) get_cone_inner_angle() !f32
```

get_cone_inner_angle returns the cone inner angle of the source

[[Return to contents]](#Contents)

## set_cone_inner_angle
```v
fn (s Source) set_cone_inner_angle(value f32) !
```

set_cone_inner_angle sets the cone inner angle of the source

[[Return to contents]](#Contents)

## get_cone_outer_angle
```v
fn (s Source) get_cone_outer_angle() !f32
```

get_cone_outer_angle returns the cone outer angle of the source

[[Return to contents]](#Contents)

## set_cone_outer_angle
```v
fn (s Source) set_cone_outer_angle(value f32) !
```

set_cone_outer_angle sets the cone outer angle of the source

[[Return to contents]](#Contents)

## get_reference_distance
```v
fn (s Source) get_reference_distance() !f32
```

get_reference_distance Get source reference distance

[[Return to contents]](#Contents)

## set_reference_distance
```v
fn (s Source) set_reference_distance(value f32) !
```

set_reference_distance sets the reference distance of the source

[[Return to contents]](#Contents)

## get_position
```v
fn (s Source) get_position() !(f32, f32, f32)
```

get_position returns the position of the source

[[Return to contents]](#Contents)

## set_position
```v
fn (s Source) set_position(v1 f32, v2 f32, v3 f32) !
```

set_position sets the position of the source

[[Return to contents]](#Contents)

## get_velocity
```v
fn (s Source) get_velocity() !(f32, f32, f32)
```

get_velocity returns the velocity of the source

[[Return to contents]](#Contents)

## set_velocity
```v
fn (s Source) set_velocity(v1 f32, v2 f32, v3 f32) !
```

set_velocity sets the velocity of the source

[[Return to contents]](#Contents)

## get_direction
```v
fn (s Source) get_direction() !(f32, f32, f32)
```

get_direction returns the direction of the source

[[Return to contents]](#Contents)

## set_direction
```v
fn (s Source) set_direction(v1 f32, v2 f32, v3 f32) !
```

set_direction sets the direction of the source

[[Return to contents]](#Contents)

## sourcef
```v
fn (s Source) sourcef(param int, value f32) !
```

sourcef sets a source parameter value as float

[[Return to contents]](#Contents)

## source3f
```v
fn (s Source) source3f(param int, v1 f32, v2 f32, v3 f32) !
```

source3f sets a source parameter value as vector of floats

[[Return to contents]](#Contents)

## sourcefv
```v
fn (s Source) sourcefv(param int, values []f32) !
```

sourcefv sets a source parameter value as vector of floats

[[Return to contents]](#Contents)

## sourcei
```v
fn (s Source) sourcei(param int, value int) !
```

sourcei sets a source parameter value as integer

[[Return to contents]](#Contents)

## source3i
```v
fn (s Source) source3i(param int, v1 int, v2 int, v3 int) !
```

source3i sets a source parameter value as vector of integers

[[Return to contents]](#Contents)

## sourceiv
```v
fn (s Source) sourceiv(param int, values []int) !
```

sourceiv sets a source parameter value as vector of integers

[[Return to contents]](#Contents)

## play
```v
fn (s Source) play() !
```

play the source

[[Return to contents]](#Contents)

## pause
```v
fn (s Source) pause() !
```

pause the source

[[Return to contents]](#Contents)

## stop
```v
fn (s Source) stop() !
```

stop the source

[[Return to contents]](#Contents)

## loop
```v
fn (s Source) loop(loop bool) !
```

loop sets source to a looping state

[[Return to contents]](#Contents)

## is_looping
```v
fn (s Source) is_looping() !bool
```

is_looping returns true if source is set to loop

[[Return to contents]](#Contents)

## rewind
```v
fn (s Source) rewind() !
```

rewind the source

[[Return to contents]](#Contents)

## queue_buffer
```v
fn (s Source) queue_buffer(b Buffer) !
```

queue_buffer adds a buffer into the source's queue

[[Return to contents]](#Contents)

## queue_buffers
```v
fn (s Source) queue_buffers(b []Buffer) !
```

queue_buffers adds buffers into the source's queue

[[Return to contents]](#Contents)

## unqueue_buffer
```v
fn (s Source) unqueue_buffer() !Buffer
```

unqueue_buffer removes a buffer fron the source's queue

[[Return to contents]](#Contents)

## unqueue_buffers
```v
fn (s Source) unqueue_buffers(size int) ![]Buffer
```

unqueue_buffers removes buffers from the source's queue

[[Return to contents]](#Contents)

## unqueue_all
```v
fn (s Source) unqueue_all() !
```


[[Return to contents]](#Contents)

## Listener
```v
struct Listener {
}
```

Listener wraps functionality around an OpenAL listener

[[Return to contents]](#Contents)

## get_gain
```v
fn (l Listener) get_gain() !f32
```

get_gain returns the gain of the listener

[[Return to contents]](#Contents)

## set_gain
```v
fn (l Listener) set_gain(value f32) !
```

set_gain sets the gain of the listener

[[Return to contents]](#Contents)

## get_position
```v
fn (l Listener) get_position() !(f32, f32, f32)
```

get_position returns the position of the listener

[[Return to contents]](#Contents)

## set_position
```v
fn (l Listener) set_position(x f32, y f32, z f32) !
```

set_position sets the position of the listener

[[Return to contents]](#Contents)

## get_velocity
```v
fn (l Listener) get_velocity() !(f32, f32, f32)
```

get_velocity returns the velocity of the listener

[[Return to contents]](#Contents)

## set_velocity
```v
fn (l Listener) set_velocity(x f32, y f32, z f32) !
```

set_velocity sets the velocity of the listener

[[Return to contents]](#Contents)

## get_orientation
```v
fn (l Listener) get_orientation() ![]f32
```

get_orientation returns the orientation of the listener

[[Return to contents]](#Contents)

## set_orientation
```v
fn (l Listener) set_orientation(value []f32) !
```

set_orientation sets the orientation of the listener

[[Return to contents]](#Contents)

## listenerf
```v
fn (l Listener) listenerf(param int, value f32) !
```

listenerf sets a listener parameter value as float

[[Return to contents]](#Contents)

## listener3f
```v
fn (l Listener) listener3f(param int, v1 f32, v2 f32, v3 f32) !
```

listener3f sets a listener parameter value as vector of floats

[[Return to contents]](#Contents)

## listenerfv
```v
fn (l Listener) listenerfv(param int, values []f32) !
```

listenefv sets a listener parameter value as vector of floats

[[Return to contents]](#Contents)

## listeneri
```v
fn (l Listener) listeneri(param int, value int) !
```

listeneri sets a listener parameter value as integer

[[Return to contents]](#Contents)

## listener3i
```v
fn (l Listener) listener3i(param int, v1 int, v2 int, v3 int) !
```

listener3i sets a listener parameter value as vector of integers

[[Return to contents]](#Contents)

## listeneriv
```v
fn (l Listener) listeneriv(param int, values []int) !
```

listeneriv sets a listener parameter value as vector of integers

[[Return to contents]](#Contents)

## get_listenerf
```v
fn (l Listener) get_listenerf(param int) !f32
```

get_listenerf returns a listener parameter value as float

[[Return to contents]](#Contents)

## get_listener3f
```v
fn (l Listener) get_listener3f(param int) !(f32, f32, f32)
```

get_listener3f returns a listener parameter value as vector of floats

[[Return to contents]](#Contents)

## get_listenerfv
```v
fn (l Listener) get_listenerfv(param int, size int) ![]f32
```

get_listenerfv returns a listener parameter value as vector of floats

[[Return to contents]](#Contents)

## get_listeneri
```v
fn (l Listener) get_listeneri(param int) !int
```

get_listeneri returns a listener parameter value as integer

[[Return to contents]](#Contents)

## get_listener3i
```v
fn (l Listener) get_listener3i(param int) !(int, int, int)
```

get_listener3i returns a listener parameter value as vector of integers

[[Return to contents]](#Contents)

## get_listeneriv
```v
fn (l Listener) get_listeneriv(param int, size int) ![]int
```

get_listeneriv returns a listener parameter value as vector of integers

[[Return to contents]](#Contents)

## Buffer
```v
struct Buffer {
mut:
	id u32
}
```

Buffer wraps the functionality of an OpenAL buffer

[[Return to contents]](#Contents)

## generate
```v
fn (mut b Buffer) generate() !
```

generate a buffer

[[Return to contents]](#Contents)

## release
```v
fn (b Buffer) release() !
```

release buffer

[[Return to contents]](#Contents)

## is_valid
```v
fn (b Buffer) is_valid() bool
```

is_valid validates Buffer

[[Return to contents]](#Contents)

## get_id
```v
fn (b Buffer) get_id() u32
```

get_id returns the id of the buffer

[[Return to contents]](#Contents)

## get_frequency
```v
fn (b Buffer) get_frequency() !int
```

get_frequency returns the frequency of the buffer

[[Return to contents]](#Contents)

## get_bits
```v
fn (b Buffer) get_bits() !int
```

get_bits returns the bits of the buffer

[[Return to contents]](#Contents)

## get_channels
```v
fn (b Buffer) get_channels() !int
```

get_channels returns the number channels of the buffer

[[Return to contents]](#Contents)

## get_size
```v
fn (b Buffer) get_size() !int
```

get_size returns the size of the buffer

[[Return to contents]](#Contents)

## set_unsigned_data
```v
fn (b Buffer) set_unsigned_data(format UnsignedBufferFormat, data []u8, frequency int) !
```

set_unsigned_data sets the buffer with unsigned raw data

[[Return to contents]](#Contents)

## set_signed_data
```v
fn (b Buffer) set_signed_data(format SignedBufferFormat, data []i16, frequency int) !
```

set_signed_data sets the buffer with signed raw data

[[Return to contents]](#Contents)

## bufferf
```v
fn (b Buffer) bufferf(param int, value f32) !
```

bufferf sets a buffer parameter value as float

[[Return to contents]](#Contents)

## buffer3f
```v
fn (b Buffer) buffer3f(param int, value1 f32, value2 f32, value3 f32) !
```

buffer3f sets a buffer parameter value as a tuple of floats

[[Return to contents]](#Contents)

## bufferfv
```v
fn (b Buffer) bufferfv(param int, values []f32) !
```

bufferfv sets a buffer parameter value as a vector of floats

[[Return to contents]](#Contents)

## bufferi
```v
fn (b Buffer) bufferi(param int, value int) !
```

bufferi sets a buffer parameter value as integer

[[Return to contents]](#Contents)

## buffer3i
```v
fn (b Buffer) buffer3i(param int, v1 int, v2 int, v3 int) !
```

buffer3i sets a buffer parameter value as a tuple of integers

[[Return to contents]](#Contents)

## bufferiv
```v
fn (b Buffer) bufferiv(param int, values []int) !
```

bufferiv sets a buffer parameter value as vector of integers

[[Return to contents]](#Contents)

## get_bufferf
```v
fn (b Buffer) get_bufferf(param int) !f32
```

get_bufferf returns a buffer parameter value as float

[[Return to contents]](#Contents)

## get_buffer3f
```v
fn (b Buffer) get_buffer3f(param int) !(f32, f32, f32)
```

get_buffer3f returns a buffer parameter value as a tuple of floats

[[Return to contents]](#Contents)

## get_bufferfv
```v
fn (b Buffer) get_bufferfv(param int, size int) ![]f32
```

get_bufferfv returns a buffer parameter value as vector of floats

[[Return to contents]](#Contents)

## get_bufferi
```v
fn (b Buffer) get_bufferi(param int) !int
```

get_bufferi returns a buffer parameter value as integer

[[Return to contents]](#Contents)

## get_buffer3i
```v
fn (b Buffer) get_buffer3i(param int) !(int, int, int)
```

get_buffer3i returns a buffer parameter value as a tuple of integers

[[Return to contents]](#Contents)

## get_bufferiv
```v
fn (b Buffer) get_bufferiv(param int, size int) ![]int
```

get_bufferiv returns a buffer parameter value as vector of integers

[[Return to contents]](#Contents)

#### Powered by vdoc. Generated on: 5 Nov 2022 15:17:13
