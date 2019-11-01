###############################################################################
#  Copyright (c) 2014-2019 libbitcoin-server developers (see COPYING).
#
#         GENERATED SOURCE CODE, DO NOT EDIT EXCEPT EXPERIMENTALLY
#
###############################################################################
# FindBitcoin-Server
#
# Use this module by invoking find_package with the form::
#
#   find_package( Bitcoin-Server
#     [version]              # Minimum version
#     [REQUIRED]             # Fail with error if bitcoin-server is not found
#   )
#
#   Defines the following for use:
#
#   bitcoin_server_FOUND                    - true if headers and requested libraries were found
#   bitcoin_server_INCLUDE_DIRS             - include directories for bitcoin-server libraries
#   bitcoin_server_LIBRARY_DIRS             - link directories for bitcoin-server libraries
#   bitcoin_server_LIBRARIES                - bitcoin-server libraries to be linked
#   bitcoin_server_PKG                      - bitcoin-server pkg-config package specification.
#

if (MSVC)
    if ( Bitcoin-Server_FIND_REQUIRED )
        set( _bitcoin_server_MSG_STATUS "SEND_ERROR" )
    else ()
        set( _bitcoin_server_MSG_STATUS "STATUS" )
    endif()

    set( bitcoin_server_FOUND false )
    message( ${_bitcoin_server_MSG_STATUS} "MSVC environment detection for 'bitcoin-server' not currently supported." )
else ()
    # required
    if ( Bitcoin-Server_FIND_REQUIRED )
        set( _bitcoin_server_REQUIRED "REQUIRED" )
    endif()

    # quiet
    if ( Bitcoin-Server_FIND_QUIETLY )
        set( _bitcoin_server_QUIET "QUIET" )
    endif()

    # modulespec
    if ( Bitcoin-Server_FIND_VERSION_COUNT EQUAL 0 )
        set( _bitcoin_server_MODULE_SPEC "libbitcoin-server" )
    else ()
        if ( Bitcoin-Server_FIND_VERSION_EXACT )
            set( _bitcoin_server_MODULE_SPEC_OP "=" )
        else ()
            set( _bitcoin_server_MODULE_SPEC_OP ">=" )
        endif()

        set( _bitcoin_server_MODULE_SPEC "libbitcoin-server ${_bitcoin_server_MODULE_SPEC_OP} ${Bitcoin-Server_FIND_VERSION}" )
    endif()

    pkg_check_modules( bitcoin_server ${_bitcoin_server_REQUIRED} ${_bitcoin_server_QUIET} "${_bitcoin_server_MODULE_SPEC}" )
    set( bitcoin_server_PKG "${_bitcoin_server_MODULE_SPEC}" )
endif()
