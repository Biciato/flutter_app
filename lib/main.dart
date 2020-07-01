// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import './routes.dart';

void main() => runApp(App());


class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aldeia Montessori',
      theme: ThemeData(          // Add the 3 lines from here...
        primaryColor: Colors.white,
      ),
      initialRoute: '/splash',
      routes: routes,
    );
  }
}


