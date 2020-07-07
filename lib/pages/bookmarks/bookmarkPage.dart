import 'package:flutter/material.dart';
import 'package:news/common/apis/newsAPI.dart';
import 'package:news/common/entity/entity.dart';
import 'package:news/common/utils/utils.dart';
import 'package:news/common/values/values.dart';
import 'package:news/pages/category/newList_blue_widget.dart';
import 'package:news/pages/mainPage/channels_widget.dart';

class BookMarkPage extends StatefulWidget {
  BookMarkPage({Key key}) : super(key: key);

  @override
  _BookMarkPageState createState() => _BookMarkPageState();
}

class _BookMarkPageState extends State<BookMarkPage> {
  List<ChannelResponseEntity> _channels; // 频道
  // List<PopularTagsResponseEntity> _popularTagList; //流行标签
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

    // _popularTagList = await NewsAPI.populartags(
    //   context: context,
    //   cacheDisk: false,
    // );

    if (mounted) {
      setState(() {});
    }
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        "Bookmarks",
        textAlign: TextAlign.start,
        style: TextStyle(
          color: AppColors.primaryText,
          fontFamily: 'Montserrat',
          fontSize: duSetFontSize(30.0),
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }

  Widget _buildChannel() {
    return _channels == null
        ? Container()
        : Container(
            padding: EdgeInsets.only(top: 10),
            child: channelsWidget(channels: _channels),
          );
  }

  Widget _buildNews() {
    return _newsPageList == null
        ? Container()
        : Container(
            child: newsPageListBlue(
              pageList: _newsPageList,
              showLoop: true,
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildHeader(),
              Divider(),
              _buildChannel(),
              Divider(),
              _buildNews(),
            ],
          ),
        ),
      ),
    );
  }
}
