require 'mkmf'

AUDIERE_INC=  "-I./src/build/include"
AUDIERE_LIB = "-L./src/build/lib -laudiere -lasound -lrt -lpthread"

if RUBY_PLATFORM =~ /(mswin|mingw)/i
  AUDIERE_LIB << " -lws2_32 -lwinmm"
end

# set flags
$CFLAGS += " -g " + AUDIERE_INC
$LDFLAGS += " -static-libgcc -static-libstdc++ " + AUDIERE_LIB

$srcs = ["interface/audiere_wrap.cpp"]


$objs = $srcs.collect {|o| o.sub(/\.cpp|\.cc|\.cxx/, ".o")}
$cleanfiles = $objs

create_makefile('Audiere')
