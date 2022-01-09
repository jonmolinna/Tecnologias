import User from '../db/User.js';

// Cursor Count
export const queryCount = async (req, res) => {
    try {
        const users = await User.find().count();

        return res.status(200).json({ users })

    } catch (err) {
        console.log('>>>', err);
        return res.status(500).json({ message: err })
    }
};

// Cursor Limit
export const queryLimit = async (req, res) => {
    try {
        const users = await User.find().limit(2);

        return res.status(200).json({ users })

    } catch (err) {
        console.log('>>>', err);
        return res.status(500).json({ message: err })
    }
};

// Cursor Skip => permite saltar documentos
// imprime a partir de los 2 usuarios siguientes
export const querySkip = async (req, res) => {
    try {
        const users = await User.find().skip(2)

        return res.status(200).json({ users })

    } catch (err) {
        console.log('>>>', err);
        return res.status(500).json({ message: err })
    }
};

// Cursor Sort => permite ordernar (1: asc, -1: desc)
// ordene las edades en forma descendiente
export const querySort = async (req, res) => {
    try {
        const users = await User.find().sort({
            edad: -1
        })

        return res.status(200).json({ users })

    } catch (err) {
        console.log('>>>', err);
        return res.status(500).json({ message: err })
    }
};