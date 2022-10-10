import { prisma } from '../database/database';
import { Post } from '@prisma/client';
import { TNewPostData, IPostsResponse } from "../types/postTypes";

export async function insert(newPost: TNewPostData) {

    return await prisma.post.create({
        data: newPost
    });
}

export async function findByUUID(postId: string) {
    return await prisma.post.findFirst({ where: { id: postId } });
  }

// export async function getPosts(userId: string, filter?: string): Promise<IPostsResponse[]> {

//     const result = prisma.post.findMany({
//         where: {},
//         include: {
//             user: {
//                 select: username: true,
//             }
//         }
//     })
// }

