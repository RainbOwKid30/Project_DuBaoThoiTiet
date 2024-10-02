import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project1/page/detail/detail_page.dart';
import 'package:flutter_project1/page/home/home_page.dart';

class BottomNavigationCustom extends StatefulWidget {
  const BottomNavigationCustom({super.key});

  @override
  State<BottomNavigationCustom> createState() => _BottomNavigationCustomState();
}

class _BottomNavigationCustomState extends State<BottomNavigationCustom> {
  List<BottomNavigationBarItem> listItem = [
    const BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.home), label: 'Home'),
    const BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.list_bullet), label: 'List'),
  ];
  // các list trang Page
  List<Widget> listPage = [
    const HomePage(),
    const DetailPage(),
  ];

  int activePage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      // dùng để xác định các vị trí chuyển đổi trang
      body: listPage[activePage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: activePage, // tự động active item trong navigation bar
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        backgroundColor: Colors.white10, // chỉnh trong suốt cho navigation
        elevation: 0,
        onTap: (index) {
          setState(() {
            activePage = index;
          });
        },
        items: listItem,
      ),
    );
  }
}
