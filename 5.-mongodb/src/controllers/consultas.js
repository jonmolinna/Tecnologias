import User from '../db/User.js';

// Obtener el username tanase123
export const query1 = async (req, res) => {
    try {
        const user = await User.findOne({ username: 'tanase123'});
        if(user){
            return res.status(200).json({ user })
        } else {
            return res.status(200).json({ message: 'Use not found' })
        }

    } catch (err) {
        console.log('>>>', err);
        return res.status(500).json({ message: err })
    }
};

// Obtener todos los usuarios con un edad mayor a 25 ($ ---> condicion)
// Operadores relacional
// gt ---> mayor que        ---> >
// gte ---> mayor o igual   ---> >=
// lt ---> menor que        ---> <
// lte ---> menor o igual   ---> <=
// ne ---> no equals        ---> !=
export const query2 = async (req, res) => {
    try {
        const users = await User.find({
            edad: { $gt: 25 }
        });

        return res.status(200).json({users })

    } catch (err) {
        console.log('>>>', err);
        return res.status(500).json({ message: err })
    }
};

// Obtener la cantidad de usuarios con una edad menor a 25
// find --> es un metodo cursor 
// metodo cursor tienen un metodo count
export const query3 = async (req, res) => {
    try {
        const users = await User.find({
            edad: { $lt: 25 }
        })
        .count();

        return res.status(200).json({users })

    } catch (err) {
        console.log('>>>', err);
        return res.status(500).json({ message: err })
    }
};

// Obtener todos los usuarios con un edad mayor a 25 y cuyo status sea activo (AND)
export const query4 = async (req, res) => {
    try {
        const users = await User.find({
            $and: [
                { edad: {$gt: 25} },
                { estado: true },
            ]
        });

        return res.status(200).json({users })

    } catch (err) {
        console.log('>>>', err);
        return res.status(500).json({ message: err })
    }
};

// Obtener todos los usuarios cuya edad no sea 24
export const query5 = async (req, res) => {
    try {
        const users = await User.find({
            edad: { $ne: 24 },
        });

        return res.status(200).json({users })

    } catch (err) {
        console.log('>>>', err);
        return res.status(500).json({ message: err })
    }
};

// Obtener todos los usuarios que tenga por edad: 24 o 37 o 22
export const query6 = async (req, res) => {
    try {
        // Primera Forma
        const users1 = await User.find({
            $or: [
                { edad: 24 },
                { edad: 37 },
                { edad: 22 },
            ]
        });

        // Segunda Forma
        const users2 = await User.find({
            edad: { $in: [24, 37, 22]}
        });

        return res.status(200).json({ users2 })

    } catch (err) {
        console.log('>>>', err);
        return res.status(500).json({ message: err })
    }
};

// Obtener todos los usuarios con atributo estado.
export const query7 = async (req, res) => {
    try {
        const users = await User.find({
            estado: { $exists: true}
        });

        return res.status(200).json({users })

    } catch (err) {
        console.log('>>>', err);
        return res.status(500).json({ message: err })
    }
}

// Obtener todos los usuarios con estado activo.
export const query8 = async (req, res) => {
    try {
        // Primera Opcion 
        const users1 = await User.find({
            estado: true
        });

        // Segunda Opcion
        const users2 = await User.find({
            $and: [
                { estado: { $exists: true }},
                { estado: true }
            ]
        });

        return res.status(200).json({ users2 })

    } catch (err) {
        console.log('>>>', err);
        return res.status(500).json({ message: err })
    }
};

// Obtener todos los usuarios con estado activo y username
export const query9 = async (req, res) => {
    try {
        const users = await User.find({
            $and: [
                { estado: { $exists: true }},
                { estado: true },
                { username: { $exists: true }}
            ]
        });

        return res.status(200).json({users })

    } catch (err) {
        console.log('>>>', err);
        return res.status(500).json({ message: err })
    }
}
// Obtener el usuario con mayor de edad
// cursor => sort();
// -1 => ordenar en forma descendiente
// 1 => ordenar en forma ascendiente
export const query10 = async (req, res) => {
    try {
        const users = await User.find().sort({
            edad: -1
        }).limit(1)

        return res.status(200).json({users })

    } catch (err) {
        console.log('>>>', err);
        return res.status(500).json({ message: err })
    }
};

// Obtener a los tres usuarios mas jovenes
export const query11 = async (req, res) => {
    try {
        const users = await User.find().sort({
            edad: 1
        }).limit(3)

        return res.status(200).json({users })

    } catch (err) {
        console.log('>>>', err);
        return res.status(500).json({ message: err })
    }
};

// Obtener los correos que acaben en .com (Exp regular => Like)
export const query12 = async (req, res) => {
    try {
        const users = await User.find({
            email: /.com$/, // acabe en punto com
            email: /^user/, // que comienze con user
            email: /@/ // que exista un caracter
        });

        return res.status(200).json({users })

    } catch (err) {
        console.log('>>>', err);
        return res.status(500).json({ message: err })
    }
};