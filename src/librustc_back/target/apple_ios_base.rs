// Copyright 2014 The Rust Project Developers. See the COPYRIGHT
// file at the top-level directory of this distribution and at
// http://rust-lang.org/COPYRIGHT.
//
// Licensed under the Apache License, Version 2.0 <LICENSE-APACHE or
// http://www.apache.org/licenses/LICENSE-2.0> or the MIT license
// <LICENSE-MIT or http://opensource.org/licenses/MIT>, at your
// option. This file may not be copied, modified, or distributed
// except according to those terms.

use std::io::Command;
use target::TargetOptions;

pub fn get_sdk_root(sdk_name: &str) -> String {
    let mut child = match Command::new("xcrun")
                                  .arg("--show-sdk-path")
                                  .arg("-sdk")
                                  .arg(sdk_name)
                                  .spawn() {
        Ok(child) => child,
        Err(e) => panic!("failed to get {} SDK path: {}", sdk_name, e),
    };

    child.stdout.as_mut().unwrap()
         .read_to_string().unwrap().as_slice()
         .trim()
         .to_string()
}

fn pre_link_args(arch: &str, sdk_name: &str) -> Vec<String> {
    vec!["-arch".to_string(), arch.to_string(),
         "-Wl,-syslibroot".to_string(), get_sdk_root(sdk_name)]
}

pub fn opts(arch: &str, sdk_name: &str) -> TargetOptions {
    TargetOptions {
        dynamic_linking: false,
        executables: true,
        // Although there is an experimental implementation of LLVM which
        // supports SS on armv7 it wasn't approved by Apple, see:
        // http://lists.cs.uiuc.edu/pipermail/llvm-commits/Week-of-Mon-20140505/216350.html
        // It looks like it might be never accepted to upstream LLVM.
        morestack: false,
        pre_link_args: pre_link_args(arch, sdk_name),
        .. super::apple_base::opts()
    }
}
