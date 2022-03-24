# Binary Player

## About
These programs plays binary files encoded with
[BinaryDecoder](https://github.com/MTsuyama-git/video_encoder) on
frame buffer.
- playBinary for traw files(noncompressed video binary)
- playJpeg   for tjpeg files(compressed video binary)
They were created for raspberry pi.

## Requirements
- linux5.0 with gcc and g++(clang/clang++ also can build these programs)
- libjpeg (for play Jpeg)
- LCD(480x320)

## Build
When the linux distribution run on your machine, you can build these
programs with arm-linux-gnueabi-gcc/g++.

### libjpeg
```
$ curl -o jpeg9e.tgz http://www.ijg.org/files/jpegsrc.v9e.tar.gz
$ tar xvzf jpeg9e.tgz
$ cd jpeg-9e
# please modify this line to adjust to your environment
$ ./configure --host=arm-linux-gnueabi --prefix=/path/to/libs/jpeg/9e
$ make -j 4
$ make install
```

### playBinary/playJpeg
```
# please modify this line to adjust to your environment
$ export PKG_CONFIG_PATH=/path/to/libs/jpeg/9e/lib/pkgconfig:${PKG_CONFIG_PATH}
$ make
```

## License
### libjpeg
This software is based in part on the work of the Independent JPEG Group.

