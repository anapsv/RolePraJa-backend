import { prisma } from '../database/database';

export async function findById(id: number) {
    const user = await prisma.user.findUnique({
        where: { id }
    });
    return user;
}