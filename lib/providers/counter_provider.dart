
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_lists.dart';

class CounterProvider extends ChangeNotifier{ 

  int _value = 0;
  get counter => this._value;

  void dataNow(index){

    
    this._value=index;

    WidgetsBinding.instance.addPostFrameCallback((_)
     {
        notifyListeners();
     }
    );    
  }

}