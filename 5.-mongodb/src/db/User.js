import mongoose from 'mongoose';

const userSchema = mongoose.Schema({
    name: String,
    username: String,
    edad: Number,
    estado: Boolean,
    address: {
        postal: Number,
        pais: String,
    },
    cursos: Array,
    comments: [
        {
            body: String,
            like: Boolean,
            tags: Array,
        }
    ]
});

export default mongoose.model('user', userSchema);