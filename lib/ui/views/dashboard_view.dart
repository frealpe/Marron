import 'package:admin_dashboard/widgets/Background.dart';
import 'package:admin_dashboard/widgets/categories_view.dart';
import 'package:admin_dashboard/widgets/page_title.dart';
import 'package:flutter/material.dart';


class DashboardView extends StatelessWidget {


   
  const DashboardView({Key? key}) : super(key: key);


  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
         //Background 
        Background(),
        _HomeBody()
        ],
      ),
   //   bottomNavigationBar: CustomBottomNavigation(),
      
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
        PageTitle(),
        CategoriesView(),
          
        ],
      ),

    );
  }
}