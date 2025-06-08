import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/pages/category_news.dart';
import 'package:news_app/services/data.dart';
import 'package:news_app/services/news.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class CategoryTile extends StatelessWidget {
  final String image;
  final String categoryname;

  const CategoryTile({required this.categoryname, required this.image});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryNews(name: categoryname)));
      },
      child: Container(
        margin: EdgeInsets.only(right: 20.0),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: Image.asset(
                image,
                height: 110,
                width: 110,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: 110,
              width: 110,
              decoration: BoxDecoration(
                color: const Color.fromARGB(34, 0, 0, 0),
                borderRadius: BorderRadius.circular(60),
              ),
            ),
            Container(
              height: 110,
              width: 110,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(60)),
              child: Center(
                child: Text(
                  categoryname,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = [];
  List<ArticleModel> articles = [];
  bool loading = true;
  String? errorMsg;

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    _getNews();
  }

  Future<void> _getNews() async {
    setState(() {
      loading = true;
      errorMsg = null;
      articles.clear();
    });

    try {
      final newsService = News();
      await newsService.getNews();
      setState(() {
        articles = newsService.news;
      });
    } catch (e) {
      setState(() {
        errorMsg = "Failed to load news: $e";
      });
    } finally {
      setState(() => loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),
      appBar: AppBar(
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Tizi',
                style: TextStyle(
                  color: Color(0xff3280ef),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: 'Line',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body:
          loading
              ? Center(child: CircularProgressIndicator())
              : errorMsg != null
              ? Center(
                child: Text(errorMsg!, style: TextStyle(color: Colors.red)),
              )
              : _buildContent(),
    );
  }

  Widget _buildContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Text(
            "Hottest News",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 10),
          SizedBox(
            height:
              MediaQuery.of(context).size.height / 3.2, // increased from 2.8
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: articles.length,
              itemBuilder: (context, i) => _newsCard(articles[i]),
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Explore",
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 10),
          SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder:
                  (context, i) => CategoryTile(
                    categoryname: categories[i].categoryName!,
                    image: categories[i].image!,
                  ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Trending News",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 10),
          _trendingTile(),
        ],
      ),
    );
  }

  Widget _newsCard(ArticleModel art) {
    return Container(
      margin: EdgeInsets.only(right: 10, bottom: 5),
      width: MediaQuery.of(context).size.width * 0.6,
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.network(
                art.urlToImage!,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
              child: Text(
                art.title ?? "",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                art.desc ?? "",
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              ),
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  // Widget _newsCard(ArticleModel art) {
  //   return Container(
  //     margin: EdgeInsets.only(right: 10),
  //     width: MediaQuery.of(context).size.width * 0.6,
  //     child: Material(
  //       elevation: 2,
  //       borderRadius: BorderRadius.circular(10),
  //       child: Column(
  //         children: [
  //           ClipRRect(
  //             borderRadius: BorderRadius.circular(10),
  //             child: Image.network(
  //               art.urlToImage!,
  //               height: 170,
  //               width: double.infinity,
  //               fit: BoxFit.cover,
  //             ),
  //           ),
  //           Padding(
  //             padding: const EdgeInsets.all(8.0),
  //             child: Text(
  //               art.title!,
  //               style: TextStyle(fontWeight: FontWeight.w600),
  //               textAlign: TextAlign.center,
  //             ),
  //           ),
  //           Padding(
  //             padding: const EdgeInsets.symmetric(horizontal: 8.0),
  //             child: Text(
  //               art.desc!,
  //               maxLines: 3,
  //               overflow: TextOverflow.ellipsis,
  //               textAlign: TextAlign.center,
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget _trendingTile() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.horizontal(left: Radius.circular(10)),
            child: Image.asset(
              "images/news1.jpg",
              width: 120,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Welcome Tizi",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 5),
                Text("Welcome to the app for me", textAlign: TextAlign.center),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



















// class _HomeState extends State<Home> {
//   List<CategoryModel> categories = [];
//   List<ArticleModel> articles = [];
//   bool loading = true;

//   @override
//   void initState() {
//     super.initState();
//     categories = getCategories();
//     getNews();
//   }

//   getNews()async{
//     News newsclass = News();
//     await newsclass.getNews();
//     setState(() {
//       articles = newsclass.news;
//       loading = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(244, 255, 255, 255),
//       body: Container(
//         margin: EdgeInsets.only(top: 60, left: 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   "Tizi",
//                   style: TextStyle(
//                     color: Color(0xff3280ef),
//                     fontSize: 30,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Text(
//                   "Line",
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 30,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 20),
//             Text(
//               "Hottest News",
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 22,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//             SizedBox(height: 10),
//             Container(
//               height: MediaQuery.of(context).size.height / 3.03,
//               child: ListView.builder(
//                 shrinkWrap: true,
//                 physics: ClampingScrollPhysics(),
//                 itemCount: articles.length,
//                 scrollDirection: Axis.horizontal,
//                 itemBuilder: (BuildContext context, int index) { 
//                   return Container(
//                     margin: EdgeInsets.only(bottom: 5, left: 5.0),
//                     child: Material(
//                       elevation: 2.0,
//                       borderRadius: BorderRadius.circular(10),
//                       child: Container(
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         child: Column(
//                           children: [
//                             Padding(
//                               padding: EdgeInsets.all(10),
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(20),
//                                 child: Image.network(
//                                   articles[index].urlToImage!,
//                                   width:
//                                       MediaQuery.of(context).size.width / 1.8,
//                                   fit: BoxFit.cover,
//                                   height: 170,
//                                 ),
//                               ),
//                             ),
//                             // SizedBox(height: 10),
//                             Container(
//                               width: MediaQuery.of(context).size.width / 1.8,
//                               child: Text(
//                                 articles[index].title!,
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                   color: const Color.fromARGB(188, 0, 0, 0),
//                                   fontSize: 18.0,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                             ),
//                             SizedBox(height: 5),
//                             Container(
//                               padding: EdgeInsets.only(left: 5.0, right: 5.0),
//                               width: MediaQuery.of(context).size.width / 1.8,
//                               child: Text(
//                                 textAlign: TextAlign.center,
//                                 articles[index].desc!,
//                                 style: TextStyle(
//                                   color: const Color.fromARGB(151, 0, 0, 0),
//                                 ),
//                               ),
//                             ),
//                             Spacer(),
//                             Container(
//                               width: 90,
//                               height: 40,
//                               decoration: BoxDecoration(
//                                 color: Color(0xff3280ef),
//                                 borderRadius: BorderRadius.only(
//                                   topLeft: Radius.circular(20),
//                                 ),
//                               ),
//                               margin: EdgeInsets.only(left: 160),
//                               child: Icon(
//                                 Icons.arrow_forward,
//                                 color: Colors.white,
//                                 size: 30,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
        
//                 },
//               ),
//             ),
//             SizedBox(height: 20),
//             Text(
//               "Explore",
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 26,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//             Container(
//               height: 150,
//               child: ListView.builder(
//                 shrinkWrap: true,
//                 scrollDirection: Axis.horizontal,
//                 itemCount: categories.length,
//                 itemBuilder: (context, index) {
//                   return CategoryTile(
//                     categoryname: categories[index].categoryName ?? "",
//                     image: categories[index].image ?? "",
//                   );
//                 },
//               ),
//             ),
//             Text(
//               "Trending News",
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 22,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//             SizedBox(height: 10),
//             Container(
//               margin: EdgeInsets.only(right: 20.0),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(10),
//                   bottomLeft: Radius.circular(10),
//                 ),
//               ),

//               child: Row(
//                 children: [
//                   ClipRRect(
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(10),
//                       bottomLeft: Radius.circular(10),
//                     ),
//                     child: Image.asset(
//                       "images/news1.jpg",
//                       height: 120,
//                       width: 120,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   Column(
//                     children: [
//                       Container(
//                               width: MediaQuery.of(context).size.width / 1.9,
//                               child: Text(
//                                 "Welcome Tizi",
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                   color: const Color.fromARGB(188, 0, 0, 0),
//                                   fontSize: 16.0,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                             ),
//                             SizedBox(height: 5),
//                             Container(
//                               padding: EdgeInsets.only(left: 5.0, right: 5.0),
//                               width: MediaQuery.of(context).size.width / 1.8,
//                               child: Text(
//                                 textAlign: TextAlign.center,
//                                 " Welcome to the app for me ",
//                                 style: TextStyle(
//                                   color: const Color.fromARGB(151, 0, 0, 0),
//                                 ),
//                               ),
//                             ),

//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

