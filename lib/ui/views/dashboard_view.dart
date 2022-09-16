import 'package:admin_dashboard/search/search_delegate.dart';
import 'package:admin_dashboard/widgets/categories_view.dart';
import 'package:flutter/material.dart';


class DashboardView extends StatelessWidget {

    const DashboardView({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Productos existentes'),
            elevation: 0,
            actions: [
              IconButton(
                icon: Icon(Icons.search_off_outlined),
                onPressed: ()=>showSearch(context: context, delegate: ProductSearchDelegate()),
                )
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