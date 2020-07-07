import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:news/common/entity/entity.dart';
import 'package:news/common/router/router.gr.dart';
import 'package:news/common/utils/utils.dart';
import 'package:news/common/values/values.dart';
import 'package:news/common/widgets/widgets.dart';

Widget recommendWidget({
  NewsRecommendResponseEntity recommend,
}) {
  return Container(
    padding: EdgeInsets.all(20),
    child: InkWell(
      onTap: () {
        // ExtendedNavigator.rootNavigator.push
        ExtendedNavigator.rootNavigator.pushNamed(Routes.detailsPageRoute,
            arguments: DetailsPageArguments(newsItem: recommend));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //image
          //author
          //title
          //row -> 分类  时间  更多
          AspectRatio(
            aspectRatio: 16 / 9,
            child: imageCached(
              recommend.thumbnail,
              width: duSetWidth(335),
              height: duSetHeight(200),
            ),
          ),
          SizedBox(
            height: 14,
          ),
          Text(
            recommend.author,
            style: TextStyle(
              fontFamily: 'Avenir',
              fontWeight: FontWeight.normal,
              color: AppColors.thirdElementText,
              fontSize: duSetFontSize(14),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            recommend.title,
            style: TextStyle(
              fontFamily: 'Avenir',
              fontWeight: FontWeight.w600,
              color: AppColors.primaryText,
              fontSize: duSetFontSize(24),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            // crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                recommend.category,
                style: TextStyle(
                  fontFamily: 'Avenir',
                  fontWeight: FontWeight.normal,
                  color: AppColors.secondaryElementText,
                  fontSize: duSetFontSize(16),
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
                  fontSize: duSetFontSize(16),
                  height: 1,
                ),
                overflow: TextOverflow.clip,
                maxLines: 1,
              ),
              // 更多
              Spacer(),
              InkWell(
                child: Icon(
                  Icons.more_horiz,
                  color: AppColors.primaryText,
                  size: 24,
                ),
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
