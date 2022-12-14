import { IProfileData } from "../types/authTypes";
import * as userRepository from "../repositories/userRepository";

export async function findUserById(id: number) {
    const existingUser = await userRepository.findById(id);
    if (!existingUser) throw { code: "not_found", message: "User not found" };
    const user: IProfileData = { ...existingUser };

    delete user.password;

    return user;
}