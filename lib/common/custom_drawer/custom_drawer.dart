import 'package:flutter/material.dart';
import 'package:loja_virtual/common/custom_drawer/drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(
                    maxRadius: 22,
                    backgroundImage: NetworkImage(
                        "https://avatars.githubusercontent.com/u/66392421?v=4"),
                  )
                ],
              ),
            ),
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
    );
  }
}
