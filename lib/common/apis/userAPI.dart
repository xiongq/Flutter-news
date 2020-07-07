import 'package:flutter/material.dart';
import 'package:news/common/entity/entity.dart';
import 'package:news/common/utils/utils.dart';

/// 用户
class UserAPI {
  /// 登录
  static Future<UserLoginReponseEntity> login({
    @required BuildContext context,
    UserLoginRequestEntity params,
  }) async {
    var response = await HttpUtil().post(
      '/user/login',
      params: params,
      context: context,
    );
    return UserLoginReponseEntity.fromJson(response);
  }
}
