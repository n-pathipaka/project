MAKEFLAGS += --no-builtin-rules
CFILES := $(wildcard *.c)
FILES := $(patsubst %.c,%.o,$(CFILES))

all: pyruntime.html

pyruntime.html: $(FILES)
	emcc -o $@ $(FILES) \
	-s EXPORTED_RUNTIME_METHODS='["ccall", "cwrap"]' \
	-s EXPORTED_FUNCTIONS='["_circle","_rectangle"]'
	mv pyruntime.html ../wasmlib/
	mv pyruntime.js ../wasmlib/
	mv pyruntime.wasm ../wasmlib/
	rm -f ./*.o

%.o : %.c
	emcc -c $< -o $@

clean:
	@echo "clean"
	@echo $(FILES)
	rm -f ./*.o ./*.wasm ./*.js ./*.html