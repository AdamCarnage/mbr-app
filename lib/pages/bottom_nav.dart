import 'package:apps/pages/dashboard.dart';
import 'package:apps/pages/trending.dart';
import 'package:apps/pages/wallet.dart';
import 'package:apps/theme/colors.dart';
import 'package:flutter/material.dart';

class MyDashboard extends StatefulWidget {
  const MyDashboard({super.key});

  @override
  _MyDashboardState createState() => _MyDashboardState();
}

class _MyDashboardState extends State<MyDashboard>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: 3, vsync: this, initialIndex: _currentIndex);
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
      _tabController.animateTo(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          TabBarView(
            controller: _tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              Dashboard(),
              Trends(),
              Wallet(),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin:
                  const EdgeInsets.only(bottom: 15.0, left: 5.0, right: 5.0),
              decoration: BoxDecoration(
                color: CustomColor.trustColor,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Style2BottomNavBar(
                navBarConfig: NavBarConfig(
                  items: [
                    ItemConfig(
                      icon: const Icon(Icons.home),
                      inactiveIcon: const Icon(Icons.home),
                      title: 'Home',
                      textStyle: const TextStyle(color: Colors.white),
                    ),
                    ItemConfig(
                      icon: const Icon(Icons.trending_up_outlined),
                      inactiveIcon: const Icon(Icons.trending_up_outlined),
                      title: 'Trends',
                      textStyle: const TextStyle(color: Colors.white),
                    ),
                    ItemConfig(
                      icon: const Icon(Icons.wallet_giftcard_outlined),
                      inactiveIcon: const Icon(Icons.wallet_giftcard_outlined),
                      title: 'Wallet',
                      textStyle: const TextStyle(color: Colors.white),
                    ),
                  ],
                  selectedIndex: _currentIndex,
                  onItemSelected: _onItemTapped,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Style2BottomNavBar extends StatelessWidget {
  const Style2BottomNavBar({
    required this.navBarConfig,
    this.navBarDecoration = const NavBarDecoration(),
    this.itemAnimationProperties = const ItemAnimation(),
    this.itemPadding = const EdgeInsets.all(5),
    super.key,
  });

  final NavBarConfig navBarConfig;
  final NavBarDecoration navBarDecoration;
  final EdgeInsets itemPadding;
  final ItemAnimation itemAnimationProperties;

  Widget _buildItem(ItemConfig item, bool isSelected, double deviceWidth) {
    return AnimatedContainer(
      width: isSelected ? deviceWidth * 0.29 : deviceWidth * 0.12,
      duration: itemAnimationProperties.duration,
      curve: itemAnimationProperties.curve,
      padding: itemPadding,
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFFFFFFF) : Colors.transparent,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconTheme(
            data: IconThemeData(
              size: 24,
              color:
                  isSelected ? CustomColor.trustColor : const Color(0xFFFFFFFF),
            ),
            child: isSelected ? item.icon : item.inactiveIcon,
          ),
          if (item.title != null && isSelected)
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Text(
                  item.title!,
                  softWrap: false,
                  style: item.textStyle.apply(
                    color: CustomColor.trustColor,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedNavBar(
      decoration: navBarDecoration,
      height: navBarConfig.navBarHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: navBarConfig.items.map((item) {
          final int index = navBarConfig.items.indexOf(item);
          return InkWell(
            onTap: () {
              navBarConfig.onItemSelected(index);
            },
            child: _buildItem(
              item,
              navBarConfig.selectedIndex == index,
              MediaQuery.of(context).size.width,
            ),
          );
        }).toList(),
      ),
    );
  }
}

class NavBarConfig {
  final List<ItemConfig> items;
  final int selectedIndex;
  final Function(int) onItemSelected;
  final double navBarHeight;

  NavBarConfig({
    required this.items,
    required this.selectedIndex,
    required this.onItemSelected,
    this.navBarHeight = 60.0,
  });
}

class NavBarDecoration {
  final Color color;

  const NavBarDecoration({this.color = Colors.transparent});
}

class ItemConfig {
  final Icon icon;
  final Icon inactiveIcon;
  final String? title;
  final TextStyle textStyle;

  ItemConfig({
    required this.icon,
    required this.inactiveIcon,
    this.title,
    required this.textStyle,
  });
}

class ItemAnimation {
  final Duration duration;
  final Curve curve;

  const ItemAnimation({
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.easeInOut,
  });
}

class DecoratedNavBar extends StatelessWidget {
  final NavBarDecoration decoration;
  final double height;
  final Widget child;

  const DecoratedNavBar({
    super.key,
    required this.decoration,
    required this.height,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: decoration.color,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: CustomColor.trustColor,
        ),
      ),
      child: child,
    );
  }
}
