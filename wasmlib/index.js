// Allocate some memory for the moodule. Initial size is specified in pages of 16 kiB.
//const memory = new WebAssembly.Memory( { initial: 16 } );

// Everything we want to pass to our module during initialisation. The names of the keys
// are not important, so long as our WASM module knows to look for them.
const imports = {
    
    cruntime:{
        circle    :  Module.cwrap("circle", null,["number", "number", "number"]),
        rectangle :  Module.cwrap("rectangle", null, ["number", "number", "number", "number"])
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