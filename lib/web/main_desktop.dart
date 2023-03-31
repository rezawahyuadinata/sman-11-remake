import 'package:flutter/material.dart';
import 'package:sman11/theme.dart';

class DesktopHomePageBody extends StatelessWidget {
  const DesktopHomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    Widget motoSekolah() {
      return Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/banner.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Container(
          padding: EdgeInsets.all(100),
          color: Color.fromRGBO(0, 0, 0, 0.7),
          child: Center(
            child: Text(
              'Mewujudkan penyelenggaraan pendidikan bermutu, yang mampu bersaing global melalui penanaman karakter profil pelajar pancasila',
              style: primaryTextStyle.copyWith(
                fontSize: 48,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    }

    Widget beritaSekolah() {
      return Container(
        color: Colors.black /* primaryHeadlineColor */,
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(marginUtama),
              child: Center(
                child: Text(
                  'Berita',
                  style: primaryTextStyle.copyWith(
                      fontSize: 32, fontWeight: medium),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget profilSekolah() {
      return Container(
        color: primaryHeadlineColor,
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
          beritaSekolah(),
          profilSekolah(),
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
