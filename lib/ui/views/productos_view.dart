
import 'package:admin_dashboard/models/producto.dart';
import 'package:admin_dashboard/widgets/Background.dart';
import 'package:admin_dashboard/widgets/page_title.dart';
import 'package:flutter/material.dart';

class ProductosView extends StatelessWidget {

final Producto? producto;

  ProductosView({
    Key? key,    
    this.producto,
    }) : super(key: key);

    @override
  Widget build(BuildContext context) {
    print('Entre');
    print(producto!.nombre);
    return  Scaffold(
       body: Stack(
        children:[
        Background(),
        PageTitle(),
        ]
      ),
    );
    


    
  }
  
}

