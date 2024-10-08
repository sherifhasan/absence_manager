import 'package:flutter/material.dart';

class FilterOptions extends StatelessWidget {
  final VoidCallback filterByDate;
  final ValueChanged<String> filterByAbsencesByType;
  final VoidCallback loadAllAbsences;
  final String selectedFilter;

  const FilterOptions({
    super.key,
    required this.filterByDate,
    required this.filterByAbsencesByType,
    required this.loadAllAbsences,
    required this.selectedFilter,
  });

  @override
  Widget build(BuildContext context) {
    final filters = [
      {'label': 'All', 'value': 'all', 'onPressed': loadAllAbsences},
      {
        'label': 'Vacation',
        'value': 'vacation',
        'onPressed': () => filterByAbsencesByType('vacation')
      },
      {
        'label': 'Sickness',
        'value': 'sickness',
        'onPressed': () => filterByAbsencesByType('sickness')
      },
      {'label': 'Date', 'value': 'date', 'onPressed': filterByDate},
    ];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: filters.map(
            (filter) {
              final isSelected = selectedFilter == filter['value'];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                child: ElevatedButton(
                  onPressed: filter['onPressed'] as VoidCallback,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isSelected ? Colors.blueAccent : null,
                  ),
                  child: Text(filter['label'] as String),
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
