import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum TabItem { Kullanicilar, Profil }

class TabItemData {
  final String title;
  final IconData icon;


  TabItemData(this.title, this.icon);
  static Map<TabItem, TabItemData> tumTablar = {
    TabItem.Kullanicilar:
        TabItemData("YapDoy", Icons.fastfood),
    TabItem.Profil: TabItemData("Profil", Icons.person)
  };
}
