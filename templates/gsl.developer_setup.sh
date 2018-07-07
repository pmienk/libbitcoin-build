.template 0
###############################################################################
# Copyright (c) 2014-2016 libbitcoin developers (see COPYING).
#
# GSL generate developer_setup.sh.
#
# This is a code generator built using the iMatix GSL code generation
# language. See https://github.com/imatix/gsl for details.
###############################################################################
# Functions
###############################################################################

# General repository query functions.
function test_perform_sync()
    return "($BUILD_MODE == \"sync\")"
endfunction

function test_perform_configure()
    return "($BUILD_MODE == \"sync\") || ($BUILD_MODE == \"configure\")"
endfunction

function test_perform_build()
    return "true"
endfunction

function test_produce_boost()
    return "($BUILD_TARGET == \"all\") || ($BUILD_TARGET == \"boost\") || ($BUILD_TARGET == \"dependencies\")"
endfunction

function test_produce_dependencies()
    return "($BUILD_TARGET == \"all\") || ($BUILD_TARGET == \"dependencies\")"
endfunction

function test_produce_project()
    return "($BUILD_TARGET == \"all\") || ($BUILD_TARGET == \"project\")"
endfunction

function have_build(install, name)
    define my.install = have_build.install
    return defined(my.install->build(starts_with(build.name, my.name)))
endfunction

function is_archive_match(build, name)
    define my.build = is_archive_match.build
    trace1("is_archive_match($(my.name)) : $(my.build.name)")
    return defined(my.build.version) & (my.build.name = my.name)
endfunction

function get_archive_version(install, name)
    trace1("get_archive_version($(my.name))")
    define my.install = get_archive_version.install
    define my.build = my.install->build(is_archive_match(build, my.name))?
    return defined(my.build) ?? my.build.version
endfunction

# Functions with specific knowledge of ICU archive file name and URL structure.

function get_icu_file(install)
    define my.install = get_icu_file.install
    define my.version = get_archive_version(my.install, "icu")?
    if (!defined(my.version))
        trace1("get_icu_file:get_archive_version() = []")
        return
    endif
    define my.underscore_version = string.convch(my.version, ".", "_")
    return "icu4c-$(my.underscore_version)-src.tgz"
endfunction

function get_icu_url(install)
    trace1("get_icu_url()")
    define my.install = get_icu_url.install
    define my.version = get_archive_version(my.install, "icu")?
    if (!defined(my.version))
        trace1("get_icu_url:get_archive_version() = []")
        return
    endif
    define my.archive = get_icu_file(my.install)?
    if (!defined(my.archive))
        trace1("get_icu_url:get_icu_file() = []")
        return
    endif
    define my.base_url = "http\://download.icu-project.org/files/icu4c"
    define my.url = "$(my.base_url)/$(my.version)/$(my.archive)"
    trace1("get_icu_url = $(my.url)")
    return my.url
endfunction

# Functions with specific knowledge of ZLib archive file name and URL structure.

function get_zlib_file(install)
    define my.install = get_zlib_file.install
    define my.version = get_archive_version(my.install, "zlib")?
    if (!defined(my.version))
        trace1("get_zlib_file:get_archive_version() = []")
        return
    endif
    return "v$(my.version).tar.gz"
endfunction

function get_zlib_url(install)
    trace1("get_zlib_url()")
    define my.install = get_zlib_url.install
    define my.version = get_archive_version(my.install, "zlib")?
    if (!defined(my.version))
        trace1("get_zlib_url:get_archive_version() = []")
        return
    endif
    define my.archive = get_zlib_file(my.install)?
    if (!defined(my.archive))
        trace1("get_zlib_url:get_zlib_file() = []")
        return
    endif
    define my.base_url = "https\://github.com/madler/zlib/archive"
    define my.url = "$(my.base_url)/$(my.archive)"
    trace1("get_zlib_url = $(my.url)")
    return my.url
endfunction

# Functions with specific knowledge of PNG archive file name and URL structure.

function get_png_file(install)
    define my.install = get_png_file.install
    define my.version = get_archive_version(my.install, "png")?
    if (!defined(my.version))
        trace1("get_png_file:get_archive_version() = []")
        return
    endif
    return "libpng-$(my.version).tar.xz"
endfunction

function get_png_url(install)
    trace1("get_png_url()")
    define my.install = get_png_url.install
    define my.version = get_archive_version(my.install, "png")?
    if (!defined(my.version))
        trace1("get_png_url:get_archive_version() = []")
        return
    endif
    define my.archive = get_png_file(my.install)?
    if (!defined(my.archive))
        trace1("get_png_url:get_png_file() = []")
        return
    endif
    define my.base_url = "http://downloads.sourceforge.net/project/libpng/libpng16/older-releases"
    define my.url = "$(my.base_url)/$(my.version)/$(my.archive)"
    trace1("get_png_url = $(my.url)")
    return my.url
endfunction

# Functions with specific knowledge of QREncode archive file name and URL structure.

function get_qrencode_file(install)
    define my.install = get_qrencode_file.install
    define my.version = get_archive_version(my.install, "qrencode")?
    if (!defined(my.version))
        trace1("get_qrencode_file:get_archive_version() = []")
        return
    endif
    define my.underscore_version = string.convch(my.version, ".", "_")
    return "qrencode-$(my.version).tar.bz2"
endfunction

function get_qrencode_url(install)
    trace1("get_qrencode_url()")
    define my.install = get_qrencode_url.install
    define my.version = get_archive_version(my.install, "qrencode")?
    if (!defined(my.version))
        trace1("get_qrencode_url:get_archive_version() = []")
        return
    endif
    define my.archive = get_qrencode_file(my.install)?
    if (!defined(my.archive))
        trace1("get_qrencode_url:get_qrencode_file() = []")
        return
    endif
    define my.base_url = "http\://fukuchi.org/works/qrencode"
    define my.url = "$(my.base_url)/$(my.archive)"
    trace1("get_qrencode_url = $(my.url)")
    return my.url
endfunction

# Functions with specific knowledge of ZMQ archive file name and URL structure.

function get_zmq_file(install)
    define my.install = get_zmq_file.install
    define my.version = get_archive_version(my.install, "zmq")?
    if (!defined(my.version))
        trace1("get_zmq_file:get_archive_version() = []")
        return
    endif
    return "zeromq-$(my.version).tar.gz"
endfunction

function get_zmq_url(install)
    trace1("get_zmq_url()")
    define my.install = get_zmq_url.install
    define my.version = get_archive_version(my.install, "zmq")?
    if (!defined(my.version))
        trace1("get_zmq_url:get_archive_version() = []")
        return
    endif
    define my.archive = get_zmq_file(my.install)?
    if (!defined(my.archive))
        trace1("get_zmq_url:get_zmq_file() = []")
        return
    endif
    define my.base_url = "https\://github.com/zeromq/libzmq/releases/download"
    define my.url = "$(my.base_url)/v$(my.version)/$(my.archive)"
    trace1("get_zmq_url = $(my.url)")
    return my.url
endfunction

# Functions with specific knowledge of Boost archive file name and URL structure.

function get_boost_file(install)
    define my.install = get_boost_file.install
    define my.version = get_archive_version(my.install, "boost")?
    if (!defined(my.version))
        trace1("get_boost_file:get_archive_version() = []")
        return
    endif
    define my.underscore_version = string.convch(my.version, ".", "_")
    return "boost_$(my.underscore_version).tar.bz2"
endfunction

function get_boost_url(install)
    trace1("get_boost_url()")
    define my.install = get_boost_url.install
    define my.version = get_archive_version(my.install, "boost")?
    if (!defined(my.version))
        trace1("get_boost_url:get_archive_version()) = []")
        return
    endif
    define my.archive = get_boost_file(my.install)?
    if (!defined(my.archive))
        trace1("get_boost_url:get_boost_file() = []")
        return
    endif
    define my.base_url = "http\://downloads.sourceforge.net/project/boost/boost"
    define my.url = "$(my.base_url)/$(my.version)/$(my.archive)"
    trace1("get_boost_url = $(my.url)")
    return my.url
endfunction

###############################################################################
# Macros
###############################################################################
.endtemplate
.template 1
.
.macro define_script_help(repository)
.   define my.repo = define_script_help.repository
display_script_help()
{
    display_message "Usage: ./developer_script.sh [OPTION]..."
    display_message "Manage the installation of $(my.repository.name)."
    display_message "Script options:"
.   if (!(my.repo.name = "libbitcoin-consensus"))
    display_message "  --with-icu               Compile with International Components for Unicode."
    display_message "                             Since the addition of BIP-39 and later BIP-38 "
    display_message "                             support, libbitcoin conditionally incorporates ICU "
    display_message "                              to provide BIP-38 and BIP-39 passphrase "
    display_message "                             normalization features. Currently "
    display_message "                             libbitcoin-explorer is the only other library that "
    display_message "                             accesses this feature, so if you do not intend to "
    display_message "                             use passphrase normalization this dependency can "
    display_message "                             be avoided."
    display_message "  --with-qrencode          Compile with QR Code Support"
    display_message "                             Since the addition of qrcode support, libbitcoin "
    display_message "                             conditionally incorporates qrencode. Currently "
    display_message "                             libbitcoin-explorer is the only other library that "
    display_message "                             accesses this feature, so if you do not intend to "
    display_message "                             use qrcode this dependency can be avoided."
    display_message "  --with-png               Compile with QR Code PNG Output Support"
    display_message "                             Since the addition of png support, libbitcoin "
    display_message "                             conditionally incorporates libpng (which in turn "
    display_message "                             requires zlib). Currently libbitcoin-explorer is "
    display_message "                             the only other library that accesses this feature, "
    display_message "                             so if you do not intend to use png this dependency "
    display_message "                             can be avoided."
.   endif
.   if (have_build(my.repo->install, "icu"))
    display_message "  --build-icu              Builds ICU libraries."
.   endif
.   if (have_build(my.repo->install, "zlib"))
    display_message "  --build-zlib             Builds ZLib libraries."
.   endif
.   if (have_build(my.repo->install, "png"))
    display_message "  --build-png              Builds PNG libraries."
.   endif
.   if (have_build(my.repo->install, "qrencode"))
    display_message "  --build-qrencode         Builds QREncode libraries."
.   endif
.   if (have_build(my.repo->install, "boost"))
    display_message "  --build-boost            Builds Boost libraries."
.   endif
.   if (have_build(my.repo->install, "zmq"))
    display_message "  --build-zmq              Build ZeroMQ libraries."
.   endif
    display_message "  --build-mode=<value>     Specifies minimum action to be taken."
    display_message "                             Valid values: { sync, configure, build }."
    display_message "                             Defaults to 'unknown', must be declared."
    display_message "  --build-target=<value>   Specifies the targets to be acted upon."
    display_message "                             Valid values: { all, boost, dependencies, project }."
    display_message "                             Defaults to 'unknown', must be declared."
    display_message "  --build-src-dir=<path>   Location of downloaded and intermediate files."
    display_message "                             Has no default, required."
    display_message "  --build-obj-dir=<path>   Location of intermediate object files."
    display_message "                             Has no default, required."
    # display_message "  --prefix=<absolute-path> Library install location (defaults to /usr/local)."
    display_message "  --prefix=<absolute-path> Library install location."
    display_message "                             Has no default, required."
    display_message "  --disable-shared         Disables shared library builds."
    display_message "  --disable-static         Disables static library builds."
    display_message "  --sync-only              Restrict actions to syncing necessary targets."
    display_message "  --help                   Display usage, overriding script execution."
    display_message ""
    display_message "All unrecognized options provided shall be passed as configuration options for "
    display_message "all dependencies."
}
.endmacro # define_script_help
.
.macro documentation(repository)
.   define my.repo = documentation.repository
# Script to build and install $(my.repo.name).
#
# Script options:
.   if (!(my.repo.name = "libbitcoin-consensus"))
# --with-icu               Compile with International Components for Unicode.
#                            Since the addition of BIP-39 and later BIP-38
#                            support, libbitcoin conditionally incorporates ICU
#                             to provide BIP-38 and BIP-39 passphrase
#                            normalization features. Currently
#                            libbitcoin-explorer is the only other library that
#                            accesses this feature, so if you do not intend to
#                            use passphrase normalization this dependency can
#                            be avoided.
# --with-qrencode          Compile with QR Code Support
#                            Since the addition of qrcode support, libbitcoin
#                            conditionally incorporates qrencode. Currently
#                            libbitcoin-explorer is the only other library that
#                            accesses this feature, so if you do not intend to
#                            use qrcode this dependency can be avoided.
# --with-png               Compile with QR Code PNG Output Support
#                            Since the addition of png support, libbitcoin
#                            conditionally incorporates libpng (which in turn
#                            requires zlib). Currently libbitcoin-explorer is
#                            the only other library that accesses this feature,
#                            so if you do not intend to use png this dependency
#                            can be avoided.
.   endif
.   if (have_build(my.repo->install, "icu"))
# --build-icu              Builds ICU libraries.
.   endif
.   if (have_build(my.repo->install, "zlib"))
# --build-zlib             Builds ZLib libraries.
.   endif
.   if (have_build(my.repo->install, "png"))
# --build-png              Builds PNG libraries.
.   endif
.   if (have_build(my.repo->install, "qrencode"))
# --build-qrencode         Builds QREncode libraries.
.   endif
.   if (have_build(my.repo->install, "boost"))
# --build-boost            Builds Boost libraries.
.   endif
.   if (have_build(my.repo->install, "zmq"))
# --build-zmq              Builds ZeroMQ libraries.
.   endif
# --build-mode=<value>     Specifies minimum action to be taken."
#                            Valid values: { sync, configure, build }."
# --build-target=<value>   Specifies the targets to be acted upon."
#                            Valid values: { all, boost, dependencies, project }."
# --build-mode=<value>     Specifies minimum action to be taken (sync, configure, build).
# --build-target=<value>   Specifies the targets to be acted upon (all, boost, dependencies, project).
# --build-src-dir=<path>   Location of downloaded and intermediate files.
# --build-obj-dir=<path>   Location of intermediate object files.
# --prefix=<absolute-path> Library install location (defaults to /usr/local).
# --disable-shared         Disables shared library builds.
# --disable-static         Disables static library builds.
# --sync-only              Restrict actions to syncing necessary targets.
# --help                   Display usage, overriding script execution.
#
# Verified on Ubuntu 14.04, requires gcc-4.8 or newer.
# Verified on OSX 10.10, using MacPorts and Homebrew repositories, requires
# Apple LLVM version 6.0 (clang-600.0.54) (based on LLVM 3.5svn) or newer.
# This script does not like spaces in the --prefix or --build-dir, sorry.
# Values (e.g. yes|no) in the '--disable-<linkage>' options are not supported.
# All command line options are passed to 'configure' of each repo, with
# the exception of the --build-<item> options, which are for the script only.
# Depending on the caller's permission to the --prefix or --build-dir
# directory, the script may need to be sudo'd.
.endmacro # documentation
.
.macro define_build_directory(repository)
.   heading2("The default source directory.")
BUILD_SRC_DIR=""

.   heading2("The default objects directory.")
BUILD_OBJ_DIR=""

.   heading2("The default build mode (sync, configure, build).")
BUILD_MODE="unknown"

.   heading2("The default build target (all, boost, dependencies, project).")
BUILD_TARGET="unknown"

.
.endmacro # define_build_directory
.
.macro define_icu(install)
.   define my.install = define_icu.install
.   define my.url = get_icu_url(my.install)?
.   if (!defined(my.url))
.       #abort "A version of icu is not defined."
.       return
.   endif
.   heading2("ICU archive.")
ICU_URL="$(my.url)"
ICU_ARCHIVE="$(get_icu_file(my.install))"

.endmacro # define_icu
.
.macro define_zlib(install)
.   define my.install = define_zlib.install
.   define my.url = get_zlib_url(my.install)?
.   if (!defined(my.url))
.       #abort "A version of zlib is not defined."
.       return
.   endif
.   heading2("ZLib archive.")
ZLIB_URL="$(my.url)"
ZLIB_ARCHIVE="$(get_zlib_file(my.install))"

.endmacro # define_zlib
.
.macro define_png(install)
.   define my.install = define_png.install
.   define my.url = get_png_url(my.install)?
.   if (!defined(my.url))
.       #abort "A version of png is not defined."
.       return
.   endif
.   heading2("PNG archive.")
PNG_URL="$(my.url)"
PNG_ARCHIVE="$(get_png_file(my.install))"

.endmacro # define_png
.
.macro define_qrencode(install)
.   define my.install = define_qrencode.install
.   define my.url = get_qrencode_url(my.install)?
.   if (!defined(my.url))
.       #abort "A version of qrencode is not defined."
.       return
.   endif
.   heading2("QREncode archive.")
QRENCODE_URL="$(my.url)"
QRENCODE_ARCHIVE="$(get_qrencode_file(my.install))"

.endmacro # define_qrencode
.
.macro define_zmq(install)
.   define my.install = define_zmq.install
.   define my.url = get_zmq_url(my.install)?
.   if (!defined(my.url))
.       #abort "A version of ZMQ is not defined."
.       return
.   endif
.   heading2("ZMQ archive.")
ZMQ_URL="$(my.url)"
ZMQ_ARCHIVE="$(get_zmq_file(my.install))"

.endmacro # define_zmq
.
.macro define_boost(install)
.   define my.install = define_boost.install
.   define my.url = get_boost_url(my.install)?
.   if (!defined(my.url))
.       #abort "A version of boost is not defined."
.       return
.   endif
.   heading2("Boost archive.")
BOOST_URL="$(my.url)"
BOOST_ARCHIVE="$(get_boost_file(my.install))"

.endmacro # define_boost
.
.macro define_initialize()
.   heading2("Exit this script on the first build error.")
set -e

.   heading2("Parse command line options that are handled by this script.")
for OPTION in "$@"; do
    case $OPTION in
        # Custom build options (in the form of --build-<option>).
        (--build-icu)           BUILD_ICU="yes";;
        (--build-zlib)          BUILD_ZLIB="yes";;
        (--build-png)           BUILD_PNG="yes";;
        (--build-qrencode)      BUILD_QRENCODE="yes";;
        (--build-zmq)           BUILD_ZMQ="yes";;
        (--build-boost)         BUILD_BOOST="yes";;
        (--build-src-dir=*)     BUILD_SRC_DIR="${OPTION#*=}";;
        (--build-obj-dir=*)     BUILD_OBJ_DIR="${OPTION#*=}";;

        # Standard build options.
        (--prefix=*)            PREFIX="${OPTION#*=}";;
        (--disable-shared)      DISABLE_SHARED="yes";;
        (--disable-static)      DISABLE_STATIC="yes";;
        (--with-icu)            WITH_ICU="yes";;
        (--with-png)            WITH_PNG="yes";;
        (--with-qrencode)       WITH_QRENCODE="yes";;

        # Standard script options.
        (--build-mode=*)        BUILD_MODE="${OPTION#*=}";;
        (--build-target=*)      BUILD_TARGET="${OPTION#*=}";;
        (--sync-only)           SYNC_ONLY="yes";;
        (--help)                DISPLAY_HELP="yes";;
    esac
done

if [[ $DISPLAY_HELP ]]; then
    display_script_help
    exit 0
fi

.   heading2("Configure build parallelism.")
SEQUENTIAL=1
OS=`uname -s`
if [[ $PARALLEL ]]; then
    display_message "Using shell-defined PARALLEL value."
elif [[ $OS == Linux ]]; then
    PARALLEL=`nproc`
elif [[ ($OS == Darwin) || ($OS == OpenBSD) ]]; then
    PARALLEL=`sysctl -n hw.ncpu`
else
    display_error "Unsupported system: $OS"
    display_error ""
    display_script_help
    exit 1
fi

.   heading2("Define operating system specific settings.")
if [[ $OS == Darwin ]]; then
    export CC="clang"
    export CXX="clang++"
    STDLIB="c++"
elif [[ $OS == OpenBSD ]]; then
    make() { gmake "$@"; }
    export CC="egcc"
    export CXX="eg++"
    STDLIB="estdc++"
else # Linux
    STDLIB="stdc++"
fi

.   heading2("Link to appropriate standard library in non-default scnearios.")
if [[ ($OS == Linux && $CC == "clang") || ($OS == OpenBSD) ]]; then
    export LDLIBS="-l$STDLIB $LDLIBS"
    export CXXFLAGS="-stdlib=lib$STDLIB $CXXFLAGS"
fi

.   heading2("Normalize of static and shared options.")
if [[ $DISABLE_SHARED ]]; then
    CONFIGURE_OPTIONS=("$@" "--enable-static")
elif [[ $DISABLE_STATIC ]]; then
    CONFIGURE_OPTIONS=("$@" "--enable-shared")
else
    CONFIGURE_OPTIONS=("$@" "--enable-shared")
    CONFIGURE_OPTIONS=("$@" "--enable-static")
fi

.   heading2("Normalize --build-mode value.")
if [[ ($BUILD_MODE != "sync") && ($BUILD_MODE != "configure") && ($BUILD_MODE != "build") ]]; then
    display_error "Unsupported build-mode: $BUILD_MODE"
    display_error "Supported values are: sync, configure, build"
    display_error ""
    display_script_help
    exit 1
fi

.   heading2("Normalize --build-target value.")
if [[ ($BUILD_TARGET != "all") && ($BUILD_TARGET != "boost") && ($BUILD_TARGET != "dependencies") && ($BUILD_TARGET != "project") ]]; then
    display_error "Unsupported build-target: $BUILD_TARGET"
    display_error "Supported values are: all, boost, dependencies, project"
    display_error ""
    display_script_help
    exit 1
fi

.   heading2("Require source directory declaration.")
if [[ !($BUILD_SRC_DIR) ]]; then
    display_error "Missing build-src-dir required."
    display_error ""
    display_script_help
    exit 1
fi

.   heading2("Require object directory declaration.")
if [[ !($BUILD_OBJ_DIR) ]]; then
    display_error "Missing build-obj-dir required."
    display_error ""
    display_script_help
    exit 1
fi

.   heading2("Purge custom build options so they don't break configure.")
CONFIGURE_OPTIONS=("${CONFIGURE_OPTIONS[@]/--build-*/}")
CONFIGURE_OPTIONS=("${CONFIGURE_OPTIONS[@]/--sync-only/}")

.   heading2("Always set a prefix (required on OSX and for lib detection).")
if [[ !($PREFIX) ]]; then
#    PREFIX="/usr/local"
#    CONFIGURE_OPTIONS=( "${CONFIGURE_OPTIONS[@]}" "--prefix=$PREFIX")
    display_error "Missing prefix required."
    display_error ""
    display_script_help
    exit 1
else
    # Incorporate the custom libdir into each object, for runtime resolution.
    export LD_RUN_PATH="$PREFIX/lib"
fi

.   heading2("Incorporate the prefix.")
# Set the prefix-based package config directory.
PREFIX_PKG_CONFIG_DIR="$PREFIX/lib/pkgconfig"

# Prioritize prefix package config in PKG_CONFIG_PATH search path.
export PKG_CONFIG_PATH="$PREFIX_PKG_CONFIG_DIR:$PKG_CONFIG_PATH"

# Set a package config save path that can be passed via our builds.
with_pkgconfigdir="--with-pkgconfigdir=$PREFIX_PKG_CONFIG_DIR"

if [[ $BUILD_BOOST ]]; then
    # Boost has no pkg-config, m4 searches in the following order:
    # --with-boost=<path>, /usr, /usr/local, /opt, /opt/local, $BOOST_ROOT.
    # We use --with-boost to prioritize the --prefix path when we build it.
    # Otherwise standard paths suffice for Linux, Homebrew and MacPorts.
    # ax_boost_base.m4 appends /include and adds to BOOST_CPPFLAGS
    # ax_boost_base.m4 searches for /lib /lib64 and adds to BOOST_LDFLAGS
    with_boost="--with-boost=$PREFIX"
fi

.   heading2("Echo generated values.")
display_message "Libbitcoin installer configuration."
display_message "--------------------------------------------------------------------"
display_message "OS                    : $OS"
display_message "PARALLEL              : $PARALLEL"
display_message "CC                    : $CC"
display_message "CXX                   : $CXX"
display_message "CPPFLAGS              : $CPPFLAGS"
display_message "CFLAGS                : $CFLAGS"
display_message "CXXFLAGS              : $CXXFLAGS"
display_message "LDFLAGS               : $LDFLAGS"
display_message "LDLIBS                : $LDLIBS"
display_message "WITH_ICU              : $WITH_ICU"
display_message "WITH_PNG              : $WITH_PNG"
display_message "WITH_QRENCODE         : $WITH_QRENCODE"
display_message "BUILD_ICU             : $BUILD_ICU"
display_message "BUILD_ZLIB            : $BUILD_ZLIB"
display_message "BUILD_PNG             : $BUILD_PNG"
display_message "BUILD_QRENCODE        : $BUILD_QRENCODE"
display_message "BUILD_ZMQ             : $BUILD_ZMQ"
display_message "BUILD_BOOST           : $BUILD_BOOST"
display_message "PREFIX                : $PREFIX"
display_message "BUILD_SRC_DIR         : $BUILD_SRC_DIR"
display_message "BUILD_OBJ_DIR         : $BUILD_OBJ_DIR"
display_message "BUILD_MODE            : $BUILD_MODE"
display_message "BUILD_TARGET          : $BUILD_TARGET"
display_message "SYNC_ONLY             : $SYNC_ONLY"
display_message "DISABLE_SHARED        : $DISABLE_SHARED"
display_message "DISABLE_STATIC        : $DISABLE_STATIC"
display_message "with_boost            : ${with_boost}"
display_message "with_pkgconfigdir     : ${with_pkgconfigdir}"
display_message "--------------------------------------------------------------------"

.endmacro # define_initialize
.
.macro define_build_options(build)
.   define my.build = define_build_options.build
.   heading2("Define $(my.build.name) options.")
$(my.build.name:upper,c)_OPTIONS=(
.   for my.build.option as _option
"$(_option.value)"$(last() ?? ")" ? " \\")
.   endfor _option

.endmacro # define_build_options
.
.macro define_utility_functions()
.
configure_links()
{
    # Configure dynamic linker run-time bindings when installing to system.
    if [[ ($OS == Linux) && ($PREFIX == "/usr/local") ]]; then
        ldconfig
    fi
}

configure_options()
{
    local PROJ_CONFIG_DIR=$1
    shift

    display_message "configure options:"
    for OPTION in "$@"; do
        if [[ $OPTION ]]; then
            display_message $OPTION
        fi
    done

    if [[ -f "Makefile" ]]; then
        if [[ $(test_perform_configure()) ]]; then
            display_message "Reconfiguring $PROJ_CONFIG_DIR..."
            $PROJ_CONFIG_DIR/configure "$@"
        else
            display_message "Reusing configuration for $PROJ_CONFIG_DIR..."
        fi
    else
        display_message "Configuring $PROJ_CONFIG_DIR..."
        $PROJ_CONFIG_DIR/configure "$@"
    fi
}

create_directory()
{
    local DIRECTORY="$1"

    if [[ -d "$DIRECTORY" ]]; then
        if [[ $(test_perform_sync()) ]]; then
            display_message "Reinitializing directory $DIRECTORY..."
            rm -rf "$DIRECTORY"
            mkdir "$DIRECTORY"
        else
            display_message "Reusing directory $DIRECTORY..."
        fi
    else
        display_message "Initializing directory $DIRECTORY..."
        mkdir "$DIRECTORY"
    fi
}

push_obj_directory()
{
    local PROJ_NAME="$1"
    shift

    push_directory $BUILD_OBJ_DIR
    create_directory $PROJ_NAME
    push_directory $PROJ_NAME
}

pop_obj_directory()
{
    pop_directory
    pop_directory
}

display_heading_message()
{
    echo
    echo "********************** $@ **********************"
    echo
}

display_message()
{
    echo "$@"
}

display_error()
{
    >&2 echo "$@"
}

initialize_git()
{
    display_heading_message "Initialize git"

    # Initialize git repository at the root of the current directory.
    git init
    git config user.name anonymous
}

# make_project_directory jobs [configure_options]
make_project_directory()
{
    local PROJ_NAME=$1
    local JOBS=$2
    local TEST=$3
    shift 3

    push_directory "$PROJ_NAME"
    local PROJ_CONFIG_DIR=\$(pwd)

    if [[ -f "$PROJ_NAME/configure" ]]; then
        if [[ BUILD_MODE != "reuse" ]]; then
            # reconfigure using autoreconf
            autoreconf -i
        fi
    else
        # boostrap configuration
        ./autogen.sh
    fi

    push_obj_directory "$PROJ_NAME"
    configure_options "$PROJ_CONFIG_DIR" "$@"
    make_jobs $JOBS

    if [[ $TEST == true ]]; then
        make_tests $JOBS
    fi

    make install
    configure_links
    pop_obj_directory
    pop_directory
}

# make_jobs jobs [make_options]
make_jobs()
{
    local JOBS=$1
    shift 1

    if [[ $(test_perform_build()) ]]; then
        display_message "BUILD_MODE=rebuild triggered 'make clean'..."
        make clean
    fi

    # Avoid setting -j1 (causes problems on Travis).
    if [[ $JOBS > $SEQUENTIAL ]]; then
        make -j$JOBS "$@"
    else
        make "$@"
    fi
}

# make_tests jobs
make_tests()
{
    local JOBS=$1

    # Disable exit on error.
    set +e

    # Build and run unit tests relative to the primary directory.
    # VERBOSE=1 ensures test runner output sent to console (gcc).
    make_jobs $JOBS check "VERBOSE=1"
    local RESULT=$?

    # Test runners emit to the test.log file.
    if [[ -e "test.log" ]]; then
        cat "test.log"
    fi

    if [[ $RESULT -ne 0 ]]; then
        exit $RESULT
    fi

    # Reenable exit on error.
    set -e
}

pop_directory()
{
    popd >/dev/null
}

push_directory()
{
    local DIRECTORY="$1"

    pushd "$DIRECTORY" >/dev/null
}

.endmacro # define_utility_functions
.
.macro define_build_functions()
.

extract_from_tarball()
{
    local TARGET_DIR=$1
    local URL=$2
    local ARCHIVE=$3
    local COMPRESSION=$4

    create_directory "$TARGET_DIR"
    push_directory "$TARGET_DIR"

    # Extract the source locally.
    wget --output-document $ARCHIVE $URL
    tar --extract --file $ARCHIVE --$COMPRESSION --strip-components=1

    pop_directory
}

unpack_from_tarball()
{
    local ARCHIVE=$1
    local URL=$2
    local COMPRESSION=$3
    local BUILD=$4

    display_heading_message "Prepairing to aquire $ARCHIVE"

    if [[ !($BUILD) ]]; then
        display_message "Skipping unpack of $ARCHIVE..."
        return
    fi

    local TARGET_DIR="build-$ARCHIVE"

    if [[ -d "$TARGET_DIR" ]]; then
        if [[ $(test_perform_sync()) ]]; then
            display_message "Re-downloading $ARCHIVE..."
            rm -rf "$TARGET_DIR"
            extract_from_tarball "$TARGET_DIR" "$URL" "$ARCHIVE" "$COMPRESSION"
        else
            display_message "Reusing existing archive $ARCHIVE..."
        fi
    else
        display_message "Downloading $ARCHIVE..."
        extract_from_tarball "$TARGET_DIR" "$URL" "$ARCHIVE" "$COMPRESSION"
    fi
}

clone_from_github()
{
    local FORK=$1
    local BRANCH=$2

    # Clone the repository locally.
    git clone --branch $BRANCH "https://github.com/$FORK"
}

create_from_github()
{
    push_directory "$BUILD_SRC_DIR"

    local ACCOUNT=$1
    local REPO=$2
    local BRANCH=$3

    FORK="$ACCOUNT/$REPO"

    display_heading_message "Prepairing to aquire $FORK/$BRANCH"

    if [[ -d "$REPO" ]]; then
        if [[ $(test_perform_sync()) ]]; then
            display_message "Re-cloning $FORK/$BRANCH..."
            rm -rf "$REPO"
            clone_from_github "$FORK" "$BRANCH"
        else
            display_message "Reusing existing clone of $FORK, Branch may not match $BRANCH..."
        fi
    else
        display_message "Cloning $FORK/$BRANCH..."
        clone_from_github "$FORK" "$BRANCH"
    fi

    pop_directory
}

# Because PKG_CONFIG_PATH doesn't get updated by Homebrew or MacPorts.
initialize_icu_packages()
{
    if [[ ($OS == Darwin) ]]; then
        # Update PKG_CONFIG_PATH for ICU package installations on OSX.
        # OSX provides libicucore.dylib with no pkgconfig and doesn't support
        # renaming or important features, so we can't use that.
        local HOMEBREW_ICU_PKG_CONFIG="/usr/local/opt/icu4c/lib/pkgconfig"
        local MACPORTS_ICU_PKG_CONFIG="/opt/local/lib/pkgconfig"

        if [[ -d "$HOMEBREW_ICU_PKG_CONFIG" ]]; then
            export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:$HOMEBREW_ICU_PKG_CONFIG"
        elif [[ -d "$MACPORTS_ICU_PKG_CONFIG" ]]; then
            export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:$MACPORTS_ICU_PKG_CONFIG"
        fi
    fi
}

# Because ZLIB doesn't actually parse its --disable-shared option.
# Because ZLIB doesn't follow GNU recommentation for unknown arguments.
patch_zlib_configuration()
{
    sed -i.tmp "s/leave 1/shift/" configure
    sed -i.tmp "s/--static/--static | --disable-shared/" configure
    sed -i.tmp "/unknown option/d" configure
    sed -i.tmp "/help for help/d" configure

    # display_message "Hack: ZLIB configuration options modified."
}

# Because ZLIB can't build shared only.
clean_zlib_build()
{
    if [[ $DISABLE_STATIC ]]; then
        rm --force "$PREFIX/lib/libz.a"
    fi
}

# Standard build from tarball.
build_from_tarball()
{
    local ARCHIVE=$1
    local PUSH_DIR=$2
    local JOBS=$3
    local BUILD=$4
    local OPTIONS=$5
    shift 5

    # For some platforms we need to set ICU pkg-config path.
    # TODO: clean this up?
    if [[ !($BUILD) ]]; then
        if [[ $ARCHIVE == $ICU_ARCHIVE ]]; then
            display_heading_message "Prepairing to build $ARCHIVE"
            initialize_icu_packages
        fi
        return
    fi

    display_heading_message "Prepairing to build $ARCHIVE"

    # Because libpng doesn't actually use pkg-config to locate zlib.
    # Because ICU tools don't know how to locate internal dependencies.
    if [[ ($ARCHIVE == $ICU_ARCHIVE) || ($ARCHIVE == $PNG_ARCHIVE) ]]; then
        local SAVE_LDFLAGS=$LDFLAGS
        export LDFLAGS="-L$PREFIX/lib $LDFLAGS"
    fi

    # Because libpng doesn't actually use pkg-config to locate zlib.h.
    if [[ ($ARCHIVE == $PNG_ARCHIVE) ]]; then
        local SAVE_CPPFLAGS=$CPPFLAGS
        export CPPFLAGS="-I$PREFIX/include $CPPFLAGS"
    fi

    local TARGET="build-$ARCHIVE"
    push_directory "$TARGET"
    push_directory "$PUSH_DIR"
    local PROJ_CONFIG_DIR=\$(pwd)

    # Enable static only zlib build.
    if [[ $ARCHIVE == $ZLIB_ARCHIVE ]]; then
        patch_zlib_configuration
    fi

    # Join generated and command line options.
    local CONFIGURATION=("${OPTIONS[@]}" "$@")

    push_obj_directory "$TARGET"
    configure_options "$PROJ_CONFIG_DIR" "${CONFIGURATION[@]}"
    make_jobs $JOBS --silent
    make install
    configure_links

    # Enable shared only zlib build.
    if [[ $ARCHIVE == $ZLIB_ARCHIVE ]]; then
        clean_zlib_build
    fi

    pop_obj_directory
    pop_directory
    pop_directory

    # Restore flags to prevent side effects.
    export LDFLAGS=$SAVE_LDFLAGS
    export CPPFLAGS=$SAVE_LCPPFLAGS
}

# Because boost ICU detection assumes in incorrect ICU path.
circumvent_boost_icu_detection()
{
    # Boost expects a directory structure for ICU which is incorrect.
    # Boost ICU discovery fails when using prefix, can't fix with -sICU_LINK,
    # so we rewrite the two 'has_icu_test.cpp' files to always return success.

    local SUCCESS="int main() { return 0; }"
    local REGEX_TEST="libs/regex/build/has_icu_test.cpp"
    local LOCALE_TEST="libs/locale/build/has_icu_test.cpp"

    echo $SUCCESS > $REGEX_TEST
    echo $SUCCESS > $LOCALE_TEST

    # display_message "Hack: ICU detection modified, will always indicate found."
}

# Because boost doesn't support autoconfig and doesn't like empty settings.
initialize_boost_configuration()
{
    if [[ $DISABLE_STATIC ]]; then
        BOOST_LINK="shared"
    elif [[ $DISABLE_SHARED ]]; then
        BOOST_LINK="static"
    else
        BOOST_LINK="static,shared"
    fi

    if [[ $CC ]]; then
        BOOST_TOOLSET="toolset=$CC"
    fi

    if [[ ($OS == Linux && $CC == "clang") || ($OS == OpenBSD) ]]; then
        STDLIB_FLAG="-stdlib=lib$STDLIB"
        BOOST_CXXFLAGS="cxxflags=$STDLIB_FLAG"
        BOOST_LINKFLAGS="linkflags=$STDLIB_FLAG"
    fi
}

# Because boost doesn't use pkg-config.
initialize_boost_icu_configuration()
{
    BOOST_ICU_ICONV="on"
    BOOST_ICU_POSIX="on"

    if [[ $WITH_ICU ]]; then
        circumvent_boost_icu_detection

        # Restrict other locale options when compiling boost with icu.
        BOOST_ICU_ICONV="off"
        BOOST_ICU_POSIX="off"

        # Extract ICU libs from package config variables and augment with -ldl.
        ICU_LIBS=( `pkg-config icu-i18n --libs` "-ldl" )

        # This is a hack for boost m4 scripts that fail with ICU dependency.
        # See custom edits in ax-boost-locale.m4 and ax_boost_regex.m4.
        export BOOST_ICU_LIBS="${ICU_LIBS[@]}"

        # Extract ICU prefix directory from package config variable.
        ICU_PREFIX=`pkg-config icu-i18n --variable=prefix`
    fi
}

# Because boost doesn't use autoconfig.
build_from_tarball_boost()
{
    local ARCHIVE=$1
    local JOBS=$2
    local BUILD=$3
    shift 3

    if [[ !($BUILD) ]]; then
        return
    fi

    display_heading_message "Prepairing to build $ARCHIVE"

    local TARGET="build-$ARCHIVE"

    push_directory "$TARGET"

    initialize_boost_configuration
    initialize_boost_icu_configuration

    display_message "Libbitcoin boost configuration."
    display_message "--------------------------------------------------------------------"
    display_message "variant               : release"
    display_message "threading             : multi"
    display_message "toolset               : $CC"
    display_message "cxxflags              : $STDLIB_FLAG"
    display_message "linkflags             : $STDLIB_FLAG"
    display_message "link                  : $BOOST_LINK"
    display_message "boost.locale.iconv    : $BOOST_ICU_ICONV"
    display_message "boost.locale.posix    : $BOOST_ICU_POSIX"
    display_message "-sNO_BZIP2            : 1"
    display_message "-sICU_PATH            : $ICU_PREFIX"
    display_message "-sICU_LINK            : ${ICU_LIBS[@]}"
    display_message "-sZLIB_LIBPATH        : $PREFIX/lib"
    display_message "-sZLIB_INCLUDE        : $PREFIX/include"
    display_message "-j                    : $JOBS"
    display_message "-d0                   : [supress informational messages]"
    display_message "-q                    : [stop at the first error]"
    display_message "--reconfigure         : [ignore cached configuration]"
    display_message "--prefix              : $PREFIX"
    display_message "BOOST_OPTIONS         : $@"
    display_message "--------------------------------------------------------------------"

    # boost_iostreams
    # The zlib options prevent boost linkage to system libs in the case where
    # we have built zlib in a prefix dir. Disabling zlib in boost is broken in
    # all versions (through 1.60). https://svn.boost.org/trac/boost/ticket/9156
    # The bzip2 auto-detection is not implemented, but disabling it works.

    ./bootstrap.sh \\
        "--prefix=$PREFIX" \\
        "--with-icu=$ICU_PREFIX"

    ./b2 install \\
        "variant=release" \\
        "threading=multi" \\
        "$BOOST_TOOLSET" \\
        "$BOOST_CXXFLAGS" \\
        "$BOOST_LINKFLAGS" \\
        "link=$BOOST_LINK" \\
        "boost.locale.iconv=$BOOST_ICU_ICONV" \\
        "boost.locale.posix=$BOOST_ICU_POSIX" \\
        "-sNO_BZIP2=1" \\
        "-sICU_PATH=$ICU_PREFIX" \\
        "-sICU_LINK=${ICU_LIBS[@]}" \\
        "-sZLIB_LIBPATH=$PREFIX/lib" \\
        "-sZLIB_INCLUDE=$PREFIX/include" \\
        "-j $JOBS" \\
        "-d0" \\
        "-q" \\
        "--reconfigure" \\
        "--prefix=$PREFIX" \\
        "$@"

    pop_directory
}

# Standard build from github.
build_from_github()
{
    local REPO=$1
    local JOBS=$2
    local TEST=$3
    local OPTIONS=$4
    shift 4

    # Join generated and command line options.
    local CONFIGURATION=("${OPTIONS[@]}" "$@")

  display_heading_message "Prepairing to build $REPO"

    # Build the local repository clone.
    make_project_directory "$REPO" $JOBS $TEST "${CONFIGURATION[@]}"
}

initialize_object_directory()
{
    display_heading_message "Initialize object directory"

    if [[ -d "$BUILD_OBJ_DIR" ]]; then
        if [[ $(test_perform_configure()) ]]; then
            display_message "Reinitializing $BUILD_OBJ_DIR..."
            rm -rf "$BUILD_OBJ_DIR"
        else
            display_message "Skipping reinitialization of $BUILD_OBJ_DIR..."
        fi
    else
        display_message "Initializing $BUILD_OBJ_DIR..."
    fi

    create_directory "$BUILD_OBJ_DIR"
}
.endmacro # define_build_functions
.
.macro unpack_from_tarball_icu(prefix)
$(my.prefix)unpack_from_tarball $ICU_ARCHIVE $ICU_URL gzip "$BUILD_ICU"
.endmacro # unpack_from_tarball_icu
.
.macro build_from_tarball_icu(prefix)
$(my.prefix)build_from_tarball $ICU_ARCHIVE source $PARALLEL "$BUILD_ICU" "${ICU_OPTIONS[@]}" "$@"
.endmacro # build_from_tarball_icu
.
.macro unpack_from_tarball_zlib(prefix)
$(my.prefix)unpack_from_tarball $ZLIB_ARCHIVE $ZLIB_URL gzip "$BUILD_ZLIB"
.endmacro # unpack_from_tarball_zlib
.
.macro build_from_tarball_zlib(prefix)
$(my.prefix)build_from_tarball $ZLIB_ARCHIVE . $PARALLEL "$BUILD_ZLIB" "${ZLIB_OPTIONS[@]}" "$@"
.endmacro # build_from_tarball_zlib
.
.macro unpack_from_tarball_png(prefix)
$(my.prefix)unpack_from_tarball $PNG_ARCHIVE $PNG_URL xz "$BUILD_PNG"
.endmacro # unpack_from_tarball_png
.
.macro build_from_tarball_png(prefix)
$(my.prefix)build_from_tarball $PNG_ARCHIVE . $PARALLEL "$BUILD_PNG" "${PNG_OPTIONS[@]}" "$@"
.endmacro # build_from_tarball_png
.
.macro unpack_from_tarball_qrencode(prefix)
$(my.prefix)unpack_from_tarball $QRENCODE_ARCHIVE $QRENCODE_URL bzip2 "$BUILD_QRENCODE"
.endmacro # unpack_from_tarball_qrencode
.
.macro build_from_tarball_qrencode(prefix)
$(my.prefix)build_from_tarball $QRENCODE_ARCHIVE . $PARALLEL "$BUILD_QRENCODE" "${QRENCODE_OPTIONS[@]}" "$@"
.endmacro # build_from_tarball_qrencode
.
.macro unpack_from_tarball_zmq(prefix)
$(my.prefix)unpack_from_tarball $ZMQ_ARCHIVE $ZMQ_URL gzip "$BUILD_ZMQ"
.endmacro # unpack_from_tarball_zmq
.
.macro build_from_tarball_zmq(prefix)
$(my.prefix)build_from_tarball $ZMQ_ARCHIVE . $PARALLEL "$BUILD_ZMQ" "${ZMQ_OPTIONS[@]}" "$@"
.endmacro # build_from_tarball_zmq
.
.macro unpack_boost(prefix)
$(my.prefix)unpack_from_tarball $BOOST_ARCHIVE $BOOST_URL bzip2 "$BUILD_BOOST"
.endmacro # unpack_boost
.

.macro build_boost(prefix)
$(my.prefix)build_from_tarball_boost $BOOST_ARCHIVE $PARALLEL "$BUILD_BOOST" "${BOOST_OPTIONS[@]}"
.endmacro # build_boost
.
.macro create_github(build, prefix)
.   define my.build = create_github.build
$(my.prefix)create_from_github $(my.build.github) $(my.build.repository) $(my.build.branch)
.endmacro # create_github
.
.macro build_github(build, prefix)
.   define my.build = build_github.build
.   define my.parallel = is_true(my.build.parallel) ?? "$PARALLEL" ? "$SEQUENTIAL"
.   define my.options = "${$(my.build.name:upper,c)_OPTIONS[@]}"
$(my.prefix)build_from_github $(my.build.repository) $(my.parallel) false $(my.options) "$@"
.endmacro # build_github_test
.
.macro build_github_test(build, prefix)
.   define my.build = build_github_test.build
.   define my.parallel = is_true(my.build.parallel) ?? "$PARALLEL" ? "$SEQUENTIAL"
.   define my.options = "${$(my.build.name:upper,c)_OPTIONS[@]}"
$(my.prefix)build_from_github $(my.build.repository) $(my.parallel) true $(my.options) "$@"
.endmacro # build_github_test
.
.macro define_create_local_copies(install)
.   define my.install = define_create_local_copies.install
.   define my.prefix = "        "
create_local_copies()
{
    display_heading_message "Create local copies of required libraries"
.   for my.install.build as _build
.       # Unique by build.name
.       if !defined(my.build_$(_build.name:c))
.           define my.build_$(_build.name:c) = 0
.
.           if (is_icu_build(_build))
    if [[ $(test_produce_dependencies()) ]]; then
.               unpack_from_tarball_icu(my.prefix)
    fi
.           elsif (is_zlib_build(_build))
    if [[ $(test_produce_dependencies()) ]]; then
.               unpack_from_tarball_zlib(my.prefix)
    fi
.           elsif (is_png_build(_build))
    if [[ $(test_produce_dependencies()) ]]; then
.               unpack_from_tarball_png(my.prefix)
    fi
.           elsif (is_qrencode_build(_build))
    if [[ $(test_produce_dependencies()) ]]; then
.               unpack_from_tarball_qrencode(my.prefix)
    fi
.           elsif (is_zmq_build(_build))
    if [[ $(test_produce_dependencies()) ]]; then
.               unpack_from_tarball_zmq(my.prefix)
    fi
.           elsif (is_boost_build(_build))
    if [[ $(test_produce_boost()) ]]; then
.               unpack_boost(my.prefix)
    fi
.           elsif (is_github_build(_build))
.               if (!last())
    if [[ $(test_produce_dependencies()) ]]; then
.               else
    if [[ $(test_produce_project()) ]]; then
.               endif
.               create_github(_build, my.prefix)
    fi
.           else
.               abort "Invalid build type: $(_build.name)."
.           endif
.
.       endif
.   endfor _build
}

.endmacro # define_create_local_copies
.
.macro define_build_local_copies(install)
.   define my.install = define_build_local_copies.install
.   define my.prefix = "        "
build_local_copies()
{
    display_heading_message "Build local copies of required libraries"
.   for my.install.build as _build
.       # Unique by build.name
.       if !defined(my.build_$(_build.name:c))
.           define my.build_$(_build.name:c) = 0
.
.           if (is_icu_build(_build))
    if [[ $(test_produce_dependencies()) ]]; then
.               build_from_tarball_icu(my.prefix)
    fi
.           elsif (is_zlib_build(_build))
    if [[ $(test_produce_dependencies()) ]]; then
.               build_from_tarball_zlib(my.prefix)
    fi
.           elsif (is_png_build(_build))
    if [[ $(test_produce_dependencies()) ]]; then
.               build_from_tarball_png(my.prefix)
    fi
.           elsif (is_qrencode_build(_build))
    if [[ $(test_produce_dependencies()) ]]; then
.               build_from_tarball_qrencode(my.prefix)
    fi
.           elsif (is_zmq_build(_build))
    if [[ $(test_produce_dependencies()) ]]; then
.               build_from_tarball_zmq(my.prefix)
    fi
.           elsif (is_boost_build(_build))
    if [[ $(test_produce_boost()) ]]; then
.               build_boost(my.prefix)
    fi
.           elsif (is_github_build(_build))
.               if (!last())
    if [[ $(test_produce_dependencies()) ]]; then
.                   build_github(_build, my.prefix)
    fi
.               else
    if [[ $(test_produce_project()) ]]; then
.                   build_github_test(_build, my.prefix)
    fi
.               endif
.           else
.               abort "Invalid build type: $(_build.name)."
.           endif
.       endif
.   endfor _build
}

.endmacro # define_build_local_copies
.
.macro define_invoke()
push_directory "$BUILD_SRC_DIR"
initialize_git
initialize_object_directory
create_local_copies
if [[ $SYNC_ONLY ]]; then
    display_message "Skipping build due to --sync-only."
else
    time build_local_copies "${CONFIGURE_OPTIONS[@]}"
fi
pop_directory
.endmacro # define_invoke
.
.endtemplate
.template 0
###############################################################################
# Generation
###############################################################################
function generate_setup(path_prefix)
for generate.repository by name as _repository
    require(_repository, "repository", "name")
    my.output_path = join(my.path_prefix, _repository.name)
    create_directory(my.output_path)
    define my.out_file = "$(my.output_path)/developer_setup.sh"
    notify(my.out_file)
    output(my.out_file)

    shebang("bash")
    define my.install = _repository->install
    copyleft(_repository.name)
    documentation(_repository)

    heading1("Define constants.")
    define_build_directory(_repository)
    define_icu(my.install)
    define_zlib(my.install)
    define_png(my.install)
    define_qrencode(my.install)
    define_zmq(my.install)
    define_boost(my.install)

    heading1("Define utility functions.")
    define_utility_functions()
    define_script_help(_repository)

    heading1("Initialize the build environment.")
    define_initialize()

    heading1("Define build options.")
    for my.install.build as _build where count(_build.option) > 0
         define_build_options(_build)
    endfor _build

    heading1("Define build functions.")
    define_build_functions()

    heading1("The master download/clone/sync function.")
    define_create_local_copies(my.install)

    heading1("The master build function.")
    define_build_local_copies(my.install)

    heading1("Build the primary library and all dependencies.")
    define_invoke()

    close
endfor _repository
endfunction # generate_setup
.endtemplate
.template 0
###############################################################################
# Execution
###############################################################################
[global].root = ".."
[global].trace = 0
[gsl].ignorecase = 0

# Note: expected context root libbitcoin-build directory
gsl from "library/math.gsl"
gsl from "library/string.gsl"
gsl from "library/collections.gsl"
gsl from "utilities.gsl"

generate_setup("output")

.endtemplate
