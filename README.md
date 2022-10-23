# OpenAL

## Description
OpenAL V bindings

## Documentation
Please follow the official [OpenAL guide](https://www.openal.org/documentation/OpenAL_Programmers_Guide.pdf)

## Install
`v install duarteroso.openal`

## Authors
@duarteroso

## License
[MIT](https://opensource.org/licenses/MIT)

## Index

- [Import](#import)
- [Device](#device)
- [Context](#context)
- [Buffer](#buffer)
- [Source](#source)

### Import

```v
import duarteroso.openal.al
import duarteroso.openal.alc
```

### Device

Open an ALC device before calling the rest of the API

```v
mut device := alc.create_device()
device.open(alc.default_device)
```

Close it after you are done

```v
device.close()
```

### Context

Create an ALC context before calling the rest of the API

```v
mut context := alc.create_context()
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
mut buffer := al.create_buffer()
buffer.generate()
// or
mut buffers := al.create_buffers(10)
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
mut source := al.create_source()
source.generate()
// or
mut sources := al.create_sources(10)
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
mut buffer := al.create_buffer()
mut source := al.create_source()
// ...
source.link_to_buffer(buffer)
```