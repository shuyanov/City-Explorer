import { Injectable } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { UserService } from './user.service';
import { User } from '.prisma/client';
import { JwtPayload } from './jwt-payload.interface';

@Injectable()
export class AuthService {
  constructor(
    private readonly userService: UserService,
    private readonly jwtService: JwtService,
  ) {}

  async signPayload(payload: JwtPayload): Promise<string> {
    return this.jwtService.sign(payload);
  }

  async validateUser(payload: JwtPayload): Promise<User> {
    return this.userService.findUserById(payload.sub);
  }

  async login(user: User) {
    const payload: JwtPayload = { sub: user.id };
    return {
      access_token: this.signPayload(payload),
    };
  }
}
