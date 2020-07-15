import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:news/common/apis/newsAPI.dart';
import 'package:news/common/entity/entity.dart';
import 'package:news/common/router/router.gr.dart';
import 'package:news/common/utils/utils.dart';
import 'package:news/common/values/values.dart';
import 'package:news/common/widgets/widgets.dart';
import 'package:news/pages/mainPage/channels_widget.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  // List<CategoryResponseEntity> _categories; // 分类
  List<ChannelResponseEntity> _channels; // 频道
  List<PopularTagsResponseEntity> _popularTagList; //流行标签
  NewsPageListResponseEntity _newsPageList; // 新闻翻页

  @override
  void initState() {
    super.initState();
    _loadAllData();
  }

  // 读取所有数据
  _loadAllData() async {
    _newsPageList = await NewsAPI.newsPageList(
      cacheDisk: true,
      context: context,
    );
    _channels = await NewsAPI.channels(
      cacheDisk: true,
      context: context,
    );

    _popularTagList = await NewsAPI.populartags(
      context: context,
      cacheDisk: true,
    );

    if (mounted) {
      setState(() {});
    }
  }

  Widget _buildAppBar() {
    return transparentAppBar(
      context: context,
      title: Text(
        "Search",
        style: TextStyle(
          color: AppColors.primaryText,
          fontFamily: 'Montserrat',
          fontSize: duSetFontSize(18.0),
          fontWeight: FontWeight.w600,
        ),
      ),
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: AppColors.primaryText,
        ),
        onPressed: () {
          ExtendedNavigator.rootNavigator.pop();
        },
      ),
    );
  }

  Widget _buildSearchTextField() {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      width: double.infinity,
      child: FlatButton(
        // color: Colors.blue,
        textColor: Colors.black,
        disabledColor: Colors.grey,
        disabledTextColor: Colors.black,
        padding: EdgeInsets.all(8.0),
        // splashColor: Colors.blueAccent,
        color: AppColors.secondaryElement,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(22)),
        ),
        onPressed: () {
          /*...*/
        },
        child: Row(
          children: <Widget>[
            SizedBox(width: 20),
            Icon(
              Icons.search,
              color: AppColors.tabBarElement,
            ),
            SizedBox(width: 6),
            Text(
              "Search...",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///推荐频道
  Widget _buildTopChannels() {
    return _channels == null
        ? Container()
        : Container(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Top channels",
                        style: TextStyle(
                          color: AppColors.thirdElementText,
                          fontFamily: 'Montserrat',
                          fontSize: duSetFontSize(18.0),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      FlatButton(
                          onPressed: () {},
                          child: Text(
                            "Show All",
                            style: TextStyle(
                              color: AppColors.secondaryElementText,
                              fontFamily: 'Avenir',
                              fontSize: duSetFontSize(18.0),
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                    ],
                  ),
                ),
                channelsWidget(channels: _channels),
              ],
            ),
          );
  }

  ///流行标签
  Widget _buildPopularTags() {
    return _popularTagList == null
        ? Container()
        : Container(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Popular tags",
                        style: TextStyle(
                          color: AppColors.thirdElementText,
                          fontFamily: 'Montserrat',
                          fontSize: duSetFontSize(18.0),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      FlatButton(
                        onPressed: () {},
                        child: Text(
                          "Show All",
                          style: TextStyle(
                            color: AppColors.secondaryElementText,
                            fontFamily: 'Avenir',
                            fontSize: duSetFontSize(18.0),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                  child: Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: _popularTagList.map((item) {
                      return Container(
                        // height: duSetHeight(32),
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppColors.secondaryElement,
                          borderRadius: Radii.k6pxRadius,
                        ),
                        child: Text(
                          item.tagName,
                          style: TextStyle(
                            color: AppColors.thirdElement,
                            fontFamily: 'Montserrat',
                            fontSize: duSetFontSize(16.0),
                            fontWeight: FontWeight.w400,
                            height: 1,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          );
  }

  Widget _buildHotNews() {
    return _newsPageList == null
        ? Container()
        : Container(
            margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Hot news",
                      style: TextStyle(
                        color: AppColors.thirdElementText,
                        fontFamily: 'Montserrat',
                        fontSize: duSetFontSize(18.0),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    FlatButton(
                      onPressed: () {},
                      child: Text(
                        "Show All",
                        style: TextStyle(
                          color: AppColors.secondaryElementText,
                          fontFamily: 'Avenir',
                          fontSize: duSetFontSize(18.0),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                GridView.count(
                  primary: false,
                  padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 20,
                  crossAxisCount: 2,
                  //宽高比
                  childAspectRatio: 160 / 270,
                  shrinkWrap: true,
                  children: _newsPageList.items.map((item) {
                    return InkWell(
                      child: hotNewsWidget(entity: item),
                      onTap: () {
                        ExtendedNavigator.rootNavigator.pushNamed(
                            Routes.detailsPageRoute,
                            arguments: DetailsPageArguments(newsItem: item));
                      },
                    );
                  }).toList(),
                ),
              ],
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              _buildSearchTextField(),
              Divider(),
              _buildTopChannels(),
              SizedBox(height:10),
              Divider(height: 1,),
              _buildPopularTags(),
              Divider(height: 1,),
              _buildHotNews(),
            ],
          ),
        ),
      ),
    );
  }
}
