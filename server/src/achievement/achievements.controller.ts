// achievements.controller.ts
import {
  Controller,
  Get,
  Post,
  Put,
  Delete,
  Param,
  Body,
} from '@nestjs/common';
import { CreateAchievementDto, UpdateAchievementDto } from './achievements.dto';
import { AchievementsService } from './achievements.service';
import { ApiTags, ApiOperation, ApiCreatedResponse } from '@nestjs/swagger';

@ApiTags('achievements')
@Controller('achievements')
export class AchievementsController {
  constructor(private readonly achievementsService: AchievementsService) {}

  @Post()
  @ApiOperation({ summary: 'Create a new achievement' })
  @ApiCreatedResponse({
    description: 'The achievement has been successfully created.',
  })
  create(@Body() createAchievementDto: CreateAchievementDto) {
    return this.achievementsService.create(createAchievementDto);
  }

  @Get()
  @ApiOperation({ summary: 'Get a achievements' })
  @ApiCreatedResponse({
    description: 'The achievements has been get.',
  })
  findAll() {
    return this.achievementsService.findAll();
  }

  @Get(':id')
  @ApiOperation({ summary: 'Get a achievement' })
  @ApiCreatedResponse({
    description: 'The achievement has been get.',
  })
  findOne(@Param('id') id: number) {
    return this.achievementsService.findOne(id);
  }

  @Put(':id')
  update(
    @Param('id') id: number,
    @Body() updateAchievementDto: UpdateAchievementDto,
  ) {
    return this.achievementsService.update(id, updateAchievementDto);
  }

  @Delete(':id')
  @ApiOperation({ summary: 'Delete a achievement' })
  @ApiCreatedResponse({
    description: 'The achievement has been successfully deleted.',
  })
  remove(@Param('id') id: number) {
    return this.achievementsService.remove(id);
  }
}
