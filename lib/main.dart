import 'package:flutter/material.dart';
import 'package:musicapp/screen/provider/musicProvider.dart';
import 'package:musicapp/screen/view/musicScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context)=> MusicProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/' : (context) => MusicScreen(),
        },
      ),
    ),
  );
}
