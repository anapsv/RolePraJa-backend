import * as models from '@prisma/client';
import { Post } from "@prisma/client";
import { User } from "@prisma/client";

export type TNewPostData = Omit<Post, 'id' | 'createdAt' | 'updatedAt'>

export interface IPostBody {
    content: string;
}

export interface IPostsResponse {
    id: number;
    user: IUserData;
    content: string;
    date: Date;
}

interface IUserData {
    userId: number;
    username: string;
}