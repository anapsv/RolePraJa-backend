import { Post } from "@prisma/client";

export type INewPostData = {
    content: string,
    image: BinaryType
}