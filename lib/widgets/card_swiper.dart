import 'package:admin_dashboard/models/producto.dart';
import 'package:admin_dashboard/providers/providers.dart';
import 'package:admin_dashboard/ui/views/productos_view.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';


class CardSwiper extends StatelessWidget {

  List <Producto> productos;
  CardSwiper({
    Key? key,
    required this.productos
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
      
     final value = Provider.of<CounterProvider>(context,);           
     final size = MediaQuery.of(context).size;

      if(productos.length ==0) {
        return Container(
            width: double.infinity,
            height: size.height*0.4,
            child: Center(
              child: CircularProgressIndicator(),
              ),
        );
      }
      return Padding(

        padding: EdgeInsets.symmetric(horizontal: 25),        
        child: Container(
        margin: EdgeInsets.only(top: 10,bottom: 10),
        width:  double.infinity,      
        height: size.height*0.6,
        decoration: _cardBorders(),
        child: Stack(
          alignment: Alignment.center,
          children: [
            _Deslizartarjeta(size: size, productos: productos),
            
            Positioned(
              top: 590,
              left: 0,
              child: _productDetails(
                size:size,
                Referencia:productos[value.counter].nombre,
                Categoria: productos[value.counter].categoria!.nombre,
                ),    
              ),          

            Positioned(
              top: 0,
              right: 0,
              child: _PriceTag(
                size:size,
                precio: productos[value.counter].precio,
                )
              ),      
            //MOSTRAR DE MANERA CONDICIONAL
            Positioned(
              top: 0,
              left: 0,
              child: _NotAvalible(
                size: size,
                disponible :productos[value.counter].disponible, 
                )
              )                   
          ],
        ),

        ),    
            
        );
  }

  BoxDecoration _cardBorders() => BoxDecoration(

      color: Colors.white,
      borderRadius: BorderRadius.circular(25),
      boxShadow: [
        BoxShadow(
          color:  Color(0xff441c04),
          offset: Offset(0,7),
          blurRadius: 10
        )
      ]

  );
}
/////////////////////////////////////////////////////////////////////
class _NotAvalible extends StatelessWidget {
  final String disponible;

  const _NotAvalible({
    Key? key,
    required this.size,
    required this.disponible,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
        return Container(
      child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding:EdgeInsets.symmetric(horizontal: 10),
          child: Text(disponible,style: TextStyle(fontSize: 5,color: Color.fromARGB(255, 14, 1, 1),fontWeight: FontWeight.bold),)
          ),
      ),
      width:  190,      
      height: 60,
      decoration: BoxDecoration(
        color:  Color.fromARGB(255, 184, 75, 7),
        borderRadius: BorderRadius.only(topLeft:Radius.circular(25),bottomRight: Radius.circular(25) )
      ),

    );  
  }
}
//////////////////////////////////////////////////////////////////////
class _PriceTag extends StatelessWidget {
  final Size size;
  final String precio;
  const _PriceTag({ 
    Key? key, 
    required this.size, 
    required this.precio,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding:EdgeInsets.symmetric(horizontal: 10),
          child: Text(precio,style: TextStyle(fontSize: 5,color: Color.fromARGB(255, 14, 1, 1),fontWeight: FontWeight.bold),)
          ),
      ),
      width:  190,      
      height: 60,
      decoration: BoxDecoration(
        color:  Color.fromARGB(255, 124, 48, 1),
        borderRadius: BorderRadius.only(topRight:Radius.circular(25),bottomLeft: Radius.circular(25) )
      ),

    );
  }
}
//////////////////////////////////////////////////////////////////////
class _productDetails extends StatelessWidget {
    final Size size;
    final String Referencia;
    final String Categoria;
  const _productDetails({
    Key? key, 
    required this.size, 
    required this.Referencia,
    required this.Categoria,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(right: 310),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            width:  200,      
            height: 70,
            decoration: _BuildboxDecoartion(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Text(
                    Referencia,
                    style: TextStyle(fontSize: 20,color: Color.fromARGB(255, 14, 1, 1),fontWeight: FontWeight.bold),
                    maxLines:1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    Categoria,
                    style: TextStyle(fontSize: 15,color: Color.fromARGB(255, 14, 1, 1),fontWeight: FontWeight.bold),
                  )                
              ],
            ),
      
        ),
      ),
    );
  }

  BoxDecoration _BuildboxDecoartion() => BoxDecoration(

    color:  Color.fromARGB(255, 124, 48, 1),
    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25),topRight: Radius.circular(25))
  );
}
///////////////////////////////////////////////////////////////////
class _Deslizartarjeta extends StatelessWidget {
  const _Deslizartarjeta({
    Key? key,
    required this.size,
    required this.productos,
  }) : super(key: key);

  final Size size;
  final List<Producto> productos;

  @override
  Widget build(BuildContext context) {
    final value = Provider.of<CounterProvider>(context);    
    return Container(
      width:  double.infinity,
      height: size.height*0.45,

      child: Swiper(
        itemCount: productos.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width*0.7,
        itemHeight: size.height*0.5,
        itemBuilder: (_, int index){
        value.dataNow(index);
        final producto = productos[index];

        return GestureDetector(
            onTap: (){
             Navigator.push(
             context,
             MaterialPageRoute(builder: (context) => ProductosView(productos:productos[value.counter].id))); 
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

