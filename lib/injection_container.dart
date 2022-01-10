import 'package:get_it/get_it.dart';
import 'package:pin_code_app/data/pin_repository_impl.dart';
import 'package:pin_code_app/domain/usecases/check_pin.dart';
import 'package:pin_code_app/domain/usecases/write_pin.dart';
import 'package:pin_code_app/ui/authentication_screen/authentication_cubit.dart';
import 'package:pin_code_app/ui/create_pin_code_screen/cubit/pin_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> init () async {
  getIt.registerFactory(() => PinCubit(getIt()));
  getIt.registerFactory(() => AuthenticationCubit(getIt()));

  getIt.registerLazySingleton(() => WritePin(getIt<PinRepositoryImpl>()));
  getIt.registerLazySingleton(() => CheckPin(getIt<PinRepositoryImpl>()));

  getIt.registerLazySingleton<PinRepositoryImpl>(() => PinRepositoryImpl(sharedPreferences: getIt()));

  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);
}