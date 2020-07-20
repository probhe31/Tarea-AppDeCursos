import 'package:flutter_sqlite/infrastructure/database_migration.dart';
import 'package:flutter_sqlite/model/teacher.dart';

abstract class TeacherRepository {
  DatabaseMigration databaseMigration;
  Future<int> insert(Teacher course);
  Future<int> update(Teacher course);
  Future<int> delete(Teacher course);
  Future<int> deleteById(int teacherId);
  Future<List<Teacher>> getList();
}
