import 'package:admin_dashboard/models/producto.dart';
import 'package:flutter/material.dart';

class ProductosView extends StatelessWidget {
final Producto producto;

  ProductosView({
    Key? key,    
    required this.producto,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {

   return Scaffold(
      body: CustomScrollView(
      slivers: [
        _CustomAppBar(producto),
        SliverList(
          delegate: SliverChildListDelegate([

        ])
        )
      ],
    )
    );
        
  }

  BoxDecoration _cardBorders() => BoxDecoration(
        color: Color.fromARGB(255, 124, 117, 117),
      borderRadius: BorderRadius.circular(25),
      boxShadow: [
        BoxShadow(
          color:  Color.fromARGB(255, 66, 33, 12),
          offset: Offset(0,8),
          blurRadius: 15
        )
      ]


  );
  
}

///////////////////////////////////////////////////////////////////////////
///
class _CustomAppBar extends StatelessWidget {

  final Producto producto;

  // ignore: unused_element
  const _CustomAppBar(
     this.producto,    
    );

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: SizedBox(
          width: double.infinity,
          child: Text(
            producto.nombre,
            style: TextStyle(fontSize: 16), 
            textAlign: TextAlign.center,
            ),
        ),


        background: FadeInImage(
          placeholder: AssetImage('assets/no-image.jpg'),
          image: NetworkImage('${producto.img}'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
