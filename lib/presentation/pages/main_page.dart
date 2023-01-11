import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:my_comic/const/color.dart';
import 'package:my_comic/presentation/pages/bookmark_page.dart';
import 'package:my_comic/presentation/pages/comic_page.dart';
import 'package:my_comic/presentation/pages/home_page.dart';
import 'package:my_comic/presentation/pages/more_page.dart';
import 'package:my_comic/presentation/widget/caraousel_widget.dart';
import 'package:my_comic/presentation/widget/mostPopular_widget.dart';
import 'package:my_comic/presentation/widget/newRelease_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  final List<Widget> _page = [HomePage(), ComicPage(), BookmarkPage(), MorePage()];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: kSecondaryColor,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: _page[_selectedIndex],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: kSecondaryColor,
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(.1),
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              gap: 8,
              activeColor: kWhite,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: kPrimaryColor,
              color: kWhite,
              tabs: [
                GButton(
                  icon: LineIcons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: LineIcons.compass,
                  text: 'Discover',
                ),
                GButton(
                  icon: LineIcons.bookmark,
                  text: 'Bookmark',
                ),
                GButton(
                  icon: Icons.more_horiz_outlined,
                  text: 'More',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
