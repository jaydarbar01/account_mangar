import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

import 'main.dart';

class MyController extends GetxController{
  RxInt selectedindex = 0.obs;
  RxInt index = 0.obs;
  RxInt digit = 0.obs;
  RxString code = ''.obs;
  RxString password=''.obs;
  Box box=Hive.box("data");

  addDigit(int digit) {
    if (code.value.length > 3) {
      return;
    }

      code.value = code + digit.toString();
     // print('Code is ${code.value}');
      selectedindex.value = code.value.length;

  }

  backspace() {
    if (code.value.length == 0) {
      return;
    }

      code.value = code.value.substring(0, code.value.length - 1);
      selectedindex.value = code.value.length;

  }
  get_pass()
  {
    password.value=box.get("pass");
    return password;
  }

}
///Dashbored Controller
///LIst alocate differn key ?
/// Jayre biju control same page valu rrun karie tyre e page nu agl nu control pan run thia che and pachi new dashbord valu run thia to ana mate biju dart pad leva nu k ej page ma rkva nu
class Dashbored_Controller extends GetxController{

  RxString name="".obs;
  RxInt balance=0.obs;
  RxInt debit=0.obs;
  RxInt credit=0.obs;

  RxList<Map<String, dynamic>> list = RxList<Map<String, dynamic>>([]);

  insert_data()
  {
    String qry = "INSERT INTO Balance VALUES(NULL, '$name', '$balance', '$debit', '$credit')";
    Home.database!.rawInsert(qry).then((value) {
      print("value $value");
    });
  }

  update_data()
  {
    String up_qry='update Balance set `name`=$name where `id=${1}' ;
    Home.database!.rawUpdate(up_qry).then((value) {
      print("update value$value");
    });
  }

  get_data() async {
    String get_data = "select * from Balance";
    list.value = await Home.database!.rawQuery(get_data);
    print(list);
  }
  Delate_data(){
    String Dlt="DELETE FROM Balance WHERE id=1";
    Home.database!.delete(Dlt);
  }


}

class Statement_Controller extends GetxController{

  RxInt credit=0.obs;
  RxInt debit=0.obs;
  RxInt ac_id=2.obs;
  RxString detail="".obs;
  RxInt sum=0.obs;
  RxBool Transaction=false.obs;
  RxString date=DateFormat("dd-MM-yyy").format(DateTime.now()).obs;
  RxList<Map> mylist = RxList<Map>([]);
  RxList<Map> sumlist = RxList<Map>([]);
  RxList<Map> sublist = RxList<Map>([]);
  RxList<Map> blanceblist = RxList<Map>([]);
  RxList<Map> ser=RxList<Map>([]);
  RxList<double> amount= RxList<double>([]);
  RxString Tran=''.obs;
  RxString t_credit="".obs;
  RxString t_debit="".obs;

  transction(value){
    Transaction.value=value;
   // Tran.value=value;
    print(Transaction);
  }

  insert_data(int ac_id)
  {
    String mqry = "INSERT INTO Statement VALUES(NULL, '$ac_id', '$debit', '$credit', '$detail','$date')";
     Home.database!.rawInsert(mqry).then((value) {
      print("State manetvalue $value");
    });
  }
   get_data(int ac_id) async {
    String get_data = "select * from Statement WHERE acid=$ac_id ";
    mylist.value = await Home.database!.rawQuery(get_data);
    print(mylist);
  }

  Sum(int ac_id) async {
     String sum_data='SELECT SUM(credit) FROM Statement WHERE acid=$ac_id';
     sumlist.value= await Home.database!.rawQuery(sum_data);
     print(sumlist);
     t_credit.value=sumlist[0]['SUM(credit)'].toString();
     //Update in balnce satemanet
     String s_qry="Update Balance set credit=$t_credit where id=$ac_id ";
       Home.database!.rawUpdate(s_qry).then((value) {
         print("my balne is update$value");

       });



  }
  Sub(int ac_id) async {
    String sum_data='SELECT SUM(debit) FROM Statement WHERE acid=$ac_id';
    sublist.value = await Home.database!.rawQuery(sum_data);
    t_debit.value=sublist[0]['SUM(debit)'].toString();

    //Update in balnce satemanet
    String s_qry="Update Balance set debit=$t_debit where id=$ac_id ";
    Home.database!.rawUpdate(s_qry).then((value) {

      print("my balne is update$value");

    });


  }
//  RxInt balnce=0.obs;
  RxString blance="".obs;
  setblance()
  {
    // balnce.value=int.parse(t_credit.value)-int.parse(t_debit.value);
   // balnce.value=int.parse(t_credit.value);
             blance.value=(int.parse(t_credit.value)-int.parse(t_debit.value)).toString();
   //   //print("mybalnece${t_credit.value}.");
     print("mybalnece${blance.value.toString()}.");

  }


}


