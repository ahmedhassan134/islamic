import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:introduction_screen/introduction_screen.dart';
import 'package:islamic/core/utiles/app_assets.dart';

import 'home_screen/home_screen.dart';



class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  OnBoardingPageState createState() => OnBoardingPageState();
}

class OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) =>  HomeScreen()),
    );
  }
  Widget buildHeaderImage(String assetName, [double width = double.infinity]) {
    return Image.asset(assetName, width: width);
  }
  Widget buildPageImage(String assetName, [double width = 350]) {
    return Column(
      children: [
         SizedBox(height: 50 ),
        Image.asset(assetName, width: width),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0,color: Colors.white);

    const pageDecoration = PageDecoration(

      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Color(0xff212121),
      imagePadding: EdgeInsets.zero,
      contentMargin: EdgeInsets.only(top: 80),
    );

    return IntroductionScreen(

      key: introKey,
      globalBackgroundColor: Colors.black,
      allowImplicitScrolling: true,
      // autoScrollDuration: 3000,
      // infiniteAutoScroll: true,
      globalHeader: Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, right: 16,bottom: 40),
            child: buildHeaderImage(AppAssets.islami ),
          ),
        ),
      ),
      globalFooter: SizedBox(
        width: double.infinity,
        height: 60,

      ),

      pages: [

      PageViewModel(
      title: "",
      bodyWidget: Column(
        children: [

           SizedBox(height: 80),

          Image.asset(AppAssets.welcome, width: 320),
          SizedBox(height: 50),
          Text(
            "Welcome To Islmi App",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24,fontWeight: FontWeight.w700,color: Colors.white),
          ),
           SizedBox(height: 50),

        ],
      ),
      decoration: pageDecoration,
    ),
        PageViewModel(
          title: "",
          bodyWidget: Column(
            children: [

              SizedBox(height: 40),

              Image.asset(AppAssets.mosque, width: 350),
              Text(
                "Welcome To Islami",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24,fontWeight: FontWeight.w700,color: Colors.white),
              ),
              SizedBox(height: 30),
              Text(
                "We Are Very Excited To Have You In Our Community",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: Colors.white),
              ),
            ],
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "",
          bodyWidget: Column(
            children: [

              SizedBox(height: 40),

              Image.asset(AppAssets.quran, width: 350),
              Text(
                "Reading the Quran",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24,fontWeight: FontWeight.w700,color: Colors.white),
              ),
              SizedBox(height: 30),
              Text(
                "Read, and your Lord is the Most Generous",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: Colors.white),
              ),
            ],
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "",
          bodyWidget: Column(
            children: [

              SizedBox(height: 40),

              Image.asset(AppAssets.doaa, width: 350),
              Text(
                "Bearish",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24,fontWeight: FontWeight.w700,color: Colors.white),
              ),
              SizedBox(height: 30),
              Text(
                "Praise the name of your Lord, the Most High",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: Colors.white),
              ),
            ],
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "",
          bodyWidget: Column(
            children: [

              SizedBox(height: 100),

              Image.asset(AppAssets.mic, width: 260),
              Text(
                "Holy Quran Radio",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24,fontWeight: FontWeight.w700,color: Colors.white),
              ),
              SizedBox(height: 15),
              Text(
                "You can listen to the Holy Quran Radio through the application for free and easily",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: Colors.white),
              ),
              SizedBox(height: 5),
            ],
          ),
          decoration: pageDecoration,
        ),



      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,
      //rtl: true, // Display as right-to-left
      back: const Icon(Icons.arrow_back,color: Color(0xffE2BE7F)),
      skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600,color: Color(0xffE2BE7F))),
      next: const Icon(Icons.arrow_forward,color: Color(0xffE2BE7F)),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600,color: Color(0xffE2BE7F))),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xffE2BE7F),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.black87,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}


