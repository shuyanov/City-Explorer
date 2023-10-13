import { Module } from '@nestjs/common';
import { AchievementsPhotosController } from './achievementPhotos.controller';
import { AchievementsPhotosService } from './achievementPhoto.service';
import { PrismaService } from '../prisma/prisma.service';

@Module({
  imports: [],
  controllers: [AchievementsPhotosController],
  providers: [AchievementsPhotosService, PrismaService],
})
export class AchievementsPhotoModule {}
