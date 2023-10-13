import { IsOptional } from 'class-validator';

export class CreateUserDto {
  @IsOptional()
  user_photos?: number[];

  @IsOptional()
  user_achievements?: number[];
}

export class UpdateUserDto {
  @IsOptional()
  user_photos?: number[];

  @IsOptional()
  user_achievements?: number[];
}
