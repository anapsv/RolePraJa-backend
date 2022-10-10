/*
  Warnings:

  - You are about to drop the column `downvotes` on the `comments` table. All the data in the column will be lost.
  - You are about to drop the column `upvotes` on the `comments` table. All the data in the column will be lost.
  - You are about to drop the column `downvotes` on the `posts` table. All the data in the column will be lost.
  - You are about to drop the column `upvotes` on the `posts` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "comments" DROP COLUMN "downvotes",
DROP COLUMN "upvotes";

-- AlterTable
ALTER TABLE "posts" DROP COLUMN "downvotes",
DROP COLUMN "upvotes";

-- CreateTable
CREATE TABLE "upvoteDownvotePosts" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER NOT NULL,
    "postId" INTEGER NOT NULL,
    "createdAt" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "upvoteDownvotePosts_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "upvoteDownvoteComments" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER NOT NULL,
    "commentId" INTEGER NOT NULL,
    "createdAt" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "upvoteDownvoteComments_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "upvoteDownvotePosts" ADD CONSTRAINT "upvoteDownvotePosts_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "upvoteDownvotePosts" ADD CONSTRAINT "upvoteDownvotePosts_postId_fkey" FOREIGN KEY ("postId") REFERENCES "posts"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "upvoteDownvoteComments" ADD CONSTRAINT "upvoteDownvoteComments_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "upvoteDownvoteComments" ADD CONSTRAINT "upvoteDownvoteComments_commentId_fkey" FOREIGN KEY ("commentId") REFERENCES "comments"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
