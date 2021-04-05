# vOpenAL

## Index

* [Description](#description)
* [Documentation](#documentation)
* [Install](#install)
* [Authors](#authors)
* [License](#license)
* [Usage](#usage)
    * [Import](#import)
    * [Device](#device)
    * [Context](#context)
    * [Buffer](#buffer)
    * [Source](#source)

#

## Description
OpenAL bindings for the V language.

## Documentation
Please follow the official [OpenAL guide](https://www.openal.org/documentation/OpenAL_Programmers_Guide.pdf)

## Install
`v install novuloj.vopenal`

## Authors
@duarteroso

## License
[2-clause BSD License](https://opensource.org/licenses/BSD-2-Clause)

## Usage

### Import

Start using vOpenAL by importing the modules

```v
import novuloj.vopanal.al
import novuloj.vopenal.alc
```

### Device

Open an ALC device before calling the rest of the API

```v
mut device := alc.new_device()
device.open_default()
```

Close it after you are done

```v
device.close()
```

### Context

Create an ALC context before calling the rest of the API

```v
mut context := alc.new_context()
context.create(device)
context.make_current()
```

Close it after you are done

```v
context.destroy()
```

### Buffer

You can generate a buffer or request a batch of buffers

```v
mut buffer := al.new_buffer()
buffer.generate()
// or
mut buffers := al.new_buffers(10)
for mut buffer in buffers {
    buffer.generate()
}
```

Release the buffer to free its resources

```v
buffer.release()
```

### Source

You can generate a source or request a batch of sources

```v
mut source := al.new_source()
source.generate()
// or
mut sources := al.new_sources(10)
for mut source in sources {
    source.generate()
}
```

Release the source to free its resources

```v
source.release()
```

A source needs to be associeted with a buffer which will contain the data to play

```v
mut buffer := al.new_buffer()
mut source := al.new_source()
// ...
source.link_to_buffer(buffer)
```