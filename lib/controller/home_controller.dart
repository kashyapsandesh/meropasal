import '../consts/consts.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    getUserName();
    super.onInit();
  }
  var currentNavIndex = 0.obs;
  var userName="";



  getUserName()async{
   var n= await firestore.collection(usersCollection).where("id",isEqualTo: currentUser!.uid).get().then((value){
if(value.docs.isNotEmpty){
return value.docs.single['name'];
}
    });
    userName=n;
    print(userName);
  }
}
