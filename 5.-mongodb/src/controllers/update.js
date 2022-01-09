import User from '../db/User.js';

// Utilizando Save()
export const updateUserSave = async (req, res) => {
    const id = req.params.id;
    const { name, username, edad, estado } = req.body;
    try {
        const user = await User.findById(id).orFail(); // orFail => envia un error si no encuentra
        user.name = name || user.name
        user.username = username || user.username
        user.edad = edad || user.edad
        user.estado = estado || user.estado

        await user.save();

        return res.status(200).json({ user })

    } catch (err) {
        console.log('>>>', err);
        return res.status(500).json({ message: err })
    }
};

// Utilizando Update()
// Para quitar un campo $unset: { edad: true }
// Incremente la edad a 1 a todos
// users.updateMany({}, {$inc: { edad: 1 }})
export const updateUser = async (req, res) => {
    const id = req.params.id;
    const { name, username, edad, estado } = req.body;
    try {
        const user = await User.updateOne(
            {"_id": ObjectId(id)},
            { $set: { name, username, edad, estado }},
        );

        return res.status(200).json({ user })

    } catch (err) {
        console.log('>>>', err);
        return res.status(500).json({ message: err })
    }
};

// Utilizando findByIdAndUpdate()

export const findByIdAndUpdateUser = async (req, res) => {
    const id = req.params.id;
    const { name, username, edad, estado } = req.body;
    try {
        const user = await User.findByIdAndUpdate(id, {name, username, edad, estado}, {new: true}); // datos update

        return res.status(200).json({ user })

    } catch (err) {
        console.log('>>>', err);
        return res.status(500).json({ message: err })
    }
};