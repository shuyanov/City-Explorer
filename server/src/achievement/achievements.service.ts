// achievements.service.ts
import { Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { CreateAchievementDto, UpdateAchievementDto } from './achievements.dto';

@Injectable()
export class AchievementsService {
  constructor(private prisma: PrismaService) {}

  async create(createAchievementDto: CreateAchievementDto) {
    return this.prisma.achievements.create({
      data: createAchievementDto,
    });
  }

  async findAll() {
    return this.prisma.achievements.findMany();
  }

  async findOne(id: number) {
    return this.prisma.achievements.findUnique({
      where: { id },
    });
  }

  async update(id: number, updateAchievementDto: UpdateAchievementDto) {
    return this.prisma.achievements.update({
      where: { id },
      data: updateAchievementDto,
    });
  }

  async remove(id: number) {
    return this.prisma.achievements.delete({
      where: { id },
    });
  }
}
