import 'package:covid_api/covid/modal/covid_modal.dart';
import 'package:covid_api/utils/api_helper.dart';
import 'package:flutter/foundation.dart';

class CovidProvider extends ChangeNotifier
{
  ApiHelper apiHelper=ApiHelper();
  CovidModal covidModal=CovidModal();

  List<CovidModal>backList=[];
  List<CovidModal>mainList=[];
  List<CovidModal>searchList=[];

  Future<List<CovidModal>> jsonGet()
  async {
   mainList = await apiHelper.getJson();
   notifyListeners();
   return mainList;
  }

  void search({String? value})
  {

      if(value==null)
        {
          searchList=List.from(mainList);
        }
      else
          {
            searchList.clear();
            for(var c in mainList)
              {
                  if(c.country!.toLowerCase().contains(value.toLowerCase()))
                    {
                      searchList.add(c);
                    }
                  // searchList=List.from(backList);
              }
          }
        notifyListeners();
  }
}