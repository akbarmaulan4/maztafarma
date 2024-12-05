import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maztafarma/feature/maztafarma/presentation/controller/basic/infinity_list_controller.dart';

class InfinityListPage extends StatefulWidget {
  const InfinityListPage({super.key});

  @override
  State<InfinityListPage> createState() => _InfinityListPageState();
}

class _InfinityListPageState extends State<InfinityListPage> {

  InfinityListController infinityListController = InfinityListController();
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(() {
      if(scrollController.position.pixels == scrollController.position.maxScrollExtent){
        infinityListController.getDataList();
      }
    });

    infinityListController.getDataList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(()=>Container(
        child: ListView.builder(
            controller: scrollController,
            itemCount: infinityListController.dataList.value.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(infinityListController.dataList.value[index].title ?? 'null'),
            )
        ),
      )),
    );
  }
}
