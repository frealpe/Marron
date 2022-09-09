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
    final String title;

    return Container(

        child: Column(

          children: [
            SizedBox( height: 30 ), 
            CardSwiper(
            productos:productosProvider.productos            
            ),
////////////////////////////////////////////////////////////
            SizedBox( height: 30 ), 
////////////////////////////////////////////////////////////            
            MovieSlider(
            categoria: categoriaProvider.categorias,
            title: 'Categorias de Todos los Productos',
            onNexPage: () => categoriaProvider.getCategories(),
            ), 
          ],
        ),
      );
  }
}


