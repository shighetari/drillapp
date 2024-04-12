import { Request, Response } from 'express';
import db from '../config/dbConfig';

export const getAllUsers = async (req: Request, res: Response) => {
  try {
    const result = await db.query('SELECT * FROM users');
    res.status(200).json(result.rows);
  } catch (error) {
    res.status(500).json(error);
  }
};

export const createUser = async (req: Request, res: Response) => {
  // Implementation for creating a user
};
