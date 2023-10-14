export class CreateAchievementDto {
  name: string;

  description: string;

  usersId?: number;

  achievementPhotoId?: number;
}

export class UpdateAchievementDto {
  name?: string;

  description?: string;

  usersId?: number;

  achievementPhotoId?: number;
}
