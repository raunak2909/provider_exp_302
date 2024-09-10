import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_exp_302/list_map_provider.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List Data')),
      body: Consumer<ListMapProvider>(
        builder: (ctx, provider, __){
          var allContacts = ctx.watch<ListMapProvider>().getListData();
          return allContacts.isNotEmpty ? ListView.builder(
            itemCount: allContacts.length,
              itemBuilder: (_, index){
              return ListTile(
                title: Text(allContacts[index]["name"]),
                subtitle: Text(allContacts[index]["mobno"]),
                trailing: SizedBox(
                  width: 100,
                  child: Row(
                    children: [
                      IconButton(onPressed: (){
                        provider.updateMap({
                          "name" : "Abhi",
                          "mobno" : "7777777777"
                        }, index);
                      }, icon: Icon(Icons.edit)),
                      IconButton(onPressed: (){
                        provider.deleteMap(index);
                      }, icon: Icon(Icons.delete_outlined, color: Colors.red,)),
                    ],
                  ),
                ),
              );
              }) : Center(child: Text('No Contacts yet!!'),);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){

          Navigator.push(context, MaterialPageRoute(builder: (context) => Scaffold(
            appBar: AppBar(
              title: Text('Add Contact'),
            ),
            body: Center(
              child: IconButton(
                onPressed: (){
                  context.read<ListMapProvider>().addMap({
                    "name" : "Abhishek",
                    "mobno" : "9743647337"
                  });
                },
                icon: Icon(Icons.add),
              ),
            ),
          ),));

         /* Provider.of<ListMapProvider>(context, listen: false).addMap({
            "name" : "Abhishek",
            "mobno" : "9743647337"
          });*/
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
