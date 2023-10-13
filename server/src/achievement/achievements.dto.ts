// create-achievement.dto.ts
export class CreateAchievementDto {
  readonly name: string;
  readonly description: string;
  readonly usersId: number;
}

// update-achievement.dto.ts (для обновления)
export class UpdateAchievementDto {
  readonly name?: string;
  readonly description?: string;
  readonly usersId?: number;
}
