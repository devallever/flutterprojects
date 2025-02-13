import 'package:flutter/material.dart';
import 'package:flutterprojects/module/basic/label_text_view.dart';
import 'package:flutterprojects/module/core/util.dart';
import 'package:flutterprojects/module/core/widget/base_title_page.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'ad_constant.dart';

class InternalAdPage extends BaseTitlePage {
  @override
  Widget getPageContent() => InternalAdPageContent();

  @override
  String getTitle() => 'Flutter-Admob-内置广告';
}

class InternalAdPageContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InternalAdPageState();
}

class InternalAdPageState extends State<InternalAdPageContent> {
  BannerAd? _bannerAd;
  InterstitialAd? _interAd;
  RewardedAd? _rewardedAd;

  @override
  void initState() {
    super.initState();
    _loadBanner();
  }

  @override
  void dispose() {
    super.dispose();
    _bannerAd?.dispose();
    _interAd?.dispose();
    _rewardedAd?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        labelTextView('Banner'),
        SizedBox(
          width: _bannerAd == null ? 0 : _bannerAd!.size.width.toDouble(),
          height: _bannerAd == null ? 0 : _bannerAd!.size.height.toDouble(),
          child: _bannerAd == null ? SizedBox() : AdWidget(ad: _bannerAd!),
        ),
        labelTextView('插页'),
        ElevatedButton(
            onPressed: () {
              _loadInter();
            },
            child: Text('加载插页')),
        labelTextView('激励视频'),
        ElevatedButton(
            onPressed: () {
              _loadRewardAd();
            },
            child: Text('加载激励视频'))
      ]),
    );
  }

  void _loadBanner() {
    final bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: AdConstant.BANNER_TEST_ID,
      request: const AdRequest(),
      listener: BannerAdListener(
        // Called when an ad is successfully received.
        onAdLoaded: (ad) {
          if (!mounted) {
            ad.dispose();
            return;
          }
          setState(() {
            _bannerAd = ad as BannerAd;
          });
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (ad, error) {
          debugPrint('BannerAd failed to load: $error');
          ad.dispose();
        },
      ),
    );

    // Start loading.
    bannerAd.load();
  }

  void _loadInter() {
    InterstitialAd.load(
        adUnitId: AdConstant.INTERSTITIAL_TEST_ID,
        request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(onAdLoaded: (ad) {
          log("插页广告加载成功");
          _interAd = ad;
          _interAd?.show();
          ad.fullScreenContentCallback = FullScreenContentCallback(
              onAdDismissedFullScreenContent: (_) {}, onAdImpression: (ad) {});
        }, onAdFailedToLoad: (error) {
          log('插页广告加载失败: ${error.code}');
        }));
  }

  void _loadRewardAd() {
    RewardedAd.load(
        adUnitId: AdConstant.REWARDED_TEST_ID,
        request: AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(onAdLoaded: (ad) {
          log("激励广告加载成功");
          _rewardedAd = ad;
          _rewardedAd?.fullScreenContentCallback =
              FullScreenContentCallback(onAdImpression: (ad) {
            log("激励广告展示成功");
          });
          _rewardedAd?.show(onUserEarnedReward: (_, reward) {
            log("获得奖励");
          });
        }, onAdFailedToLoad: (error) {
          log("激励广告加载失败: ${error.code}");
        }));
  }
}
