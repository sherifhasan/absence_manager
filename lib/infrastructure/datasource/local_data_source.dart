import 'dart:convert';
import 'dart:io';

import 'package:absence_manager/infrastructure/datasource/data_source.dart';

class LocalDataSource extends DataSource {
  final absencesPath = 'assets/json_files/absences.json';
  final membersPath = 'assets/json_files/members.json';

  Future<List<dynamic>> readJsonFile(String path) async {
    String content = await File(path).readAsString();
    Map<String, dynamic> data = jsonDecode(content);
    return data['payload'];
  }

  @override
  Future<List<dynamic>> absences() async {
    return await readJsonFile(absencesPath);
  }

  @override
  Future<List<dynamic>> members() async {
    return await readJsonFile(membersPath);
  }
}
