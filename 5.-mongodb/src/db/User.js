import mongoose from 'mongoose';

const userSchema = mongoose.Schema({
    name: String,
    username: String,
    edad: Number,
    estado: Boolean,
});

export default mongoose.model('user', userSchema);