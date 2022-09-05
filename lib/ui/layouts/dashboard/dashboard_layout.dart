import 'package:admin_dashboard/providers/sidemenu_provider.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class DashboardLayout extends StatefulWidget {

  //Los latout reciben un widget

  final Widget child;

  const DashboardLayout({
    Key? key,
    required this.child,
    }) : super(key: key);

  @override
  State<DashboardLayout> createState() => _DashboardLayoutState();
}

class _DashboardLayoutState extends State<DashboardLayout> with SingleTickerProviderStateMixin {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SideMenuProvider.menuController= new AnimationController(
      vsync:this,
      duration: Duration(microseconds: 300),
      );
  }

  
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffEDF1F2),
        body: Stack(
          children: [
            Row(
              children:[
                  Text('Tienda en Articulos de Cuero',style: CustomLabels.h1),
              ]
            ),
          ],
        )

    );
  }
}