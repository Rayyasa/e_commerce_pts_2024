// ignore_for_file: prefer_const_constructors, unused_import, prefer_const_literals_to_create_immutables, unused_local_variable

import 'package:e_commerce_pts_2024/controller/homeController.dart';
import 'package:e_commerce_pts_2024/page/productPage.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_pts_2024/model/model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import '../widget/kategori.dart'; // Tambahkan import untuk widget kategori
import '../widget/judul.dart';
import '../widget/card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // void searchProducts(String query) {
  //   setState(() {
  //     searchKeyword = query;
  //   });
  //   Navigator.pushReplacementNamed(context, '/productPage',
  //       arguments: {'searchKeyword': searchKeyword});
  // }

  TextEditingController searchController = TextEditingController();
  String searchKeyword = '';

  @override
  Widget build(BuildContext context) {
    var tinggi = MediaQuery.of(context).size.height;
    var lebar = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: tinggi * 0.03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Discover',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Icon(
                        Icons.shopping_bag_outlined,
                        color: Colors.black,
                        size: 24,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              Container(
                margin: EdgeInsets.only(bottom: tinggi * 0.03),
                child: TextField(
                  onSubmitted: (value) {
                    setState(() {
                      searchKeyword = value;
                    });
                    Navigator.pushReplacementNamed(context, '/productPage',
                        arguments: {'keyword': value});
                  },
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: "Cari Produk",
                    suffixIcon: Icon(
                      Icons.search,
                      size: 24,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.only(bottom: tinggi * 0.03),
                width: lebar,
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage('assets/img/Banner.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 24),
              Judul('Categories', 'See all', tinggi),
              Container(
                margin: EdgeInsets.only(bottom: tinggi * 0.03),
                child: FutureBuilder(
                  future: HomeController().getKategori(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      List<CategoryModel> data = snapshot.data!;
                      return Container(
                        width: lebar,
                        padding: EdgeInsets.only(right: 20, left: 20),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Wrap(
                            spacing: 20,
                            children: List.generate(data.length, (index) {
                              return InkWell(
                                  onTap: () =>
                                      navigateToProductPage(data[index]),
                                  child: kategori(
                                      context,
                                      data[index].name,
                                      data[index].image,
                                      lebar,
                                      data[index].id));
                            }),
                          ),
                        ),
                      );
                    } else {
                      return Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Wrap(
                            spacing: 20,
                            children: List.generate(3, (index) {
                              return Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Row(
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.only(right: lebar * 0.01),
                                      child: Image.network(
                                          "assets/img/play-circle.png"),
                                    ),
                                    Text(
                                      "Categories",
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
              SizedBox(height: 12),
              Judul('Product', 'See More', tinggi),
              Container(
                margin: EdgeInsets.only(bottom: tinggi * 0.03),
                child: FutureBuilder(
                  future: HomeController().getProduk(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      List<ProductModel> data = snapshot.data!;
                      return Container(
                        width: lebar,
                        padding: EdgeInsets.only(right: 20, left: 20),
                        child: SingleChildScrollView(
                          child: Wrap(
                            spacing: 50,
                            children: List.generate(10, (index) {
                              return InkWell(
                                onTap: () => Navigator.pushNamed(
                                  context,
                                  '/detailPage',
                                  arguments: data[index],
                                ),
                                child: kartu(
                                    context,
                                    data[index].images[0],
                                    data[index].title,
                                    data[index].description,
                                    data[index].price,
                                    data[index].id),
                              );
                            }),
                          ),
                        ),
                      );
                    } else {
                      return Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Wrap(
                            spacing: 20,
                            children: List.generate(3, (index) {
                              return Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Row(
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.only(right: lebar * 0.01),
                                      child: Image.network(
                                          "assets/img/play-circle.png"),
                                    ),
                                    Text(
                                      "Product",
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
              SizedBox(height: 12),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: () {
                  Navigator.pushNamed(context, '/productPage', arguments: {
                    'kategori': null,
                  });
                },
                child: Container(
                  width: lebar,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      'See All Product',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void navigateToProductPage(CategoryModel selectedCategory) {
    Navigator.pushNamed(context, '/productPage', arguments: {
      'category': selectedCategory,
      'products': HomeController().getProduk()
    });
  }
}
