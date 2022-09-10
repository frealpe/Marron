import 'package:admin_dashboard/models/category.dart';
import 'package:admin_dashboard/ui/views/categoria_view.dart';
import 'package:flutter/material.dart';


class MovieSlider extends StatefulWidget {
  
  final List<Categoria> categoria;
  final String? title;
  final Function onNexPage;
  
  const MovieSlider(
    {Key? key,
     required this.categoria,
     this.title, 
     required this.onNexPage,
     }) : super(key: key);

  @override
  State<MovieSlider> createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {

  final ScrollController scrollController = new ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(() {
      
      if(scrollController.position.pixels >= scrollController.position.maxScrollExtent-500){
          widget.onNexPage();
      }

    });

  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 260,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          
          if (this.widget.title != null)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(widget.title!,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
          SizedBox(height: 5),
          Expanded(
            child: ListView.builder(
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: widget.categoria.length,
                itemBuilder: (_, int index) => _MovieCategoria(widget.categoria[index]),
              
                ),
          ),
        ],
      ),
    );
  }
}


class _MovieCategoria extends StatelessWidget {
  final Categoria categoria;

  const _MovieCategoria(this.categoria);
    
  @override
    Widget build(BuildContext context) {
      
      return Container(
                    width: 130,
                    height: 190,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        GestureDetector(
                          //TODO HCAER LA NAVEGACION A TODOS LOS PRODUCTOS DE LA CATEGORIA ESCOGIDA
                            onTap: (){                              
                            Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CategoriaView(categoria: categoria.id))); 
                            },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: FadeInImage(
                            placeholder: AssetImage ('assets/no-image.jpg'),
                            image: NetworkImage(categoria.img!),     
                            width: 130,
                            height: 190,
                            fit: BoxFit.cover),
                          ),
                        ),

                        SizedBox(height: 5,),
                          Text(
                          categoria.nombre,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,)
                      ],
                    ),
                  );
    }
  }



        



  
