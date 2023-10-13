import { Injectable, NotFoundException } from '@nestjs/common';

@Injectable()
export class UsersService {
  private users: any[] = [];

  findAll(): any[] {
    return this.users;
  }

  findOne(id: number): any {
    const user = this.users.find((user) => user.id === id);
    if (!user) {
      throw new NotFoundException('User not found');
    }
    return user;
  }

  create(userData: any): any {
    const newUser = { ...userData, id: this.generateUniqueId() };
    this.users.push(newUser);
    return newUser;
  }

  update(id: number, userData: any): any {
    const userIndex = this.users.findIndex((user) => user.id === id);
    if (userIndex === -1) {
      throw new NotFoundException('User not found');
    }
    this.users[userIndex] = { ...this.users[userIndex], ...userData };
    return this.users[userIndex];
  }

  remove(id: number): void {
    const userIndex = this.users.findIndex((user) => user.id === id);
    if (userIndex === -1) {
      throw new NotFoundException('User not found');
    }
    this.users.splice(userIndex, 1);
  }

  private currentUserId = 1;

  private generateUniqueId(): number {
    const newUserId = this.currentUserId;
    this.currentUserId++;
    return newUserId;
  }
}
