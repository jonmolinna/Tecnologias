import express from "express";
const router = express.Router();

import { insertManyUser, createUser } from '../controllers/insert.js';
import {
  query1, query2, query3, query4, query5,
  query6, query7, query8, query9, query10, query11 } from '../controllers/consultas.js';
import { queryCount, queryLimit, querySkip, querySort } from '../controllers/cursor.js';
import { proyeccion } from '../controllers/proyecciones.js';
import { updateUserSave, updateUser, findByIdAndUpdateUser } from '../controllers/update.js';
import { deleteOneUser, findByIdAndDeleteUser } from '../controllers/delete.js';
import {
  pregunta1, pregunta2, pregunta3, pregunta5,
  pregunta6, pregunta7, pregunta8, pregunta9, pregunta10
} from '../controllers/schemas.js';

// INSERT
router.post('/insert', insertManyUser);
router.post('/create', createUser);

// QUERIES
router.get('/query1', query1);
router.get('/query2', query2);
router.get('/query3', query3);
router.get('/query4', query4);
router.get('/query5', query5);
router.get('/query6', query6);
router.get('/query7', query7);
router.get('/query8', query8);
router.get('/query9', query9);
router.get('/query10', query10);
router.get('/query11', query11);

// QUERYCURSOR
router.get('/queryCount', queryCount);
router.get('/queryLimit', queryLimit);
router.get('/querySkip', querySkip);
router.get('/querySort', querySort);

// PROYECCIONES
router.get('/proyeccion', proyeccion);

// UPDATE
router.put('/updateUser/:id', updateUserSave);
router.put('/updateUser/:id', updateUser);
router.put('/findByIdAndUpdateUser/:id', findByIdAndUpdateUser);

// DELETE
router.delete('/deleteOneUser/:id', deleteOneUser);
router.delete('/findByIdAndDeleteUser/:id', findByIdAndDeleteUser);

// SCHEMAS CON MULTIPLES LISTAS.
router.get('/pregunta1', pregunta1);
router.put('/pregunta2/:id', pregunta2);
router.put('/pregunta3/:id', pregunta3);
router.get('/pregunta5', pregunta5);
router.put('/pregunta6/:id', pregunta6);
router.put('/pregunta7/:id', pregunta7);
router.put('/pregunta8/:idSchema/:idComments', pregunta8);
router.put('/pregunta9/:idSchema/:idComments', pregunta9);
router.put('/pregunta10/:idSchema/:idComments', pregunta10);


export default router;