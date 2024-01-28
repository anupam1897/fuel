import 'package:feul/services/api_service.dart';
import 'package:feul/services/base_url.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Feed extends StatefulWidget {
  const Feed({
    Key? key,
    required this.username,
    required this.tweet,
    required this.created_at,
    required this.views,
    required this.likes,
    this.url = "",
    this.profilePicture = "",
  }) : super(key: key);
  final String username;
  final String tweet;
  final DateTime created_at;
  final String views;
  final String likes;
  final String url;
  final String profilePicture;

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  final apiService = ApiService(BaseUrl.baseUrl + '/get_posts');
  @override
  Widget build(BuildContext context) {

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            children: [
              // Avatar
              widget.profilePicture == ""
                  ? CircleAvatar(
                      radius: 15,
                    )
                  : CircleAvatar(
                      backgroundImage: NetworkImage(widget.profilePicture),
                      radius: 15,
                    ),

              SizedBox(width: 8),
              Text(
                widget.username,
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
        child: widget.url == "" ? Container() : Image.network(widget.url),
      ),
      SizedBox(
        height: 4.0,
      ),
      Container(
        color: Colors.white,
        child: Text(
          widget.tweet,
          style: TextStyle(fontSize: 16),
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        color: Colors.white,
        child: Row(
          children: [
            Text(
                "${widget.views} views \u30fb ${DateFormat("MMM d, y").format(widget.created_at)} "),
            Spacer(),
            Icon(
              Icons.favorite_border_rounded,
              size: 20,
            ),
            Text(widget.likes),
          ],
        ),
      ),
      Divider(
        height: 0,
        thickness: 1,
      ),
    ]);
  }
}
