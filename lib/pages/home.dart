import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/services/data.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = [];

  @override
  void initState() {
    super.initState();
    categories = getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(244, 255, 255, 255),
      body: Container(
        margin: EdgeInsets.only(top: 60, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Tizi",
                  style: TextStyle(
                    color: Color(0xff3280ef),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Line",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              "Hottest News",
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: MediaQuery.of(context).size.height / 3.03,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 5, left: 5.0),
                    child: Material(
                      elevation: 2.0,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  "images/news3.jpg",
                                  width:
                                      MediaQuery.of(context).size.width / 1.8,
                                  fit: BoxFit.cover,
                                  height: 170,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              width: MediaQuery.of(context).size.width / 1.8,
                              child: Text(
                                "Welcome Tizi",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: const Color.fromARGB(188, 0, 0, 0),
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            Container(
                              padding: EdgeInsets.only(left: 5.0, right: 5.0),
                              width: MediaQuery.of(context).size.width / 1.8,
                              child: Text(
                                textAlign: TextAlign.center,
                                " Welcome to the app for me ",
                                style: TextStyle(
                                  color: const Color.fromARGB(151, 0, 0, 0),
                                ),
                              ),
                            ),
                            Spacer(),
                            Container(
                              width: 90,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Color(0xff3280ef),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                ),
                              ),
                              margin: EdgeInsets.only(left: 160),
                              child: Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20.0),
                  Container(
                    margin: EdgeInsets.only(bottom: 5, left: 5.0),
                    child: Material(
                      elevation: 2.0,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  "images/news3.jpg",
                                  width:
                                      MediaQuery.of(context).size.width / 1.8,
                                  fit: BoxFit.cover,
                                  height: 170,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              width: MediaQuery.of(context).size.width / 1.8,
                              child: Text(
                                "Welcome Tizi",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: const Color.fromARGB(188, 0, 0, 0),
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            Container(
                              padding: EdgeInsets.only(left: 5.0, right: 5.0),
                              width: MediaQuery.of(context).size.width / 1.8,
                              child: Text(
                                textAlign: TextAlign.center,
                                " Welcome to the app for me ",
                                style: TextStyle(
                                  color: const Color.fromARGB(151, 0, 0, 0),
                                ),
                              ),
                            ),
                            Spacer(),
                            Container(
                              width: 90,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Color(0xff3280ef),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                ),
                              ),
                              margin: EdgeInsets.only(left: 160),
                              child: Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Explore",
              style: TextStyle(
                color: Colors.black,
                fontSize: 26,
                fontWeight: FontWeight.w500,
              ),
            ),
            Container(
              height: 150,

              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return CategoryTile(
                    categoryname: categories[index].categoryName ?? "",
                    image: categories[index].image ?? "",
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final image, categoryname;
  CategoryTile({this.categoryname, this.image});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20.0),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: Image.asset(
              image,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: 100,
            width: 100,
            child: Text(
              categoryname,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
