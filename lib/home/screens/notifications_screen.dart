import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  final String authToken;
  const NotificationPage({required this.authToken, Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // width: MediaQuery.of(context).size.width,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: const NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKI27I5cwgxsD7_JrMaiQVFtDqpYPWfckKeA&usqp=CAU',
              ),
              colorFilter: ColorFilter.mode(
                  Colors.blue.withOpacity(0.5), BlendMode.color)),
          color: Colors.white,
        ),
        child: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
              ),
              Text('Ini Halaman Notification'),
            ]),
      ),
    );
  }
}
