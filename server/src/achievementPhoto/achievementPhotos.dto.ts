import { IsUrl } from 'class-validator';

export class CreateAchievementPhotoDto {
  @IsUrl()
  url_image: string;
}
