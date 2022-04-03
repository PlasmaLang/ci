#!/bin/sh

set -e

echo Build script running.

export CI=true
JOBS=$(if X=$(nproc 2>&1); then echo $X; else echo 1; fi)
export MAKEFLAGS="-j$JOBS"

case "$INPUT_COMMAND" in
    setup)
        case "$INPUT_C" in
            gcc)
                CC=gcc
                CXX=g++
                ;;
            clang)
                CC=clang
                CXX=clang++
                ;;
            *)
                echo "Unknown C compiler $INPUT_C"
                exit 1
                ;;
        esac

        BUILD_TYPE=$INPUT_BUILDTYPE
        case "$INPUT_BUILDTYPE" in
            dev)
                C_CXX_FLAGS='$(C_CXX_FLAGS_BASE) -O1 -DDEBUG -DPZ_DEV'
                MCFLAGS="-O1"
                ;;
            rel)
                C_CXX_FLAGS='$(C_CXX_FLAGS_BASE) -O3'
                MCFLAGS="-O4 --intermodule-optimisation"
                ;;
            *)
                echo "Unknown build type $INPUT_BUILDTYPE"
                ;;
        esac

        case "$INPUT_LINT" in
            lint)
                C_CXX_FLAGS="$C_CXX_FLAGS -Wall -Werror"
                # TODO: Add -Werror for Mercury after we upgrade to stable.
                ;;
        esac

        echo C compiler
        echo ----------
        $CC --version
        echo C_CXX_FLAGS is $C_CXX_FLAGS
        echo

        echo Mercury compiler
        echo ----------------
        mmc --version
        echo MCFLAGS is $MCFLAGS
        echo

        echo Other
        echo -----
        echo JOBS is $JOBS
        echo MAKEFLAGS is $MAKEFLAGS
        echo

cat > build.mk << END
JOBS=$JOBS
CC=$CC
CXX=$CXX
C_CXX_FLAGS=$C_CXX_FLAGS
MCFLAGS=$MCFLAGS
BUILD_TYPE=$BUILD_TYPE
END

        echo build.mk:
        cat build.mk
        echo
        ;;
    build)
        exec make progs
        ;;
    test)
        exec make test
        ;;
    gctest)
        cd tests
        exec ./run_tests.sh gc
        ;;
    extra)
        exec make tags
        ;;
    *)
        echo "Unknown command"
        exit 1
        ;;
esac

