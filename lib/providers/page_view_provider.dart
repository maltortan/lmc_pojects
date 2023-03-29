import 'package:flutter/material.dart';

class PageViewProvider extends ChangeNotifier{
  int index = 0;

  increment(int length) async{
    if(index<=length){
      index = index+1;
      print(index);
      notifyListeners();
    }

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