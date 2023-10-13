import { Module } from '@nestjs/common';
import { SwaggerModule, DocumentBuilder } from '@nestjs/swagger';

@Module({})
export class SwaggerDocsModule {
  static createDocument(app) {
    const config = new DocumentBuilder()
      .setTitle('City Explorer')
      .setDescription('City Explorer documentation')
      .setVersion('1.0')
      .addTag('achievements', 'Operations related to achievements')
      .build();

    const document = SwaggerModule.createDocument(app, config);
    SwaggerModule.setup('api', app, document);
  }
}
