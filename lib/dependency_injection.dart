import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:inventory_system/common/data/common_remote_data_source.dart';
import 'package:inventory_system/features/auth/data/datasource/auth_remote_data_source.dart';
import 'package:inventory_system/features/auth/domain/repository/auth_repository.dart';
import 'package:inventory_system/features/auth/domain/repository/auth_repository_impl.dart';
import 'package:inventory_system/features/auth/presentation/controller/auth_controller.dart';
import 'package:inventory_system/features/barang/data/datasource/barang_remote_data_source.dart';
import 'package:inventory_system/features/barang/domain/repository/barang_repository.dart';
import 'package:inventory_system/features/barang/domain/repository/barang_repository_impl.dart';
import 'package:inventory_system/features/barang/presentation/controller/barang_controller.dart';
import 'package:inventory_system/features/transaksi/data/datasource/transaksi_remote_data_source.dart';
import 'package:inventory_system/features/transaksi/domain/repository/transaksi_repository.dart';
import 'package:inventory_system/features/transaksi/presentation/controller/transaksi_controller.dart';
import 'package:inventory_system/features/user/data/datasource/user_remote_data_source.dart';
import 'package:inventory_system/features/user/domain/repository/user_repository.dart';
import 'package:inventory_system/features/user/domain/repository/user_repository_impl.dart';
import 'package:inventory_system/features/user/presentation/controller/user_controller.dart';

import 'features/transaksi/domain/repository/transaksi_repository_impl.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! External
  // sl.registerLazySingleton(() => Dio());

  ///Controller ------------------------------------------------------------------
  sl.registerFactory(() => AuthController(authRepository: sl()));
  sl.registerFactory(() => UserController(userRepository: sl()));
  sl.registerFactory(() => BarangController(barangRepository: sl()));
  sl.registerFactory(() => TransaksiController(transaksiRepository: sl()));

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
  sl.registerLazySingleton<BarangRepository>(
        () =>BarangRepositoryImpl(
        barangRemoteDataSource: sl(),
        commonRemoteDataSource: sl()
    ),
  );
  sl.registerLazySingleton<TransaksiRepository>(
        () =>TransaksiRepositoryImpl(
        transaksiRemoteDataSource: sl()
    ),
  );

  ///DATA SOURCES --------------------------------------------------------------
  sl.registerLazySingleton(() => AuthRemoteDataSource());
  sl.registerLazySingleton(() => CommonRemoteDataSource());
  sl.registerLazySingleton(() => UserRemoteDataSource());
  sl.registerLazySingleton(() => BarangRemoteDataSource());
  sl.registerLazySingleton(() => TransaksiRemoteDataSource());
}
