import 'package:ektfaa/Screens/HomeScreen.dart';
import 'package:ektfaa/Screens/ProfileScreen.dart';
import 'package:ektfaa/Screens/uploadProduct.dart';
import 'package:ektfaa/Theme.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class DashBoard extends StatefulWidget {
  int selectedIndex;
  DashBoard({
    Key? key,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

// int _selectedIndex = 0;

class _DashBoardState extends State<DashBoard> {
  Widget getFragment() {
    if (widget.selectedIndex == 0) {
      return const HomeScreen();
    } else if (widget.selectedIndex == 1) {
      return const AddProducts();
    } else if (widget.selectedIndex == 2) {
      return const ProfileScreen();
    }
    return const HomeScreen();
  }

  bool get wantKeepAlive => true;
  @override
  void initState() {
    setStatusBarColor(Colors.transparent);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: getFragment(),
        bottomNavigationBar: Container(
          height: 63,
          // padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(100), //New
                blurRadius: 40.0,
              )
            ],
            color: AppColors.white,
          ),
          child: BottomNavigationBar(
            showSelectedLabels: false,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppColors.white,
            items: [
              BottomNavigationBarItem(
                icon: Image.asset('assets/Icons/Ic_Home.png',
                        height: 20,
                        width: 20,
                        fit: BoxFit.cover,
                        color: AppColors.grey)
                    .paddingTop(12),
                label: '',
                activeIcon: Image.asset('assets/Icons/Ic_Home.png',
                        height: 20,
                        width: 20,
                        fit: BoxFit.cover,
                        color: AppColors.redAccent)
                    .paddingTop(12),
              ),

              //
              BottomNavigationBarItem(
                icon: Image.asset('assets/Icons/ic_share.png',
                        height: 20,
                        width: 20,
                        fit: BoxFit.cover,
                        color: AppColors.grey)
                    .paddingTop(12),
                label: '',
                activeIcon: Image.asset('assets/Icons/ic_share.png',
                        height: 20,
                        width: 20,
                        fit: BoxFit.cover,
                        color: AppColors.redAccent)
                    .paddingTop(12),
              ),
              //
              BottomNavigationBarItem(
                icon: Image.asset('assets/Icons/ic_profile.png',
                        height: 20,
                        width: 20,
                        fit: BoxFit.cover,
                        color: AppColors.grey)
                    .paddingTop(12),
                label: '',
                activeIcon: Image.asset('assets/Icons/ic_profile.png',
                        height: 20,
                        width: 20,
                        fit: BoxFit.cover,
                        color: AppColors.redAccent)
                    .paddingTop(12),
              ),
            ],
            onTap: (val) {
              widget.selectedIndex = val;
              setState(() {
                widget.selectedIndex = val;
              });
            },
            currentIndex: widget.selectedIndex,
          ),
        ),
      ),
    );
  }
}
