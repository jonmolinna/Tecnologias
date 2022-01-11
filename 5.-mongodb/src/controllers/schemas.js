import User from '../db/User.js';

// Obtener todos los usuarios que radiquen en PERU. Muestre solo el username y pais
export const pregunta1 = async (req, res) => {
    try {
        const user = await User.find(
            {
                'address.pais': 'PERU'
            },
            {
                username: true,
                'address.pais': true
            }
        );

        return res.status(200).json({ user })

    } catch (err) {
        console.log('>>>', err);
        return res.status(500).json({ message: err })
    }
};

// Actualizar el codigo postal del usuario khoma123 de 309 a 1700.
// $set de actualizar
export const pregunta2 = async (req, res) => {
    const id = req.params.id;
    const { postal } = req.body;
    
    try {
        const user = await User.findByIdAndUpdate(
            { "_id": id },
            { $set: {
              'address.postal': postal  
            }},
            { new: true },
        )

        return res.status(200).json({ user })

    } catch (err) {
        console.log('>>>', err);
        return res.status(500).json({ message: err })
    }
};

// Añadir la direccion al usuario abab123 POSTAL Y PAIS
export const pregunta3 = async (req, res) => {
    const id = req.params.id;
    const { postal, pais } = req.body;
    
    try {
        const user = await User.findByIdAndUpdate(
            { "_id": id },
            { $set: {
              'address': {
                  pais: pais,
                  postal: postal 
              }  
            }},
            { new: true },
        )

        return res.status(200).json({ user })

    } catch (err) {
        console.log('>>>', err);
        return res.status(500).json({ message: err })
    }
};

/**
 * añadir un documento envevido
User.findByIdAndUpdate(
    { "_id": id },
    {
        $set: {
            "address.location": {
                lat: 100,
                long: 200
            }
        }
    }
)
 */

// Obtener todos los usuarios que tengan en su listado de cursos Python.

// Obtener todos los usuarios con por los menos un comentario positivo (LIKE = TRUE ).
// $elemMatch => nos permite filtrar sobre atributos de documentos dentro de listados.
export const pregunta5 = async (req, res) => {   
    try {
        const user = await User.find(
            {
                comments: {
                    $elemMatch: {
                        like: true
                    }
                }
            }
        )

        return res.status(200).json({ user })

    } catch (err) {
        console.log('>>>', err);
        return res.status(500).json({ message: err })
    }
};

/**
 * Usuarios con comentarios positivos y que tengan tags
 const user = await User.find(
            {
                comments: {
                    $elemMatch: {
                        $and: [
                            { like: true },
                            { tags: { $exists: true }}
                        ]
                    }
                }
            }
        ) 
*/

// Añadir un nuevo comentario positivo al listado de comentarios para el khoma123.
// $push => permite añadir un nuevo elementos a un documento
export const pregunta6 = async (req, res) => {
    const id = req.params.id;
    const { like, body, tags } = req.body;

    try {
        const user = await User.findByIdAndUpdate(
            { "_id": id },
            {
                $push: {
                    comments: {
                        like: like,
                        body: body,
                        tags: tags
                    }
                }
            },
        )

        return res.status(200).json({ user })

    } catch (err) {
        console.log('>>>', err);
        return res.status(500).json({ message: err })
    }
};

/*
POSTMAN
metodo = put
link = http://localhost:9000/pregunta6/61dc3cec4d7e339379ab77ff
{
    "like": true,
    "body": "Las clases de PhotoShop son lo maximo",
    "tags": ["Excelente", "Nuevo"]
}
*/

// Añade un nuevo curso de Economia al usuario abab123
export const pregunta7 = async (req, res) => {
    const id = req.params.id;
    const { curso } = req.body;

    try {
        const user = await User.findByIdAndUpdate(
            { "_id": id },
            {
                $push: {
                    cursos: curso
                }
            },
        )

        return res.status(200).json({ user })

    } catch (err) {
        console.log('>>>', err);
        return res.status(500).json({ message: err })
    }
};

// Añade una nueva etiqueta (tags) al comentario 3 del usuario khoma123.
export const pregunta8 = async (req, res) => {
    const idSchema = req.params.idSchema;
    const idComments = req.params.idComments;
    const { tags } = req.body;

    try {
        await User.findByIdAndUpdate(
            { "_id": idSchema },
            {
                $push: {'comments.$[comm].tags': tags}
            },
            {
                arrayFilters: [
                    {"comm._id": idComments},
                ]
            }
        );

        return res.status(200).json({ msg: "Se registro" })

    } catch (err) {
        console.log('>>>', err);
        return res.status(500).json({ message: err })
    }
};

/**
metodo = PUT
url = http://localhost:9000/pregunta8/61dc3cec4d7e339379ab77ff/61dc54b5c815e14bf688419b
{
    "tags": "Tutor"
}
*/


// Actualiza el Primer comentario del khoma123.
// $set => actualizar
// $push => añadir
export const pregunta9 = async (req, res) => {
    const idSchema = req.params.idSchema;
    const idComments = req.params.idComments;
    const { body } = req.body;

    try {
        await User.findByIdAndUpdate(
            { "_id": idSchema },
            {
                $set: {'comments.$[comm].body': body}
            },
            {
                arrayFilters: [
                    {"comm._id": idComments},
                ]
            }
        );

        return res.status(200).json({ msg: "Se registro" })

    } catch (err) {
        console.log('>>>', err);
        return res.status(500).json({ message: err })
    }
};

/**
metodo = PUT
url = http://localhost:9000/pregunta9/61dc3cec4d7e339379ab77ff/61dc3cec4d7e339379ab7800
{
    "body": "Me gusta el curso de Python"
}
*/



// Actualiza el comentario 4 del khoma123 (body y like).
export const pregunta10 = async (req, res) => {
    const idSchema = req.params.idSchema;
    const idComments = req.params.idComments;
    const { body, like } = req.body;
    console.log("body >", body);
    console.log("like >", like);

    try {
        await User.findByIdAndUpdate(
            { "_id": idSchema },
            {
                $set: {
                    'comments.$[comm].like': like,
                    'comments.$[comm].body': body,
                }
            },
            {
                arrayFilters: [
                    {"comm._id": idComments},
                ]
            }
        );

        return res.status(200).json({ msg: "Se registro" })

    } catch (err) {
        console.log('>>>', err);
        return res.status(500).json({ message: err })
    }
};

/**
metodo = PUT
url = http://localhost:9000/pregunta10/61dc3cec4d7e339379ab77ff/61dd92740d29051860033212
{
    "body": "Me gusta este instituto 10",
    "like": false
}
*/


/*
await User.findByIdAndUpdate(
            { "_id": idSchema },
            {
                $set: {
                    'comments.$[comm].like': like,
                    'comments.$[comm].body': body,
                }
                $unset: {
                    'comments.$[comm].tags': true, ====> elimina el campo tags
                }
            },
            {
                arrayFilters: [
                    {"comm._id": idComments},
                ]
            }
        );
*/



/*
Coleccion
-----------------------------------------------------------------------------
[
    {
        "_id":"5c3d2b3502d0a9467037ede5",
        "usuarioId":"usuario 1",
        "perfiles":[
            {
                "_id":"5c3d2b4702d0a9467037ede7",
                "perfil":"perfil 1",
                "estudios":[
                    {
                        "_id":"5c5110da02d0a90ba0926731",
                        "institucion":"institucion 1"
                    },
                    {
                        "_id":"5c9980eb02d0a920bcb66db3",
                        "institucion":"institucion 2"
                    }
                ]
            }
        ]
    }
]

Añadir
----------------------------------------------------------------------------------
User.update(
    {
        "_id": {$eq: ObjectId("5c3d2b3502d0a9467037ede5")}
    },
    {
        $set: {"perfiles.$[perf].estudios.$[est].institucion": "Escola Poblenou"}
    },
    {
        arrayFilters:[
            {"perf._id": {$eq: ObjectId("5c3d2b4702d0a9467037ede7")}},
            {"est._id":{$eq: ObjectId("5c5110da02d0a90ba0926731")}}
        ]
    }
)
*/