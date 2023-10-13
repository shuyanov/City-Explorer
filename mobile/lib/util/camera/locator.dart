
import 'package:get_it/get_it.dart';
import 'package:test_hackaton/util/camera/cameraService.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<CameraService>(() => CameraService());
}