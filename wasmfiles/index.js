// Allocate some memory for the moodule. Initial size is specified in pages of 16 kiB.
//const memory = new WebAssembly.Memory( { initial: 16 } );

const imports = {

    cruntime:{
        circle    :  Module.cwrap("circle", null,["number", "number", "number"]),
        rectangle :  Module.cwrap("rectangle", null, ["number", "number", "number", "number"]),
        clear     :  Module.cwrap("clear", null, []),
        color     :  Module.cwrap("color", null, ["number", "number", "number"]),
        fill_circle : Module.cwrap("fill_circle", null, ["number", "number", "number"]),
        fill_rectangle : Module.cwrap("fill_rectangle", null, ["number", "number", "number", "number"]),
        rotate : Module.cwrap("rotate", null, ["number"]),
        line : Module.cwrap("line", null, ["number", "number", "number", "number", "number"])
    }
};

fetch('../test/input.wasm')
    .then( response => response.arrayBuffer() )
    .then( bytes => WebAssembly.compile( bytes ) )
    .then( module => new WebAssembly.Instance( module, imports ) )
    .then( instance => {

        // Set the pixel data in the module's memory
        const res = instance.exports.run();

        console.log(res)

    });
