import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:news/common/apis/newsAPI.dart';
import 'package:news/common/entity/entity.dart';
import 'package:news/common/utils/utils.dart';
import 'package:news/common/values/values.dart';
import 'package:news/common/widgets/widgets.dart';
import 'package:news/pages/mainPage/categories_widget.dart';
import 'package:news/pages/mainPage/newsList_widget.dart';
import 'package:news/pages/mainPage/recommend_widget.dart';

class ChannelPage extends StatefulWidget {
  final ChannelResponseEntity entity;
  ChannelPage({Key key, this.entity}) : super(key: key);

  @override
  _ChannelPageState createState() => _ChannelPageState();
}

class _ChannelPageState extends State<ChannelPage> {
  NewsPageListResponseEntity _newsPageList; // 新闻翻页
  NewsRecommendResponseEntity _newsRecommend; // 新闻推荐
  List<CategoryResponseEntity> _categories; // 分类
  List<ChannelResponseEntity> _channels; // 频道
  String _selCategoryCode; // 选中的分类Code



  
  Widget _buildAppBar() {
    return transparentAppBar(
      context: context,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: AppColors.primaryText,
        ),
        onPressed: () {
          ExtendedNavigator.rootNavigator.pop();
        },
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.bookmark_border,
            color: AppColors.primaryText,
          ),
          onPressed: () {
            ExtendedNavigator.rootNavigator.pop();
          },
        ),
        IconButton(
          icon: Icon(
            Icons.search,
            color: AppColors.primaryText,
          ),
          onPressed: () {
            // Share.share(widget.newsItem.title,subject: widget.newsItem.url);
          },
        ),
      ],
    );
  }

  Widget _buildPageTitle() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // 标题
                Text(
                  widget.entity.title,
                  overflow: TextOverflow.clip,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.normal,
                    fontSize: duSetFontSize(30),
                    color: AppColors.thirdElement,
                  ),
                ),
                // 作者
                Text(
                  widget.entity.code,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    fontFamily: "Avenir",
                    fontWeight: FontWeight.normal,
                    fontSize: duSetFontSize(14),
                    color: AppColors.thirdElementText,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 20),
          CircleAvatar(
            radius: duSetWidth(30),
            backgroundImage: NetworkImage(widget.entity.thumbnail),
          ),
        ],
      ),
    );
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
    ///新闻列表
  Widget _buildNewsList() {
    return _newsPageList == null
        ? Container(
            height: duSetHeight(161 * 5 + 100.0),
          )
        : newsPageList(pageList: _newsPageList);
  }
  
  @override
  void initState() {
    super.initState();
    // _controller = EasyRefreshController();
    _loadAllData();
    // _loadLatestWithDiskCache();
  }

  // // 如果有磁盘缓存，延迟3秒拉取更新档案
  // _loadLatestWithDiskCache() {
  //   if (CACHE_ENABLE == true) {
  //     var cacheData = StorageUtil().getJSON(STORAGE_INDEX_NEWS_CACHE_KEY);
  //     if (cacheData != null) {
  //       Timer(Duration(seconds: 1), () {
  //         _controller.callRefresh();
  //       });
  //     }
  //   }
  // }

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
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _buildPageTitle(),
            _buildCategories(),
            Divider(),
            _buildRecommend(),
            Divider(),
            _buildNewsList(),
          ],
        ),
      ),
    );
  }
}
