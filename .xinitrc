#!/bin/sh
export EDITOR=subl
exec $1 >> ~/.cache/$1/stdout 2>> ~/.cache/$1/stderr
