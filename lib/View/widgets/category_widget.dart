import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_udemy/Controller/news_controller.dart';
import 'package:news_udemy/Model/news_model.dart';
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

  final newsController = Get.put(NewsController());

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
              children: CategoryList.categoryItems.map((e) {
                return FutureBuilder(
                  future: newsController.getCategory(category: e),
                  builder: (context, snapShot) {
                    if (snapShot.hasData) {
                      return ListItems(list: snapShot.data as List<NewsModel>);
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                );
              }).toList()),
        )
      ],
    );
  }
}
