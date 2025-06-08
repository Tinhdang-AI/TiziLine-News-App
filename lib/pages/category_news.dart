import 'package:flutter/material.dart';
import 'package:news_app/models/show_category.dart';
import 'package:news_app/services/show_category_news.dart';

class CategoryNews extends StatefulWidget {
  final String name;
  const CategoryNews({required this.name});

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<ShowCategoryModel> categories = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    getNews();
  }

  Future<void> getNews() async {
    ShowCategoryNews showCategoryNews = ShowCategoryNews();
    await showCategoryNews.getCategoryNews(widget.name.toLowerCase());
    setState(() {
      categories = showCategoryNews.categories;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff3280ef),
      body: loading
          ? const Center(child: CircularProgressIndicator(color: Colors.white))
          : Column(
              children: [
                const SizedBox(height: 60),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(Icons.arrow_back_ios_new_rounded,
                            color: Colors.white),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width / 3.8),
                      Text(
                        widget.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(top: 20),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30),
                      ),
                    ),
                    child: ListView.builder(
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        final item = categories[index];
                        return Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  item.urlToImage ?? '',
                                  height: 200,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                item.title ?? 'No title',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                item.desc ?? 'No description',
                                style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Divider(),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}




// import 'package:flutter/material.dart';
// import 'package:news_app/models/show_category.dart';
// import 'package:news_app/services/show_category_news.dart';

// class CategoryNews extends StatefulWidget {
//   String name;
//   CategoryNews({required this.name});

//   @override
//   State<CategoryNews> createState() => _CategoryNewsState();
// }

// class _CategoryNewsState extends State<CategoryNews> {
//   List<ShowCategoryModel> categories = [];
//   bool loading = true;
//   @override
//   void initState() {
//     getNews();

//     super.initState();
//   }

//   getNews() async {
//     ShowCategoryNews showCategoryNews = ShowCategoryNews();
//     await showCategoryNews.getCategoryNews(widget.name.toLowerCase());
//     categories = showCategoryNews.categories;
//     setState(() {
//       loading = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xff3280ef),

//       body: Container(
//         margin: EdgeInsets.only(top: 60),
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(left: 12),
//               child: Row(
//                 // mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
//                   SizedBox(width: MediaQuery.of(context).size.width / 3.8),
//                   Text(
//                     "Business",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 30.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 20),
//             child: ListView.builder(
//                   shrinkWrap: true,
//                   scrollDirection: Axis.horizontal,
//                   itemCount: categories.length,
//                   itemBuilder: (context, index) {
//                     return CategoryTile(
//                       categoryname: categories[index].categoryName ?? "",
//                       image: categories[index].image ?? "",
//                     );
//                   },
//                 ),
//             Expanded(
//               child: Container(
//                 width: MediaQuery.of(context).size.width,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(30),
//                     topRight: Radius.circular(30),
//                   ),
//                 ),
//                 child: Column(
//                   children: [
//                     Container(
//                       decoration: BoxDecoration(
//                         color: Color.fromARGB(244, 255, 255, 255),
//                       ),
//                       margin: EdgeInsets.all(30),
//                       child: Column(
//                         children:[
//                           ClipRRect(
//                             borderRadius: BorderRadius.circular(10),
//                             child: Image.asset("images/news1.jpg")
//                             ),
//                             SizedBox(height: 5.0),
//                           Container(
//                             width: MediaQuery.of(context).size.width,
//                             child: Text(
//                               "Lorem ipsum dolor sit amet",
//                               style: TextStyle(
//                                 color: const Color.fromARGB(198, 0, 0, 0),
//                                 fontSize: 20.0,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                            ),
//                            SizedBox(height: 3.0,),
//                           Container(
//                             padding: EdgeInsets.only(left: 5,right: 5),
//                             width: MediaQuery.of(context).size.width,
//                             child: Text(
//                               "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sit amet nulla auctor",
//                               style: TextStyle(
//                                 color: const Color.fromARGB(151, 0, 0, 0),
//                                 fontSize: 18,
//                               ),
//                             ),


//                           ),
                           
                              
                            

//                             ]),
                    
                    
                    
//                     ),
                   

//                     ]),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CategoryTile extends StatelessWidget {
//   final String image;
//   final String categoryname;

//   const CategoryTile({required this.categoryname, required this.image});
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryNews(name: categoryname)));
//       },
//       child: Container(
//         margin: EdgeInsets.only(right: 20.0),
//         child: Stack(
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(60),
//               child: Image.asset(
//                 image,
//                 height: 110,
//                 width: 110,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             Container(
//               height: 110,
//               width: 110,
//               decoration: BoxDecoration(
//                 color: const Color.fromARGB(34, 0, 0, 0),
//                 borderRadius: BorderRadius.circular(60),
//               ),
//             ),
//             Container(
//               height: 110,
//               width: 110,
//               decoration: BoxDecoration(borderRadius: BorderRadius.circular(60)),
//               child: Center(
//                 child: Text(
//                   categoryname,
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 15.0,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:news_app/models/show_category.dart';
// import 'package:news_app/services/show_category_news.dart';

// class CategoryNews extends StatefulWidget {
//   final String name;
//   const CategoryNews({required this.name});

//   @override
//   State<CategoryNews> createState() => _CategoryNewsState();
// }

// class _CategoryNewsState extends State<CategoryNews> {
//   List<ShowCategoryModel> categories = [];
//   bool loading = true;

//   @override
//   void initState() {
//     super.initState();
//     getNews();
//   }

//   Future<void> getNews() async {
//     ShowCategoryNews showCategoryNews = ShowCategoryNews();
//     await showCategoryNews.getCategoryNews(widget.name.toLowerCase());
//     setState(() {
//       categories = showCategoryNews.categories;
//       loading = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xff3280ef),
//       appBar: AppBar(
//         backgroundColor: const Color(0xff3280ef),
//         elevation: 0,
//         title: Text(
//           widget.name,
//           style: const TextStyle(
//             color: Colors.white,
//             fontSize: 22,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         centerTitle: true,
//         iconTheme: const IconThemeData(color: Colors.white),
//       ),
//       body: loading
//           ? const Center(child: CircularProgressIndicator(color: Colors.white))
//           : ListView.builder(
//               padding: const EdgeInsets.all(10),
//               itemCount: categories.length,
//               itemBuilder: (context, index) {
//                 final article = categories[index];
//                 return _buildArticleCard(article);
//               },
//             ),
//     );
//   }

//   Widget _buildArticleCard(ShowCategoryModel article) {
//     return Card(
//       margin: const EdgeInsets.only(bottom: 12),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           if (article.urlToImage != null)
//             ClipRRect(
//               borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
//               child: Image.network(
//                 article.urlToImage!,
//                 width: double.infinity,
//                 height: 200,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           Padding(
//             padding: const EdgeInsets.all(10),
//             child: Text(
//               article.title ?? 'No Title',
//               style: const TextStyle(
//                 fontWeight: FontWeight.w600,
//                 fontSize: 18,
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 10),
//             child: Text(
//               article.desc ?? 'No Description',
//               style: const TextStyle(color: Colors.grey),
//             ),
//           ),
//           const SizedBox(height: 10),
//         ],
//       ),
//     );
//   }
// }
