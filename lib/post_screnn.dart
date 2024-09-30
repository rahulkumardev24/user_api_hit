import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'model/post_model.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Post Screen"),
      ),
      body: FutureBuilder<UserDataModel?>(
        future: getPostApi(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            if (snapshot.data != null && snapshot.data!.users!.isNotEmpty) {
              return ListView.builder(
                itemCount: snapshot.data!.users!.length,
                itemBuilder: (context, index) {
                  UserModel eachUser = snapshot.data!.users![index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 5,
                      shadowColor: Colors.black87,
                      child: Column(
                        children: [
                          Image.network(eachUser.image!),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              eachUser.firstName!, // Ensure null safety
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(eachUser.email!),
                          Text(eachUser.phone!),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: Text("No Data Found!"),
              );
            }
          }
          return Container();
        },
      ),
    );
  }

  Future<UserDataModel?> getPostApi() async {
    UserDataModel? userDataModel;
    String url = "https://dummyjson.com/users";
    Uri uri = Uri.parse(url);
    http.Response res = await http.get(uri);
    if (res.statusCode == 200) {
      print("Response body: ${res.body}");
      var resData = jsonDecode(res.body);
      userDataModel = UserDataModel.fromJson(resData);
    }
    return userDataModel;
  }
}


