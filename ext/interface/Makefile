.PHONY: clean

SWIG = swig
SWIGFLAGS = -ruby -c++ -I../src/build/include/

TARGET = audiere_wrap.cpp

all: $(TARGET)

$(TARGET): audiere.i
	$(SWIG) $(SWIGFLAGS) -o $@ $<

clean:
	@rm -f $(TARGET)
