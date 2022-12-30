import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_users_api_call/pages/profile_page.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> users = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Users REST API",
          style: TextStyle(color: Colors.black),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchUsers,
        child: const Text('Fetch'),
      ),
      body: SafeArea(
        child: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              final thumbnail = user['picture']['thumbnail'];
              final fName = user['name']['first'];
              final lName = user['name']['last'];
              final email = user['email'];
              final profilePhoto = user['picture']['large'];
              final dob = user['dob']['age'];
              final username = user['login']['username'];
              final registeredOn = user['registered']['date'];
              final phoneNumber = user['phone'];
              final country = user['location']['country'];
              final gender = user['gender'];

              return Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: ListTile(
                  title: Row(
                    children: [
                      Text(fName),
                      const SizedBox(width: 6),
                      Text(lName),
                    ],
                  ),
                  subtitle: Text(email),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(thumbnail),
                  ),
                  trailing: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ProfilePage(
                                fName: fName,
                                lName: lName,
                                email: email,
                                profilePhoto: profilePhoto,
                                dob: dob.toString(),
                                userName: username,
                                phoneNumber: phoneNumber,
                                country: country,
                                registeredOn: registeredOn,
                                gender: gender,
                              )));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.grey,
                            width: 1.0,
                          )),
                      child: const Icon(Icons.arrow_forward_ios_outlined),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }

  void fetchUsers() async {
    const url = 'https://randomuser.me/api/?results=20';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);

    setState(() {
      users = json['results'];
    });
    print('fetch user completed');
  }
}
