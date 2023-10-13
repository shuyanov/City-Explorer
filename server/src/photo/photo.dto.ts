export class CreatePhotoDto {
  description: string;
  url_image: string;
  latitude: number;
  longitude: number;
  city: string;
  usersId?: number;
}

export class UpdatePhotoDto {
  description: string;
  url_image: string;
  latitude: number;
  longitude: number;
  city: string;
  usersId?: number;
}
