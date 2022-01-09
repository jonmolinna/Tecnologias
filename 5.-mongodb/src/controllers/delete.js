import User from '../db/User.js';

// Utilizando Remove()
export const deleteOneUser = async (req, res) => {
    const id = req.params.id;
    try {
        const user = await User.deleteOne({ id })

        return res.status(200).json({ user })

    } catch (err) {
        console.log('>>>', err);
        return res.status(500).json({ message: err })
    }
};

// Utilizando Remove()
export const findByIdAndDeleteUser = async (req, res) => {
    const id = req.params.id;
    try {
        await User.findByIdAndDelete(id).orFail(); // traer error si no hay el id

        return res.status(200).json({ msg: 'User deleted' })

    } catch (err) {
        console.log('>>>', err);
        return res.status(500).json({ message: err })
    }
};