import 'package:admin_dashboard/providers/categories_provider.dart';
import 'package:admin_dashboard/widgets/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoriaProvider     = Provider.of<CategoriesProvider>(context);
    final String title;
    //final popularProvider = Provider.of<Pop

    return Container(

        child: Column(
          children: [
            CardSwiper(categorias:categoriaProvider.categorias),
/*             MovieSlider(
              movies: moviesProvider.popularMovies,
              title: 'Populares',
              onNexPage: () => moviesProvider.getPopularMovies(),
            ), */
          ],
        ),
      );
  }
}
