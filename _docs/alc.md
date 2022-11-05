# module alc




## Contents
- [Constants](#Constants)
- [check_error](#check_error)
- [version](#version)
- [get_all_devices](#get_all_devices)
- [get_all_extensions](#get_all_extensions)
- [get_current_context](#get_current_context)
- [remove_current_context](#remove_current_context)
- [create_capture_device](#create_capture_device)
- [create_context_from_data](#create_context_from_data)
- [create_context_from_device](#create_context_from_device)
- [create_device](#create_device)
- [create_device_from_data](#create_device_from_data)
- [get_all_capture_devices](#get_all_capture_devices)
- [Context](#Context)
  - [make_current](#make_current)
  - [process](#process)
  - [suspend](#suspend)
  - [destroy](#destroy)
  - [get_device](#get_device)
- [Err](#Err)
  - [str](#str)
- [CaptureDevice](#CaptureDevice)
  - [open_default](#open_default)
  - [open](#open)
  - [close](#close)
  - [get_device](#get_device)
  - [start](#start)
  - [stop](#stop)
  - [get_sample_count](#get_sample_count)
  - [samples](#samples)
  - [get_string](#get_string)
- [Device](#Device)
  - [open](#open)
  - [open_default](#open_default)
  - [close](#close)
  - [get_data](#get_data)
  - [is_extension_present](#is_extension_present)
  - [get_proc_addr](#get_proc_addr)
  - [get_enum_value](#get_enum_value)
  - [get_string](#get_string)
  - [get_integers](#get_integers)

## Constants
```v
const (
	alc_false = 0
	alc_true  = 1
)
```



[[Return to contents]](#Contents)

```v
const (
	alc_frequency      = 0x1007
	alc_refresh        = 0x1008
	alc_sync           = 0x1009
	alc_mono_sources   = 0x1010
	alc_stereo_sources = 0x1011
)
```

Context attribute

[[Return to contents]](#Contents)

```v
const (
	alc_no_error        = 0
	alc_invalid_device  = 0xA001
	alc_invalid_context = 0xA002
	alc_invalid_enum    = 0xA003
	alc_invalid_value   = 0xA004
	alc_out_of_memory   = 0xA005
)
```

AlcError error codes

[[Return to contents]](#Contents)

```v
const (
	alc_major_version = 0x1000
	alc_minor_version = 0x1001
)
```

Runtime ALC version

[[Return to contents]](#Contents)

```v
const (
	alc_attributes_size = 0x1002
	alc_all_attributes  = 0x1003
)
```

Context attribute list properties

[[Return to contents]](#Contents)

```v
const (
	alc_default_device_specifier = 0x1004
	alc_device_specifier         = 0x1005
	alc_extentions               = 0x1006
)
```

Device specifier

[[Return to contents]](#Contents)

```v
const (
	alc_ext_capture                      = 1
	alc_capture_device_specifier         = 0x310
	alc_capture_default_device_specifier = 0x311
	alc_capture_samples                  = 0x312
)
```

Capture extension

[[Return to contents]](#Contents)

```v
const (
	alc_enumerate_all_ext             = 1
	alc_default_all_devices_specifier = 0x1012
	alc_all_devices_specifier         = 0x1013
)
```

Enumerate extension

[[Return to contents]](#Contents)

```v
const default_device = ''
```


[[Return to contents]](#Contents)

## check_error
```v
fn check_error(d &Device) !
```

check_error checks and panics on errors

[[Return to contents]](#Contents)

## version
```v
fn version() semver.SemVer
```

version returns the ALC semantic version

[[Return to contents]](#Contents)

## get_all_devices
```v
fn get_all_devices() ![]string
```


[[Return to contents]](#Contents)

## get_all_extensions
```v
fn get_all_extensions() ![]string
```


[[Return to contents]](#Contents)

## get_current_context
```v
fn get_current_context() !&Context
```

get_current_context returns the current context

[[Return to contents]](#Contents)

## remove_current_context
```v
fn remove_current_context() bool
```

remove_current_context removes the current context

[[Return to contents]](#Contents)

## create_capture_device
```v
fn create_capture_device() &CaptureDevice
```

create_capture_device creates a new instance of CaptureDevice

[[Return to contents]](#Contents)

## create_context_from_data
```v
fn create_context_from_data(context &C.ALCcontext) !&Context
```

create_context_from_data creates an instance of Context from data

[[Return to contents]](#Contents)

## create_context_from_device
```v
fn create_context_from_device(d &Device) !&Context
```

create_context creates an instance of Context

[[Return to contents]](#Contents)

## create_device
```v
fn create_device() &Device
```

create_device creates an instance of Device

[[Return to contents]](#Contents)

## create_device_from_data
```v
fn create_device_from_data(data &C.ALCdevice) &Device
```

create_device_from_data creates an instance of Device from data

[[Return to contents]](#Contents)

## get_all_capture_devices
```v
fn get_all_capture_devices() ![]string
```


[[Return to contents]](#Contents)

## Context
```v
struct Context {
pub mut:
	data   &C.ALCcontext = &C.ALCcontext(0)
	device &Device       = &Device(0)
}
```

Context wraps functionality around OpenALC context

[[Return to contents]](#Contents)

## make_current
```v
fn (c &Context) make_current() !bool
```

make_current marks a context as current

[[Return to contents]](#Contents)

## process
```v
fn (c &Context) process() !
```

process context

[[Return to contents]](#Contents)

## suspend
```v
fn (c &Context) suspend() !
```

suspend context

[[Return to contents]](#Contents)

## destroy
```v
fn (c &Context) destroy() !
```

destroy context

[[Return to contents]](#Contents)

## get_device
```v
fn (c &Context) get_device() &Device
```

get_device returns device linked to context

[[Return to contents]](#Contents)

## Err
```v
struct Err {
pub mut:
	code int
}
```

Err defines a code for a particular error

[[Return to contents]](#Contents)

## str
```v
fn (err &Err) str() string
```

str formats the error into a string

[[Return to contents]](#Contents)

## CaptureDevice
```v
struct CaptureDevice {
mut:
	device &Device = &Device(0)
}
```

CaptureDevice wraps functionality around OpenALC capture device

[[Return to contents]](#Contents)

## open_default
```v
fn (mut c CaptureDevice) open_default(frequency u32, format al.BufferFormat, size int) !
```

open_default opens the default audio device

[[Return to contents]](#Contents)

## open
```v
fn (mut c CaptureDevice) open(name string, frequency u32, format al.BufferFormat, size int) !
```

open_device opens the capture device

[[Return to contents]](#Contents)

## close
```v
fn (c &CaptureDevice) close() !bool
```

close closes capture devce

[[Return to contents]](#Contents)

## get_device
```v
fn (c &CaptureDevice) get_device() &Device
```

get_device returns a reference to the underlying device

[[Return to contents]](#Contents)

## start
```v
fn (c &CaptureDevice) start() !
```

start capture

[[Return to contents]](#Contents)

## stop
```v
fn (c &CaptureDevice) stop() !
```

stop capture

[[Return to contents]](#Contents)

## get_sample_count
```v
fn (c &CaptureDevice) get_sample_count() !int
```


[[Return to contents]](#Contents)

## samples
```v
fn (c &CaptureDevice) samples(samples int) ![]u8
```

samples of the capture

[[Return to contents]](#Contents)

## get_string
```v
fn (c &CaptureDevice) get_string(param int) !string
```

get_string returns a device parameter as string

[[Return to contents]](#Contents)

## Device
```v
struct Device {
mut:
	data &C.ALCdevice = &C.ALCdevice(0)
}
```

Device wraps functionality around ALCdevice

[[Return to contents]](#Contents)

## open
```v
fn (mut d Device) open(name string) !
```

open audio device by name

[[Return to contents]](#Contents)

## open_default
```v
fn (mut d Device) open_default() !
```


[[Return to contents]](#Contents)

## close
```v
fn (d &Device) close() !bool
```

close device

[[Return to contents]](#Contents)

## get_data
```v
fn (d &Device) get_data() &C.ALCdevice
```

get_data returns data from the device

[[Return to contents]](#Contents)

## is_extension_present
```v
fn (d &Device) is_extension_present(name string) !bool
```

is_extension_present checks if a certain extension is present

[[Return to contents]](#Contents)

## get_proc_addr
```v
fn (d &Device) get_proc_addr(name string) !voidptr
```

get_proc_addr returns the process address

[[Return to contents]](#Contents)

## get_enum_value
```v
fn (d &Device) get_enum_value(name string) !int
```

get_enum_value returns an enumeration value

[[Return to contents]](#Contents)

## get_string
```v
fn (d &Device) get_string(param int) !string
```

get_string returns a device parameter as string

[[Return to contents]](#Contents)

## get_integers
```v
fn (d &Device) get_integers(param int, size int) ![]int
```

get_integers returns a device parameters as vector of strings

[[Return to contents]](#Contents)

#### Powered by vdoc. Generated on: 5 Nov 2022 15:17:13
