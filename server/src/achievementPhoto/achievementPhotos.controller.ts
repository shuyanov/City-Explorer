import {
  Controller,
  Post,
  Get,
  Param,
  Body,
  ValidationPipe,
} from '@nestjs/common';
import { CreateAchievementPhotoDto } from './achievementPhotos.dto';
import { AchievementsPhotosService } from './achievementPhoto.service';

@Controller('achievements-photos')
export class AchievementsPhotosController {
  constructor(
    private readonly achievementsPhotosService: AchievementsPhotosService,
  ) {}

  @Post()
  async create(
    @Body(ValidationPipe) createAchievementPhotoDto: CreateAchievementPhotoDto,
  ) {
    return this.achievementsPhotosService.create(createAchievementPhotoDto);
  }

  @Get()
  async findAll() {
    return this.achievementsPhotosService.findAll();
  }

  @Get(':id')
  async findOne(@Param('id') id: string) {
    return this.achievementsPhotosService.findOne(Number(id));
  }
}
