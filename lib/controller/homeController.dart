// ignore_for_file: unused_import, file_names, unused_local_variable, prefer_const_constructors, avoid_print

import 'package:e_commerce_pts_2024/model/model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class HomeController {
  Future<List<ProductModel>> getProduk({minPrice, maxPrice}) async {
    await Future.delayed(Duration(seconds: 3));
    String url =
        "https://api.escuelajs.co/api/v1/products/?q=da3b8da873fb3a742e404d0bb2a91852";

    // if (minPrice != null) {
    //   url += '&price_min=$minPrice';
    // }

    // if (maxPrice != null) {
    //   url += '&price_max=$maxPrice';
    // }

    Uri urlData = Uri.parse(url);
    final respon = await http.get(urlData);

    print(respon.body);
    if (respon.statusCode == 200) {
      List<ProductModel> data = productModelFromJson(respon.body);
      return data;
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<List<CategoryModel>> getKategori() async {
    await Future.delayed(Duration(seconds: 3));
    String url =
        "https://api.escuelajs.co/api/v1/categories/?q=201ad5d3b92232cbf975142709a04334";
    Uri urlData = Uri.parse(url);

    final respon = await http.get(urlData);

    print(respon.body);
    if (respon.statusCode == 200) {
      List<CategoryModel> data = categoryModelFromJson(respon.body);
      return data;
    } else {
      throw Exception('Failed to load categories');
    }
  }
  
}
