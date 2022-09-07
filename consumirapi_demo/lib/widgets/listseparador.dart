import 'package:consumirapi_demo/model/dato.dart';
import 'package:flutter/material.dart';

class ListSeparador extends StatelessWidget {
  const ListSeparador({
    Key? key,
    required this.post,
  }) : super(key: key);
  final List<Post>? post;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 100,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.all(10.10),
          child: Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey[300]),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post![index].title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    post![index].body ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              )),
            ],
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
