import { IProfileData, IRegisterData } from "../types/authTypes";
import * as authRepository from "../repositories/authRepository";
import bcrypt from 'bcrypt';
import jwt from 'jsonwebtoken';

export async function registerUser(registerData: IRegisterData) {
    const { username, email, password, passwordConfirmation } = registerData;

    if (password !== passwordConfirmation) throw { code: "conflict", message: "Passwords must be equal" };

    const existingEmail = await checkEmail(email);
    if (existingEmail) throw { code: "conflict", message: "This email is already registered in the database" };

    const existingUsername = await checkUsername(username);
    if (existingUsername) throw { code: "conflict", message: "This username is already in use, please select another one" };

    const encryptedPassword = encryptPassword(password);

    await authRepository.insert({
        username,
        email,
        password: encryptedPassword
    });

    return "User successfully registered!"
}

async function checkEmail(email: string) {
    return await authRepository.findByEmail(email);
}

async function checkUsername(username: string) {
    return await authRepository.findByUsername(username);
}

function encryptPassword(password: string) {
    const SALT = 10;
    return bcrypt.hashSync(password, SALT);
}

export async function loginUser(username: string, password: string) {
    const user = await checkUsernameAndPassword(username, password);

    const token = generateToken(user.id);

    return { token };
}

async function checkUsernameAndPassword(username: string, password: string) {
    const user = await checkUsername(username);
    if (!user) throw { code: "unauthorized", message: "Wrong username or password!" };

    const encryptedPassword = user.password;

    if (!bcrypt.compareSync(password, encryptedPassword)) throw { code: "unauthorized", message: "Wrong username or password!" };

    return user;
}

function generateToken(id: number) {
    const data = { id };
    const SECRET = process.env.JWT_SECRET || "";
    const EXPIRES_IN = process.env.TOKEN_EXPIRES_IN;
    const options = { expiresIn: EXPIRES_IN };

    return jwt.sign(data, SECRET, options);
}