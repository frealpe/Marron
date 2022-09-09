import 'package:admin_dashboard/models/producto.dart';
import 'package:admin_dashboard/ui/views/productos_view.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class CardSwiper extends StatelessWidget {

  List <Producto> productos = [];
  CardSwiper({
    Key? key,
    required this.productos
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {

      final size = MediaQuery.of(context).size;

      if(productos.length ==0) {
        return Container(
            width: double.infinity,
            height: size.height*0.6,
            child: Center(
              child: CircularProgressIndicator(),
              ),
        );
      }
      return Container(
        width:  double.infinity,
        height: size.height*0.45,
        //: Text('Categorias existentes'),
        child: Swiper(
          itemCount: productos.length,
          layout: SwiperLayout.STACK,
          itemWidth: size.width*0.7,
          itemHeight: size.height*0.5,
          itemBuilder: (_, int index){
          final producto = productos[index];

          return GestureDetector(
              onTap: (){
               Navigator.push(
                context,
              MaterialPageRoute(builder: (context) => ProductsView())); 
              },
        child: Card(
              child: ClipRRect(
                borderRadius:BorderRadius.circular(25),
                child: FadeInImage(                
                  placeholder: AssetImage ('assets/no-image.jpg'),
                  image: NetworkImage(producto.img!),                
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



/*                     ChangeNotifierProvider(
                      create: ( _ ) => LoginFormProvider(),
                      child: _LoginForm(), 
                    )  */ 