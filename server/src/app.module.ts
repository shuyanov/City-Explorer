import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { PrismaService } from './prisma/prisma.service';
import { UsersModule } from './user/users.module';

@Module({
  imports: [UsersModule],
  controllers: [AppController],
  providers: [PrismaService, AppService],
})
export class AppModule {}
