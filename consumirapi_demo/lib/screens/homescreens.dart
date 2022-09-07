import 'package:consumirapi_demo/model/dato.dart';
import 'package:flutter/material.dart';

import 'package:consumirapi_demo/server/remote_service.dart';

import '../widgets/listseparador.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Post>? post;
  bool isLoaded = false;
  @override
  void initState() {
    super.initState();
    getData();
    //fetch data drom API
  }

  getData() async {
    post = await RemoteService().getPosts();
    if (post != null) {
      isLoaded = true;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Consumir API'),
        ),
        body: Visibility(
          visible: isLoaded,
          replacement: const Center(child: CircularProgressIndicator()),
          child: ListSeparador(post: post),
        ));
  }
}

class ListPosts extends StatelessWidget {
  const ListPosts({
    Key? key,
    required this.post,
  }) : super(key: key);

  final List<Post>? post;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: post?.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey[300],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post![index].title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      post![index].body ?? '',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
