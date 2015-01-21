# iOS related notes

* iOS support [was merged](https://github.com/mozilla/rust/commit/2ec323e4c30c265f35314c0a77f5df5a655cec2f)
 into `master`. The only problem is that since it is not tested on
 Mozilla's internal buildbots, building from `master` might be
 broken. This branch is automatically tested to be 100% compilable
 even if means to lag a bit behind `master`.
* Should work out of box both for device and simulator
* Segmented stacks are currently disabled. It also means there is no
  prevention from stack overflow
* Unwinding works

## Obtaining

### Pre-built binary

  Is available in Releases section, [direct link](https://github.com/vhbit/rust/releases/download/ios-latest/rust-0.13.0-dev-x86_64-apple-darwin.tar.gz), it is kind of experimental now, will be updated daily. Unpack and install as usual Rust nightly.

    curl -O https://github.com/vhbit/rust/releases/download/ios-latest/rustc-1.0.0-dev-x86_64-apple-darwin.tar.gz
    tar xzf rustc-1.0.0-dev-x86_64-apple-darwin.tar.gz
    cd rustc-1.0.0-dev-x86_64-apple-darwin
    ./install.sh

### Building from source

    git clone git@github.com:vhbit/rust.git
    git checkout ios
    mkdir build
    cd build
    ../configure --target=armv7-apple-ios,armv7s-apple-ios,aarch64-apple-ios,i386-apple-ios,x86_64-apple-ios
    make -j4
    make install

## Using

Once you've got a cross-compiler, you have to provide same targets to rustc binary, i.e.

    $ rustc --target=armv7-apple-ios hello.rs

Supported architectures are: `armv7-apple-ios`, `armv7s-apple-ios`, `aarch64-apple-ios`, `i386-apple-ios`, `x86_64-apple-ios`.

You can check how it works on [ObjCrust sample project](https://github.com/vhbit/ObjCrust). It also has an example of how to setup `make` for building fat libraries and incorporate Rust build into Xcode build process through `Script Phase` (`cargo` support is planned but unfortunately there is [a bug](https://github.com/rust-lang/cargo/issues/442) which makes it impossible to use so far).

# The Rust Programming Language

This is a compiler for Rust, including standard libraries, tools and
documentation.

## Quick Start

1. Download a [binary installer][installer] for your platform.
2. Read [The Rust Programming Language][trpl].
3. Enjoy!

> ***Note:*** Windows users can read the detailed
> [using Rust on Windows][win-wiki] notes on the wiki.

[installer]: http://www.rust-lang.org/install.html
[trpl]: http://doc.rust-lang.org/book/index.html
[win-wiki]: https://github.com/rust-lang/rust/wiki/Using-Rust-on-Windows

## Building from Source

1. Make sure you have installed the dependencies:
    * `g++` 4.7 or `clang++` 3.x
    * `python` 2.6 or later (but not 3.x)
    * GNU `make` 3.81 or later
    * `curl`
    * `git`
2. Download and build Rust:

    You can either download a [tarball] or build directly from the [repo].

    To build from the [tarball] do:

        $ curl -O https://static.rust-lang.org/dist/rust-nightly.tar.gz
        $ tar -xzf rust-nightly.tar.gz
        $ cd rust-nightly

    Or to build from the [repo] do:

        $ git clone https://github.com/rust-lang/rust.git
        $ cd rust

    Now that you have Rust's source code, you can configure and build it:

        $ ./configure
        $ make && make install

    > ***Note:*** You may need to use `sudo make install` if you do not normally have
    > permission to modify the destination directory. The install locations can
    > be adjusted by passing a `--prefix` argument to `configure`. Various other
    > options are also supported, pass `--help` for more information on them.

    When complete, `make install` will place several programs into
    `/usr/local/bin`: `rustc`, the Rust compiler, and `rustdoc`, the
    API-documentation tool.
3. Read [The Rust Programming Language][trpl].
4. Enjoy!

### Building on Windows

To easily build on windows we can use [MSYS2](http://msys2.github.io/):

1. Grab the latest MSYS2 installer and go through the installer.
2. Now from the MSYS2 terminal we want to install the mingw64 toolchain and the other
   tools we need.

```bash
# choose one based on platform
$ pacman -S mingw-w64-i686-toolchain
$ pacman -S mingw-w64-x86_64-toolchain

$ pacman -S base-devel
```

3. With that now start `mingw32_shell.bat` or `mingw64_shell.bat`
   from where you installed MSYS2 (i.e. `C:\msys`). Which one you
   choose depends on if you want 32 or 64 bit Rust.
4. From there just navigate to where you have Rust's source code, configure and build it:

        $ ./configure
        $ make && make install

[repo]: https://github.com/rust-lang/rust
[tarball]: https://static.rust-lang.org/dist/rust-nightly.tar.gz
[trpl]: http://doc.rust-lang.org/book/index.html

## Notes

Since the Rust compiler is written in Rust, it must be built by a
precompiled "snapshot" version of itself (made in an earlier state of
development). As such, source builds require a connection to the Internet, to
fetch snapshots, and an OS that can execute the available snapshot binaries.

Snapshot binaries are currently built and tested on several platforms:

* Windows (7, 8, Server 2008 R2), x86 and x86-64 (64-bit support added in Rust 0.12.0)
* Linux (2.6.18 or later, various distributions), x86 and x86-64
* OSX 10.7 (Lion) or greater, x86 and x86-64

You may find that other platforms work, but these are our officially
supported build environments that are most likely to work.

Rust currently needs about 1.5 GiB of RAM to build without swapping; if it hits
swap, it will take a very long time to build.

There is a lot more documentation in the [wiki].

[wiki]: https://github.com/rust-lang/rust/wiki

## Getting help and getting involved

The Rust community congregates in a few places:

* [StackOverflow] - Get help here.
* [/r/rust] - General discussion.
* [discuss.rust-lang.org] - For development of the Rust language itself.

[StackOverflow]: http://stackoverflow.com/questions/tagged/rust
[/r/rust]: http://reddit.com/r/rust
[discuss.rust-lang.org]: http://discuss.rust-lang.org/

## License

Rust is primarily distributed under the terms of both the MIT license
and the Apache License (Version 2.0), with portions covered by various
BSD-like licenses.

See LICENSE-APACHE, LICENSE-MIT, and COPYRIGHT for details.
