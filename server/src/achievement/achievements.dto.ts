// create-achievement.dto.ts
export class CreateAchievementDto {
  name: string;
  description: string;
  usersId: number;
}

// update-achievement.dto.ts (для обновления)
export class UpdateAchievementDto {
  name?: string;
  description?: string;
  usersId?: number;
}
