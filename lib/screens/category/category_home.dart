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
      backgroundColor: Colors.grey[600],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Strange Sounds"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 8, right: 8),
            child: Container(
              width: AppBar().preferredSize.height - 8,
              height: AppBar().preferredSize.height - 8,
              color: Colors.white,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius:
                      BorderRadius.circular(AppBar().preferredSize.height),
                  child: Icon(
                    multiple ? Icons.dashboard : Icons.view_agenda,
                    color: Colors.grey,
                  ),
                  onTap: () {
                    setState(() {
                      multiple = !multiple;
                    });
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
            child: multiple
                ? Column(
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
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  )
                : GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
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
                  )),
      ),
    );
  }
}
