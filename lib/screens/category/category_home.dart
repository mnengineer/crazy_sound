import 'package:flutter/material.dart';
import 'package:strange_sounds/data/category_data.dart';
import 'package:strange_sounds/screens/category/category_detail.dart';
import 'package:strange_sounds/widgets/category_home_item.dart';

class CategoryHomeScreen extends StatefulWidget {
  const CategoryHomeScreen({Key? key}) : super(key: key);

  @override
  State<CategoryHomeScreen> createState() => _CategoryHomeScreenState();
}

class _CategoryHomeScreenState extends State<CategoryHomeScreen> {
  bool multiple = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
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
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        child: SingleChildScrollView(
          child: GridView.count(
            crossAxisCount: multiple ? 1 : 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            childAspectRatio: multiple ? 1.5 : 1,
            children: [
              for (final item in categoryData)
                CategoryHomeItem(
                  title: item.title,
                  imagePath: item.imagePath,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CategoryDetailScreen(title: item.title),
                      ),
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
