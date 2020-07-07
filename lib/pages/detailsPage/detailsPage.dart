import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:news/common/entity/entity.dart';
import 'package:news/common/utils/utils.dart';
import 'package:news/common/values/values.dart';
import 'package:news/common/widgets/widgets.dart';
import 'package:news/pages/mainPage/recommend_widget.dart';
import 'package:share/share.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailsPage extends StatefulWidget {
  final NewsRecommendResponseEntity newsItem;
  DetailsPage({Key key, this.newsItem}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  bool _isPageFinished = false;
  double _webViewHeight = 900;

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
            Icons.share,
            color: AppColors.primaryText,
          ),
          onPressed: () {
            Share.share(widget.newsItem.title,subject: widget.newsItem.url);
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
                  widget.newsItem.category,
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
                  widget.newsItem.author,
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
            backgroundImage: AssetImage("assets/images/feature-3.png"),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return recommendWidget(recommend: widget.newsItem);
  }

  Widget _buildWebView() {
    return Container(
      height: _webViewHeight,
      child: WebView(
        initialUrl: widget.newsItem.url,
        // '$SERVER_API_URL/news/content/${widget.item.id}', //widget.url,
        javascriptMode: JavascriptMode.unrestricted,
        javascriptChannels: <JavascriptChannel>[
          _invokeJavascriptChannel(context),
        ].toSet(),
        onWebViewCreated: (WebViewController webViewController) async {
          _controller.complete(webViewController);
        },
        navigationDelegate: (NavigationRequest request) {
          if (request.url != widget.newsItem.url) {
            // toastInfo(msg: request.url);
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
        onPageStarted: (String url) {
          Timer(Duration(seconds: 1), () {
            // setState(() {
            //   _isPageFinished = true;
            // });
            _removeWebViewAd();
            // _getViewHeight();
          });
        },
        onPageFinished: (String url) {
          _getWebViewHeight();
          setState(() {
            _isPageFinished = true;
          });
        },
        gestureNavigationEnabled: true,
      ),
    );
  }

  _removeWebViewAd() async {
    await (await _controller.future)?.evaluateJavascript('''
      try {
        function removeElement(elementName){
          let _element = document.getElementById(elementName);
          if(!_element) {
            _element = document.querySelector(elementName);
          }
          if(!_element) {
            return;
          }
          let _parentElement = _element.parentNode;
          if(_parentElement){
              _parentElement.removeChild(_element);
          }
        }

        removeElement('module-engadget-deeplink-top-ad');
        removeElement('module-engadget-deeplink-streams');
        removeElement('footer');
      } catch{}
      ''');
  }

  // 获取页面高度
  _getWebViewHeight() async {
    await (await _controller.future)?.evaluateJavascript('''
        try {
          // Invoke.postMessage([document.body.clientHeight,document.documentElement.clientHeight,document.documentElement.scrollHeight]);
          let scrollHeight = document.documentElement.scrollHeight;
          if (scrollHeight) {
            Invoke.postMessage(scrollHeight);
          }
        } catch {}
        ''');
  }

  // 注册js回调
  JavascriptChannel _invokeJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Invoke',
        onMessageReceived: (JavascriptMessage message) {
          print(message.message);
          var webHeight = double.parse(message.message);
          if (webHeight != null) {
            setState(() {
              _webViewHeight = webHeight;
            });
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: Stack(children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _buildPageTitle(),
                Divider(),
                // _buildHeader(),
                _buildWebView(),
              ],
            ),
          ),
          _isPageFinished == true
              ? Container()
              : Align(
                  alignment: Alignment.center,
                  child: LoadingBouncingGrid.square(),
                ),
        ]),
      ),
    );
  }
}
