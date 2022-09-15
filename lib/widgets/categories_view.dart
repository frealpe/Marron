import 'package:admin_dashboard/providers/providers.dart';
import 'package:admin_dashboard/widgets/card_swiper.dart';
import 'package:admin_dashboard/widgets/movie_slider.dart';
import 'package:flutter/material.dart';
class CategoriesView extends StatelessWidget {
  const CategoriesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoriaProvider = Provider.of<CategoriesProvider>(context);
    final productosProvider = Provider.of<ProductosProvider>(context);
    final value = Provider.of<CounterProvider>(context,listen: false);
    value.dataNow(productosProvider.productos.length,productosProvider.productos.length);
    return Container(

        child: Column(

          children: [
////////////////////////////////////////////////////////
             Positioned(
              top: 20,
              left: 1,
              child: IconButton(
                onPressed: ()=> productosProvider.getProductos(),
                icon: Icon(
                Icons.arrow_back_ios_new,size:40,
                color:  Color.fromARGB(255, 66, 33, 12),
                ) 
                
                )
              ),            
////////////////////////////////////////////////////////              
            SizedBox( height: 10 ), 
////////////////////////////////////////////////////////
            CardSwiper(
            productos:productosProvider.productos            
            ),
////////////////////////////////////////////////////////////
            SizedBox( height: 30 ), 
////////////////////////////////////////////////////////////            
            MovieSlider(
            categoria: categoriaProvider.categorias,
            title: 'Categorías de Productos',
            onNexPage: () => categoriaProvider.getCategories(),
            ), 
          ],
        ),
      );
  }
}


