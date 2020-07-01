import 'package:aldeia_montessori/models/user.dart';
import 'package:aldeia_montessori/services/storage-service.dart';
import 'package:aldeia_montessori/widgets/HomeMenu.dart';
import 'package:aldeia_montessori/widgets/HomeNews.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:image_picker/image_picker.dart';

import 'package:aldeia_montessori/resources/menu-items.dart' as menu_items;

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  Future<User> _user;
  String _imagePath;
  final ImagePicker _picker = ImagePicker();
  final StorageService _storageService = StorageService();

  Future<void> getImage() async {
    final PickedFile pickedFile = await _picker.getImage(source: ImageSource.gallery);
    await _storageService.saveAvatar(pickedFile.path);
    setState(() {
      _imagePath = pickedFile.path;
    });
  }

  Future<String> getUsername() async => await _storageService.getUsername();

  Future<User> getUserData() async {
    final StorageService _storageService = StorageService();
    final String imagePath = await _storageService.getAvatarPath();
    final String username = await _storageService.getUsername();
    return User(imagePath: imagePath ?? 'assets/user.png', name: username);
  }

  List<Widget> getMenuItems() {
    final List<Map<String, dynamic>> menuItems = List<Map<String, dynamic>>.generate(8, (int index) {
      if (index == 7) {
        return <String, dynamic>{ 'name': 'Sair', 'icon': Icons.exit_to_app };
      } else {
        return menu_items.drawerItems[index];
      }
    });

    return menuItems.map((Map<String, dynamic> item) {
      final int idx = menu_items.drawerItems.indexOf(item);
      return HomeMenu(item['name'] as String, item['icon'] as IconData, idx);
    }).toList();
  }

  @override
  void initState() {
    super.initState();
    _user = getUserData();
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Icon(Icons.account_circle, size: 26.0);
    return FutureBuilder<User>(
      future: _user,
      builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
        String username = 'Usuário';
        if (snapshot.data != null || _imagePath != null) {
          final String path = snapshot.data.imagePath ?? _imagePath;
          username = snapshot.data.name ?? 'Usuário';
          content = CircleAvatar(backgroundImage: AssetImage(path), radius: 10);
        }
        final double circleImgWidth = MediaQuery.of(context).size.width * 0.4;
        return
          Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 1,
                    height: 78.5,
                    color: const Color(0xFFF58634),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(circleImgWidth, 40, 20, 20),
                    width: 75,
                    height: 75,
                    child: GestureDetector(
                        onTap: getImage,
                        child: content
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                width: MediaQuery.of(context).size.width * 0.8,
                height: 40,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text('Olá, ', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
                      Text(username, style: const TextStyle(fontSize: 24)),
                    ]
                  )
                )
              ),
              Container(
                child: CarouselSlider(
                  options: CarouselOptions(height: 190.0, enlargeCenterPage: true, enableInfiniteScroll: false, initialPage: 0),
                  items: <int>[1,2,3,4,5].map((int i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return const HomeNews(300);
                      },
                    );
                  }).toList(),
                )
              ),
              Container(
                margin: const EdgeInsets.only(left: 37, top: 20),
                height: 114,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: getMenuItems(),
                )
              )
            ]
          );
      }
    );
  }
}