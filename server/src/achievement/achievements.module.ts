// app.module.ts
import { Module } from '@nestjs/common';
import { AchievementsController } from './achievements.controller';
import { AchievementsService } from './achievements.service';
import { PrismaService } from '../prisma/prisma.service';

@Module({
  imports: [],
  controllers: [AchievementsController],
  providers: [AchievementsService, PrismaService],
})
export class AchievementsModule {}
