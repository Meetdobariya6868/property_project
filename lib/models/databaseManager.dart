import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseManager {
  final CollectionReference profileList =
  FirebaseFirestore.instance
      .collection('propertyDetails');


  Future getUsersList() async {
    List itemsList = [];

    try {
      await profileList.get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          itemsList.add(element.data());
        });
      });
      return itemsList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
//
class DatabaseManager1 {
  Future getUsersList(String state,String city,String sellOrRent,String propertyType,String status,String postedBy) async {
    List itemsList = [];
    final profileList =
    FirebaseFirestore.instance
        .collection('propertyDetails')
        .where('state',isEqualTo: state)
        .where('city',isEqualTo:city)
        .where('sellOrRent',isEqualTo: sellOrRent)
        .where('propertyType',isEqualTo: propertyType)
        .where('status',isEqualTo: status)
        .where('postedBy',isEqualTo: postedBy);

    try {
      await profileList.get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          itemsList.add(element.data());
        });
      });
      return itemsList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}

class FavoritePostManager {
  final Query query = FirebaseFirestore.instance
      .collection('propertyDetails')
      .where('favorites', arrayContains: FirebaseAuth.instance.currentUser!.uid);

  Future getFavoritePostList() async {
    List itemsList = [];

    try {
      await query.get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          // if(element.data()['favorites'][0] == FirebaseAuth.instance.currentUser.uid) {
          //   itemsList.add(element.data());
          // }
          itemsList.add(element.data());
        });
      });
      return itemsList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}

class UserpostManager {
  final CollectionReference postList =
  FirebaseFirestore.instance
      .collection('propertyDetails');


  Future getUsersPostList() async {
    List itemsList = [];

    try {
      await postList.get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          // if(element.data()!['postedById'] == FirebaseAuth.instance.currentUser!.uid)
          // {
          //   itemsList.add(element.data());
          // }
        });
      });
      return itemsList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}

class SearchService{
  searchByName(String searchField){
    return FirebaseFirestore.instance.collection('propertyDetails')
        .where('city',isEqualTo: searchField.substring(0,1).toUpperCase()).get();

  }
}

class DatabaseManagerUser {
  final CollectionReference profileList =
  FirebaseFirestore.instance
      .collection('Users');


  Future getUsersList() async {
    List itemsList = [];

    try {
      await profileList.get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          itemsList.add(element.data());
        });
      });
      return itemsList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}

class DataModel {
  final String postedBy;
  final String city;
  final String category;
  final String status;
  final String firstImage;
  final String name;

  DataModel({required this.postedBy, required this.city,required this.category,required this.status,required this.firstImage,required this.name});

  // List<DataModel> dataListFromSnapshot(QuerySnapshot querySnapshot) {
  //   return querySnapshot.docs.map((snapshot) {
  //     final Map<String, dynamic> dataMap = snapshot.data();
  //
  //     return DataModel(
  //         postedBy: dataMap['postedBy'], city: dataMap['city'],category:dataMap['category'],status: dataMap['status'],firstImage: dataMap['firstImage'],name: dataMap['projectName'] );
  //   }).toList();
  // }
}

class DataModel1{
  final String postedBy;
  final String city;
  final String category;
  final String status;
  final String firstImage;
  final String name;

  DataModel1({required this.postedBy, required this.city,required this.category,required this.status,required this.firstImage,required this.name});

  // List<DataModel1> dataListFromSnapshot(QuerySnapshot querySnapshot) {
  //   return querySnapshot.docs.map((snapshot) {
  //     final Map<String, dynamic> dataMap = snapshot.data();
  //
  //     return DataModel1(
  //         postedBy: dataMap['postedBy'], city: dataMap['city'],category:dataMap['category'],status: dataMap['status'],firstImage: dataMap['firstImage'],name: dataMap['projectName'] );
  //   }).toList();
  // }
}

class DataModelpostedBy{
  final String postedBy;
  final String city;
  final String category;
  final String status;
  final String firstImage;
  final String name;

  DataModelpostedBy({required this.postedBy, required this.city,required this.category,required this.status,required this.firstImage,required this.name});

  // List<DataModelpostedBy> dataListFromSnapshot(QuerySnapshot querySnapshot) {
  //   return querySnapshot.docs.map((snapshot) {
  //     final Map<String, dynamic> dataMap = snapshot.data();
  //
  //     return DataModelpostedBy(
  //         postedBy: dataMap['postedBy'], city: dataMap['city'],category:dataMap['category'],status: dataMap['status'],firstImage: dataMap['firstImage'],name: dataMap['projectName'] );
  //   }).toList();
  // }
}

class DataModellandmark{
  final String postedBy;
  final String city;
  final String category;
  final String status;
  final String firstImage;
  final String name;

  DataModellandmark({required this.postedBy, required this.city,required this.category,required this.status,required this.firstImage,required this.name});

  // List<DataModellandmark> dataListFromSnapshot(QuerySnapshot querySnapshot) {
  //   return querySnapshot.docs.map((snapshot) {
  //     final Map<String, dynamic> dataMap = snapshot.data();
  //
  //     return DataModellandmark(
  //         postedBy: dataMap['postedBy'], city: dataMap['city'],category:dataMap['category'],status: dataMap['status'],firstImage: dataMap['firstImage'],name: dataMap['projectName'] );
  //   }).toList();
  // }
}

class NewProject {
  final CollectionReference profileList =
  FirebaseFirestore.instance
      .collection('newProject');


  Future getUsersList() async {
    List itemsList = [];

    try {
      await profileList.get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          itemsList.add(element.data());
        });
      });
      return itemsList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}

class DatabaseManagerUser1 {
  Future getUsersList() async {
    List itemsList = [];
    final profileList =
    FirebaseFirestore.instance
        .collection('Users').where('role',isNotEqualTo: 'Admin');

    try {
      await profileList.get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          itemsList.add(element.data());
        });
      });
      return itemsList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}

class UserNewPostManager {
  final CollectionReference postList =
  FirebaseFirestore.instance
      .collection('newProject');


  Future getUsersPostList() async {
    List itemsList = [];

    try {
      await postList.get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          // if(element.data()!['postedById'] == FirebaseAuth.instance.currentUser!.uid) {
          //   itemsList.add(element.data());
          // }
        });
      });
      return itemsList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
