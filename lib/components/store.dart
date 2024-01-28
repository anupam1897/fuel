import 'package:feul/services/api_service.dart';
import 'package:feul/services/base_url.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'ad_container.dart';
import 'store_category_list.dart';
import 'store_category_tile_list.dart';

class Store extends StatefulWidget {
  Store({Key? key}) : super(key: key);

  @override
  State<Store> createState() => _StoreState();
}

class _StoreState extends State<Store> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final venture_data = ApiService(BaseUrl.baseUrl + "/get_ventures");
    final ad_data = ApiService(BaseUrl.baseUrl + "/get_ads");
    return FutureBuilder(
      future: venture_data.fetchData(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Lottie.asset(
            'assets/error.json',
            width: 200,
            height: 200,
            repeat: true, // Set to true if you want the animation to repeat
            reverse:
                false, // Set to true if you want the animation to play in reverse
          );
        }
        List<Map<String, dynamic>> data =
            (snapshot.data as List?)?.cast<Map<String, dynamic>>() ?? [];

        return ListView(children: [
          StoreCategoryList(
            categoryName: "All top Startups",
            data: data,
            field: '',
            fieldName: '',
          ),
          StoreCategoryList(
            categoryName: "Software Investment Opportunities",
            data: data,
            field: 'industryCategory',
            fieldName: 'software',
          ),
          StoreCategoryTileList(
            categoryName: "Software Investment Opportunities",
            data: data,
            field: 'industryCategory',
            fieldName: 'software',
          ),
          AdContainer(ad_data: ad_data),
          StoreCategoryList(
            categoryName: "Rated 4+ Startups",
            data: data,
            field: 'rating',
            fieldName: '4',
          ),
          StoreCategoryList(
            categoryName: "Top Tech Startups",
            data: data,
            field: 'type',
            fieldName: 'technology',
          ),
          StoreCategoryList(
            categoryName: "Aerospace Startups",
            data: data,
            field: 'type',
            fieldName: 'aerospace',
          ),
          StoreCategoryList(
            categoryName: "Invested by Vangaurd",
            data: data,
            field: 'investor',
            fieldName: 'Vanguard Group',
          ),
          StoreCategoryList(
            categoryName: "Located in Chicago",
            data: data,
            field: 'location',
            fieldName: 'Chicago, IL',
          ),
          StoreCategoryList(
            categoryName: "Invested by  Sequoia",
            data: data,
            field: 'investor',
            fieldName: 'sequoia',
          ),
        ]);
      },
    );
  }
}
