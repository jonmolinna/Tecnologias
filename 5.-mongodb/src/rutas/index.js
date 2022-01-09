import express from "express";
const router = express.Router();

import { insertManyUser, createUser } from '../controllers/insert.js';
import { query1, query2, query3, query4, query5, query6, query7, query8, query9, query10, query11 } from '../controllers/consultas.js';

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

export default router;