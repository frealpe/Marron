import 'dart:convert';

class Productobus {
    Productobus({
        required this.id,
        required this.nombre,
        required this.genero,
        required this.cantidad,
        required this.usuario,
        required this.precio,
        required this.categoria,
        required this.descripcion,
        required this.disponible,
        this.img,

    });

    String id;
    String nombre;
    String genero;
    String cantidad;
    String usuario;
    String precio;
    String categoria;
    String descripcion;
    String disponible;
    String? img;


    factory Productobus.fromJson(String str) => Productobus.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

     factory Productobus.fromMap(Map<String, dynamic> json) {

          return Productobus(
              id: json["_id"],
              nombre: json["nombre"],
              genero: json["genero"],
              cantidad: json["cantidad"],
              usuario: json["usuario"],
              precio: json["precio"],
              categoria: json["categoria"],
              descripcion: json["descripcion"],
              disponible: json["disponible"], 
              img: json["img"],
          ); 
           
     } 
     
      Map<String, dynamic> toMap() => {
        
        "_id": id,
        "nombre": nombre,
        "genero": genero,
        "cantidad": cantidad,
        "usuario": usuario,
        "precio": precio,
        "categoria": categoria,
        "descripcion": descripcion,
        "disponible": disponible,
        "img": img,
    };

}

class Categoriap {
    Categoriap({
        required this.id,
        required this.nombre,
    });

    String id;
    String nombre;

    factory Categoriap.fromJson(String str) => Categoriap.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());


    factory Categoriap.fromMap(Map<String, dynamic> json){

        return Categoriap (
        nombre: json["nombre"],
        id: json["_id"],
        );
    }
    

    Map<String, dynamic> toMap() => {
        "_id": id,
        "nombre": nombre,
    };
}
