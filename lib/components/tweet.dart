import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Tweet extends StatefulWidget {
  const Tweet(
      {Key? key,
      required this.username,
      required this.tweet,
      required this.created_at,
      required this.views,
      required this.likes})
      : super(key: key);
  final String username;
  final String tweet;
  final DateTime created_at;
  final String views;
  final String likes;
  @override
  State<Tweet> createState() => _TweetState();
}

class _TweetState extends State<Tweet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8.0),
      color: Color(0xfdfdfdff),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: Row(
            children: [
              // Avatar
              CircleAvatar(
                radius: 15,
              ),

              SizedBox(width: 8),

              // User ID
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
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
      ]),
    );
  }
}
