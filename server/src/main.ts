import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
// !
import { PrismaService } from './prisma/prisma.service';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);

  // !
  const prismaService = app.get(PrismaService);
  await prismaService.enableShutdownHooks(app);

  // обратите внимание на порт
  await app.listen(3001);
}
bootstrap();
