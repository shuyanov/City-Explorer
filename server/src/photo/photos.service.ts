import { Injectable, NotFoundException } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { CreatePhotoDto, UpdatePhotoDto } from './photo.dto';

@Injectable()
export class PhotosService {
  constructor(private readonly prisma: PrismaService) {}

  async findAll() {
    return this.prisma.photos.findMany();
  }

  async findOne(id: number) {
    const photo = await this.prisma.photos.findUnique({ where: { id } });
    if (!photo) {
      throw new NotFoundException('Photo not found');
    }
    return photo;
  }

  async create(createPhotoDto: CreatePhotoDto) {
    return this.prisma.photos.create({ data: createPhotoDto });
  }

  async update(id: number, updatePhotoDto: UpdatePhotoDto) {
    const { usersId, ...data } = updatePhotoDto;
    const photo = await this.prisma.photos.findUnique({ where: { id } });
    if (!photo) {
      throw new NotFoundException('Photo not found');
    }
    return this.prisma.photos.update({ where: { id }, data });
  }

  async remove(id: number) {
    const photo = await this.prisma.photos.findUnique({ where: { id } });
    if (!photo) {
      throw new NotFoundException('Photo not found');
    }
    return this.prisma.photos.delete({ where: { id } });
  }
}
