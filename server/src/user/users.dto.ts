export class CreateUserDto {
  name: string;

  user_photos?: number[];

  user_achievements?: number[];
}

export class UpdateUserDto {
  name: string;

  user_photos?: number[];

  user_achievements?: number[];
}
