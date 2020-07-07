import 'package:flutter/material.dart';
import 'package:news/common/entity/entity.dart';
import 'package:news/common/utils/utils.dart';
import 'package:news/common/values/values.dart';

class NewsAPI {
  /// 翻页
  static Future<NewsPageListResponseEntity> newsPageList({
    NewsPageListRequestEntity params,
    @required BuildContext context,
    bool refresh = false,
    bool cacheDisk = false,
  }) async {
    var response = await HttpUtil().get(
      '/news',
      params: params?.toJson(),
      refresh: refresh,
      cacheDisk: cacheDisk,
      context: context,
      cacheKey: STORAGE_INDEX_NEWS_CACHE_KEY,
    );
    return NewsPageListResponseEntity.fromJson(response);
  }

  /// refresh 是否刷新
  static Future<NewsPageListResponseEntity> newsPageLists({
    NewsPageListRequestEntity params,
    @required BuildContext context,
    bool refresh = false,
    bool cacheDisk = false,
  }) async {
    var response = await HttpUtil().get(
      '/news',
      params: params?.toJson(),
      refresh: refresh,
      cacheDisk: cacheDisk,
      context: context,
    );
    return NewsPageListResponseEntity.fromJson(response);
  }

  /// 推荐新闻
  static Future<NewsRecommendResponseEntity> newsRecommend({
    NewsRecommendRequestEntity params,
    @required BuildContext context,
    bool refresh = false,
    bool cacheDisk = false,
  }) async {
    var response = await HttpUtil().get(
      '/news/recommend',
      params: params?.toJson(),
      refresh: refresh,
      cacheDisk: cacheDisk,
      context: context,
    );
    return NewsRecommendResponseEntity.fromJson(response);
  }

  /// 分类
  static Future<List<CategoryResponseEntity>> categories({
    bool cacheDisk = false,
    @required BuildContext context,
  }) async {
    var response = await HttpUtil().get(
      '/categories',
      cacheDisk: cacheDisk,
      context: context,
    );
    return response
        .map<CategoryResponseEntity>(
            (item) => CategoryResponseEntity.fromJson(item))
        .toList();
  }

  /// 频道
  static Future<List<ChannelResponseEntity>> channels({
    @required BuildContext context,
    bool cacheDisk = false,
  }) async {
    var response = await HttpUtil().get(
      '/channels',
      cacheDisk: cacheDisk,
      context: context,
    );
    return response
        .map<ChannelResponseEntity>(
            (item) => ChannelResponseEntity.fromJson(item))
        .toList();
  }

  /// 标签列表
  static Future<List<TagResponseEntity>> tags({
    TagRequestEntity params,
    @required BuildContext context,
    bool cacheDisk = false,
  }) async {
    var response = await HttpUtil().get(
      '/tags',
      params: params?.toJson(),
      cacheDisk: cacheDisk,
      context: context,
    );
    return response
        .map<TagResponseEntity>((item) => TagResponseEntity.fromJson(item))
        .toList();
  }
  
  static Future<List<PopularTagsResponseEntity>> populartags({
    
    @required BuildContext context,
    bool cacheDisk = false,
  }) async {
    var response = await HttpUtil().get(
      '/populartags',
      // params: params?.toJson(),
      cacheDisk: cacheDisk,
      context: context,
      // noCache: false
    );
    return response
        .map<PopularTagsResponseEntity>((item) => PopularTagsResponseEntity.fromJson(item))
        .toList();
  }
}
