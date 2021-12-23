import 'package:rrule_generator/localizations/text_delegate.dart';

class IndonesianRRuleTextDelegate implements RRuleTextDelegate {
  const IndonesianRRuleTextDelegate();

  @override
  String get byDayInMonth => 'Menurut hari dalam Bulan';

  @override
  String get byNthDayInMonth => 'Pada hari ke-n dalam Bulan';

  @override
  String get every => 'Setiap';

  @override
  String get of => 'dari';

  @override
  String get months => 'Bulan';

  @override
  String get weeks => 'Minggu';

  @override
  String get days => 'Hari';

  @override
  String get instances => 'contoh';

  @override
  String get neverEnds => 'Tidak pernah berakhir';

  @override
  String get endsAfter => 'Berakhir setelah';

  @override
  String get endsOnDate => 'Berakhir pada tanggal';

  @override
  List<String> get daysInMonth => [
        '1',
        '2',
        '3',
        '4',
        'Terakhir',
      ];

  @override
  List<String> get allMonths => [
        'Januari',
        'Februari',
        'Maret',
        'April',
        'Mei',
        'Juni',
        'Juli',
        'Agustus',
        'September',
        'Oktober',
        'November',
        'Desember',
      ];

  @override
  List<String> get weekdays => [
        'Senin',
        'Selasa',
        'Rabu',
        'Kamis',
        'Jumat',
        'Sabtu',
        'Minggu',
      ];

  @override
  List<String> get periods => [
        'Tahunan',
        'Bulanan',
        'Mingguan',
        'Harian',
        'Tak pernah',
      ];
}
