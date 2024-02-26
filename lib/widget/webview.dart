import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  final String? url;
  final String? title;

  WebViewScreen({this.url, this.title});

  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late WebViewController _webViewController;
  bool isVideoLoading = false;
  bool isadVideoLoading = false;
  RewardedAd? rewardedAd;
  AdRequest? adRequest;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        setState(() {
          isadVideoLoading = true;
        });
        show_rewardAds();

        return false;
      },
      child: SafeArea(
        child: Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text(widget.title ?? "Webview", style: TextStyle(fontSize: 14)),
              ),
              body: WebView(
                initialUrl: widget.url ?? 'https://www.google.com',
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (WebViewController webViewController) {
                  _webViewController = webViewController;
                },
                onPageFinished: (String url) {
                  // Inject JavaScript to set the viewport width for desktop-like experience
                  String desktopModeScript =
                      'var viewport = document.querySelector("meta[name=viewport]");'
                      'viewport.parentNode.removeChild(viewport);'
                      'var newViewport = document.createElement("meta");'
                      'newViewport.name = "viewport";'
                      'newViewport.content = "width=device-width, initial-scale=0.5, maximum-scale=1.0, user-scalable=yes";'
                      'document.getElementsByTagName("head")[0].appendChild(newViewport);';
                  _webViewController.evaluateJavascript(desktopModeScript);
                },
              ),
            ),
            if(isadVideoLoading == true)
              Center(child: CircularProgressIndicator())
          ],
        ),
      ),
    );
  }
  show_rewardAds() {
    if (!isVideoLoading) {
      isVideoLoading = true;
      RewardedAd.load(
        adUnitId: Platform.isAndroid
            ? "ca-app-pub-2669599292701410/3640290086" //"ca-app-pub-2669599292701410/2720729152"
            : "ca-app-pub-3940256099942544/6978759866",
        request: const AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (ad) {
            rewardedAd = ad;
            rewardedAd?.fullScreenContentCallback =
                FullScreenContentCallback(
                  onAdShowedFullScreenContent: (ad) {
                    // Video is displayed, pause your app or take appropriate actions
                    // to prevent the user from skipping the video
                    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
                  },
                  onAdFailedToShowFullScreenContent: (ad, err) {
                    ad.dispose();
                    isVideoLoading = false;
                  },
                  onAdDismissedFullScreenContent: (ad) {
                    // Video ad was dismissed, resume your app or take appropriate actions
                    isVideoLoading = false;
                    ad.dispose();
                    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
                    Navigator.pop(context);
                  },
                );

            rewardedAd?.show(
              onUserEarnedReward: ((ad, reward) {
                debugPrint("My Reward Amount -> ${reward.amount}");
                // You can give the reward here if needed
              }),
            );
            setState(() {
              isadVideoLoading = false;
            });

            // Wrap the content with WillPopScope to handle back button press
            WillPopScope(
              onWillPop: () async {
                // Prevent back button during video playback
                if (isVideoLoading ) {
                  return false;
                } else {
                  // Handle back button as usual
                  return true;
                }
              },
              child: Container(),
            );
          },
          onAdFailedToLoad: (err) {
            debugPrint(err.message);
            isVideoLoading = false;
          },
        ),
      );
    }
  }


}
