import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:inventory_system/common/data/common_remote_data_source.dart';
import 'package:inventory_system/features/auth/data/datasource/auth_remote_data_source.dart';
import 'package:inventory_system/features/auth/domain/repository/auth_repository.dart';
import 'package:inventory_system/features/auth/domain/repository/auth_repository_impl.dart';
import 'package:inventory_system/features/auth/presentation/controller/auth_controller.dart';
import 'package:inventory_system/features/user/data/datasource/user_remote_data_source.dart';
import 'package:inventory_system/features/user/domain/repository/user_repository.dart';
import 'package:inventory_system/features/user/domain/repository/user_repository_impl.dart';
import 'package:inventory_system/features/user/presentation/controller/user_controller.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! External
  // sl.registerLazySingleton(() => Dio());

  ///Controller ------------------------------------------------------------------
  sl.registerFactory(() => AuthController(authRepository: sl()));
  sl.registerFactory(() => UserController(userRepository: sl()));

  /// REPOSITORY ---------------------------------------------------------------
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      authRemoteDataSource: sl(),
    ),
  );
  sl.registerLazySingleton<UserRepository>(
        () =>UserRepositoryImpl(
      userRemoteDataSource: sl(),
      commonRemoteDataSource: sl()
    ),
  );

  ///DATA SOURCES --------------------------------------------------------------
  sl.registerLazySingleton(() => AuthRemoteDataSource());
  sl.registerLazySingleton(() => CommonRemoteDataSource());
  sl.registerLazySingleton(() => UserRemoteDataSource());
}
