import 'package:flutter/material.dart';
import 'package:loja_virtual/models/page_manager.dart';
import 'package:provider/provider.dart';

class DrawerTile extends StatelessWidget {
  final IconData iconData;
  final String title;
  final int page;

  const DrawerTile({this.iconData, this.title, this.page});

  @override
  Widget build(BuildContext context) {
    final int curPage = context.watch<PageManager>().page;

    return Column(
      children: [
        InkWell(
          onTap: () {
            context.read<PageManager>().setPage(page);
          },
          child: SizedBox(
            height: 60,
            child: Row(
              children: [
                Divider(
                  color: Colors.grey[400],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Icon(
                    iconData,
                    size: 32,
                    color: curPage == page ? Colors.red : Colors.grey[700],
                  ),
                ),
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 16,
                      color: curPage == page ? Colors.red : Colors.grey[700]),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}