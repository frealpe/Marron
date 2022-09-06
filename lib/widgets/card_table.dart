import 'package:admin_dashboard/widgets/single_card.dart';
import 'package:flutter/material.dart';


class CardTable extends StatelessWidget {
const CardTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
       children: [
        TableRow(
          children: [
          SingleCard(imagen: 'REF485',),
          SingleCard(imagen: 'REF486'),
          ]
        ),
        TableRow(
          children: [
          SingleCard(imagen: 'REF487'),
          SingleCard(imagen: 'REF488'),
          ]
        ),
        TableRow(
          children: [
          SingleCard(imagen: 'REF489'),
          SingleCard(imagen: 'REF485'),
          ]
        ),



       ], 

    );
    
  }
}


