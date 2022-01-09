import express from "express";
import mongoose from "mongoose";

// Rutas
import rutas from './rutas/index.js'

// App Config
const app = express();
const port = process.env.PORT || 9000;

// Middleware
app.use(express.json());

// DB Config
const mongoURI = "mongodb://localhost/mongoose_curso";

mongoose.connect(mongoURI);

mongoose.connection.once('open', () => {
    console.log('DB Connected');
});

// Rutas
app.get("/", (req, res) => res.status(200).send('I message fron backend'));
app.use("/", rutas);

// Listen
app.listen(port, () => console.log(`http://localhost:${port}/`));