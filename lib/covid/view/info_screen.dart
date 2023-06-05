import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/covid_provider.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  CovidProvider? providerFalse;
  CovidProvider? providerTrue;

  @override
  Widget build(BuildContext context) {
    providerFalse = Provider.of<CovidProvider>(context, listen: false);
    providerTrue = Provider.of<CovidProvider>(context, listen: true);
    int index = ModalRoute
        .of(context)!
        .settings
        .arguments as int;
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            actions: [
              Center(
                child: Text(
                  "Country Info",
                  style: TextStyle(
                      color: Colors.white, letterSpacing: 1, fontSize: 20),
                ),
              ),
              SizedBox(width: 5)
            ],
            backgroundColor: Colors.black,
          ),
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  "${providerFalse!.mainList[index].countryInfo!.flag}",
                  height: 150, width: 300, fit: BoxFit.fill,),
                SizedBox(height: 10),
                Text(
                  "Continent :- ${providerFalse!.mainList[index].continent}",
                  style: TextStyle(letterSpacing: 1, fontSize: 20),
                ),
                SizedBox(height: 10),
                Divider(thickness: 0.5, color: Colors.black,),
                SizedBox(height: 10),
                Text(
                  "Country :- ${providerFalse!.mainList[index].country}",
                  style: TextStyle(letterSpacing: 1, fontSize: 20),
                ),
                SizedBox(height: 10),
                Divider(thickness: 0.5, color: Colors.black,),
                SizedBox(height: 10),
                Text(
                  "Population :- ${providerFalse!.mainList[index].population}",
                  style: TextStyle(letterSpacing: 1, fontSize: 20),
                ),
                SizedBox(height: 10),
                Divider(thickness: 0.5, color: Colors.black,),
                SizedBox(height: 10),
                Text(
                  "Active Cases :- ${providerFalse!.mainList[index].active}",
                  style: TextStyle(letterSpacing: 1, fontSize: 20),
                ),
                SizedBox(height: 10),
                Divider(thickness: 0.5, color: Colors.black,),
                SizedBox(height: 10),
                Text(
                  "Deaths Cases :- ${providerFalse!.mainList[index].deaths}",
                  style: TextStyle(letterSpacing: 1, fontSize: 20),
                ),
                SizedBox(height: 10),
                Divider(thickness: 0.5, color: Colors.black,),
                SizedBox(height: 10),
                Text(
                  "Recovered Cases :- ${providerFalse!.mainList[index]
                      .recovered}",
                  style: TextStyle(letterSpacing: 1, fontSize: 20),
                ),
                SizedBox(height: 10),
                Divider(thickness: 0.5, color: Colors.black,),
                SizedBox(height: 10),
                Text(
                  "Total Cases :- ${providerFalse!.mainList[index].cases}",
                  style: TextStyle(letterSpacing: 1, fontSize: 20),
                ),
                SizedBox(height: 10),
                Divider(thickness: 0.5, color: Colors.black,),
                SizedBox(height: 10),
                Text(
                  "Total Test :- ${providerFalse!.mainList[index].tests}",
                  style: TextStyle(letterSpacing: 1, fontSize: 20),
                ),
              ],
            ),
          ),
        ));
  }
}
