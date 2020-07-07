import 'package:flutter/material.dart';
import 'package:news/common/entity/entity.dart';
import 'package:news/common/utils/utils.dart';
import 'package:news/common/values/values.dart';
import 'package:news/common/widgets/imageCache.dart';

Widget hotNewsWidget({NewsRecommendResponseEntity entity, int maxLine = 3}) {
  return Container(
    // padding: const EdgeInsets.only(bottom: 8),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1,
          child: imageCached(
            entity.thumbnail,
          ),
        ),
        SizedBox(height: duSetHeight(15)),
        Text(
          entity.title,
          maxLines: maxLine,
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w500,
            color: AppColors.primaryText,
            fontSize: duSetFontSize(16),
          ),
        ),
        SizedBox(height: duSetHeight(10)),
        Spacer(),
        // SizedBox(height:14),
        Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              entity.category,
              style: TextStyle(
                fontFamily: 'Avenir',
                fontWeight: FontWeight.normal,
                color: AppColors.secondaryElementText,
                fontSize: duSetFontSize(14),
                height: 1,
              ),
              overflow: TextOverflow.clip,
              maxLines: 1,
            ),
            // Text("  •  "),
            Text(
              "  •  1m ago",
              style: TextStyle(
                fontFamily: 'Avenir',
                fontWeight: FontWeight.normal,
                color: AppColors.thirdElementText,
                fontSize: duSetFontSize(14),
                height: 1,
              ),
              overflow: TextOverflow.clip,
              maxLines: 1,
            ),
            // 更多
            // Spacer(),
          ],
        ),
      ],
    ),
    // color: Colors.teal[100],
  );
}
