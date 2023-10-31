import 'package:meta/meta.dart';

import 'package:clean_flutter_app/domain/entities/account_entity.dart';

abstract class Autentication {
  Future<AcocountEntity> auth({
    @required String email,
    @required String password,
  });
}
