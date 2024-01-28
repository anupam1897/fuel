import 'package:feul/services/api_service.dart';
import 'package:feul/services/base_url.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SeededCompanies extends StatefulWidget {
  const SeededCompanies({Key? key}) : super(key: key);

  @override
  State<SeededCompanies> createState() => _SeededCompaniesState();
}

class _SeededCompaniesState extends State<SeededCompanies> {
  @override
  Widget build(BuildContext context) {
    final apiService = ApiService(BaseUrl.baseUrl + '/get_ventures');
    return FutureBuilder(
        future: apiService.fetchData(),
        initialData: [],
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Lottie.asset(
              'assets/error.json',
              width: 200,
              height: 200,
              repeat: true,
              reverse: false,
            );
          }
          List<Map<String, dynamic>> data =
              (snapshot.data as List?)?.cast<Map<String, dynamic>>() ?? [];
          return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Number of columns
                crossAxisSpacing: 8.0, // Spacing between columns
                mainAxisSpacing: 8.0, // Spacing between rows
              ),
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0))),
                        child: Center(
                          child: Image.network(
                            data[index]['logo_icon_src'],
                            height: 80,
                            width: 80,
                          ),
                        ),
                      ),
                      SizedBox(height: 3),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data[index]['venture_name']),
                          Text(
                            data[index]['rating'] +
                                "\u2605  | " +
                                data[index]['location'],
                            maxLines: 1,
                            overflow: TextOverflow.fade,
                          ),
                        ],
                      )
                    ],
                  ),
                );
              });
        });
  }
}
