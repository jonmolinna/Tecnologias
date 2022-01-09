import User from '../db/User.js';

// Liste todos los usuarios con sus campos { name, username }
export const proyeccion = async (req, res) => {
    try {
        const users = await User.find(
            {}, // Definir Condiciones
            {
                _id: false,
                name: true,
                username: true,
            }
        )

        return res.status(200).json({ users })

    } catch (err) {
        console.log('>>>', err);
        return res.status(500).json({ message: err })
    }
};