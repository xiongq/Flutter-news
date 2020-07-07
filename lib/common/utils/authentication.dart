import 'package:flutter/material.dart';
import 'package:news/common/utils/utils.dart';
import 'package:news/common/values/values.dart';
import 'package:news/global.dart';

/// 检查 token
Future<bool> isAuthenticated() async {
  var profileJson = StorageUtil().getJSON(STORAGE_USER_PROFILE_KEY);
  return profileJson != null ? true : false;
}

/// 删除token
Future deleteAuthentication() async {
  await StorageUtil().remove(STORAGE_USER_PROFILE_KEY);
  Global.profile = null;
}

/// 重洗登录 logo_in
///
Future goLoginPage(BuildContext context) async {
  await deleteAuthentication();
  Navigator.pushNamedAndRemoveUntil(context, 'sign-in', (route) => false);
}
