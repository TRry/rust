# thumbv7-apple-ios configuration
CFG_SDK_NAME_thumbv7-apple-ios = iphoneos
CFG_SDK_ARCHS_thumbv7-apple-ios = thumbv7
ifneq ($(findstring darwin,$(CFG_OSTYPE)),)
CFG_IOS_SDK = $(shell xcrun --show-sdk-path -sdk iphoneos 2>/dev/null)
CFG_IOS_FLAGS = -target thumbv7-apple-ios -isysroot $(CFG_IOS_SDK) -mios-version-min=7.0
CC_thumbv7-apple-ios = $(shell xcrun -find -sdk iphoneos clang)
CXX_thumbv7-apple-ios = $(shell xcrun -find -sdk iphoneos clang++)
CPP_thumbv7-apple-ios = $(shell xcrun -find -sdk iphoneos clang++)
AR_thumbv7-apple-ios = $(shell xcrun -find -sdk iphoneos ar)
endif
CFG_LIB_NAME_thumbv7-apple-ios = lib$(1).a
CFG_LIB_GLOB_thumbv7-apple-ios = lib$(1)-*.a
CFG_LIB_SKIP_INSTALL_thumbv7-apple-ios = 1 #lib$(1)-*.a
CFG_STATIC_LIB_NAME_thumbv7-apple-ios=lib$(1).a
CFG_LIB_DSYM_GLOB_thumbv7-apple-ios = lib$(1)-*.a.dSYM
CFG_JEMALLOC_CFLAGS_thumbv7-apple-ios := -arch armv7 -mfpu=vfp3 $(CFG_IOS_FLAGS)
CFG_GCCISH_CFLAGS_thumbv7-apple-ios := -Wall -Werror -g -fPIC $(CFG_IOS_FLAGS) -mfpu=vfp3 -arch armv7
CFG_GCCISH_CXXFLAGS_thumbv7-apple-ios := -fno-rtti $(CFG_IOS_FLAGS) -I$(CFG_IOS_SDK)/usr/include/c++/4.2.1
CFG_GCCISH_LINK_FLAGS_thumbv7-apple-ios := -lpthread -syslibroot $(CFG_IOS_SDK) -Wl,-no_compact_unwind
CFG_GCCISH_DEF_FLAG_thumbv7-apple-ios := -Wl,-exported_symbols_list,
CFG_GCCISH_PRE_LIB_FLAGS_thumbv7-apple-ios :=
CFG_GCCISH_POST_LIB_FLAGS_thumbv7-apple-ios :=
CFG_DEF_SUFFIX_thumbv7-apple-ios := .darwin.def
CFG_LLC_FLAGS_thumbv7-apple-ios := -mattr=+vfp3,+v7,+thumb2,+neon -march=arm
CFG_INSTALL_NAME_thumbv7-apple-ios = -Wl,-install_name,@rpath/$(1)
CFG_EXE_SUFFIX_thumbv7-apple-ios :=
CFG_WINDOWSY_thumbv7-apple-ios :=
CFG_UNIXY_thumbv7-apple-ios := 1
CFG_PATH_MUNGE_thumbv7-apple-ios := true
CFG_LDPATH_thumbv7-apple-ios :=
CFG_RUN_thumbv7-apple-ios = $(2)
CFG_RUN_TARG_thumbv7-apple-ios = $(call CFG_RUN_thumbv7-apple-ios,,$(2))
CFG_GNU_TRIPLE_thumbv7-apple-ios := thumbv7-apple-ios
