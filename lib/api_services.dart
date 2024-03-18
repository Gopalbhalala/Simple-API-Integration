import 'package:http/http.dart' as http;
import 'package:testing_api/model.dart';

getFetchData() async{
  var res= await http.get(Uri.parse('https://dummyjson.com/carts'));
  if(res.statusCode==200){
    var data=cardDataFromJson(res.body.toString());
    return data;
  }
}