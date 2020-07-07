import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:news/common/router/router.gr.dart';
import 'package:news/common/utils/utils.dart';
import 'package:news/common/values/values.dart';
import 'package:news/common/widgets/widgets.dart';
import 'package:news/pages/account/account.dart';
import 'package:news/pages/bookmarks/bookmarkPage.dart';
import 'package:news/pages/category/categoryPage.dart';
import 'package:news/pages/mainPage/mainPage.dart';

class ApplicationPage extends StatefulWidget {
  ApplicationPage({Key key}) : super(key: key);

  @override
  _ApplicationPageState createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage>
    with SingleTickerProviderStateMixin {
  // 页控制器
  PageController _pageController;
  // 当前 tab 页码
  int _page = 0;

   // tab 页标题
  final List<String> _tabTitles = [
    'Welcome',
    'Cagegory',
    'Bookmarks',
    'Account'
  ];

  @override
  void initState() {
    super.initState();
    _pageController = new PageController(initialPage: this._page);
  }

  // tab栏动画
  void _handleNavBarTap(int index) {
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 200), curve: Curves.ease);
  }

  // tab栏页码切换
  void _handlePageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }

  final List<BottomNavigationBarItem> _bottomTabs = <BottomNavigationBarItem>[
    new BottomNavigationBarItem(
      icon: Icon(
        Iconfont.home,
        color: AppColors.tabBarElement,
      ),
      activeIcon: Icon(
        Iconfont.home,
        color: AppColors.secondaryElementText,
      ),
      title: Text('main'),
      backgroundColor: AppColors.primaryBackground,
    ),
    new BottomNavigationBarItem(
      icon: Icon(
        Iconfont.grid,
        color: AppColors.tabBarElement,
      ),
      activeIcon: Icon(
        Iconfont.grid,
        color: AppColors.secondaryElementText,
      ),
      title: Text('category'),
      backgroundColor: AppColors.primaryBackground,
    ),
    new BottomNavigationBarItem(
      icon: Icon(
        Iconfont.tag,
        color: AppColors.tabBarElement,
      ),
      activeIcon: Icon(
        Iconfont.tag,
        color: AppColors.secondaryElementText,
      ),
      title: Text('tag'),
      backgroundColor: AppColors.primaryBackground,
    ),
    new BottomNavigationBarItem(
      icon: Icon(
        Iconfont.me,
        color: AppColors.tabBarElement,
      ),
      activeIcon: Icon(
        Iconfont.me,
        color: AppColors.secondaryElementText,
      ),
      title: Text('my'),
      backgroundColor: AppColors.primaryBackground,
    ),
  ];

  Widget _buildAppBar() {
    return transparentAppBar(
        context: context,
        title: Text(
          _tabTitles[_page],
          style: TextStyle(
            color: AppColors.primaryText,
            fontFamily: 'Montserrat',
            fontSize: duSetFontSize(18.0),
            fontWeight: FontWeight.w600,
          ),
        ),
        // leading: IconButton(
        //   icon: Icon(
        //     Icons.arrow_back,
        //     color: AppColors.primaryText,
        //   ),
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        // ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: AppColors.primaryText,
            ),
            onPressed: () {
              ExtendedNavigator.rootNavigator.pushNamed(Routes.searchPageRoute);

            },
          )
        ]);
  }

  Widget _buildPageView() {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        MainPage(),
        CategoryPage(),
        BookMarkPage(),
        AccountPage(),
      ],
      controller: _pageController,
      onPageChanged: _handlePageChanged,
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: _bottomTabs, currentIndex: _page,
      // fixedColor: AppColors.primaryElement,
      type: BottomNavigationBarType.fixed,
      onTap: _handleNavBarTap,
      // selectedItemColor: Colors.red,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(child: _buildPageView()),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
}
