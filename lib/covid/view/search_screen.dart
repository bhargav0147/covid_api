import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/covid_provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  CovidProvider? providerFalse;
  CovidProvider? providerTrue;

  @override
  void initState() {
    super.initState();
    Provider.of<CovidProvider>(context, listen: false).search();
  }

  @override
  Widget build(BuildContext context) {
    providerFalse = Provider.of<CovidProvider>(context, listen: false);
    providerTrue = Provider.of<CovidProvider>(context, listen: true);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Search",
          style: TextStyle(color: Colors.white, letterSpacing: 1),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
                width: double.infinity,
                height: 45,
                child: TextField(
                  onChanged: (search) {
                    providerFalse!.search(value: search);
                  },
                  style: TextStyle(color: Colors.black),
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    label: Text(
                      "Search",
                      style: TextStyle(letterSpacing: 1, color: Colors.black54),
                    ),
                  ),
                )),
            SizedBox(height: 10),
            Expanded(
                child: ListView.builder(
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Image.network(
                          "${providerTrue!.searchList[index].countryInfo!.flag}",
                          height: 30,
                          width: 60,
                          fit: BoxFit.fill,
                        ),
                        title: Text(
                          "${providerTrue!.searchList[index].country}",
                          style: TextStyle(letterSpacing: 1, fontSize: 20),
                        ),
                      );
                    },
                    itemCount: providerTrue!.searchList.length))
          ],
        ),
      ),
    ));
  }
}
