import 'package:admin_dashboard/models/category.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class CardSwiper extends StatelessWidget {


  List <Categoria> categorias = [];
  CardSwiper({
    Key? key, required this.categorias
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
      final size = MediaQuery.of(context).size;

      if(categorias.length ==0) {
        return Container(
            width: double.infinity,
            height: size.height*0.5,
            child: Center(
              child: CircularProgressIndicator(),
              ),
        );
      }
      return Container(
        width:  double.infinity,
        height: size.height*0.5,
        child: Swiper(
          itemCount: categorias.length,
          layout: SwiperLayout.STACK,
          itemWidth: size.width*0.6,
          itemHeight: size.height*0.4,
          itemBuilder: (_, int index){
          final categoria = categorias[index];

          return GestureDetector(
              onTap: () => NavigationServer.navigateTo(Flurorouter.productsRoute),
              //Flurorouter.rootRoute
        child: Card(
              child: ClipRRect(
                borderRadius:BorderRadius.circular(20),
                child: FadeInImage(                
                  placeholder: AssetImage ('assets/no-image.jpg'),
                  image: NetworkImage(categoria.img!),                
                  fit: BoxFit.cover,
                  ),
              ),
              ),
              );
          },
          ),
      );
  }
}