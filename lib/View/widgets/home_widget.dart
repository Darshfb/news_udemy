import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_udemy/Controller/news_controller.dart';
import 'package:news_udemy/View/widgets/list_items.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsController>(
        init: NewsController(),
        builder: (controller) {
          return ListItems(list: controller.list,);
        });
  }
}
