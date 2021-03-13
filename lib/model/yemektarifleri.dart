
import 'package:flutter/material.dart';

class Tarif {

  final List items;
  final String name;
  final String tarif;
  final String pisirmesuresi;
  final String resimURL;

  Tarif({@required this.items, @required this.name,@required this.tarif,@required this.pisirmesuresi,@required this.resimURL});

        Tarif.fromMap(Map<String, dynamic> map) :
      // User nesnesinin içinde bulunan yapı -- Firebasedeki etiket.
              items = map['items'],
              name = map['name'],
              tarif = map['tarif'],
              pisirmesuresi = map['pisirmesuresi'],
              resimURL = map['resimURL'];
           

        @override
        String toString() {
          return '{name: $name,items: $items,pisirmesuresi: $pisirmesuresi, tarif: $tarif, resimURL: $resimURL}';
        }
      
}
