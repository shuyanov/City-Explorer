// achievements.controller.ts
import {
  Controller,
  Get,
  Post,
  Put,
  Delete,
  Param,
  Body,
  NotFoundException,
  InternalServerErrorException,
} from '@nestjs/common';
import { CreateAchievementDto, UpdateAchievementDto } from './achievements.dto';
import { AchievementsService } from './achievements.service';
import { ApiTags, ApiOperation, ApiCreatedResponse } from '@nestjs/swagger';
import './achievements.types';
import { achievement } from './achievements.types';

@ApiTags('achievements')
@Controller('achievements')
export class AchievementsController {
  constructor(private readonly achievementsService: AchievementsService) {}

  @Post()
  @ApiOperation({ summary: achievement.POST_ACHIEVEMENTS_SUMMARY })
  @ApiCreatedResponse({
    description: achievement.POST_ACHIEVEMENTS_DESCRIPTION,
  })
  create(@Body() createAchievementDto: CreateAchievementDto) {
    return this.achievementsService.create(createAchievementDto);
  }

  @Get()
  @ApiOperation({ summary: achievement.GET_ACHIEVEMENTS_SUMMARY })
  @ApiCreatedResponse({
    description: achievement.GET_ACHIEVEMENTS_DESCRIPTION,
  })
  findAll() {
    return this.achievementsService.findAll();
  }

  @Get(':id')
  @ApiOperation({ summary: achievement.GETID_ACHIEVEMENT_SUMMARY })
  @ApiCreatedResponse({
    description: achievement.GETID_ACHIEVEMENT_DESCRIPTION,
  })
  async findOne(@Param(achievement.ID) id: number) {
    try {
      const achievement = await this.achievementsService.findOne(Number(id));
      if (!achievement) {
        throw new NotFoundException('Achievement not found');
      }
      return achievement;
    } catch (error) {
      console.error(error);
      throw new InternalServerErrorException(
        'An internal server error occurred.',
      );
    }
  }

  @Put(`:${achievement.ID}`)
  update(
    @Param(achievement.ID) id: number,
    @Body() updateAchievementDto: UpdateAchievementDto,
  ) {
    return this.achievementsService.update(id, updateAchievementDto);
  }

  @Delete(`:${achievement.ID}`)
  @ApiOperation({ summary: achievement.DELETE_ACHIEVEMENT_SUMMARY })
  @ApiCreatedResponse({
    description: achievement.DELETE_ACHIEVEMENT_DESCRIPTION,
  })
  remove(@Param(`:${achievement.ID}`) id: number) {
    return this.achievementsService.remove(id);
  }
}
