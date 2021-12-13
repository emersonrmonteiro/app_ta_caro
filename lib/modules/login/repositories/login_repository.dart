import '../../../shared/model/user_model.dart';

abstract class ILoginRepository {
  Future<UserModel> login({
    required String email,
    required String password,
  });

  Future<UserModel> createAccount({
    required String email,
    required String password,
    required String name,
  });
}
