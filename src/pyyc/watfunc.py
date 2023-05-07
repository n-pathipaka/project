from helper import  Type

watfunc = {
    'import':{
        'cruntime':{
            'circle':{
                'func':{
                    'fname' : 'circle',
                    'params': [{'type': Type.i32}, {'type': Type.i32}, {'type': Type.i32}],
                    'ret'   : {}
                }
            },
            'rectangle':{
                'func':{
                    'fname'  : 'rectangle',
                    'params' : [{'type': Type.i32}, {'type': Type.i32}, {'type': Type.i32}, {'type': Type.i32}],
                    'ret'    : {}
                }
            },
            'clear':{
                'func':{
                    'fname'  : 'clear',
                    'params' : [],
                    'ret'    : {}
                }
            },
            'color': {
                'func':{
                    'fname'  : 'color',
                    'params' : [{'type': Type.i32}, {'type': Type.i32}, {'type': Type.i32}],
                    'ret'    : {}
                }
            },
            'fill_rectangle': {
                'func':{
                    'fname'  : 'fill_rectangle',
                    'params' : [{'type': Type.i32}, {'type': Type.i32}, {'type': Type.i32}, {'type': Type.i32}],
                    'ret'    : {}
                }
            },
            'fill_circle': {
                'func':{
                    'fname'  : 'fill_circle',
                    'params' : [{'type': Type.i32}, {'type': Type.i32}, {'type': Type.i32}],
                    'ret'    : {}
                }
            },
            'rotate': {
                'func':{
                    'fname' : 'rotate',
                    'params' : [{'type': Type.i32}],
                    'ret': {}
                }
            },
            'line': {
                'func':{
                    'fname' : 'line',
                    'params' : [{'type': Type.i32}, {'type': Type.i32}, {'type': Type.i32}, {'type': Type.i32}, {'type': Type.i32}],
                    'ret' : {}
                }
            }
        }
    }
}
