import 'package:flutter/material.dart';
import 'package:news_udemy/Model/news_model.dart';

class ListItems extends StatelessWidget {
  const ListItems({super.key, required this.list});

  final List<NewsModel> list;

  @override
  Widget build(BuildContext context) {
    if (list.isNotEmpty) {
      return ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(4),
            height: MediaQuery.of(context).size.height * 0.3,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage("${list[index].urlToImage}"),
                fit: BoxFit.cover,
              ),
            ),
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
              padding: const EdgeInsets.all(10),
              child: Text(
                "${list[index].title}",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          );
        },
      );
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
