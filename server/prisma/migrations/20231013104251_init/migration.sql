-- CreateTable
CREATE TABLE "Users" (
    "id" SERIAL NOT NULL,

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
    "user_photosId" INTEGER,

    CONSTRAINT "Photos_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "User_photos" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER NOT NULL,
    "photoId" INTEGER NOT NULL,

    CONSTRAINT "User_photos_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Achievements" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,

    CONSTRAINT "Achievements_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "User_achievements" (
    "id" SERIAL NOT NULL,
    "current_value" INTEGER NOT NULL,
    "end_value" INTEGER NOT NULL,
    "usersId" INTEGER NOT NULL,
    "achievementsId" INTEGER NOT NULL,

    CONSTRAINT "User_achievements_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Photos_url_image_key" ON "Photos"("url_image");

-- CreateIndex
CREATE UNIQUE INDEX "Photos_city_key" ON "Photos"("city");

-- AddForeignKey
ALTER TABLE "User_photos" ADD CONSTRAINT "User_photos_userId_fkey" FOREIGN KEY ("userId") REFERENCES "Users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User_photos" ADD CONSTRAINT "User_photos_photoId_fkey" FOREIGN KEY ("photoId") REFERENCES "Photos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User_achievements" ADD CONSTRAINT "User_achievements_usersId_fkey" FOREIGN KEY ("usersId") REFERENCES "Users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User_achievements" ADD CONSTRAINT "User_achievements_achievementsId_fkey" FOREIGN KEY ("achievementsId") REFERENCES "Achievements"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
