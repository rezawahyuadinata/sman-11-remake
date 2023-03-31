import 'package:flutter/material.dart';
import 'package:sman11/theme.dart';

class DesktopHomePageBody extends StatelessWidget {
  const DesktopHomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    Widget motoSekolah() {
      return Container(
        height: 100 /* MediaQuery.of(context).size.height */,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(child: Text('hello')),
      );
    }

    Widget beritaSekolah() {
      return Container(
        color: primaryButtonColor,
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
      );
    }

    Widget profilSekolah() {
      return Container(
        color: primaryMainColor,
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
      );
    }

    Widget daftarBeritaSekolah() {
      return Container(
        color: primaryHeadlineColor,
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
      );
    }

    Widget footerSekolah() {
      return Container();
    }

    Widget content() {
      return Column(
        children: [
          motoSekolah(),
          profilSekolah(),
          beritaSekolah(),
          daftarBeritaSekolah(),
          footerSekolah()
        ],
      );
    }

    return SafeArea(
      child: SingleChildScrollView(
        child: content(),
      ),
    );
  }
}

class DesktopHomePageHeader extends StatelessWidget {
  const DesktopHomePageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        leadingWidth: 500,
        leading: Container(
          padding: EdgeInsets.symmetric(horizontal: marginUtama),
          child: Center(
            child: InkWell(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/', (route) => false);
              },
              child: Text(
                'SMAN-11-Jakarta',
                style: primaryTextStyle.copyWith(fontSize: 18),
              ),
            ),
          ),
        ),
        backgroundColor: primaryBackgroundColor,
        elevation: 0,
        centerTitle: false,
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 200),
          child: Align(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const <Widget>[
                NavbarMenu(namaNavbar: 'Beranda'),
                NavbarMenu(namaNavbar: 'Profil'),
                NavbarMenu(namaNavbar: 'Akademik'),
                NavbarMenu(namaNavbar: 'Kesiswaan'),
                NavbarMenu(namaNavbar: 'Sarprashum'),
                NavbarMenu(namaNavbar: 'Aplikasi'),
              ],
            ),
          ),
        ),
      );
    }

    return Column(
      children: [
        header(),
      ],
    );
  }
}

class NavbarMenu extends StatelessWidget {
  const NavbarMenu({
    Key? key,
    required this.namaNavbar,
  }) : super(key: key);

  final String namaNavbar;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Text(
        namaNavbar,
        style: primaryTextStyle.copyWith(fontSize: 18),
      ),
    );
  }
}
