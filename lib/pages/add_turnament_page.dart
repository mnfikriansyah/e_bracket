import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddTournamentPage extends StatefulWidget {
  const AddTournamentPage({Key? key}) : super(key: key);

  @override
  _AddTournamentPageState createState() => _AddTournamentPageState();
}

class _AddTournamentPageState extends State<AddTournamentPage> {
  bool isSingleType = false;
  bool random = false;
  int bestOf = 1;
  TextEditingController timecontroller = TextEditingController();

  DateTime selectedDate = DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime.now(),
        lastDate: DateTime(2050));
    if (picked != null) {
      setState(() {
        selectedDate = picked;
        timecontroller.text = DateFormat('dd MMM yyyy').format(selectedDate);
        // tanggalLahir = DateFormat('yyyy-MM-dd').format(selectedDate);
        // dateController.text = DateFormat('dd/MM/yyyy').format(selectedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: const Text("Add Tournament"),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: const Text(
                  'New Tournament',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Host'),
                    SizedBox(
                      height: 8,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF79018C)),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: 'Host',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Tournament name'),
                    SizedBox(
                      height: 8,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF79018C)),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: 'Tournament name',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Game'),
                    SizedBox(
                      height: 8,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF79018C)),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: 'Game',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    const Text(
                      'Type',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isSingleType = !isSingleType;
                        });
                      },
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            color: isSingleType ? Colors.purple : Colors.white,
                            border: Border.all(color: Colors.grey),
                            shape: BoxShape.circle),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'Single stage',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    const Text(
                      'Best Of',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.grey)),
                      child: Row(
                        children: [
                          Text(
                            bestOf.toString(),
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          PopupMenuButton<int>(
                            itemBuilder: (BuildContext context) {
                              return [
                                PopupMenuItem(
                                  child: Text("1"),
                                  value: 0,
                                ),
                                PopupMenuItem(
                                  child: Text("3"),
                                  value: 1,
                                ),
                                PopupMenuItem(
                                  child: Text("5"),
                                  value: 2,
                                ),
                                PopupMenuItem(
                                  child: Text("7"),
                                  value: 3,
                                ),
                              ];
                            },
                            iconSize: 20,
                            icon: Icon(Icons.keyboard_arrow_down),
                            onSelected: (v) {
                              if (v == 0) {
                                bestOf = 1;
                              }
                              if (v == 1) {
                                bestOf = 3;
                              }
                              if (v == 2) {
                                bestOf = 5;
                              }
                              if (v == 3) {
                                bestOf = 7;
                              }
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'When?',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextField(
                        controller: timecontroller,
                        readOnly: true,
                        showCursor: true,
                        onTap: () {
                          _selectDate(context);
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF79018C)),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          hintText: 'DD/MM/YYYY',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Participant'),
                    SizedBox(
                      height: 8,
                    ),
                    TextField(
                      minLines: 5,
                      maxLines: 50,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF79018C)),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: '1. participant name',
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Checkbox(
                        value: random,
                        onChanged: (v) {
                          setState(() {
                            random = v!;
                          });
                        }),
                    const Text('Randomize seeds'),
                  ],
                ),
              ),
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () async {
                      showDialog(context: context, builder: (context){
                        return AlertDialog(
                          content: Text("Confirm to conduct\nthis tournament?", textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18),
                          ),
                          actionsAlignment: MainAxisAlignment.center,
                          actions: [

                            InkWell(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 10),
                                decoration: BoxDecoration(
                                    color: const Color(0xFF79018C),
                                    borderRadius: BorderRadius.circular(10)),
                                child: const Text(
                                  'Yes',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 10),
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(10)),
                                child: const Text(
                                  'No',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        );
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 20),
                      decoration: BoxDecoration(
                          color: const Color(0xFF79018C),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Text(
                        'Generate',
                        style: TextStyle(fontSize: 18,color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 100,),

            ],
          ),
        ),
      ),
    );
  }
}
