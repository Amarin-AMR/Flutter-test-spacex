import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:rocketapi/detailscreen/screen.dart';
import 'package:rocketapi/model/list_response.dart';
import 'package:rocketapi/service/list_rocket_service.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ListScreen(),
    );
  }
}

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  Future<RocketListResponse>? futureRocketList;

  @override
  void initState() {
    super.initState();
    futureRocketList = fetchRocketList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: futureRocketList,
          builder: ((context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
              case ConnectionState.active:
                {
                  return const Center(
                    child: Text('Loading...'),
                  );
                }
              case ConnectionState.done:
                return ListView.builder(
                  itemBuilder: ((context, index) {
                    var data = snapshot.data!;
                    var rocketList = data.result![index];
                    return Card(
                      elevation: 8.0,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 6.0,
                      ),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20.0,
                            vertical: 10.0,
                          ),
                          title: Text(
                            rocketList.name.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          leading: rocketList.fireDate == null
                              ? const Text('null')
                              : Text(
                                  DateFormat.yMMMd()
                                      .format(rocketList.fireDate!),
                                ),
                          trailing: Text(rocketList.success.toString()),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Details(),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  }),
                );
            }
          }),
        ),
      ),
    );
  }
}
