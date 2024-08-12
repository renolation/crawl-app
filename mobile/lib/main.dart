import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'config/router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();



  runApp(const ProviderScope(
    child: MyApp(),
  ),);
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);

    return MaterialApp.router(
      title: 'Flutter Demo',
      routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}


//region cal
// Map<String, double> calculateTotalStats({
//   required Map<String, double> baseStats,
//   required Map<String, double> weaponStats,
//   required List<Map<String, double>> mainStatsList,
// }) {
//   // Initialize totalStats with baseStats
//
//   //total base stats
//   Map<String, double> totalStats = Map.from(baseStats);
//
//   //total percent
//   Map<String, double> totalPercent = {};
//
//   //total flat
//   Map<String, double> totalFlat = {};
//
//   //result
//   Map<String, double> result = Map.from(baseStats);
//
//   // Add weapon stats to totalStats
//   weaponStats.forEach((key, value) {
//     if (!key.endsWith('_percent')) {
//       totalStats[key] = (baseStats[key] ?? 0) + value;
//     } else {
//       totalPercent[key] = value;
//     }
//   });
//
//
//   // Sum the first entry in each map in mainStatsList
//   for (var stats in mainStatsList) {
//     if (stats.isNotEmpty) {
//       var firstEntry = stats.entries.first;
//       var key = firstEntry.key;
//       var value = firstEntry.value;
//
//       if (totalFlat.containsKey(key)) {
//         totalFlat[key] = totalFlat[key]! + value;
//       } else {
//         totalFlat[key] = value;
//       }
//       var secondEntry = stats.entries.elementAt(1);
//       var key2 = secondEntry.key;
//       var value2 = secondEntry.value;
//       if(totalPercent.containsKey(key2)){
//         totalPercent[key2] = totalPercent[key2]! + value2;
//       } else {
//         totalPercent[key2] = value2;
//       }
//
//     }
//   }
//
//
//   print(totalStats);
//
//   baseStats.forEach((key, value) {
//     // key = atk_percent
//     if (!key.endsWith('_percent')) {
//       //baseKey = atk
//       String percentKey = '${key}_percent';
//       if (weaponStats.containsKey(percentKey)) {
//         result[key] = totalStats[key]! * (1 + totalPercent[percentKey]! / 100) + totalFlat[key]!;
//       } else {
//         if (totalFlat[key] == null) {
//           totalFlat[key] = 0.0;
//         }
//         result[key] = baseStats[key]! * (1 + totalPercent[percentKey]! / 100) + totalFlat[key]!;
//         print(result);
//       }
//     }
//   });
//   print(result);
//   return result;
//
//   //region a
//   // Calculate intermediate stats by applying percentage increases
//   // totalStats.forEach((key, value) {
//   //   if (key.endsWith('_percent')) {
//   //     String baseKey = key.replaceAll('_percent', '');
//   //     if (totalStats.containsKey(baseKey)) {
//   //       totalStats[baseKey] = totalStats[baseKey]! * (1 + value / 100);
//   //     }
//   //   }
//   // });
//
//   // Add main stats from each map in mainStatsList to totalStats
//   // for (var mainStats in mainStatsList) {
//   //   double flatAtk = 0;
//   //   mainStats.forEach((key, value) {
//   //     if (key == 'atk') {
//   //       flatAtk += value;
//   //     } else if (key.endsWith('_percent')) {
//   //       totalStats[key] = (totalStats[key] ?? 0) + value;
//   //     }
//   //   });
//   //
//   //   // Apply percentage increases from main stats
//   //   totalStats.forEach((key, value) {
//   //     if (key.endsWith('_percent')) {
//   //       String baseKey = key.replaceAll('_percent', '');
//   //       if (totalStats.containsKey(baseKey)) {
//   //         totalStats[baseKey] = totalStats[baseKey]! * (1 + value / 100);
//   //       }
//   //     }
//   //   });
//   //
//   //   // Add flat atk after percentage increases
//   //   totalStats['atk'] = (totalStats['atk'] ?? 0) + flatAtk;
//   // }
//   //
//   // return totalStats;
//
//   //endregion
// }
//
// void main() {
//   Map<String, double> baseStats = {
//     'atk': 412,
//     'hp': 10825,
//   };
//
//   Map<String, double> weaponStats = {
//     'atk': 587.50,
//     'atk_percent': 36.45,
//   };
//
//   List<Map<String, double>> mainStatsList = [
//     {
//       'atk': 150,
//       'atk_percent': 33,
//     },
//     {
//       'atk': 150,
//       'hp_percent': 33,
//     },
//     {
//       'atk': 150,
//       'hp_percent': 33,
//     },
//   ];
//
//   Map<String, double> totalStats = calculateTotalStats(
//     baseStats: baseStats,
//     weaponStats: weaponStats,
//     mainStatsList: mainStatsList,
//   );
//
//   print(totalStats);
// }
//endregion