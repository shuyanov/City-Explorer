import {
  Body,
  Controller,
  Get,
  Param,
  Post,
  Put,
  Delete,
} from '@nestjs/common';
import { CreatePhotoDto, UpdatePhotoDto } from './photo.dto';
import { PhotosService } from './photos.service';

@Controller('photos')
export class PhotosController {
  constructor(private readonly photosService: PhotosService) {}

  @Get()
  async findAll() {
    return this.photosService.findAll();
  }

  @Get(':id')
  async findOne(@Param('id') id: number) {
    return this.photosService.findOne(Number(id));
  }

  @Post()
  async create(@Body() createPhotoDto: CreatePhotoDto) {
    return this.photosService.create(createPhotoDto);
  }

  @Put(':id')
  async update(
    @Param('id') id: number,
    @Body() updatePhotoDto: UpdatePhotoDto,
  ) {
    return this.photosService.update(id, updatePhotoDto);
  }

  @Delete(':id')
  async remove(@Param('id') id: number) {
    return this.photosService.remove(Number(id));
  }
}
