import {
  Controller,
  Get,
  Param,
  Post,
  Put,
  Delete,
  Body,
} from '@nestjs/common';
import { UsersService } from './users.service';
import { CreateUserDto, UpdateUserDto } from './users.dto';
import { ApiCreatedResponse, ApiOperation, ApiTags } from '@nestjs/swagger';

@ApiTags('Users')
@Controller('users')
export class UsersController {
  constructor(private readonly usersService: UsersService) {}

  @Get()
  @ApiOperation({ summary: 'Get all Users' })
  @ApiCreatedResponse({
    description: 'Get all users with photo and achievements',
  })
  findAll() {
    return this.usersService.findAll();
  }

  @Get(':id')
  @ApiOperation({ summary: 'Get User by ID' })
  @ApiCreatedResponse({
    description: 'Get User by ID',
  })
  findOne(@Param('id') id: number) {
    return this.usersService.findOne(Number(id));
  }

  @Post()
  @ApiOperation({ summary: 'Create new User' })
  @ApiCreatedResponse({
    description: 'Create new User',
  })
  create(@Body() createUserDto: CreateUserDto) {
    return this.usersService.create(createUserDto);
  }

  @Put(':id')
  update(@Param('id') id: number, @Body() updateUserDto: UpdateUserDto) {
    return this.usersService.update(id, updateUserDto);
  }

  @Delete(':id')
  @ApiOperation({ summary: 'Delete user by ID' })
  @ApiCreatedResponse({
    description: 'Delete user by ID',
  })
  remove(@Param('id') id: number) {
    this.usersService.remove(id);
  }
}
