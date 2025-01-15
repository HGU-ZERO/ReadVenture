/// File: custom_app_bar.dart
/// Purpose: 앱에서 커스터마이즈된 AppBar 위젯을 제공하여 타이틀, 검색 버튼 등을 설정 가능하게 함
/// Author: 박민준
/// Created: 2024-12-28
/// Last Modified: 2024-12-30 by 박민준

/*
    사용 방법
    Scaffold 에서 아래와 같이 사용

    appBar: CustomAppBar(
      title: '매장 목록',
      onSearchPressed: () {
        print("검색");
      },
    ),

    ////// 1 Depth //////

    1. CustomAppBar_Logo
      appBar: CustomAppBar_Logo(),

    2. CustomAppBar_Course
      appBar: CustomAppBar_Course(),

    3. CustomAppBar_Community
      appBar: CustomAppBar_Community()
      // 현재 Search Button 부분 함수 구현되어 있지 않음. 추후 Search 기능 연결 필요.

    4. CustomAppBar_MyPage
      appBar: CustomAppBar_MyPage()

    5. CustomAppBar_Logo_only
      appBar: CustomAppBar_Logo_only()

    ////// 2 Depth //////

    1. CustomAppBar_2depth_1
      appBar: CustomAppBar_2depth_1(
        title: "앱바 제목",
        onIconPressed: 함수 기능 정의
      )

    2. CustomAppBar_2depth_2
      appBar: CustomAppBar_2depth_2(
        title: "앱바 제목",
        onIconPressed: 함수 기능 정의
      )

    3. CustomAppBar_2depth_3
      appBar: CustomAppBar_2depth_3(
        title: "앱바 제목",
        onIconPressed : 함수 기능 정의
      )

    4. CustomAppBar_2depth_4
      appBar: CustomAppBar_2depth_4(
        title: "앱바 제목",
      )

    5. CustomAppBar_2depth_5
      appBar: CustomAppBar_2depth_5(
        title: "앱바 제목",
        onIconPressed : 함수 기능 정의
      )


*/

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../theme/theme.dart';
import '../../theme/font.dart';
import '../../viewmodel/custom_colors_provider.dart';
import 'dart:async';

//////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////        1 Depth App Bar        //////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////

// 기본 형식 앱바
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? backgroundColor; // null 가능하도록 수정
  final Function()? onSearchPressed; //action 함수를 호출하는 곳에서 설정할 수 있도록 함

  const CustomAppBar({
    Key? key,
    required this.title,
    this.backgroundColor, // null이면 default로 설정
    this.onSearchPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>()!;

    return AppBar(
      scrolledUnderElevation: 0,
      leading: Container(child: Image.asset('assets/images/appleicon.png')),// logo 부분. 추후 진짜 로고로 바꿀 것
      title: Text(
        title,
        style: TextStyle(
          color: customColors.black,
          fontWeight: FontWeight.bold,
        ),
      ).tr(),
      centerTitle: true,
      actions: [// 이 부분에 아이콘 버튼을 추가
        IconButton(
          icon: Icon(Icons.search, color: Colors.orange),
          onPressed: onSearchPressed,
        ),
      ],
      backgroundColor: backgroundColor ?? customColors.neutral100,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

// 앱바_로고
class CustomAppBar_Logo extends StatelessWidget implements PreferredSizeWidget {
  final Color? backgroundColor; // null 가능하도록 수정
  final Function()? onNotificationPressed; //action 함수를 호출하는 곳에서 설정할 수 있도록 함

  const CustomAppBar_Logo({
    Key? key,
    this.backgroundColor, // null이면 default로 설정
    this.onNotificationPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>()!;

    return AppBar(
      scrolledUnderElevation: 0,
      leading: Container(child: Image.asset('assets/images/appleicon.png')),// logo 부분. 추후 진짜 로고로 바꿀 것
      actions: [// 이 부분에 아이콘 버튼을 추가
        IconButton(
          icon: Icon(Icons.notifications, color: customColors.neutral30, size: 28,),
          onPressed: onNotificationPressed ?? () {
            Navigator.pushNamed(context, '/notification');
          },
        ),
      ],
      backgroundColor: backgroundColor ?? customColors.neutral100,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

// 앱바_코스
class CustomAppBar_Course extends StatelessWidget implements PreferredSizeWidget {
  final Color? backgroundColor; // null 가능하도록 수정
  final Function()? onSearchPressed; //action 함수를 호출하는 곳에서 설정할 수 있도록 함

  const CustomAppBar_Course({
    Key? key,
    this.backgroundColor, // null이면 default로 설정
    this.onSearchPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>()!;

    return AppBar(
      scrolledUnderElevation: 0,
      title: Text(
        "course_title",
        style: heading_small(context).copyWith(color: customColors.neutral30),
      ).tr(),
      centerTitle: true,
      backgroundColor: backgroundColor ?? customColors.neutral100,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

// 앱바_커뮤니티
class CustomAppBar_Community extends StatelessWidget implements PreferredSizeWidget {
  final Color? backgroundColor; // null 가능하도록 수정
  final Function()? onSearchPressed; //action 함수를 호출하는 곳에서 설정할 수 있도록 함

  const CustomAppBar_Community({
    Key? key,
    this.backgroundColor, // null이면 default로 설정
    this.onSearchPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>()!;

    return AppBar(
      scrolledUnderElevation: 0,
      title: Text(
        "community_title",
        style: heading_small(context).copyWith(color: customColors.neutral30),
      ).tr(),
      centerTitle: true,
      actions: [// 이 부분에 아이콘 버튼을 추가
        IconButton(
          icon: Icon(Icons.search, color: customColors.neutral30, size: 28,),
          onPressed: onSearchPressed,
        ),
      ],
      backgroundColor: backgroundColor ?? customColors.neutral90,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

// 앱바_마이페이지
class CustomAppBar_MyPage extends StatelessWidget implements PreferredSizeWidget {
  final Color? backgroundColor; // null 가능하도록 수정
  final Function()? onSettingPressed; //action 함수를 호출하는 곳에서 설정할 수 있도록 함

  const CustomAppBar_MyPage({
    Key? key,
    this.backgroundColor, // null이면 default로 설정
    this.onSettingPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>()!;

    return AppBar(
      scrolledUnderElevation: 0,
      title: Text(
        "mypage_title",
        style: heading_small(context).copyWith(color: customColors.neutral30),
      ).tr(),
      centerTitle: true,
      actions: [// 이 부분에 아이콘 버튼을 추가
        IconButton(
          icon: Icon(Icons.settings, color: customColors.neutral30, size: 28,),
          onPressed: onSettingPressed ?? () {
            Navigator.pushNamed(context, '/mypage/settings');
          },
        ),
      ],
      backgroundColor: backgroundColor ?? customColors.neutral100,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class CustomAppBar_Logo_only extends StatelessWidget implements PreferredSizeWidget {
  final Color? backgroundColor; // null 가능하도록 수정
  final Function()? onNotificationPressed; //action 함수를 호출하는 곳에서 설정할 수 있도록 함

  const CustomAppBar_Logo_only({
    Key? key,
    this.backgroundColor, // null이면 default로 설정
    this.onNotificationPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>()!;

    return AppBar(
      scrolledUnderElevation: 0,
      leading: Container(child: Image.asset('assets/images/appleicon.png')),// logo 부분. 추후 진짜 로고로 바꿀 것
      backgroundColor: backgroundColor ?? customColors.neutral100,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

//////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////        2 Depth App Bar        //////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////

class CustomAppBar_2depth_1 extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? backgroundColor; // null 가능하도록 수정
  final Function()? onIconPressed; //action 함수를 호출하는 곳에서 설정할 수 있도록 함

  const CustomAppBar_2depth_1({
    Key? key,
    required this.title,
    this.backgroundColor, // null이면 default로 설정
    this.onIconPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>()!;

    return AppBar(
      scrolledUnderElevation: 0,
      leading: IconButton(
        icon: Icon(Icons.navigate_before, color: customColors.neutral30),
        onPressed: () {
          Navigator.pop(context); //뒷 페이지로 돌아가는 기능. 상황에 맞게 수정.
        },
      ),
      title: Text(
        title,
        style: heading_xsmall(context).copyWith(color: customColors.neutral30)
      ).tr(),
      centerTitle: true,
      actions: [// 이 부분에 아이콘 버튼을 추가
        IconButton(
          icon: Icon(Icons.close, color: customColors.neutral30, size: 28,),
          onPressed: onIconPressed,
        ),
      ],
      backgroundColor: backgroundColor ?? customColors.neutral100,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class CustomAppBar_2depth_2 extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? backgroundColor; // null 가능하도록 수정
  final Function()? onIconPressed; //action 함수를 호출하는 곳에서 설정할 수 있도록 함

  const CustomAppBar_2depth_2({
    Key? key,
    required this.title,
    this.backgroundColor, // null이면 default로 설정
    this.onIconPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>()!;

    return AppBar(
      scrolledUnderElevation: 0,
      leading: IconButton(
        icon: Icon(Icons.navigate_before, color: customColors.neutral30),
        onPressed: () {
          Navigator.pop(context); //뒷 페이지로 돌아가는 기능. 상황에 맞게 수정.
        },
      ),
      title: Text(
        title,
        style: heading_xsmall(context).copyWith(color: customColors.neutral30)
      ).tr(),
      centerTitle: true,
      actions: [// 이 부분에 아이콘 버튼을 추가
        IconButton(
          icon: Icon(Icons.calendar_today_outlined, color: customColors.neutral30, size: 28,),
          onPressed: onIconPressed,
        ),
      ],
      backgroundColor: backgroundColor ?? customColors.neutral100,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class CustomAppBar_2depth_3 extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? backgroundColor; // null 가능하도록 수정
  final Function()? onIconPressed; //action 함수를 호출하는 곳에서 설정할 수 있도록 함
  final PreferredSizeWidget? bottom; // bottom 파라미터 추가

  const CustomAppBar_2depth_3({
    Key? key,
    required this.title,
    this.backgroundColor, // null이면 default로 설정
    this.onIconPressed,
    this.bottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>()!;

    return AppBar(
      scrolledUnderElevation: 0,
      bottom: bottom,
      leading: IconButton(
        icon: Icon(Icons.navigate_before, color: customColors.neutral30),
        onPressed: () {
          Navigator.pop(context); //뒷 페이지로 돌아가는 기능. 상황에 맞게 수정.
        },
      ),
      title: Text(
        title,
        style: heading_xsmall(context).copyWith(color: customColors.neutral30)
      ).tr(),
      centerTitle: true,
      actions: [// 이 부분에 아이콘 버튼을 추가
        IconButton(
          icon: Icon(Icons.settings, color: customColors.neutral30, size: 28,),
          onPressed: onIconPressed,
        ),
      ],
      backgroundColor: backgroundColor ?? customColors.neutral100,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize {
    // bottom의 높이를 고려하여 AppBar의 총 높이를 반환
    final bottomHeight = bottom?.preferredSize.height ?? 0.0;
    return Size.fromHeight(kToolbarHeight + bottomHeight);
  }
}

class CustomAppBar_2depth_4 extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? backgroundColor; // null 가능하도록 수정
  final PreferredSizeWidget? bottom; // bottom 파라미터 추가

  const CustomAppBar_2depth_4({
    Key? key,
    required this.title,
    this.backgroundColor, // null이면 default로 설정
    this.bottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>()!;

    return AppBar(
      scrolledUnderElevation: 0,
      bottom: bottom,
      leading: IconButton(
        icon: Icon(Icons.navigate_before, color: customColors.neutral30),
        onPressed: () {
          Navigator.pop(context); //뒷 페이지로 돌아가는 기능. 상황에 맞게 수정.
        },
      ),
      title: Text(
          title,
          style: heading_xsmall(context).copyWith(color: customColors.neutral30)
      ).tr(),
      centerTitle: true,
      backgroundColor: backgroundColor ?? customColors.neutral100,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize {
    // bottom의 높이를 고려하여 AppBar의 총 높이를 반환
    final bottomHeight = bottom?.preferredSize.height ?? 0.0;
    return Size.fromHeight(kToolbarHeight + bottomHeight);
  }
}

class CustomAppBar_2depth_5 extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? backgroundColor; // null 가능하도록 수정
  final Function()? onIconPressed; //action 함수를 호출하는 곳에서 설정할 수 있도록 함
  final PreferredSizeWidget? bottom; // bottom 파라미터 추가

  const CustomAppBar_2depth_5({
    Key? key,
    required this.title,
    this.backgroundColor, // null이면 default로 설정
    this.onIconPressed,
    this.bottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>()!;

    return AppBar(
      scrolledUnderElevation: 0,
      bottom: bottom,
      leading: IconButton(
        icon: Icon(Icons.navigate_before, color: customColors.neutral30),
        onPressed: () {
          Navigator.pop(context); //뒷 페이지로 돌아가는 기능. 상황에 맞게 수정.
        },
      ),
      title: Text(
          title,
          style: heading_xsmall(context).copyWith(color: customColors.neutral30)
      ).tr(),
      centerTitle: true,
      actions: [// 이 부분에 아이콘 버튼을 추가
        IconButton(
          icon: Icon(Icons.search, color: customColors.neutral30, size: 28,),
          onPressed: onIconPressed,
        ),
      ],
      backgroundColor: backgroundColor ?? customColors.neutral100,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize {
    // bottom의 높이를 고려하여 AppBar의 총 높이를 반환
    final bottomHeight = bottom?.preferredSize.height ?? 0.0;
    return Size.fromHeight(kToolbarHeight + bottomHeight);
  }
}

class CustomAppBar_2depth_6 extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? backgroundColor; // null 가능하도록 수정
  final Function()? onIconPressed; //action 함수를 호출하는 곳에서 설정할 수 있도록 함
  final PreferredSizeWidget? bottom; // bottom 파라미터 추가

  const CustomAppBar_2depth_6({
    Key? key,
    required this.title,
    this.backgroundColor, // null이면 default로 설정
    this.onIconPressed,
    this.bottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>()!;

    return AppBar(
      scrolledUnderElevation: 0,
      bottom: bottom,
      title: Text(
          title,
          style: heading_xsmall(context).copyWith(color: customColors.neutral30)
      ).tr(),
      centerTitle: true,
      actions: [// 이 부분에 아이콘 버튼을 추가
        IconButton(
          icon: Icon(Icons.close, color: customColors.neutral30, size: 28,),
          onPressed: onIconPressed,
        ),
      ],
      backgroundColor: backgroundColor ?? customColors.neutral100,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize {
    // bottom의 높이를 고려하여 AppBar의 총 높이를 반환
    final bottomHeight = bottom?.preferredSize.height ?? 0.0;
    return Size.fromHeight(kToolbarHeight + bottomHeight);
  }
}

class CustomAppBar_2depth_7 extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? backgroundColor; // null 가능하도록 수정
  final Function()? onIconPressed; //action 함수를 호출하는 곳에서 설정할 수 있도록 함
  final PreferredSizeWidget? bottom; // bottom 파라미터 추가

  const CustomAppBar_2depth_7({
    Key? key,
    required this.title,
    this.backgroundColor, // null이면 default로 설정
    this.onIconPressed,
    this.bottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>()!;

    return AppBar(
      scrolledUnderElevation: 0,
      bottom: bottom,
      leading: IconButton(
        icon: Icon(Icons.navigate_before, color: customColors.neutral30),
        onPressed: () {
          Navigator.pop(context); //뒷 페이지로 돌아가는 기능. 상황에 맞게 수정.
        },
      ),
      title: Text(
          title,
          style: heading_xsmall(context).copyWith(color: customColors.neutral30)
      ).tr(),
      centerTitle: true,
      backgroundColor: backgroundColor ?? customColors.neutral100,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize {
    // bottom의 높이를 고려하여 AppBar의 총 높이를 반환
    final bottomHeight = bottom?.preferredSize.height ?? 0.0;
    return Size.fromHeight(kToolbarHeight + bottomHeight);
  }
}
////////////////////// 타이머 존재하는 앱바 //////////////////////
class CustomAppBar_2depth_8 extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final Color? backgroundColor;
  // final Function()? onIconPressed;

  const CustomAppBar_2depth_8({
    Key? key,
    required this.title,
    this.backgroundColor,
    // this.onIconPressed,
  }) : super(key: key);

  @override
  _CustomAppBar_2depth_8State createState() => _CustomAppBar_2depth_8State();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBar_2depth_8State extends State<CustomAppBar_2depth_8> {
  late Timer _timer;
  int _elapsedSeconds = 0; // 학습 시간 초기화

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _elapsedSeconds++;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // 타이머 정리
    super.dispose();
  }

  String _formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return "$minutes:$secs";
  }

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>()!;

    return AppBar(
      scrolledUnderElevation: 0,
      leadingWidth: 100,
      leading: Center(
        // Center를 사용해 leading 영역 내에서 위젯을 가운데 정렬
        child: Row(
          children: [
            SizedBox(width: 16,),
            SizedBox(
              width: 59, // 원하는 너비
              height: 32, // 원하는 높이
              child: Container(
                decoration: BoxDecoration(
                  color: customColors.neutral90,
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center, // 텍스트 중앙 정렬
                child: Text(
                  _formatTime(_elapsedSeconds), // 타이머 표시
                  style: TextStyle(
                    color: customColors.neutral30,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      title: Text(
        widget.title,
        style: heading_xsmall(context).copyWith(color: customColors.neutral30),
      ).tr(),
      centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(Icons.close, color: customColors.neutral30, size: 28),
          onPressed: () => Navigator.pop(context),
        ),
      ],
      backgroundColor: widget.backgroundColor ?? customColors.neutral100,
      elevation: 0,
    );
  }
}