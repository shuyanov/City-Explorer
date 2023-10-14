import { IsString, IsInt, IsOptional, IsNumber } from 'class-validator';

export class CreatePhotoDto {
  @IsString()
  description: string;

  @IsString()
  url_image: string;

  @IsNumber()
  latitude: number;

  @IsNumber()
  longitude: number;

  @IsString()
  city: string;

  @IsOptional()
  @IsInt()
  usersId?: number;
}

export class UpdatePhotoDto {
  @IsString()
  @IsOptional()
  description?: string;

  @IsString()
  @IsOptional()
  url_image?: string;

  @IsOptional()
  @IsNumber()
  latitude?: number;

  @IsOptional()
  @IsNumber()
  longitude?: number;

  @IsString()
  @IsOptional()
  city?: string;

  @IsOptional()
  @IsInt()
  usersId?: number;
}
