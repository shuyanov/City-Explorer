import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { PrismaService } from './prisma/prisma.service';
import { UsersModule } from './user/users.module';
import { PhotosModule } from './photo/photos.module';
import { AchievementsModule } from './achievement';
import { AchievementsPhotoModule } from './achievementPhoto';
import { SwaggerDocsModule } from './swagger/swagger.module';

@Module({
  imports: [
    UsersModule,
    AchievementsModule,
    PhotosModule,
    SwaggerDocsModule,
    AchievementsPhotoModule,
  ],
  controllers: [AppController],
  providers: [PrismaService, AppService],
})
export class AppModule {}
