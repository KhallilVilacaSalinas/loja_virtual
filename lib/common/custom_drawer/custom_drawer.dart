import 'package:flutter/material.dart';
import 'package:loja_virtual/common/custom_drawer/drawer_tile.dart';

import 'custom_drawer_header.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color.fromARGB(255, 203, 236, 241),
                  Colors.white
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter
              )
            ),
          ),
          ListView(
            children: [
              CustomDrawerHeader(),
              Divider(
                thickness: 0.9,
              ),
              DrawerTile(
                iconData: Icons.home,
                title: "Inicio",
                page: 0,
              ),
              DrawerTile(
                iconData: Icons.list,
                title: "Produtos",
                page: 1,
              ),
              DrawerTile(
                iconData: Icons.playlist_add_check,
                title: "Meus pedidos",
                page: 2,
              ),
              DrawerTile(
                iconData: Icons.location_on,
                title: "lojas",
                page: 3,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
