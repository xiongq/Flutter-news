import 'package:flutter/material.dart';
import 'package:news/common/apis/newsAPI.dart';
import 'package:news/common/entity/entity.dart';
import 'package:news/common/utils/utils.dart';
import 'package:news/common/values/values.dart';
import 'package:news/common/widgets/widgets.dart';
import 'package:news/pages/category/newList_blue_widget.dart';

class CategoryPage extends StatefulWidget {
  CategoryPage({Key key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
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
    // _channels = await NewsAPI.channels(
    //   cacheDisk: true,
    //   context: context,
    // );

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
        "Politics",
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

  Widget _buildTags() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: <Widget>[
            FlatButton(
              onPressed: () {},
              child: Text(
                "#item",
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: AppColors.primaryText,
                  fontFamily: 'Montserrat',
                  fontSize: duSetFontSize(16.0),
                  fontWeight: FontWeight.w500,
                ),
              ),
              color: AppColors.secondaryElement,
              shape: RoundedRectangleBorder(
                borderRadius: Radii.k6pxRadius,
              ),
            ),
            SizedBox(
              width: duSetWidth(10),
            ),
            FlatButton(
              onPressed: () {},
              child: Text(
                "#Jump",
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: AppColors.primaryText,
                  fontFamily: 'Montserrat',
                  fontSize: duSetFontSize(16.0),
                  fontWeight: FontWeight.w500,
                ),
              ),
              color: AppColors.secondaryElement,
              shape: RoundedRectangleBorder(
                borderRadius: Radii.k6pxRadius,
              ),
            ),
            SizedBox(
              width: duSetWidth(10),
            ),
            FlatButton(
              onPressed: () {},
              child: Text(
                "#row",
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: AppColors.primaryText,
                  fontFamily: 'Montserrat',
                  fontSize: duSetFontSize(16.0),
                  fontWeight: FontWeight.w500,
                ),
              ),
              color: AppColors.secondaryElement,
              shape: RoundedRectangleBorder(
                borderRadius: Radii.k6pxRadius,
              ),
            ),
            SizedBox(
              width: duSetWidth(10),
            ),
            FlatButton(
              onPressed: () {},
              child: Text(
                "#pro",
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: AppColors.primaryText,
                  fontFamily: 'Montserrat',
                  fontSize: duSetFontSize(16.0),
                  fontWeight: FontWeight.w500,
                ),
              ),
              color: AppColors.secondaryElement,
              shape: RoundedRectangleBorder(
                borderRadius: Radii.k6pxRadius,
              ),
            ),
            SizedBox(
              width: duSetWidth(10),
            ),
            FlatButton(
              onPressed: () {},
              child: Text(
                "#Montserrat",
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: AppColors.primaryText,
                  fontFamily: 'Montserrat',
                  fontSize: duSetFontSize(16.0),
                  fontWeight: FontWeight.w500,
                ),
              ),
              color: AppColors.secondaryElement,
              shape: RoundedRectangleBorder(
                borderRadius: Radii.k6pxRadius,
              ),
            ),
            SizedBox(
              width: duSetWidth(10),
            ),
            FlatButton(
              onPressed: () {},
              child: Text(
                "#swippe",
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: AppColors.primaryText,
                  fontFamily: 'Montserrat',
                  fontSize: duSetFontSize(16.0),
                  fontWeight: FontWeight.w500,
                ),
              ),
              color: AppColors.secondaryElement,
              shape: RoundedRectangleBorder(
                borderRadius: Radii.k6pxRadius,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecomedNew() {
    return _newsPageList == null
        ? Container()
        : Container(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _newsPageList.items.map(
                  (item) {
                    return Container(
                      padding: EdgeInsets.only(left: 20),
                      width: duSetWidth(319),
                      height: duSetWidth(385),
                      child: hotNewsWidget(entity: item, maxLine: 2),
                    );
                    // return Text("data");
                  },
                ).toList(),
              ),
            ),
          );
  }

  ///新闻列表
  Widget _buildNewsList() {
    return _newsPageList == null
        ? Container(
            height: duSetHeight(161 * 5 + 100.0),
          )
        : newsPageListBlue(pageList: _newsPageList);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildHeader(),
                Divider(),
                _buildTags(),
                _buildRecomedNew(),
                Divider(),
                _buildNewsList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
