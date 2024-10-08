import 'package:absence_manager/domain/entities/entities.dart';

abstract class AppRepository {
  Future<List<AbsenceEntity>> absences();

  Future<Map<int, MemberEntity>> members();
}
