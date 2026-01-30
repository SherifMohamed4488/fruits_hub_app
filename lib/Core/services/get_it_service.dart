
import 'package:fruits_hub/Core/repos/order_repo/order_repo_impl.dart';
import 'package:fruits_hub/Core/services/database_service.dart';
import 'package:fruits_hub/Core/services/firebase_auth_service.dart';
import 'package:fruits_hub/Core/services/firestore_service.dart';
import 'package:fruits_hub/Features/auth/data/repos/auth_repo_impl.dart';
import 'package:fruits_hub/Features/auth/domain/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';

import '../repos/order_repo/order_repo.dart';
import '../repos/product_repo.dart';
import '../repos/product_repo_impl.dart';

GetIt getIt = GetIt.instance;

void setUpGetIt(){

  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<DatabaseService>(FirestoreService());

  getIt.registerSingleton<AuthRepo>(AuthRepoImpl(firebaseAuthService: getIt<FirebaseAuthService>() ,
      databaseService: getIt<DatabaseService>()));

  getIt.registerSingleton<ProductRepo>(ProductRepoImpl(databaseService: getIt<DatabaseService>()));

  getIt.registerSingleton<OrderRepo>(OrderRepoImpl(getIt<DatabaseService>()));

}