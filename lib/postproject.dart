import 'package:flutter/material.dart';

import 'constant.dart';

class ResidentialFilterEntry1 {
  const ResidentialFilterEntry1(this.name1);
  final String name1;
}

class CommercialFilterEntry1 {
  const CommercialFilterEntry1(this.cname1);
  final String cname1;
}

class PostProperty extends StatefulWidget {
  const PostProperty({super.key});

  @override
  State<PostProperty> createState() => _PostPropertyState();
}

class _PostPropertyState extends State<PostProperty> {
  var _isSelectd = false;

  final List<ResidentialFilterEntry1> residential1_cast =
      <ResidentialFilterEntry1>[
    const ResidentialFilterEntry1('Apartment'),
    const ResidentialFilterEntry1('Villa/House'),
    const ResidentialFilterEntry1('Row House'),
    const ResidentialFilterEntry1('Farm House'),
    const ResidentialFilterEntry1('Plot'),
    const ResidentialFilterEntry1('Pent House'),
    const ResidentialFilterEntry1('Others'),
  ];
  List<String> _filters1 = <String>[];

  Iterable<Widget> get residentialWidgets sync* {
    for (final ResidentialFilterEntry1 residential in residential1_cast) {
      yield Padding(
        padding: const EdgeInsets.all(4.0),
        child: FilterChip(
          label: Text(residential.name1),
          labelStyle: const TextStyle(
            color: kPrimaryColor,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
          selected: _filters1.contains(residential.name1),
          backgroundColor: Colors.white,
          selectedColor: const Color.fromARGB(255, 233, 203, 213),
          onSelected: (bool value) {
            setState(() {
              if (value) {
                _filters1.add(residential.name1);
              } else {
                _filters1.removeWhere((String name) {
                  return name == residential.name1;
                });
              }
              print('${_filters1.join(',  ')}');
            });
          },
        ),
      );
    }
  }

  final List<CommercialFilterEntry1> commercial1_cast =
      <CommercialFilterEntry1>[
    const CommercialFilterEntry1('Office Space'),
    const CommercialFilterEntry1('Shop'),
    const CommercialFilterEntry1('Ware House'),
    const CommercialFilterEntry1('Commercial Land'),
    const CommercialFilterEntry1('Hotel'),
    const CommercialFilterEntry1('Showroom'),
    const CommercialFilterEntry1('Others'),
  ];
  // ignore: non_constant_identifier_names
  List<String> commercial1_filters = <String>[];

  Iterable<Widget> get commercialWidgets sync* {
    for (final CommercialFilterEntry1 commercial1 in commercial1_cast) {
      yield Padding(
        padding: const EdgeInsets.all(4.0),
        child: FilterChip(
          label: Text(commercial1.cname1),
          labelStyle: const TextStyle(
              color: kPrimaryColor,
              fontSize: 16.0,
              fontWeight: FontWeight.bold),
          selected: commercial1_filters.contains(commercial1.cname1),
          backgroundColor: Colors.white,
          selectedColor: const Color.fromARGB(255, 233, 203, 213),
          onSelected: (bool value) {
            setState(() {
              if (value) {
                commercial1_filters.add(commercial1.cname1);
              } else {
                commercial1_filters.removeWhere((String name) {
                  return name == commercial1.cname1;
                });
              }
              print('${commercial1_filters.join(',  ')}');
            });
          },
        ),
      );
    }
  }

  Future getImage1() async {}

  Future getImage2() async {}

  Future getImage3() async {}
  Future getImage4() async {}
  Future getImage5() async {}
  Future getImage6() async {}

  List<String> sell_and_rent = ["Sell", "Rent"];
  List<String> sell_and_rent_1c = ["Sell", "Rent"];
  List<String> owner_builder_broker = ["Owner", "Builder", "Broker"];
  List<String> bhk = ["1BHK", "2BHK", "3BHK", "4BHK"];
  List<String> construction_status = ["Completed", "Under Construction"];
  List<String> construction_status_4c = ["Completed", "Under Construction"];
  int selectedIndex = 0;
  int selectedIndex1 = 0;
  int selectedIndex1c = 0;
  int selectedIndex2 = 0;
  int selectedIndex3 = 0;
  int selectedIndex4c = 0;
  TextEditingController project_name_controller_r = TextEditingController();
  TextEditingController address_controller_r = TextEditingController();
  TextEditingController landmark_controller_r = TextEditingController();
  TextEditingController state_controller_r = TextEditingController();
  TextEditingController city_controller_r = TextEditingController();
  TextEditingController area_controller_r = TextEditingController();
  TextEditingController price_controller_r = TextEditingController();
  TextEditingController project_description_controller_r =
      TextEditingController();
  TextEditingController project_name_controller_c = TextEditingController();
  TextEditingController address_controller_c = TextEditingController();
  TextEditingController landmark_controller_c = TextEditingController();
  TextEditingController state_controller_c = TextEditingController();
  TextEditingController city_controller_c = TextEditingController();
  TextEditingController area_controller_c = TextEditingController();
  TextEditingController price_controller_c = TextEditingController();
  TextEditingController project_description_controller_c =
      TextEditingController();
  TextEditingController detail_controller = TextEditingController();
  TextEditingController addToMap = TextEditingController();
  String inputaddr = '';

  addToList() async {}

  Future addMarker() async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text(
              "Add Marker Location",
              style: TextStyle(fontSize: 17.0),
            ),
            children: <Widget>[
              TextField(
                onChanged: (String enterLoc) {
                  setState(() {
                    inputaddr = enterLoc;
                  });
                },
              ),
              SimpleDialogOption(
                child: const Text(
                  "Add It",
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: () {
                  addToList();
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Post As",
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      customRadio_2(
                        owner_builder_broker[0],
                        0,
                      ),
                      const SizedBox(width: 20),
                      customRadio_2(owner_builder_broker[1], 1),
                      const SizedBox(width: 20),
                      // customRadio_2(owner_builder_broker[2], 2),
                    ],
                  ),
                ),
                const Divider(),
                SizedBox(
                  height: 50,
                  child: AppBar(
                    backgroundColor: Colors.white,
                    elevation: 0,
                    bottom: const TabBar(
                      tabs: [
                        Tab(
                          icon: Text(
                            "Residential",
                            style: TextStyle(
                                fontSize: 18,
                                color: kIconColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Tab(
                          icon: Text(
                            "Commercial",
                            style: TextStyle(
                                fontSize: 18,
                                color: kIconColor,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: TabBarView(
                    children: [
                      ListView(
                        children: [
                          Column(
                            children: [
                              Container(
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 7,
                                    ),
                                    Container(
                                      alignment: Alignment.topLeft,
                                      margin: const EdgeInsets.only(left: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          customRadio_1(sell_and_rent[0], 0),
                                          const SizedBox(width: 20),
                                          customRadio_1(sell_and_rent[1], 1),
                                        ],
                                      ),
                                    ), //Radio button sell and rent
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    const Divider(),
                                    Container(
                                      alignment: Alignment.topLeft,
                                      margin: const EdgeInsets.only(left: 20),
                                      child: const Text(
                                        "Property Type",
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ), //Property type container
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    Container(
                                      child: Wrap(
                                        spacing: 5.0,
                                        runSpacing: 2.0,
                                        children: residentialWidgets.toList(),
                                      ),
                                    ), //Filterchip for residential
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10.0),
                              const Divider(),
                              Container(
                                  alignment: Alignment.topLeft,
                                  margin: const EdgeInsets.only(left: 20),
                                  child: const Text(
                                    "Add Location",
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  )), //Add location Container
                              const SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                padding: const EdgeInsets.only(left: 15),
                                margin: const EdgeInsets.only(
                                    left: 20, top: 10, right: 20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      style: BorderStyle.solid,
                                      color: Colors.grey),
                                ),
                                child: TextFormField(
                                  controller: project_name_controller_r,
                                  decoration: const InputDecoration(
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      hintText: "Project Name",
                                      hintStyle: TextStyle(fontSize: 18)),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Enter Project Name';
                                    }
                                    return null;
                                  },
                                ),
                              ), //Project Name
                              const SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                padding: const EdgeInsets.only(left: 15),
                                margin: const EdgeInsets.only(
                                    left: 20, top: 10, right: 20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      style: BorderStyle.solid,
                                      color: Colors.grey),
                                ),
                                child: TextFormField(
                                  controller: address_controller_r,
                                  decoration: const InputDecoration(
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      hintText: "Address",
                                      hintStyle: TextStyle(fontSize: 18)),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Enter Address';
                                    }
                                    return null;
                                  },
                                ),
                              ), //Address
                              const SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                padding: const EdgeInsets.only(left: 15),
                                margin: const EdgeInsets.only(
                                    left: 20, top: 10, right: 20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      style: BorderStyle.solid,
                                      color: Colors.grey),
                                ),
                                child: TextFormField(
                                  controller: landmark_controller_r,
                                  decoration: const InputDecoration(
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      hintText: "Landmark",
                                      hintStyle: TextStyle(fontSize: 18)),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Enter Landmark';
                                    }
                                    return null;
                                  },
                                ),
                              ), //Landmark
                              const SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                padding: const EdgeInsets.only(left: 15),
                                margin: const EdgeInsets.only(
                                    left: 20, top: 10, right: 20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      style: BorderStyle.solid,
                                      color: Colors.grey),
                                ),
                                child: TextFormField(
                                  controller: city_controller_r,
                                  decoration: const InputDecoration(
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      hintText: "City",
                                      hintStyle: TextStyle(fontSize: 18)),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Enter City';
                                    }
                                    return null;
                                  },
                                ),
                              ), //City
                              const SizedBox(height: 10.0),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                padding: const EdgeInsets.only(left: 15),
                                margin: const EdgeInsets.only(
                                    left: 20, top: 10, right: 20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      style: BorderStyle.solid,
                                      color: Colors.grey),
                                ),
                                child: TextFormField(
                                  controller: state_controller_r,
                                  decoration: const InputDecoration(
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      hintText: "State",
                                      hintStyle: TextStyle(fontSize: 18)),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Enter State';
                                    }
                                    return null;
                                  },
                                ),
                              ), //State

                              const SizedBox(
                                height: 10.0,
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              const Divider(),
                              Container(
                                alignment: Alignment.topLeft,
                                margin: const EdgeInsets.only(left: 20),
                                child: const Text(
                                  "Upload Photos",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ), //upload photo container
                              const SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                height: 100,
                                width: MediaQuery.of(context).size.width,
                                margin: const EdgeInsets.only(
                                    left: 20.0, right: 20.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: 100,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Container(
                                        height: 100,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Container(
                                        height: 100,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              const Divider(),
                              Container(
                                  alignment: Alignment.topLeft,
                                  margin: const EdgeInsets.only(left: 20),
                                  child: const Text(
                                    "Property Detail",
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  )), //property details
                              const SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                margin: const EdgeInsets.only(left: 20),
                                child: Row(
                                  children: [
                                    customRadio_3(bhk[0], 0),
                                    const SizedBox(width: 10),
                                    customRadio_3(bhk[1], 1),
                                    const SizedBox(width: 10),
                                    customRadio_3(bhk[2], 2),
                                    const SizedBox(width: 10),
                                    customRadio_3(bhk[3], 3),
                                  ],
                                ),
                              ), //bhk detail
                              const SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                padding: const EdgeInsets.only(left: 15),
                                margin: const EdgeInsets.only(
                                    left: 20, top: 10, right: 20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      style: BorderStyle.solid,
                                      color: Colors.grey),
                                ),
                                child: TextFormField(
                                  controller: area_controller_r,
                                  decoration: const InputDecoration(
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      hintText: "Area",
                                      hintStyle: TextStyle(fontSize: 18),
                                      suffixText: "sq ft"),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Enter Area';
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.number,
                                ),
                              ), //Area
                              const SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                padding: const EdgeInsets.only(left: 15),
                                margin: const EdgeInsets.only(
                                    left: 20, top: 10, right: 20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      style: BorderStyle.solid,
                                      color: Colors.grey),
                                ),
                                child: TextFormField(
                                  controller: price_controller_r,
                                  decoration: const InputDecoration(
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      hintText: "Price",
                                      hintStyle: TextStyle(fontSize: 18),
                                      suffixText: "/sq ft"),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Enter price';
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.number,
                                ),
                              ), //Price
                              const SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 100,
                                padding: const EdgeInsets.only(left: 15),
                                margin: const EdgeInsets.only(
                                    left: 20, top: 10, right: 20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      style: BorderStyle.solid,
                                      color: Colors.grey),
                                ),
                                child: TextFormField(
                                  minLines: 1,
                                  maxLines: 6,
                                  controller: project_description_controller_r,
                                  decoration: const InputDecoration(
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      hintText: "Project Description",
                                      hintStyle: TextStyle(fontSize: 18)),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Enter Description';
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.multiline,
                                ),
                              ), //Project Description
                              const SizedBox(
                                height: 10.0,
                              ),
                              const Divider(),
                              Container(
                                alignment: Alignment.topLeft,
                                margin: const EdgeInsets.only(left: 20),
                                child: const Text(
                                  "Construction Status",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ), //Construction status container
                              const SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                margin: const EdgeInsets.only(left: 20),
                                child: Row(
                                  children: [
                                    customRadio_4(construction_status[0], 0),
                                    const SizedBox(width: 20),
                                    customRadio_4(construction_status[1], 1),
                                  ],
                                ),
                              ), //construction status button
                              const SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                padding: const EdgeInsets.only(left: 15),
                                margin: const EdgeInsets.only(
                                    left: 20, top: 10, right: 20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      style: BorderStyle.solid,
                                      color: Colors.grey),
                                ),
                                child: TextField(
                                  onChanged: (String enterLoc) {
                                    setState(() {
                                      inputaddr = enterLoc;
                                    });
                                  },
                                  //controller: addToMap,
                                  decoration: const InputDecoration(
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      hintText: "Add to Map",
                                      hintStyle: TextStyle(fontSize: 18)),
                                ),
                              ),
                              const SizedBox(
                                height: 30.0,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                height: 50,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  // color: Colors.indigo,
                                  child: const Center(
                                      child: Text("POST",
                                          style: TextStyle(
                                              fontSize: 22,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold))),
                                ),
                              ), //post button container
                              const SizedBox(
                                height: 30.0,
                              ),
                            ],
                          ),
                        ],
                      ), // residential
                      ListView(
                        children: [
                          Column(
                            children: [
                              Container(
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 7,
                                    ),
                                    Container(
                                      alignment: Alignment.topLeft,
                                      margin: const EdgeInsets.only(left: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          customRadio_1c(
                                              sell_and_rent_1c[0], 0),
                                          const SizedBox(width: 20),
                                          customRadio_1c(
                                              sell_and_rent_1c[1], 1),
                                        ],
                                      ),
                                    ), //sell rent radio button
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      alignment: Alignment.topLeft,
                                      margin: const EdgeInsets.only(left: 20),
                                      child: const Text(
                                        "Property Type",
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ), //property type container
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    Container(
                                        child: Wrap(
                                      spacing: 5.0,
                                      runSpacing: 2.0,
                                      children: commercialWidgets.toList(),
                                    )), //Filter chip buttons
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              const Divider(),
                              Container(
                                  alignment: Alignment.topLeft,
                                  margin: const EdgeInsets.only(left: 20),
                                  child: const Text(
                                    "Add Location",
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  )), //add location container
                              const SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                padding: const EdgeInsets.only(left: 15),
                                margin: const EdgeInsets.only(
                                    left: 20, top: 10, right: 20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      style: BorderStyle.solid,
                                      color: Colors.grey),
                                ),
                                child: TextFormField(
                                  controller: project_name_controller_c,
                                  decoration: const InputDecoration(
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      hintText: "Project Name",
                                      hintStyle: TextStyle(fontSize: 18)),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Enter Project Name';
                                    }
                                    return null;
                                  },
                                ),
                              ), //project name commercial
                              const SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                padding: const EdgeInsets.only(left: 15),
                                margin: const EdgeInsets.only(
                                    left: 20, top: 10, right: 20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      style: BorderStyle.solid,
                                      color: Colors.grey),
                                ),
                                child: TextFormField(
                                  controller: address_controller_c,
                                  decoration: const InputDecoration(
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      hintText: "Address",
                                      hintStyle: TextStyle(fontSize: 18)),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Enter Address';
                                    }
                                    return null;
                                  },
                                ),
                              ), //address commercial
                              const SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                padding: const EdgeInsets.only(left: 15),
                                margin: const EdgeInsets.only(
                                    left: 20, top: 10, right: 20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      style: BorderStyle.solid,
                                      color: Colors.grey),
                                ),
                                child: TextFormField(
                                  controller: landmark_controller_c,
                                  decoration: const InputDecoration(
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      hintText: "Landmark",
                                      hintStyle: TextStyle(fontSize: 18)),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Enter Landmark';
                                    }
                                    return null;
                                  },
                                ),
                              ), //landmark container commercial
                              const SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                padding: const EdgeInsets.only(left: 15),
                                margin: const EdgeInsets.only(
                                    left: 20, top: 10, right: 20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      style: BorderStyle.solid,
                                      color: Colors.grey),
                                ),
                                child: TextFormField(
                                  controller: city_controller_c,
                                  decoration: const InputDecoration(
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      hintText: "City",
                                      hintStyle: TextStyle(fontSize: 18)),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Enter City';
                                    }
                                    return null;
                                  },
                                ),
                              ), //city container commercial
                              const SizedBox(height: 10.0),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                padding: const EdgeInsets.only(left: 15),
                                margin: const EdgeInsets.only(
                                    left: 20, top: 10, right: 20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      style: BorderStyle.solid,
                                      color: Colors.grey),
                                ),
                                child: TextFormField(
                                  controller: state_controller_c,
                                  decoration: const InputDecoration(
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      hintText: "State",
                                      hintStyle: TextStyle(fontSize: 18)),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Enter State';
                                    }
                                    return null;
                                  },
                                ),
                              ), //state container commercial
                              const SizedBox(
                                height: 10.0,
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              const Divider(),
                              Container(
                                  alignment: Alignment.topLeft,
                                  margin: const EdgeInsets.only(left: 20),
                                  child: const Text(
                                    "Upload Photos",
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  )), //upload photo container
                              const SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                height: 100,
                                width: MediaQuery.of(context).size.width,
                                margin: const EdgeInsets.only(
                                    left: 20.0, right: 20.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: 100,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Container(
                                        height: 100,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Container(
                                        height: 100,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              const Divider(),
                              Container(
                                  alignment: Alignment.topLeft,
                                  margin: const EdgeInsets.only(left: 20),
                                  child: const Text(
                                    "Property Detail",
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  )), //property detail container
                              const SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                padding: const EdgeInsets.only(left: 15),
                                margin: const EdgeInsets.only(
                                    left: 20, top: 10, right: 20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      style: BorderStyle.solid,
                                      color: Colors.grey),
                                ),
                                child: TextFormField(
                                  controller: area_controller_c,
                                  decoration: const InputDecoration(
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      hintText: "Area",
                                      hintStyle: TextStyle(fontSize: 18),
                                      suffixText: "sq ft"),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Enter Area';
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.number,
                                ),
                              ), //area container commercial
                              const SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                padding: const EdgeInsets.only(left: 15),
                                margin: const EdgeInsets.only(
                                    left: 20, top: 10, right: 20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      style: BorderStyle.solid,
                                      color: Colors.grey),
                                ),
                                child: TextFormField(
                                  controller: price_controller_c,
                                  decoration: const InputDecoration(
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      hintText: "Price",
                                      hintStyle: TextStyle(fontSize: 18),
                                      suffixText: "/sq ft"),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Enter Price';
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.number,
                                ),
                              ), //price container
                              const SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                padding: const EdgeInsets.only(left: 15),
                                margin: const EdgeInsets.only(
                                    left: 20, top: 10, right: 20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      style: BorderStyle.solid,
                                      color: Colors.grey),
                                ),
                                child: TextFormField(
                                  controller: detail_controller,
                                  decoration: const InputDecoration(
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      hintText: "Maintenance",
                                      hintStyle: TextStyle(fontSize: 18)),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Enter Maintenance';
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 100,
                                padding: const EdgeInsets.only(left: 15),
                                margin: const EdgeInsets.only(
                                    left: 20, top: 10, right: 20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      style: BorderStyle.solid,
                                      color: Colors.grey),
                                ),
                                child: TextFormField(
                                  controller: project_description_controller_c,
                                  decoration: const InputDecoration(
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      hintText: "Project Description",
                                      hintStyle: TextStyle(fontSize: 18)),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Enter Description';
                                    }
                                    return null;
                                  },
                                ),
                              ), //project description container
                              const SizedBox(
                                height: 10.0,
                              ),
                              const Divider(),
                              Container(
                                  alignment: Alignment.topLeft,
                                  margin: const EdgeInsets.only(left: 20),
                                  child: const Text(
                                    "Construction Status",
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  )), //construction status container
                              const SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                margin: const EdgeInsets.only(left: 20),
                                child: Row(
                                  children: [
                                    customRadio_4c(
                                        construction_status_4c[0], 0),
                                    const SizedBox(width: 20),
                                    customRadio_4c(
                                        construction_status_4c[1], 1),
                                  ],
                                ),
                              ), //construction status buttons
                              const SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                padding: const EdgeInsets.only(left: 15),
                                margin: const EdgeInsets.only(
                                    left: 20, top: 10, right: 20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      style: BorderStyle.solid,
                                      color: Colors.grey),
                                ),
                                child: TextField(
                                  onChanged: (String enterLoc) {
                                    setState(() {
                                      inputaddr = enterLoc;
                                    });
                                  },
                                  //controller: addToMap,
                                  decoration: const InputDecoration(
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      hintText: "Add to Map",
                                      hintStyle: TextStyle(fontSize: 18)),
                                ),
                              ),
                              const SizedBox(
                                height: 30.0,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                height: 50,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  // color: Colors.indigo,
                                  child: const Center(
                                      child: Text("POST",
                                          style: TextStyle(
                                              fontSize: 22,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold))),
                                  // shape: RoundedRectangleBorder(
                                  //   borderRadius: BorderRadius.circular(30),
                                  // ),
                                ),
                              ), //post button
                              const SizedBox(
                                height: 30.0,
                              )
                            ],
                          ),
                        ],
                      ), //commercial
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void changeIndex_sell_rent_1(int index) {
    setState(() {
      selectedIndex1 = index;
    });
  }

  void changeIndex_sell_rent_1c(int index) {
    setState(() {
      selectedIndex1c = index;
    });
  }

  void changeIndex_sell_rent_2(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void changeIndex_sell_rent_3(int index) {
    setState(() {
      selectedIndex2 = index;
    });
  }

  void changeIndex_sell_rent_4(int index) {
    setState(() {
      selectedIndex3 = index;
    });
  }

  void changeIndex_sell_rent_4c(int index) {
    setState(() {
      selectedIndex4c = index;
    });
  }

  Widget customRadio_4(String txt, int index) {
    return OutlinedButton(
      onPressed: () => changeIndex_sell_rent_4(index),
      child: Text(
        txt,
        style: TextStyle(
            color: selectedIndex3 == index ? kIconColor : Colors.grey,
            fontSize: 16.0),
      ),
    );
  }

  Widget customRadio_3(String txt, int index) {
    return OutlinedButton(
      onPressed: () => changeIndex_sell_rent_3(index),
      child: Text(
        txt,
        style: TextStyle(
            color: selectedIndex2 == index ? kIconColor : Colors.grey,
            fontSize: 16.0),
      ),
    );
  }

  Widget customRadio_2(String txt, int index) {
    return OutlinedButton(
      onPressed: () => changeIndex_sell_rent_2(index),
      child: Text(
        txt,
        style: TextStyle(
            color: selectedIndex == index ? kIconColor : Colors.grey,
            fontSize: 16.0),
      ),
    );
  }

  Widget customRadio_1(String txt, int index) {
    return OutlinedButton(
      onPressed: () => changeIndex_sell_rent_1(index),
      child: Text(
        txt,
        style: TextStyle(
            color: selectedIndex1 == index ? kIconColor : Colors.grey,
            fontSize: 16.0),
      ),
    );
  }

  Widget customRadio_1c(String txt, int index) {
    return OutlinedButton(
      onPressed: () => changeIndex_sell_rent_1c(index),
      child: Text(
        txt,
        style: TextStyle(
            color: selectedIndex1c == index ? kIconColor : Colors.grey,
            fontSize: 16.0),
      ),
    );
  }

  Widget customRadio_4c(String txt, int index) {
    return OutlinedButton(
      onPressed: () => changeIndex_sell_rent_4c(index),
      child: Text(
        txt,
        style: TextStyle(
            color: selectedIndex4c == index ? kIconColor : Colors.grey,
            fontSize: 16.0),
      ),
    );
  }
}
