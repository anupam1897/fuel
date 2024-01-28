import 'package:feul/components/store.dart';
import 'package:flutter/material.dart';
import '../components/seeded_companies.dart';

class Hub extends StatefulWidget {
  @override
  HubState createState() => HubState();
}

class HubState extends State<Hub> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: MediaQuery.of(context).size.width,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                style: BorderStyle.solid,
                width: 2.0,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(100),
              ),
            ),
            child: TextField(
              maxLines: 1,
              controller: _searchController,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                hintMaxLines: 1,
                hintText: '     Search...',
                hintStyle: TextStyle(fontSize: 18),
                border: InputBorder.none,
                suffixIcon: Icon(Icons.search_outlined),
              ),
              onChanged: (value) {},
            ),
          ),
        ),
      ),
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              splashFactory: NoSplash.splashFactory,
              tabs: [
                Tab(text: 'For you'),
                Tab(text: 'Seeded'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Store(),
              SeededCompanies(),
            ],
          ),
        ),
      ),
    );
  }
}
