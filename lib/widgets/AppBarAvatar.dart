import 'package:aldeia_montessori/services/storage-service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AppBarAvatar extends StatefulWidget {
  @override
  AppBarAvatarState createState() => AppBarAvatarState();
}

class AppBarAvatarState extends State<AppBarAvatar> {
  Future<String> _getAvatarPath;
  String _imagePath;
  final ImagePicker _picker = ImagePicker();
  final StorageService _storageService = StorageService();

  Future<String> getAvatarPath() async {
    final StorageService _storageService = StorageService();
    return await _storageService.getAvatarPath();
  }

  Future<void> getImage() async {
    final PickedFile pickedFile = await _picker.getImage(source: ImageSource.gallery);
    await _storageService.saveAvatar(pickedFile.path);
    setState(() {
      _imagePath = pickedFile.path;
    });
  }

  @override
  void initState() {
    super.initState();

    _getAvatarPath = getAvatarPath();
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Icon(Icons.account_circle, size: 26.0);
    return FutureBuilder<String>(
      future: _getAvatarPath,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.data != null || _imagePath != null) {
          final String path = snapshot.data ?? _imagePath;
          content = CircleAvatar(backgroundImage: AssetImage(path), radius: 10);
        }
        return GestureDetector(
          onTap: getImage,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              content
            ],
          )
        );
      },
    );
  }
}