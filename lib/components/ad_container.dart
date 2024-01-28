import 'package:feul/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class AdContainer extends StatelessWidget {
  const AdContainer({
    Key? key,
    required this.ad_data,
  }) : super(key: key);

  final ApiService ad_data;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: ad_data.fetchData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Lottie.asset(
              'assets/error.json',
              width: 200,
              height: 200,
              repeat: true,
              reverse: false,
            );
          }
          List<Map<String, dynamic>> adData =
              (snapshot.data as List?)?.cast<Map<String, dynamic>>() ?? [];

          return Container(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sponsored Ad",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Container(
                  height: 150,
                  child: ListView.builder(
                      itemCount: adData.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Container(
                            height: 150,
                            width: 320,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color:
                                    Colors.black12, // Specify the border color
                                width: 1.0, // Specify the border width
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                adData[index]['ad_image'],
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        );
                      }),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
