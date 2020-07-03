import 'package:FkutterTestapp/coomponents/rounded_button.dart';
import 'package:FkutterTestapp/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:FkutterTestapp/styles.dart';
import 'package:flutter_line_sdk/flutter_line_sdk.dart';
import 'package:FkutterTestapp/onboard/profile.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final int _numPages = 4;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.yellow : Color(0xFFFFC107),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  void login() async {
    try {
      final result = await LineSDK.instance.login();
      print(result.toString());
      var accesstoken = await getAccessToken();
      var displayname = result.userProfile.displayName;
      var statusmessage = result.userProfile.statusMessage;
      var imgUrl = result.userProfile.pictureUrl;
      var userId = result.userProfile.userId;

      print("AccessToken> " + accesstoken);
      print("DisplayName> " + displayname);
      print("StatusMessage> " + statusmessage);
      print("ProfileURL> " + imgUrl);
      print("userId> " + userId);

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProfilePage(
                    puserId: userId,
                    paccessToken: accesstoken,
                    pdisplayName: displayname,
                    pimgUrl: imgUrl,
                    pstatusMessage: statusmessage,
                  )));
    } on PlatformException catch (e) {
      print(e);
    }
  }

  Future getAccessToken() async {
    try {
      final result = await LineSDK.instance.currentAccessToken;
      return result.value;
    } on PlatformException catch (e) {
      print(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 0.4, 0.7, 0.9],
              colors: [
                Color(0xFFFFFFFF),
                Color(0xFFFFFFFF),
                Color(0xFFFFFFFF),
                Color(0xFFFFFFFF),
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  height: 600.0,
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/images/82651313_725109954942416_6283575950306336150_n.png',
                                ),
                                height: 300.0,
                                width: 300.0,
                              ),
                            ),
                            SizedBox(height: 30.0),
                            Text(
                              'ลงทะเบียน Q Easy',
                              // textAlign: TextAlign.center,
                              style: kTitleStyle,
                            ),
                            SizedBox(height: 15.0),
                            Text(
                              'จองคิวร้านค้าหรือบริการก่อนไม่ต้องต่อตัว',
                              // textAlign: TextAlign.center,
                              style: kSubtitleStyle,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/images/106420741_2745632832336670_4367385252193015361_n.png',
                                ),
                                height: 300.0,
                                width: 300.0,
                              ),
                            ),
                            SizedBox(height: 30.0),
                            Text(
                              'จองคิวร้านโปรด',
                              // textAlign: TextAlign.center,
                              style: kTitleStyle,
                            ),
                            SizedBox(height: 15.0),
                            Text(
                              'ง่ายๆ ได้เลย Q Easy ไม่ต้องรอหน้าร้าน',
                              // textAlign: TextAlign.center,
                              style: kSubtitleStyle,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/images/105707771_667045177218983_6414477636004806707_n.png',
                                ),
                                height: 300.0,
                                width: 300.0,
                              ),
                            ),
                            SizedBox(height: 30.0),
                            Text(
                              'เข้ารับบริการ',
                              // textAlign: TextAlign.center,
                              style: kTitleStyle,
                            ),
                            SizedBox(height: 15.0),
                            Text(
                              'อุ่นใจ..ใช้บริการ บริหารเวลาได้อย่างคุ้มค่า',
                              // textAlign: TextAlign.center,
                              style: kSubtitleStyle,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/images/106058323_636304063929528_1274759682671193672_n.png',
                                ),
                                height: 300.0,
                                width: 300.0,
                              ),
                            ),
                            SizedBox(height: 30.0),
                            Text(
                              'เริ่มเวลาคุณภาพกับเราวันนี้!',
                              // textAlign: TextAlign.center,
                              style: kTitleStyle,
                            ),
                            SizedBox(height: 15.0),
                            Text(
                              'แอปพลิเคชัน จองคิวง่ายๆ by Q Easy',
                              // textAlign: TextAlign.center,
                              style: kSubtitleStyle,
                            ),
                            SizedBox(height: 30.0),
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Row(children: <Widget>[
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        top: 0,
                                        bottom: 10,
                                        right: 10,
                                        left: 10),
                                    child: RaisedButton(
                                      color: Color.fromRGBO(0, 185, 0, 1),
                                      textColor: Colors.white,
                                      padding: const EdgeInsets.all(1),
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: <Widget>[
                                                Image.network(
                                                  'https://firebasestorage.googleapis.com/v0/b/messagingapitutorial.appspot.com/o/line_logo.png?alt=media&token=80b41ee6-9d77-45da-9744-2033e15f52b2',
                                                  width: 50,
                                                  height: 50,
                                                ),
                                                Container(
                                                  color: Colors.black12,
                                                  width: 2,
                                                  height: 40,
                                                ),
                                                Expanded(
                                                  child: Center(
                                                      child: Text(
                                                          "เข้าสู่ระบบด้วย LINE",
                                                          style: TextStyle(
                                                              fontSize: 17,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold))),
                                                )
                                              ])
                                        ],
                                      ),
                                      onPressed: () {
                                        login();
                                      },
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
