-- CreateTable
CREATE TABLE "Users" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Photos" (
    "id" SERIAL NOT NULL,
    "description" TEXT NOT NULL,
    "url_image" TEXT NOT NULL,
    "latitude" INTEGER NOT NULL,
    "longitude" INTEGER NOT NULL,
    "city" TEXT NOT NULL,
    "usersId" INTEGER,

    CONSTRAINT "Photos_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Achievements" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "usersId" INTEGER,
    "achievementPhotoId" INTEGER,

    CONSTRAINT "Achievements_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AchievementPhoto" (
    "id" SERIAL NOT NULL,
    "url_image" TEXT NOT NULL,

    CONSTRAINT "AchievementPhoto_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "AchievementPhoto_url_image_key" ON "AchievementPhoto"("url_image");

-- AddForeignKey
ALTER TABLE "Photos" ADD CONSTRAINT "Photos_usersId_fkey" FOREIGN KEY ("usersId") REFERENCES "Users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Achievements" ADD CONSTRAINT "Achievements_usersId_fkey" FOREIGN KEY ("usersId") REFERENCES "Users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Achievements" ADD CONSTRAINT "Achievements_achievementPhotoId_fkey" FOREIGN KEY ("achievementPhotoId") REFERENCES "AchievementPhoto"("id") ON DELETE SET NULL ON UPDATE CASCADE;
