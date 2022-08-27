import 'package:flutter/material.dart';

// ignore: camel_case_types
enum gioi_tinh { nam, nu }

// ignore: camel_case_types, constant_identifier_names
enum bang_cap { CaoDang, DaiHoc, ThacSi, TienSi, GiaoSu }

class GioiTinh extends ChangeNotifier {
  gioi_tinh _gioiTinh = gioi_tinh.nam;

  gioi_tinh get gioiTinh => _gioiTinh;

  set gioiTinh(gioi_tinh value) {
    _gioiTinh = value;
    notifyListeners();
  }

  /**
   * Tạo ra class GioiTinh để lưu trữ giới tính của sinh viên nhập vào.
   * Tại sao không chuyển biến giới tính thành biến công khai (public) và bỏ get với set đi?
   * Như thế cũng được nhưng đang mong muốn biến giới tính mỗi lần có giá trị mới thì phải thông báo đến các nơi đăg ký biết để cập nhật lại giao diện.
   */
}

class BangCap extends ChangeNotifier {
  bang_cap _bangCap = bang_cap.DaiHoc;

  bang_cap get bangCap => _bangCap;

  set bangCap(value) {
    _bangCap = value;
    notifyListeners();
  }
}
