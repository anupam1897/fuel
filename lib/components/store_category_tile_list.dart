import 'package:flutter/material.dart';

class StoreCategoryTileList extends StatelessWidget {
  const StoreCategoryTileList({
    Key? key,
    required this.categoryName,
    required this.data,
    required this.field,
    required this.fieldName,
  }) : super(key: key);
  final String categoryName;
  final List<Map<String, dynamic>> data;
  final String field;
  final String fieldName;

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filterCompanies(String field, String fieldName) {
      if (fieldName == "" && field == "") {
        return data;
      } else {
        return data.where((company) => company[field] == fieldName).toList();
      }
    }

    List<Map<String, dynamic>> filteredCompany =
        filterCompanies(field, fieldName);

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Row(
              children: [
                Text(
                  categoryName,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 125,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: filteredCompany.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    width: 360,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black12, // Specify the border color
                        width: 1.0, // Specify the border width
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                              ),
                              child: filteredCompany[index]['logo_icon_src'] ==
                                      null
                                  ? Container(
                                      color: Colors.amber,
                                    )
                                  : Image.network(
                                      filteredCompany[index]['logo_icon_src']),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 240,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                filteredCompany[index]['venture_name'] +
                                    " by " +
                                    filteredCompany[index]['founder_name'],
                                overflow: TextOverflow.fade,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(204, 0, 0, 0)),
                              ),
                              SizedBox(
                                height: 4.0,
                              ),
                              Text(
                                filteredCompany[index]['description'],
                                overflow: TextOverflow.fade,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    overflow: TextOverflow.fade,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromARGB(204, 0, 0, 0)),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
