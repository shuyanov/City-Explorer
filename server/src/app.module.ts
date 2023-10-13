import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { PrismaService } from './prisma/prisma.service';
import { UsersModule } from './user/users.module';
import { PhotosModule } from './photo/photos.module';

@Module({
  imports: [UsersModule, PhotosModule],
  controllers: [AppController],
  providers: [PrismaService, AppService],
})
export class AppModule {}
