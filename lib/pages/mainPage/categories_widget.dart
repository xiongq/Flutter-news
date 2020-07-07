import 'package:flutter/material.dart';
import 'package:news/common/entity/entity.dart';
import 'package:news/common/utils/utils.dart';
import 'package:news/common/values/values.dart';

Widget categoriseWidget({
  List<CategoryResponseEntity> list,
  String selectCategorCode,
  Function(CategoryResponseEntity) onTap,
}) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: list.map<Widget>((item) {
        return Container(
          // height: duSetHeight(44),
          margin: EdgeInsets.all(8),
          // padding: EdgeInsets.symmetric(horizontal: 2),
          child: GestureDetector(
            child: Center(
              child: Text(
                item.title,
                style: TextStyle(
                  color: selectCategorCode == item.code
                      ? AppColors.secondaryElementText
                      : AppColors.primaryText,
                  fontSize: duSetFontSize(20),
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            onTap: () => onTap(item),
          ),
        );
      }).toList(),
    ),
  );
}
