import { Injectable } from '@nestjs/common';
import { PrismaService } from './prisma.service';
import { User } from '.prisma/client';

@Injectable()
export class UserService {
  constructor(private readonly prisma: PrismaService) {}

  async findUserById(id: number): Promise<User | null> {
    return this.prisma.user.findUnique({ where: { id } });
  }

  async findByUsername(username: string): Promise<User | null> {
    return this.prisma.user.findUnique({ where: { username } });
  }

  async createUser(data: {
    username: string;
    password: string;
  }): Promise<User> {
    return this.prisma.user.create({ data });
  }
}
