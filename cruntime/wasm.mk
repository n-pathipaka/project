MAKEFLAGS += --no-builtin-rules
CC := emcc
CFLAGS := -c
FILES := runtime.c


TARGET := pyruntime.html
EXPORTED_FUNCS := "_circle","_rectangle","_clear","_fill_circle", "_fill_rectangle","_rotate","_line"
LIB_DIR := ../wasmfiles/

all: $(TARGET)

$(TARGET) : $(FILES)
	emcc -o $@ $(FILES) \
	-s EXPORTED_RUNTIME_METHODS='["ccall", "cwrap"]' \
	-s EXPORTED_FUNCTIONS='[$(EXPORTED_FUNCS)]'
	mv $(TARGET) $(LIB_DIR)
	mv $(TARGET:.html=.js)   $(LIB_DIR)
	mv $(TARGET:.html=.wasm)  $(LIB_DIR)
	rm -f ./*.o

%.o : %.c
	$(CC) $(CFLAGS) $< -o $@

clean:
	@echo "clean"
	rm -f $(LIB_DIR)$(TARGET) $(LIB_DIR)$(TARGET:.html=.js) $(LIB_DIR)$(TARGET:.html=.wasm)
