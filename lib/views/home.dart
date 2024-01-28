import 'package:feul/services/feul_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:feul/services/api_service.dart';
import 'package:feul/services/base_url.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final apiService = ApiService(BaseUrl.baseUrl + '/get_posts');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        shadowColor: Colors.grey.shade200,
        centerTitle: true,
        toolbarHeight: 40,
        title: SvgPicture.string(
          FeulLogo.black,
          height: MediaQuery.of(context).size.height * 0.030,
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: IconButton(
              icon: const Icon(Icons.add_box_outlined),
              tooltip: 'Open shopping cart',
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Center(
        child: FutureBuilder(
          future: apiService.fetchData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            List<Map<String, dynamic>> data =
                (snapshot.data as List?)?.cast<Map<String, dynamic>>() ?? [];
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 4.0),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            children: [
                              // Avatar
                              data[index]['profilePicture'] == null
                                  ? CircleAvatar(
                                      radius: 15,
                                    )
                                  : CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          data[index]['profilePicture']),
                                      radius: 15,
                                    ),

                              SizedBox(width: 8),
                              Text(
                                data[index]['username'],
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: data[index]['postImage'] == null
                            ? Container()
                            : Image.network(
                                data[index]['postImage'],
                                fit: BoxFit.fill,
                              ),
                      ),
                      SizedBox(height: 4.0),
                      Container(
                        color: Colors.white,
                        child: Text(
                          data[index]['caption'],
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                        color: Colors.white,
                        child: Row(
                          children: [
                            Text(
                                "${data[index]['views']} views \u30fb ${data[index]['createdAt']} "),
                            Spacer(),
                            Icon(
                              Icons.favorite_border_rounded,
                              size: 20,
                            ),
                            Text(data[index]['likes']),
                          ],
                        ),
                      ),
                      Divider(height: 0, thickness: 1),
                    ]);
              },
            );
          },
        ),
      ),
    );
  }
}
