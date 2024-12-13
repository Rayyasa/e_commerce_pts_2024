// ignore_for_file: unnecessary_null_comparison, unused_local_variable, file_names, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:e_commerce_pts_2024/model/model.dart';
import '../controller/homeController.dart';
import '../widget/card.dart';
import '../widget/judul.dart';

class ProductPage extends StatefulWidget {
  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late List<ProductModel> displayedProducts = [];
  TextEditingController searchController = TextEditingController();
  String minPrice = '';
  String maxPrice = '';

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    List<ProductModel>? products = await HomeController()
        .getProduk(maxPrice: maxPrice, minPrice: minPrice);
    if (products != null) {
      setState(() {
        displayedProducts = products;
      });
      filterProducts(searchController.text);
      filterByPrice(minPrice, maxPrice);
    }
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void filterByPrice(String min, String max) {
    setState(() {
      displayedProducts = displayedProducts
          .where((product) =>
              product.price >= int.parse(min) &&
              product.price <= int.parse(max))
          .toList();
    });
  }

  void filterProducts(String query) {
    setState(() {
      if (query.isEmpty) {
        displayedProducts = displayedProducts;
      } else {
        displayedProducts = displayedProducts
            .where((product) =>
                product.title.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final data =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final CategoryModel? selectedCategory = data['category'];

    return Scaffold(
      appBar: AppBar(
        title: Text('Product Page'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(24),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 16),
                    child: TextField(
                      controller: searchController,
                      onChanged: (text) {
                        filterProducts(text);
                      },
                      decoration: InputDecoration(
                        hintText: "Cari Produk",
                        suffixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              setState(() {
                                minPrice = value;
                              });
                              filterByPrice(minPrice, maxPrice);
                            },
                            decoration: InputDecoration(
                              hintText: "Min Harga",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              setState(() {
                                maxPrice = value;
                              });
                              filterByPrice(minPrice, maxPrice);
                            },
                            decoration: InputDecoration(
                              hintText: "Max Harga",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Judul('Product', displayedProducts.length.toString(), 1),
                  Container(
                    margin: EdgeInsets.only(bottom: 16),
                    child: displayedProducts.isEmpty
                        ? Center(
                            child: Text(
                              'Barang tidak ditemukan',
                              style: TextStyle(fontSize: 18),
                            ),
                          )
                        : SingleChildScrollView(
                            child: Wrap(
                              spacing: 50,
                              children: List.generate(displayedProducts.length,
                                  (index) {
                                return InkWell(
                                  onTap: () => Navigator.pushNamed(
                                      context, '/detailPage',
                                      arguments: displayedProducts[index]),
                                  child: kartu(
                                    context,
                                    displayedProducts[index].images[0],
                                    displayedProducts[index].title,
                                    displayedProducts[index].description,
                                    displayedProducts[index].price,
                                    displayedProducts[index].id,
                                  ),
                                );
                              }),
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
