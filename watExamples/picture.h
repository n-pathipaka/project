/* Automatically generated by wasm2c */
#ifndef PICTURE_H_GENERATED_
#define PICTURE_H_GENERATED_

#include <stdint.h>

#include "wasm-rt.h"

#if defined(WASM_RT_ENABLE_SIMD)
#include "simde/wasm/simd128.h"
#endif

/* TODO(binji): only use stdint.h types in header */
#ifndef WASM_RT_CORE_TYPES_DEFINED
#define WASM_RT_CORE_TYPES_DEFINED
typedef uint8_t u8;
typedef int8_t s8;
typedef uint16_t u16;
typedef int16_t s16;
typedef uint32_t u32;
typedef int32_t s32;
typedef uint64_t u64;
typedef int64_t s64;
typedef float f32;
typedef double f64;

#if defined(WASM_RT_ENABLE_SIMD)
typedef simde_v128_t v128;
#endif

#endif

#ifdef __cplusplus
extern "C" {
#endif

struct w2c_js;
extern wasm_rt_memory_t* w2c_js_mem(struct w2c_js*);

typedef struct w2c_picture {
  /* import: 'js' 'mem' */
  wasm_rt_memory_t *w2c_js_mem;
} w2c_picture;

void wasm2c_picture_instantiate(w2c_picture*, struct w2c_js*);
void wasm2c_picture_free(w2c_picture*);
wasm_rt_func_type_t wasm2c_picture_get_func_type(uint32_t param_count, uint32_t result_count, ...);

extern const u64 wasm2c_picture_min_js_mem;
extern const u64 wasm2c_picture_max_js_mem;
extern const u8 wasm2c_picture_is64_js_mem;

/* export: 'run' */
void w2c_picture_run(w2c_picture*);

#ifdef __cplusplus
}
#endif

#endif  /* PICTURE_H_GENERATED_ */
