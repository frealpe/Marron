import 'dart:async';

import 'package:admin_dashboard/helpers/debouncer.dart';
import 'package:admin_dashboard/models/busqueda.dart';
import 'package:admin_dashboard/models/http/productos_busqueda.dart';
import 'package:admin_dashboard/models/http/productos_response.dart';
import 'package:flutter/material.dart';
import 'package:admin_dashboard/api/BolsosApi.dart';
import '../models/producto.dart';


class ProductosProvider extends ChangeNotifier{

  int _value = 0;
  get estadoc => this._value;

  final debouncer = Debouncer(
    duration: Duration(microseconds: 500),
    
    );

List <Producto>productos= [];
List <Productobus> producbs= [];

final StreamController<List<Productobus>>_suggestionsStreamController= new StreamController.broadcast();
Stream<List<Productobus>> get suggestionsStream => this._suggestionsStreamController.stream;

GlobalKey<FormState> formKey = new GlobalKey<FormState>();

///////////////////////////////////////////////////////////

  ProductosProvider(){
  getProductos();
 // _suggestionsStreamController.close();

}
/////////////////////////////////////////////////////////////////////
  getProductos() async{

    final resp= await BolsosApi.httpGet('/productos/');
    
    final prodResp= ProductoResponse.fromMap(resp);
    productos = [...prodResp.productos]; 
     notifyListeners();
    
  }
/////////////////////////////////////////////////////////////////////
 Future<Producto>getProductoById(String uid) async{

    try {
    final resp= await BolsosApi.httpGet('/productos/$uid');  
    final prodR= Producto.fromMap(resp["producto"]);
    return prodR;
    } catch (e) {
      print(e);
      throw e;     
    }
  }
/////////////////////////////////////////////////////////////////////
  deleteProducto(String uid) async{
    try {
     await BolsosApi.delete('/productos/$uid',{});    
      productos.removeWhere((productos)=>productos.id==uid);
      notifyListeners();
    } catch (e) {
      throw 'Error al borrar el producto';
    }
  }

  ///////////////////////////////////////////
void refreshProducto(Producto newProducto){

  productos = this.productos.map(
    (producto) {
        if(producto.id == newProducto.id){
          producto=newProducto;
        }
        return producto;
    }
    ).toList();

  notifyListeners();
  
}
/////////////////////////////////////////////////////////////////////
 getProduCate(String uidc) async{
    productos.clear();
    
    final resp= await BolsosApi.httpGet('/buscar/producateg/$uidc');
    //print(resp);
    final prodResp= ProductoResponse.fromMap(resp);
    productos = [...prodResp.productos];   
    notifyListeners();
    return productos.length;  

  }
/////////////////////////////////////////////////////////////////////
 Future busProduct(String uidc) async{
    producbs.clear();   
    final resp= await BolsosApi.httpGet('/buscar/productos/$uidc');
    final prodResp= Productobus.fromMap(resp);

    producbs=[prodResp];
    notifyListeners();
    return producbs;  

  }
//////////////////////////////////////////////////////////////////////
Future newProducto( String name ) async {
    final data = {
      'nombre': name,
    };

    try {
 //     print(data);
      final json = await BolsosApi.post('/categorias', data );
      getProductos();
      
    } catch (e) {
      throw 'Error al crear categoria';
    }

}  
/////////////////////SE ACTUALIZA CATEGORIA
  Future updateProducto( String name, String id ) async {

    final data = {
      'nombre': name,
    };
    try {
     await BolsosApi.put('/categorias/$id', data );
     this.productos=this.productos.map(
     (category){
      if(category.id !=id) return category;
      category.nombre=name;
      return category;
     } 
     ).toList();

      notifyListeners();
     
    } catch (e) {
      throw 'Error al actualizar la categoria';
    }
  }



void getSuggestionsByQuery( String searchTerm ) {

    debouncer.value = '';
    debouncer.onValue = ( value ) async {
      // print('Tenemos valor a buscar: $value');
      final results = await this.busProduct(value);

      print(results);
      this._suggestionsStreamController.add( results );
    };

    final timer = Timer.periodic(Duration(milliseconds: 300), ( _ ) { 
      debouncer.value = searchTerm;
    });

    Future.delayed(Duration( milliseconds: 301)).then(( _ ) => timer.cancel());
  }



/* @override
void dispose() {
  _disposed = true;
  super.dispose();
}

@override
void notifyListeners() {
  if (!_disposed) {
    super.notifyListeners();
  }
} */


  }
