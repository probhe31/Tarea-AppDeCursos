import 'package:flutter/material.dart';
import 'package:flutter_sqlite/infrastructure/sqflite_teacher_repository.dart';
import 'package:flutter_sqlite/infrastructure/database_migration.dart';
import 'package:flutter_sqlite/model/teacher.dart';
import 'package:flutter_sqlite/pages/teacher_detail_page.dart';

class TeacherListWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TeacherListPageState();
}

class TeacherListPageState extends State<TeacherListWidget> {
  SqfliteTeacherRepository teacherRepository =
      SqfliteTeacherRepository(DatabaseMigration.get);
  List<Teacher> teachers;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    if (teachers == null) {
      teachers = List<Teacher>();
      getData();
    }
    return Scaffold(
      body: teacherListItems(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateToDetail(Teacher(''));
        },
        tooltip: "Add new Teacher",
        child: new Icon(Icons.add),
      ),
    );
  }

  ListView teacherListItems() {
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          color: Colors.white,
          elevation: 5.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.yellow,
              child: Text(''),
            ),
            title: Text(this.teachers[position].name),
            subtitle: Text(''),
            onTap: () {
              navigateToDetail(this.teachers[position]);
            },
          ),
        );
      },
    );
  }

  void getData() {
    final teachersFuture = teacherRepository.getList();
    teachersFuture.then((teacherList) {
      setState(() {
        teachers = teacherList;
        count = teacherList.length;
      });
    });
  }

  void navigateToDetail(Teacher teacher) async {
    bool result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TeacherDetailPage(teacher)),
    );
    if (result == true) {
      getData();
    }
  }
}
