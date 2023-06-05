import 'package:covid_api/covid/modal/covid_modal.dart';
import 'package:covid_api/covid/provider/covid_provider.dart';
import 'package:covid_api/utils/api_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CovidProvider? providerFalse;
  CovidProvider? providerTrue;
TextEditingController txtSearch = TextEditingController();
  @override
  void initState() {
    super.initState();
    Provider.of<CovidProvider>(context, listen: false).jsonGet();
  }
  @override
  Widget build(BuildContext context) {
    providerFalse = Provider.of<CovidProvider>(context, listen: false);
    providerTrue = Provider.of<CovidProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Covid Info",
              style: TextStyle(color: Colors.white, letterSpacing: 1),
            ),
            backgroundColor: Colors.black,
            actions: [
              InkWell(onTap: () {
                Navigator.pushNamed(context, 'search');
              },child: Icon(Icons.search,color: Colors.white,size: 25,)),
              SizedBox(width: 10)
            ],
          ),
          backgroundColor: Colors.white,
          body: providerTrue!.covidModal == null
              ? Center(
                  child: CircularProgressIndicator(color: Colors.black,),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Container(
                        height: 30,
                        width: double.infinity,
                        child: Row(
                          children: [
                            Container(
                                height: 30,
                                width: 220,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: Colors.black)),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Country",
                                    style: TextStyle(
                                        letterSpacing: 1, fontSize: 15),
                                  ),
                                )),
                            SizedBox(width: 10),
                            Container(
                                height: 30,
                                width: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: Colors.black)),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Population",
                                    style: TextStyle(
                                        letterSpacing: 1, fontSize: 15),
                                  ),
                                )),
                            SizedBox(width: 10),
                          ],
                        ),
                      ),
                      SizedBox(height: 5),
                      Divider(color: Colors.black),
                      SizedBox(height: 5),
                      Expanded(
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) => showList(index),
                            itemCount:
                                providerTrue!.mainList.length),
                      ),
                    ],
                  ),
                )),
    );
  }

  Widget showList(int index) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, 'info',arguments: index);
      },
      child: Container(
        height: 46,
        margin: EdgeInsets.symmetric(vertical: 1),
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Container(
                    height: 30,
                    width: 220,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "${providerFalse!.mainList[index].country}",
                        style: TextStyle(letterSpacing: 1, fontSize: 15),
                      ),
                    )),
                SizedBox(width: 10),
                Container(
                    height: 30,
                    width: 110,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                          "${providerFalse!.mainList[index].population}",
                          style: TextStyle(letterSpacing: 1, fontSize: 15)),
                    )),
              ],
            ),
            Divider(thickness: 0.5,color: Colors.black,)
          ],
        ),
      ),
    );
  }
}
