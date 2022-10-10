/*
  Warnings:

  - You are about to drop the `upvoteDownvoteComments` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `upvoteDownvotePosts` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "upvoteDownvoteComments" DROP CONSTRAINT "upvoteDownvoteComments_commentId_fkey";

-- DropForeignKey
ALTER TABLE "upvoteDownvoteComments" DROP CONSTRAINT "upvoteDownvoteComments_userId_fkey";

-- DropForeignKey
ALTER TABLE "upvoteDownvotePosts" DROP CONSTRAINT "upvoteDownvotePosts_postId_fkey";

-- DropForeignKey
ALTER TABLE "upvoteDownvotePosts" DROP CONSTRAINT "upvoteDownvotePosts_userId_fkey";

-- DropTable
DROP TABLE "upvoteDownvoteComments";

-- DropTable
DROP TABLE "upvoteDownvotePosts";

-- CreateTable
CREATE TABLE "upvotePosts" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER NOT NULL,
    "postId" INTEGER NOT NULL,
    "createdAt" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "upvotePosts_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "downvotePosts" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER NOT NULL,
    "postId" INTEGER NOT NULL,
    "createdAt" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "downvotePosts_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "starEvents" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER NOT NULL,
    "eventId" INTEGER NOT NULL,
    "createdAt" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "starEvents_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "upvotePosts_userId_postId_key" ON "upvotePosts"("userId", "postId");

-- CreateIndex
CREATE UNIQUE INDEX "downvotePosts_userId_postId_key" ON "downvotePosts"("userId", "postId");

-- CreateIndex
CREATE UNIQUE INDEX "starEvents_userId_eventId_key" ON "starEvents"("userId", "eventId");

-- AddForeignKey
ALTER TABLE "upvotePosts" ADD CONSTRAINT "upvotePosts_postId_fkey" FOREIGN KEY ("postId") REFERENCES "posts"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "upvotePosts" ADD CONSTRAINT "upvotePosts_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "downvotePosts" ADD CONSTRAINT "downvotePosts_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "downvotePosts" ADD CONSTRAINT "downvotePosts_postId_fkey" FOREIGN KEY ("postId") REFERENCES "posts"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "starEvents" ADD CONSTRAINT "starEvents_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "starEvents" ADD CONSTRAINT "starEvents_eventId_fkey" FOREIGN KEY ("eventId") REFERENCES "events"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
