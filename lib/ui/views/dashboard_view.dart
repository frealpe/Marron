import 'package:admin_dashboard/widgets/categories_view.dart';
import 'package:flutter/material.dart';


class DashboardView extends StatelessWidget {

    const DashboardView({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Categorias existentes'),
            elevation: 0,
            actions: [
              IconButton(onPressed: (){}, icon: Icon(Icons.search_off_outlined))
            ],
        ),
      body: Stack(
        children: [
        //Background(),
        _HomeBody()
        ],
      ),    
    );
  }
}
//////////////////////////////////////////////////////////

class _HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
        CategoriesView(),
          
        ],
      ),

    );
  }
}