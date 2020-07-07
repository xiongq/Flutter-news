import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:news/common/entity/entity.dart';
import 'package:news/common/router/router.gr.dart';
import 'package:news/common/utils/utils.dart';
import 'package:news/common/values/values.dart';
import 'package:news/common/widgets/widgets.dart';

Widget newsPageListBlue({
  NewsPageListResponseEntity pageList,

  ///0 默认样式  1.无图模式  2. 16：9图在上
  int style = 0,
  bool showLoop = false,
}) {
  int index = 0;
  return Container(
    child: Column(
      children: pageList.items.map((item) {
        
        if (showLoop) {
          style = index % 3;
          index++;
        }
        return InkWell(
          onTap: () {
            ExtendedNavigator.rootNavigator.pushNamed(
              Routes.detailsPageRoute,
              arguments: DetailsPageArguments(newsItem: item),
            );
          },
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      style == 0
                          ? Expanded(
                              flex: 1,
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: imageCached(
                                  item.thumbnail,
                                ),
                              ),
                            )
                          : Container(),
                      style == 0 ? SizedBox(width: 20) : Container(),
                      Expanded(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            style == 2
                                ? AspectRatio(
                                    aspectRatio: 16 / 9,
                                    child: imageCached(
                                      item.thumbnail,
                                    ),
                                  )
                                : Container(),
                            SizedBox(height: 14),
                            Text(
                              item.author,
                              style: TextStyle(
                                fontFamily: 'Avenir',
                                fontWeight: FontWeight.normal,
                                color: AppColors.secondaryElementText,
                                fontSize: duSetFontSize(14),
                                height: 1,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              item.title,
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w500,
                                color: AppColors.primaryText,
                                fontSize: duSetFontSize(16),
                                height: 1.3,
                              ),
                              overflow: TextOverflow.clip,
                              maxLines: 3,
                            ),
                            SizedBox(height: 10),
                            Row(
                              // crossAxisAlignment:
                              //     CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "11m ago",
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
                    ],
                  ),
                ),
              ),
              Divider(
                height: 1,
              ),
            ],
          ),
        );
      }).toList(),
    ),
  );
}
