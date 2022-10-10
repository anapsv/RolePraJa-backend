import { Request, Response } from 'express';
import { ILoginData, IRegisterData, IProfileData } from '../types/authTypes';
import * as authService from '../services/authService';

export async function registerUser(req: Request, res: Response) {
    const registerData: IRegisterData = req.body;

    const result = await authService.registerUser(registerData);

    res.status(201).send(result);
}

export async function loginUser(req: Request, res: Response) {
    const { username, password }: ILoginData = req.body;

    const result = await authService.loginUser(username, password);

    res.status(200).send(result);
}

export async function accessFeed(req: Request, res: Response) {
	const user = res.locals.user as IProfileData;

	res.status(200).send(user);
}