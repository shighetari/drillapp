import { Router } from 'express';
import * as userController from '../controllers/userController';

const router = Router();

router.get('/users', userController.getAllUsers);
router.post('/users', userController.createUser);

export default router;
