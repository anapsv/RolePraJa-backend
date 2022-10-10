/*
  Warnings:

  - A unique constraint covering the columns `[userId,commentId]` on the table `upvoteDownvoteComments` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[userId,postId]` on the table `upvoteDownvotePosts` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "upvoteDownvoteComments_userId_commentId_key" ON "upvoteDownvoteComments"("userId", "commentId");

-- CreateIndex
CREATE UNIQUE INDEX "upvoteDownvotePosts_userId_postId_key" ON "upvoteDownvotePosts"("userId", "postId");
