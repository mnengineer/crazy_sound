import 'package:flutter/material.dart';
import 'package:strange_sounds/data/category_data.dart';
import 'package:strange_sounds/screens/category/category_detail.dart';
import 'package:strange_sounds/widgets/category_home_item.dart';

class CategoryHomeScreen extends StatefulWidget {
  const CategoryHomeScreen({Key? key}) : super(key: key);

  @override
  State<CategoryHomeScreen> createState() => _CategoryHomeScreenState();
}

class _CategoryHomeScreenState extends State<CategoryHomeScreen>
    with TickerProviderStateMixin {
  bool multiple = true;
  AnimationController? animationController;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: const Text("Strange Sounds"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 8, right: 4),
            child: Material(
              child: InkWell(
                borderRadius:
                    BorderRadius.circular(AppBar().preferredSize.height),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Icon(
                    multiple ? Icons.dashboard : Icons.view_agenda,
                  ),
                ),
                onTap: () {
                  setState(() {
                    multiple = !multiple;
                  });
                },
              ),
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
        child: SingleChildScrollView(
          child: GridView.count(
            crossAxisCount: multiple ? 1 : 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            childAspectRatio: multiple ? 1.5 : 1,
            children: List<Widget>.generate(categoryData.length, (int index) {
              final int count = categoryData.length;
              final Animation<double> animation =
                  Tween<double>(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(
                  parent: animationController!,
                  curve: Interval((1 / count) * index, 1.0,
                      curve: Curves.fastOutSlowIn),
                ),
              );
              animationController?.forward();
              return CategoryHomeItem(
                title: categoryData[index].title,
                imagePath: categoryData[index].imagePath,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoryDetailScreen(
                          title: categoryData[index].title),
                    ),
                  );
                },
                animation: animation,
                animationController: animationController,
              );
            }),
          ),
        ),
      ),
    );
  }
}
