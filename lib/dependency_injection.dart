import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:inventory_system/features/auth/data/datasource/auth_remote_data_source.dart';
import 'package:inventory_system/features/auth/domain/repository/auth_repository.dart';
import 'package:inventory_system/features/auth/domain/repository/auth_repository_impl.dart';
import 'package:inventory_system/features/auth/presentation/controller/auth_controller.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! External
  // sl.registerLazySingleton(() => Dio());

  ///Controller ------------------------------------------------------------------
  //Auth
  sl.registerFactory(() => AuthController(authRepository: sl()));

  /// REPOSITORY ---------------------------------------------------------------
  //Auth
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      authRemoteDataSource: sl(),
    ),
  );

  ///DATA SOURCES --------------------------------------------------------------
  sl.registerLazySingleton(() => AuthRemoteDataSource());
}
