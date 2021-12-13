import '../../../shared/model/user_model.dart';
import '../../../shared/services/app_database.dart';
import 'login_repository.dart';

class LoginRepositoryImpl implements ILoginRepository {
  final AppDatabase database;

  LoginRepositoryImpl({required this.database});

  @override
  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    final response = await database.login(
      email: email,
      password: password,
    );
    return response;
  }

  @override
  Future<UserModel> createAccount({
    required String email,
    required String password,
    required String name,
  }) async {
    final response = await database.createAccount(
        email: email, password: password, name: name);
    return response;
  }
}
