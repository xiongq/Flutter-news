import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:news/common/entity/entity.dart';
import 'package:news/common/router/router.gr.dart';
import 'package:news/common/utils/utils.dart';
import 'package:news/common/values/values.dart';
import 'package:news/common/widgets/widgets.dart';

Widget newsPageList({NewsPageListResponseEntity pageList}) {
  return Container(
    child: Column(
      children: pageList.items.map((item) {
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
                      Expanded(
                        flex: 1,
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: imageCached(
                            item.thumbnail,
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Text(item.author,
                                style: TextStyle(
                                  fontFamily: 'Avenir',
                                  fontWeight: FontWeight.normal,
                                  color: AppColors.thirdElementText,
                                  fontSize: duSetFontSize(14),
                                  height: 1,
                                )),
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
                            Row(
                              // crossAxisAlignment:
                              //     CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  item.category,
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
                                Text(
                                  "  •  11m ago",
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
                                    size: 20,
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
