import 'dart:math';

import 'package:flutter/material.dart';
import '../database/model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mypets/database/database_helper.dart';

// ignore: must_be_immutable
class PetsScreen extends StatefulWidget {
  PetsScreen({Key? key, required this.dbHelper}) : super(key: key);

  DatabaseHelper dbHelper;

  @override
  _PetsScreenState createState() => _PetsScreenState();
}

class _PetsScreenState extends State<PetsScreen> {
  // add List of Product variable for List creation
  List<Pets> pets = [];

  Future<dynamic> _showConfirmDialog(BuildContext context, String action) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text(
                  'Do you want to $action this item?'), //----popup เด้งมากดยืนยันการลบ
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                    child: const Text('Yes')),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                    child: const Text('No')),
              ]);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 231, 137, 83),
        actions: [
          IconButton(
              onPressed: () async {
                await ModalProductForm(
                  dbHelper: widget.dbHelper,
                ).showModalInputForm(context);
              },
              icon: const Icon(Icons.add)),
        ],
        title: const Text('My Pets'),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: widget.dbHelper.getStream(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                  child: CircularProgressIndicator()); // หมุนๆระหว่างรอข้อมูล
            }
            pets.clear();
            for (var element in snapshot.data!.docs) {
              pets.add(Pets(
                  name: element.get('name'),
                  age: element.get('age'),
                  sex: element.get('sex'),
                  blood: element.get('blood'),
                  pet: element.get('pet'),
                  gene: element.get('gene'),
                  moredetails: element.get('moredetails'),
                  vaccine: element.get('vaccine'),
                  referenceId: element.id));
            }
            // create product array from
            return ListView.builder(
              itemCount: pets.length,
              itemBuilder: (context, index) {
                //
                // *** Edit #8 *** => Add swipe feature to delete item
                //
                return Dismissible(
                  key: UniqueKey(),
                  background: Container(
                    color: Colors.blue,
                  ),
                  secondaryBackground: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 20),
                      child: const Icon(Icons.delete_forever_outlined,
                          color: Colors.white, size: 30)),
                  onDismissed: (direction) {
                    if (direction == DismissDirection.endToStart) {
                      widget.dbHelper.deletePets(pets[index]);
                    }
                  },
                  confirmDismiss: (direction) async {
                    if ((direction) == DismissDirection.endToStart) {
                      return await _showConfirmDialog(context, 'Delete');
                    }
                    return false;
                  },
                  child: Card(
                    child: ListTile(
                      title: Text(pets[index].name),
                      subtitle:
                          Text('Details: ${pets[index].moredetails.toString()}'),
                      trailing: pets[index].vaccine == 1
                          ? const Icon(Icons.healing,
                              color: Colors.green)
                          : null,
                      onTap: () async {
                        var result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailScreen(petsdetail: pets[index]),
                          ),
                        );
                        setState(() {
                          if (result != null) {
                            pets[index].vaccine = result;
                            widget.dbHelper.updatePets(pets[index]);
                          }
                        });
                      
                      },
                      onLongPress: () async {
                        await ModalEditPetsForm(
                          dbHelper: widget.dbHelper,
                          editedPets: pets[index],
                        ).showModalInputForm(context);
                      },
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(
                          ('assets/images/logohome.png'),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }),
    );
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.petsdetail}) : super(key: key);

  final Pets petsdetail;

  @override
  Widget build(BuildContext context) {
    var result = petsdetail.vaccine;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 231, 137, 83),
        title: Text(petsdetail.name),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.topCenter,
              padding: const EdgeInsets.all(100),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/logopet.png'
                  ),
                  fit: BoxFit.fitHeight,
                ),
              ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(10),
            child: Text('Pet : ${petsdetail.pet}'),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(10),
            child: Text(petsdetail.age),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(10),
            child: Text(petsdetail.sex),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(10),
            child: Text(petsdetail.blood),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(10),
            child: Text(petsdetail.gene),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(10),
            child: Text(petsdetail.moredetails),
          ),
          Container(
            padding: const EdgeInsets.only(top: 80),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(120, 40),
                      primary: petsdetail.vaccine == 1
                          ? Colors.blueGrey
                          : Colors.redAccent),
                  child: petsdetail.vaccine == 1
                      ? const Text('UnVaccine')
                      : const Text('Vaccine'),
                  onPressed: () {
                    result = petsdetail.vaccine == 1 ? 0 : 1;
                    Navigator.pop(context, result);
                  },
                ),
                ElevatedButton(
                  child: const Text('Close'),
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(120, 40),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ModalProductForm {
  ModalProductForm({
    Key? key,
    required this.dbHelper,
  });

  DatabaseHelper dbHelper;

  String _name = '', _age = '',  _sex = '',  _blood = '',  _pet = '',  _gene = '', _moredetails = '';
  final int _vaccine = 0;

  Future<dynamic> showModalInputForm(BuildContext context) {
    return showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return Container(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const ListTile(
                  title: Center(
                    child: Text(
                      'Input My Pets',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(15),
                      child: TextFormField(
                        initialValue: '',
                        autofocus: true,
                        decoration: const InputDecoration(
                          labelText: 'Name',
                          hintText: 'input name',
                        ),
                        onChanged: (value) {
                          _name = value;
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(15),
                      child: TextFormField(
                        initialValue: '',
                        decoration: const InputDecoration(
                          labelText: 'pet',
                          hintText: 'input pet',
                        ),
                        onChanged: (value) {
                          _pet = value;
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(15),
                      child: TextFormField(
                        initialValue: '',
                        decoration: const InputDecoration(
                          labelText: 'gene',
                          hintText: 'input gene',
                        ),
                        onChanged: (value) {
                          _gene = value;
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(15),
                      child: TextFormField(
                        initialValue: '',
                        decoration: const InputDecoration(
                          labelText: 'Age',
                          hintText: 'input age',
                        ),
                        onChanged: (value) {
                          _age = value;
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(15),
                      child: TextFormField(
                        initialValue: '',
                        decoration: const InputDecoration(
                          labelText: 'Sex',
                          hintText: 'input sex',
                        ),
                        onChanged: (value) {
                          _sex = value;
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(15),
                      child: TextFormField(
                        initialValue: '',
                        decoration: const InputDecoration(
                          labelText: 'Blood',
                          hintText: 'input blood',
                        ),
                        onChanged: (value) {
                          _blood = value;
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(15),
                      child: TextFormField(
                        initialValue: '',
                        decoration: const InputDecoration(
                          labelText: 'More Details',
                          hintText: 'input details',
                        ),
                        onChanged: (value) {
                          _moredetails = value;
                        },
                      ),
                    ),
                
                    Container(
                      margin: const EdgeInsets.all(20),
                      child: ElevatedButton(
                          child: const Text('Add'),
                          onPressed: () async {
                            var newPets = Pets(
                                name: _name,
                                age: _age,
                                blood: _blood,
                                pet: _pet,
                                gene: _gene,
                                sex: _sex,
                                moredetails: _moredetails,
                                vaccine: _vaccine,
                                referenceId: null);
                            await dbHelper.insertPets(newPets).then(
                                (value) => newPets.referenceId = value.id);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  '${newPets.name} is inserted complete...'),
                            ));
                            Navigator.pop(context);
                          }),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}

class ModalEditPetsForm {
  ModalEditPetsForm(
      {Key? key, required this.dbHelper, required this.editedPets});

  DatabaseHelper dbHelper;
  Pets editedPets;

  String _name = '', _age = '',  _sex = '',  _blood = '',  _pet = '',  _gene = '', _moredetails = '';
  int _vaccine = 0;
  String? _referencrId;



  Future<dynamic> showModalInputForm(BuildContext context) {
    _name = editedPets.name;
    _age = editedPets.age;
    _blood = editedPets.blood;
    _sex = editedPets.sex;
    _pet = editedPets.pet;
    _gene = editedPets.gene;
    _moredetails = editedPets.moredetails;
    _vaccine = editedPets.vaccine;
    _referencrId = editedPets.referenceId;

    return showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return Container(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const ListTile(
                  title: Center(
                    child: Text(
                      'input your pet',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(15),
                      child: TextFormField(
                        initialValue: _name,
                        autofocus: true,
                        decoration: const InputDecoration(
                          labelText: 'Name',
                          hintText: 'input name',
                        ),
                        onChanged: (value) {
                          _name = value;
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(15),
                      child: TextFormField(
                        initialValue: _pet,
                        decoration: const InputDecoration(
                          labelText: 'Pet',
                          hintText: 'input pet',
                        ),
                        onChanged: (value) {
                          _pet = value;
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(15),
                      child: TextFormField(
                        initialValue: _gene,
                        decoration: const InputDecoration(
                          labelText: 'Gene',
                          hintText: 'input Gene',
                        ),
                        onChanged: (value) {
                          _gene = value;
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(15),
                      child: TextFormField(
                        initialValue: _age,
                        decoration: const InputDecoration(
                          labelText: 'Age',
                          hintText: 'input age',
                        ),
                        onChanged: (value) {
                          _age = value;
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(15),
                      child: TextFormField(
                        initialValue: _sex,
                        decoration: const InputDecoration(
                          labelText: 'sex',
                          hintText: 'input sex',
                        ),
                        onChanged: (value) {
                          _sex = value;
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(15),
                      child: TextFormField(
                        initialValue: _blood,
                        decoration: const InputDecoration(
                          labelText: 'Blood',
                          hintText: 'input blood',
                        ),
                        onChanged: (value) {
                          _blood = value;
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(15),
                      child: TextFormField(
                        initialValue: _moredetails,
                        decoration: const InputDecoration(
                          labelText: 'Details',
                          hintText: 'input details',
                        ),
                        onChanged: (value) {
                          _moredetails = value;
                        },
                      ),
                    ),
                    
                    Container(
                      margin: const EdgeInsets.all(20),
                      child: ElevatedButton(
                          child: const Text('Update'),
                          onPressed: () async {
                            var newPets = Pets(
                                name: _name,
                                age: _age,
                                blood: _blood,
                                pet: _pet,
                                gene: _gene,
                                sex: _sex,
                                moredetails: _moredetails,
                                vaccine: _vaccine,
                                referenceId: _referencrId);
                            dbHelper.updatePets(newPets);
                            Navigator.pop(context);
                          }),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
