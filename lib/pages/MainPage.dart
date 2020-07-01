import 'package:aldeia_montessori/pages/CircularPage.dart';
import 'package:aldeia_montessori/pages/ConfigurationPage.dart';
import 'package:aldeia_montessori/pages/DiaryPage.dart';
import 'package:aldeia_montessori/pages/FinancialPage.dart';
import 'package:aldeia_montessori/pages/HomePage.dart';
import 'package:aldeia_montessori/pages/RequirementPage.dart';
import 'package:aldeia_montessori/pages/StudentDataPage.dart';
import 'package:aldeia_montessori/resources/menu-items.dart' as menu_items;
import 'package:aldeia_montessori/services/auth-service.dart';
import 'package:aldeia_montessori/widgets/AppBarAvatar.dart';
import 'package:flutter/material.dart';

import 'LogoutPage.dart';

class MainPage extends StatefulWidget {
  const MainPage(this._page);

  final int _page;

  @override
  MainPageState createState() => MainPageState(_page);
}

class MainPageState extends State<MainPage> {
  MainPageState(this._page);
  final AuthService authService = AuthService();
  PageController _pageController;
  int _page;
  String _pageName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF58634),
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(_pageName, style: const TextStyle(color: Colors.white)),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.notifications_none,
                size: 26.0,
              ),
            )
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: AppBarAvatar()
          ),
        ]
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: menu_items.drawerItems.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Map<String, dynamic> item = menu_items.drawerItems[index];
                      return ListTile(
                        leading: Icon(
                          item['icon'] as IconData,
                          color: _page == index
                            ? Colors.deepOrangeAccent
                            : Theme.of(context).textTheme.headline6.color
                        ),
                        title: Text(
                          item['name'] as String,
                          style: TextStyle(
                            color: _page == index
                                ? Colors.deepOrangeAccent
                                : Theme.of(context).textTheme.headline6.color,
                          ),
                        ),
                        onTap: () {
                          _pageController.jumpToPage(index);
                          Navigator.pop(context);
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            const Divider(color: Colors.blueGrey),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Sair'),
              onTap: () {
                _pageController.jumpToPage(7);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: <Widget>[
          HomePage(),
          StudentDataPage(),
          DiaryPage(),
          CircularPage(),
          FinancialPage(),
          RequirementPage(),
          ConfigurationPage(),
          LogoutPage()
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _page);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
      _pageName = (page == 7 || menu_items.drawerItems[page]['name'] == 'Home')
          ? ''
          : menu_items.drawerItems[page]['name'] as String;
    });
  }
}
