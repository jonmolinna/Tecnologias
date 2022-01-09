import User from '../db/User.js';

export const insertManyUser = async (req, res) => {
    const { name, username, edad, estado } = req.body;

    try {
        const user = await User.insertMany({ name, username, edad, estado });
        
        return res.status(200).json({
            message: 'User Create',
            user,
        })

    } catch (err) {
        console.log('>>>', err);
        return res.status(500).json({ err })
    }
};

export const createUser = async (req, res) => {
    // const { name, username, edad, estado } = req.body;

    try {
        // const user = await User.create({ name, username, edad, estado });
        const user = await User.create(req.body);
        
        return res.status(200).json({
            message: 'User Create',
            user,
        })

    } catch (err) {
        console.log('>>>', err);
        return res.status(500).json({ err })
    }
};