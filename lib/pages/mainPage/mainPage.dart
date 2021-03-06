import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:news/common/apis/newsAPI.dart';
import 'package:news/common/entity/entity.dart';
import 'package:news/common/utils/utils.dart';
import 'package:news/common/values/values.dart';
import 'package:news/common/widgets/widgets.dart';

import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:news/pages/mainPage/categories_widget.dart';
import 'package:news/pages/mainPage/channels_widget.dart';
import 'package:news/pages/mainPage/newsList_widget.dart';
import 'package:news/pages/mainPage/recommend_widget.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with AutomaticKeepAliveClientMixin {
  NewsPageListResponseEntity _newsPageList; // 新闻翻页
  NewsRecommendResponseEntity _newsRecommend; // 新闻推荐
  List<CategoryResponseEntity> _categories; // 分类
  List<ChannelResponseEntity> _channels; // 频道
  String _selCategoryCode; // 选中的分类Code

  EasyRefreshController _controller; // EasyRefresh控制器
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();
    _loadAllData();
    _loadLatestWithDiskCache();
    print("MainPage init");
  }

  // 如果有磁盘缓存，延迟3秒拉取更新档案
  _loadLatestWithDiskCache() {
    if (CACHE_ENABLE == true) {
      var cacheData = StorageUtil().getJSON(STORAGE_INDEX_NEWS_CACHE_KEY);
      if (cacheData != null) {
        Timer(Duration(seconds: 1), () {
          _controller.callRefresh();
        });
      }
    }
  }

  // 读取所有数据
  _loadAllData() async {
    _categories = await NewsAPI.categories(
      cacheDisk: true,
      context: context,
    );
    _channels = await NewsAPI.channels(
      cacheDisk: true,
      context: context,
    );
    _newsRecommend = await NewsAPI.newsRecommend(
      cacheDisk: true,
      context: context,
    );
    _newsPageList = await NewsAPI.newsPageList(
      cacheDisk: true,
      context: context,
    );

    _selCategoryCode = _categories.first.code;

    if (mounted) {
      setState(() {});
    }
  }

  // 拉取推荐、新闻
  _loadNewsData(
    categoryCode, {
    bool refresh = false,
  }) async {
    // _selCategoryCode = categoryCode;
    _newsRecommend = await NewsAPI.newsRecommend(
      params: NewsRecommendRequestEntity(categoryCode: categoryCode),
      refresh: refresh,
      cacheDisk: true,
      context: context,
    );
    _newsPageList = await NewsAPI.newsPageList(
      params: NewsPageListRequestEntity(categoryCode: categoryCode),
      refresh: refresh,
      cacheDisk: true,
      context: context,
    );
    if (mounted) {
      setState(() {});
    }
  }

  ///分类
  Widget _buildCategories() {
    return _categories == null
        ? Container()
        : categoriseWidget(
            list: _categories,
            selectCategorCode: _selCategoryCode,
            onTap: (CategoryResponseEntity item) {
              setState(() {
                _selCategoryCode = item.code;
              });
              _loadNewsData(item.code);
            });
  }

  /// 推荐新闻
  Widget _buildRecommend() {
    return _newsRecommend == null
        ? Container()
        : recommendWidget(recommend: _newsRecommend);
  }

  ///推荐频道
  Widget _buildChannels() {
    return _channels == null
        ? Container()
        : Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: channelsWidget(channels: _channels),
          );
  }

  ///新闻列表
  Widget _buildNewsList() {
    return _newsPageList == null
        ? Container(
            height: duSetHeight(161 * 5 + 100.0),
          )
        : newsPageList(pageList: _newsPageList);
  }

  Widget _buildEmailSubscribe() {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                "Newsletter",
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: duSetFontSize(18),
                  fontWeight: FontWeight.w600,
                  color: AppColors.thirdElement,
                ),
              ),
              Spacer(),
              IconButton(
                  icon: Icon(
                    Icons.close,
                    color: AppColors.thirdElementText,
                    size: 27,
                  ),
                  onPressed: () {})
            ],
          ),
          // email
          inputEmailEdit(
            marginTop: 19,
            keyboardType: TextInputType.emailAddress,
            hintText: "Email",
            isPassword: false,
            controller: null,
          ),
          // btn subcrible
          Padding(
            padding: EdgeInsets.only(top: 15),
            child: btnFlatButtonWidget(
              onPressed: () {},
              width: duSetWidth(335),
              height: duSetHeight(44),
              fontWeight: FontWeight.w600,
              fontSize: 16,
              title: "Subscribe",
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 20, 0),
            child: Text.rich(
              TextSpan(
                children: <InlineSpan>[
                  // WidgetSpan(
                  //   child: Container(
                  //     margin: EdgeInsets.only(right: 6),
                  //     child: ClipRRect(
                  //       borderRadius: BorderRadius.circular(4),
                  //       child: Container(
                  //         padding: EdgeInsets.symmetric(horizontal: 4),
                  //         color: Colors.red,
                  //         child: Text(
                  //           "自营",
                  //           textAlign: TextAlign.center,
                  //           style: new TextStyle(
                  //             color: Colors.white,
                  //             fontSize: 14,
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  WidgetSpan(
                    child: Container(
                      margin: EdgeInsets.only(right: 4),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 2),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(3)),
                          border: new Border.all(color: Colors.red, width: 1),
                        ),
                        child: Text(
                          "自营",
                          textAlign: TextAlign.center,
                          style: new TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                  ),
                  WidgetSpan(
                    child: Container(
                      margin: EdgeInsets.only(right: 4),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 2),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(3)),
                          border: new Border.all(color: Colors.red, width: 1),
                        ),
                        child: Text(
                          "WidgetSpan 测试",
                          textAlign: TextAlign.center,
                          style: new TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                  ),
                  WidgetSpan(
                    child: Container(
                      margin: EdgeInsets.only(right: 4),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 2),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(3)),
                          border: new Border.all(color: Colors.red, width: 1),
                        ),
                        child: Text(
                          "黑卡会员",
                          textAlign: TextAlign.center,
                          style: new TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                  ),
                  WidgetSpan(
                    child: Container(
                      margin: EdgeInsets.only(right: 4),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 2),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(3)),
                          border: new Border.all(
                              color: Colors.green, width: 1), // 边色与边宽度
                        ),
                        child: Text(
                          "新品",
                          textAlign: TextAlign.center,
                          style: new TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.w300,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                  ),

                  WidgetSpan(
                    child: Container(
                      margin: EdgeInsets.only(right: 6),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(3)),
                          border: new Border.all(
                              color: Colors.green, width: 1), // 边色与边宽度
                        ),
                        child: Text(
                          "小米",
                          textAlign: TextAlign.center,
                          style: new TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.w300,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                  ),
                  TextSpan(
                    text:
                        '小米手环5 NFC版 石墨黑 动态彩屏 智能运动监测 内置小爱同学语音遥控手机\n\nBy clicking on Subscribe button you agree to accept',
                    style: new TextStyle(
                      // color: AppColors.thirdElementText,
                      // fontFamily: "Avenir",
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      // backgroundColor: Colors.yellow,
                      // height: 2.4,
                    ),
                  ),
                  TextSpan(
                    text: ' Privacy Policy',
                    style: new TextStyle(
                      color: AppColors.secondaryElementText,
                      fontFamily: "Avenir",
                      fontWeight: FontWeight.w400,
                      fontSize: duSetFontSize(14),
                      // backgroundColor: Colors.red,
                      // height: 1.4,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        toastInfo(msg: 'Privacy Policy');
                      },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: _newsPageList == null
            ? cardListSkeleton()
            : EasyRefresh(
                enableControlFinishRefresh: true,
                controller: _controller,
                header: ClassicalHeader(),
                onRefresh: () async {
                  await _loadNewsData(
                    _selCategoryCode,
                    refresh: true,
                  );

                  _controller.finishRefresh();
                },
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      _buildCategories(),
                      Divider(height: 1),
                      _buildRecommend(),
                      Divider(height: 1),
                      _buildChannels(),
                      Divider(height: 1),
                      _buildNewsList(),
                      _buildEmailSubscribe(),
                    ],
                  ),
                ),
              ));
  }
}
