import { Module } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { PhotosController } from './photos.controller';
import { PhotosService } from './photos.service';

@Module({
  controllers: [PhotosController],
  providers: [PhotosService, PrismaService],
})
export class PhotosModule {}
