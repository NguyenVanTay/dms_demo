// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, unnecessary_new, unused_import

// import 'package:carbon_icons/carbon_icons.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_navigation/src/routes/default_transitions.dart';
// import 'package:intl/intl.dart';
// import '../../../routers/router.dart';
// import '../login.dart';
// // ignore: import_of_legacy_library_into_null_safe
// import 'package:animated_theme_switcher/animated_theme_switcher.dart';
// // ignore: import_of_legacy_library_into_null_safe
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// // ignore: import_of_legacy_library_into_null_safe
// import 'package:line_awesome_flutter/line_awesome_flutter.dart';
// import 'package:dms/constants.dart';
// import '../../widgets/Profile/profile_list_item.dart';

import 'package:flutter/material.dart';
// import 'package:dms/components/coustom_bottom_nav_bar.dart';
// import 'package:dms/enums.dart';

import '../../widgets/Profile/body.dart';

class AccountPage extends StatefulWidget {
  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  // @override
  // Widget build(BuildContext context) {
  //   ScreenUtil.init(context, height: 896, width: 414, allowFontScaling: true);

  //   var profileInfo = Expanded(
  //     child: Column(
  //       children: <Widget>[
  //         Container(
  //           height: kSpacingUnit.w * 10,
  //           width: kSpacingUnit.w * 10,
  //           margin: EdgeInsets.only(top: kSpacingUnit.w * 3),
  //           child: Stack(
  //             children: <Widget>[
  //               CircleAvatar(
  //                 radius: kSpacingUnit.w * 5,
  //                 backgroundImage: AssetImage('images/dog.jpg'),
  //               ),
  //               Align(
  //                 alignment: Alignment.bottomRight,
  //                 child: Container(
  //                   height: kSpacingUnit.w * 2.5,
  //                   width: kSpacingUnit.w * 2.5,
  //                   decoration: BoxDecoration(
  //                     color: Theme.of(context).accentColor,
  //                     shape: BoxShape.circle,
  //                   ),
  //                   child: Center(
  //                     heightFactor: kSpacingUnit.w * 1.5,
  //                     widthFactor: kSpacingUnit.w * 1.5,
  //                     child: Icon(
  //                       LineAwesomeIcons.pen,
  //                       color: kDarkPrimaryColor,
  //                       size:
  //                           ScreenUtil().setSp(kSpacingUnit.w * 1.5).toDouble(),
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //         SizedBox(height: kSpacingUnit.w * 2),
  //         Text(
  //           'Nicolas Adams',
  //           style: kTitleTextStyle,
  //         ),
  //         SizedBox(height: kSpacingUnit.w * 0.5),
  //         Text(
  //           'nicolasadams@gmail.com',
  //           style: kCaptionTextStyle,
  //         ),
  //         SizedBox(height: kSpacingUnit.w * 2),
  //         Container(
  //           height: kSpacingUnit.w * 4,
  //           width: kSpacingUnit.w * 20,
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(kSpacingUnit.w * 3),
  //             color: Theme.of(context).accentColor,
  //           ),
  //           child: Center(
  //             child: Text(
  //               'Upgrade to PRO',
  //               style: kButtonTextStyle,
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );

  //   var themeSwitcher = ThemeSwitcher(
  //     builder: (context) {
  //       return AnimatedCrossFade(
  //         duration: Duration(milliseconds: 200),
  //         crossFadeState:
  //             ThemeProvider.of(context).brightness == Brightness.dark
  //                 ? CrossFadeState.showFirst
  //                 : CrossFadeState.showSecond,
  //         firstChild: GestureDetector(
  //           onTap: () =>
  //               ThemeSwitcher.of(context).changeTheme(theme: kLightTheme),
  //           child: Icon(
  //             LineAwesomeIcons.sun,
  //             size: ScreenUtil().setSp(kSpacingUnit.w * 3).toDouble(),
  //           ),
  //         ),
  //         secondChild: GestureDetector(
  //           onTap: () =>
  //               ThemeSwitcher.of(context).changeTheme(theme: kDarkTheme),
  //           child: Icon(
  //             LineAwesomeIcons.moon,
  //             size: ScreenUtil().setSp(kSpacingUnit.w * 3).toDouble(),
  //           ),
  //         ),
  //       );
  //     },
  //   );

  //   var header = Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: <Widget>[
  //       SizedBox(width: kSpacingUnit.w * 3),
  //       Icon(
  //         LineAwesomeIcons.arrow_left,
  //         size: ScreenUtil().setSp(kSpacingUnit.w * 3).toDouble(),
  //       ),
  //       profileInfo,
  //       themeSwitcher,
  //       SizedBox(width: kSpacingUnit.w * 3),
  //     ],
  //   );

  //   return ThemeSwitchingArea(
  //     child: Builder(
  //       builder: (context) {
  //         return Scaffold(
  //           body: Column(
  //             children: <Widget>[
  //               SizedBox(height: kSpacingUnit.w * 5),
  //               header,
  //               Expanded(
  //                 child: ListView(
  //                   children: <Widget>[
  //                     ProfileListItem(
  //                       icon: LineAwesomeIcons.user_shield,
  //                       text: 'Privacy',
  //                     ),
  //                     ProfileListItem(
  //                       icon: LineAwesomeIcons.history,
  //                       text: 'Purchase History',
  //                     ),
  //                     ProfileListItem(
  //                       icon: LineAwesomeIcons.question_circle,
  //                       text: 'Help & Support',
  //                     ),
  //                     ProfileListItem(
  //                       icon: LineAwesomeIcons.cog,
  //                       text: 'Settings',
  //                     ),
  //                     ProfileListItem(
  //                       icon: LineAwesomeIcons.user_plus,
  //                       text: 'Invite a Friend',
  //                     ),
  //                     ProfileListItem(
  //                       icon: LineAwesomeIcons.alternate_sign_out,
  //                       text: 'Logout',
  //                       hasNavigation: false,
  //                     ),
  //                   ],
  //                 ),
  //               )
  //             ],
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return SafeArea(
  //       child: Center(
  //     child: ElevatedButton(
  //         onPressed: () {
  //           Get.to(Login());
  //         },
  //         child: Text("Sign out")),
  //   ));
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Projects",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Body(),
      //bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}
