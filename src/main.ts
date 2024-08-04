import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  await app.listen(3001);
}
bootstrap();


// <div class="slider-target slider-ltr slider-horizontal slider-txt-dir-ltr">
// <div class="slider-base"><div class="slider-connects"><div class="slider-connect" style="transform: translate(0%) scale(0.685393, 1);"></div></div><div class="slider-origin" style="transform: translate(-31.4607%); z-index: 4;"><div class="slider-handle slider-handle-lower" data-handle="0" tabindex="0" role="slider" aria-orientation="horizontal" aria-valuemin="1.0" aria-valuemax="90.0" aria-valuenow="62.0" aria-valuetext="62.00"><div class="slider-touch-area"></div></div></div></div>
//     </div>