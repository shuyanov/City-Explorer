import { Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { CreateAchievementPhotoDto } from './achievementPhotos.dto';

@Injectable()
export class AchievementsPhotosService {
  constructor(private readonly prisma: PrismaService) {}

  async create(data: CreateAchievementPhotoDto): Promise<any> {
    const achievementPhoto = await this.prisma.achievementPhoto.create({
      data: {
        url_image: data.url_image,
      },
    });
    return achievementPhoto;
  }

  async findAll(): Promise<any[]> {
    return this.prisma.achievementPhoto.findMany();
  }

  async findOne(id: number): Promise<any> {
    return this.prisma.achievementPhoto.findUnique({
      where: { id },
    });
  }
}
