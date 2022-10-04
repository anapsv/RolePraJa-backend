import { User } from '@prisma/client';

export type IRegisterData = {
    username: string,
    email: string,
    password: string,
    passwordConfirmation: string,
}

export type ILoginData = {
    username: string,
    email: string,
    password: string
}

export type IProfileData = Partial<User>;