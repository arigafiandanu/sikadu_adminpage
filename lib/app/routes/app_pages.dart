import 'package:get/get.dart';

import '../modules/BuatPengumuman/bindings/buat_pengumuman_binding.dart';
import '../modules/BuatPengumuman/views/buat_pengumuman_view.dart';
import '../modules/KelolaGuru/bindings/kelola_guru_binding.dart';
import '../modules/KelolaGuru/views/kelola_guru_view.dart';
import '../modules/TambahGuru/bindings/tambah_guru_binding.dart';
import '../modules/TambahGuru/views/tambah_guru_view.dart';
import '../modules/chat/bindings/chat_binding.dart';
import '../modules/chat/views/chat_view.dart';
import '../modules/daftar/bindings/daftar_binding.dart';
import '../modules/daftar/views/daftar_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/listAdmin/bindings/list_admin_binding.dart';
import '../modules/listAdmin/views/list_admin_view.dart';
import '../modules/listGuru/bindings/list_guru_binding.dart';
import '../modules/listGuru/views/list_guru_view.dart';
import '../modules/list_chat/bindings/list_chat_binding.dart';
import '../modules/list_chat/views/list_chat_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/lupaPass/bindings/lupa_pass_binding.dart';
import '../modules/lupaPass/views/lupa_pass_view.dart';
import '../modules/profil/bindings/profil_binding.dart';
import '../modules/profil/views/profil_view.dart';
import '../modules/tambahSiswa/bindings/tambah_siswa_binding.dart';
import '../modules/tambahSiswa/views/tambah_siswa_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.DAFTAR,
      page: () => DaftarView(),
      binding: DaftarBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.PROFIL,
      page: () => ProfilView(),
      binding: ProfilBinding(),
    ),
    GetPage(
      name: _Paths.CHAT,
      page: () => ChatView(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: _Paths.LIST_CHAT,
      page: () => ListChatView(),
      binding: ListChatBinding(),
    ),
    GetPage(
      name: _Paths.LUPA_PASS,
      page: () => LupaPassView(),
      binding: LupaPassBinding(),
    ),
    GetPage(
      name: _Paths.BUAT_PENGUMUMAN,
      page: () => BuatPengumumanView(),
      binding: BuatPengumumanBinding(),
    ),
    GetPage(
      name: _Paths.TAMBAH_SISWA,
      page: () => TambahSiswaView(),
      binding: TambahSiswaBinding(),
    ),
    GetPage(
      name: _Paths.TAMBAH_GURU,
      page: () => TambahGuruView(),
      binding: TambahGuruBinding(),
    ),
    GetPage(
      name: _Paths.KELOLA_GURU,
      page: () => KelolaGuruView(),
      binding: KelolaGuruBinding(),
    ),
    GetPage(
      name: _Paths.LIST_ADMIN,
      page: () => ListAdminView(),
      binding: ListAdminBinding(),
    ),
    GetPage(
      name: _Paths.LIST_GURU,
      page: () => ListGuruView(),
      binding: ListGuruBinding(),
    ),
  ];
}
