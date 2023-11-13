import 'package:flutter/material.dart';
import 'package:sqf_demo_project/controller/home_page_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//instance of controller
  HomePageController controllerObj = HomePageController();

  @override
  void initState() {
    //for fetching initial data
    fetchData();
    super.initState();
  }

  fetchData() async {
    //get all data form datbase
    await controllerObj.getAllDataFromDb();
    setState(() {});
  }

  final nameController = TextEditingController(); //name controller
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                  hintText: "Name",
                  labelText: "Name",
                  border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () async {
                  //funciton to add employee to database
                  await HomePageController.addDatatoDb(
                      name: nameController.text);

                  // funciton to get data from data base after adding new data
                  await controllerObj.getAllDataFromDb();
                  setState(() {});
                },
                child: Text("Save")),
            Divider(
              thickness: 2,
            ),
            Expanded(
              child: ListView.separated(
                itemCount: controllerObj.myModelList.length,
                itemBuilder: (context, index) => ListTile(

                    //show name in the model list in ui
                    title: Text(controllerObj.myModelList[index].name)),
                separatorBuilder: (context, index) => Divider(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
