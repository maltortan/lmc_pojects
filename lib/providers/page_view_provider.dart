import 'package:flutter/material.dart';

class PageViewProvider extends ChangeNotifier{
  String image_url = '';


  Future<void> imageUrl(String image) async{
    image_url=image;
  }
}

class CustomSwitchProviderTwo extends ChangeNotifier{
  bool customSwitch2 = false;

  toggle() async{
    customSwitch2 = !customSwitch2;
    print(customSwitch2);
    notifyListeners();
  }
}