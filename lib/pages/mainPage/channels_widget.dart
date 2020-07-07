import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:news/common/entity/entity.dart';
import 'package:news/common/router/router.gr.dart';
import 'package:news/common/utils/utils.dart';
import 'package:news/common/values/values.dart';

Widget channelsWidget({
  List<ChannelResponseEntity> channels,
}) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 20),
    height: duSetWidth(102),
    // width: double.infinity,
    child: GridView.count(
      scrollDirection: Axis.horizontal,
      primary: false,
      crossAxisSpacing: 0,
      mainAxisSpacing: 10,
      crossAxisCount: 1,
      //宽高比
      childAspectRatio: 97 / 70,
      shrinkWrap: true,
      children: channels.map((item) {
        return InkWell(
            onTap: () {
              print(item.title);
              ExtendedNavigator.rootNavigator.pushNamed(
                Routes.channelPageRoute,
                arguments: ChannelPageArguments(
                  entity: item,
                ),
              );
            },
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: duSetHeight(64),
                    width: duSetHeight(64),
                    child: Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(item.thumbnail),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primaryBackground,
                      shape: BoxShape.circle,
                      boxShadow: [
                        Shadows.primaryShadow,
                      ],
                    ),
                  ),
                  // Spacer(),
                  SizedBox(height: 12),
                  Expanded(
                    child: Text(
                      item.title,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.clip,
                      maxLines: 1,
                      style: TextStyle(
                        color: AppColors.thirdElementText,
                        fontFamily: "Avenir",
                        fontWeight: FontWeight.w400,
                        fontSize: duSetFontSize(14),
                        height: 1,
                      ),
                    ),
                  ),
                  Spacer(),
                  // SizedBox(height: 12),
                ],
              ),
            ));
      }).toList(),
    ),
  );
}
