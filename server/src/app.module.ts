import { Module } from '@nestjs/common';
import { PrismaService } from './prisma/prisma.service';
import { UsersModule } from './user/users.module';

@Module({
  imports: [UsersModule],
  controllers: [],
  providers: [PrismaService]
})
export class AppModule {}
