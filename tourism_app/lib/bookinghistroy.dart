// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, camel_case_types, sort_child_properties_last, deprecated_member_use, unused_import

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tourism_app/agenthistry.dart';
import 'package:tourism_app/balosh.dart';
import 'package:tourism_app/cartab.dart';
import 'package:tourism_app/contact.dart';
import 'package:tourism_app/detailpage.dart';
import 'package:http/http.dart' as http;
import 'package:tourism_app/homescreen.dart';
import 'package:tourism_app/hoteltab.dart';
import 'package:tourism_app/login.dart';
import 'package:tourism_app/packagetab.dart';
import 'package:tourism_app/register.dart';

class bookingHistory extends StatefulWidget {
  const bookingHistory({Key? key}) : super(key: key);

  @override
  State<bookingHistory> createState() => _bookingHistoryState();
}

class _bookingHistoryState extends State<bookingHistory> {
  // Define tabs and corresponding content
  final List<Tab> myTabs = <Tab>[
    Tab(
      text: 'Tour',
    ),
    Tab(text: 'Car'),
    Tab(text: 'Hotel'),
    Tab(text: 'Agent'),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.blue,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Color.fromARGB(255, 14, 204, 222)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(left: 45),
            child: Text(
              'Histroy',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          bottom: TabBar(
            tabs: myTabs,
          ),
        ),
        body: TabBarView(
          children: [packagetab(), cartab(), hoteltab(), agenthistry()],
        ),
      ),
    );
  }
}
