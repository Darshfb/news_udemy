import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_udemy/View/widgets/list_items.dart';
import 'package:news_udemy/shared/constant.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({super.key});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget>
    with SingleTickerProviderStateMixin {
  late TabController? controller;

  @override
  void initState() {
    controller =
        TabController(length: CategoryList.categoryItems.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          isScrollable: true,
          controller: controller,
          tabs: CategoryList.categoryItems.map((e) {
            return Container(
              child: Text(e),
            );
          }).toList(),
        ),
        Expanded(
          child: TabBarView(
            controller: controller,
              children: CategoryList.categoryItems.map((e) => ListItems()).toList()),
        )
      ],
    );
  }
}
