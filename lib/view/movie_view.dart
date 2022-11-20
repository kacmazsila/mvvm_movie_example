import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mvvm_movie_example/view_model/movie_view_mode.dart';
import 'package:provider/provider.dart';

class MovieView extends StatelessWidget {
  const MovieView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(),
        body: context.watch<MovieViewModel>().state == MovieState.BUSY
            ? buildLoadingWidget()
            : context.watch<MovieViewModel>().state == MovieState.ERROR
                ? buildErrorWidget()
                : buildListView(context));
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const Text("Movies"),
    );
  }

  Center buildLoadingWidget() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Center buildErrorWidget() {
    return const Center(
      child: Text('Servis sorgulamasında hata alındı!'),
    );
  }

  ListView buildListView(BuildContext context) {
    return ListView.builder(
        itemCount: 9, itemBuilder: (_, index) => buildListItem(context, index));
  }

  Widget buildListItem(BuildContext context, int index) {}
}
