import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/info.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => GioiTinh()),
          ChangeNotifierProvider(create: (_) => BangCap()),
        ],
        child: const MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter multiProvider ',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Radio Demo'),
      ),
      // Nếu có nhiều class cần thay đổi thì có thể dùng Consumer2, Consumer3, ...
      body: Consumer2<GioiTinh, BangCap>(
        builder: (context, infoGioiTinh, infoBangCap, child) {
          return Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    'Giới Tính',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 10),
                // Thêm nút radio chọn giới tính
                RadioListTile<gioi_tinh?>(
                  title: const Text('Nam'),
                  value: gioi_tinh.nam,
                  secondary: const Icon(Icons.male),
                  groupValue: infoGioiTinh.gioiTinh,
                  onChanged: (value) {
                    infoGioiTinh.gioiTinh = value!;
                  },
                ),
                RadioListTile<gioi_tinh?>(
                  title: const Text('Nữ'),
                  value: gioi_tinh.nu,
                  secondary: const Icon(Icons.female),
                  groupValue: infoGioiTinh.gioiTinh,
                  onChanged: (value) {
                    infoGioiTinh.gioiTinh = value!;
                  },
                ),
                const SizedBox(height: 30),
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    'Bằng Cấp',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 10),
                // Thêm nút radio chọn bằng cấp
                RadioListTile<bang_cap?>(
                  title: const Text('Cao Đẳng'),
                  value: bang_cap.CaoDang,
                  groupValue: infoBangCap.bangCap,
                  onChanged: (value) {
                    infoBangCap.bangCap = value!;
                  },
                ),
                RadioListTile<bang_cap?>(
                  title: const Text('Đại Học'),
                  value: bang_cap.DaiHoc,
                  groupValue: infoBangCap.bangCap,
                  onChanged: (value) {
                    infoBangCap.bangCap = value!;
                  },
                ),
                RadioListTile<bang_cap?>(
                  title: const Text('Thạc Sĩ'),
                  value: bang_cap.ThacSi,
                  groupValue: infoBangCap.bangCap,
                  onChanged: (value) {
                    infoBangCap.bangCap = value!;
                  },
                ),
                RadioListTile<bang_cap?>(
                  title: const Text('Tiến Sĩ'),
                  value: bang_cap.TienSi,
                  groupValue: infoBangCap.bangCap,
                  onChanged: (value) {
                    infoBangCap.bangCap = value!;
                  },
                ),
                RadioListTile<bang_cap?>(
                  title: const Text('Giáo Sư'),
                  value: bang_cap.GiaoSu,
                  groupValue: infoBangCap.bangCap,
                  onChanged: (value) {
                    infoBangCap.bangCap = value!;
                  },
                ),
                const Divider(height: 100),
                Center(
                  child: Text(
                    'Thông tin cá nhân: ${infoGioiTinh.gioiTinh}, ${infoBangCap.bangCap}',
                    style: const TextStyle(fontSize: 15),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

/*
  // Nhà cung cấp
    class YourProvider extends ChangeNotifier
    notifyListeners();
  --------------------------------------------------
  // Nhà phân phối
    ChangNotifierProvider
    MultiProvider
  --------------------------------------------------
  // Người sử dụng
    Consumer<YourProvider>
    context.watch<YourProvider>()
    context.read<YourProvider>()
  --------------------------------------------------
*/