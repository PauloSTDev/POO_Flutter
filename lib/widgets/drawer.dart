import "package:flutter/material.dart";
import "package:poo_flutter/components/content_division.dart";
import "package:poo_flutter/screens/categories_screen.dart";
import "package:poo_flutter/screens/home_screen.dart";
import "package:poo_flutter/screens/todo_screen.dart";
import "package:poo_flutter/themes/theme_colors.dart";

class DrawerNavigation extends StatefulWidget {
  const DrawerNavigation({Key? key}) : super(key: key);

  @override
  State<DrawerNavigation> createState() => _DrawerNavigationState();
}

class _DrawerNavigationState extends State<DrawerNavigation> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text("Paulo Santos"),
            accountEmail: Text("paulo.santos@gmail.com"),
            currentAccountPicture: CircleAvatar(
                child: Icon(Icons.filter_list, color: Colors.white,),
              ),
            decoration: BoxDecoration(
              color: ThemeColors.drawerHeaderColor,
            ),
          ),
          ListTile(
            title: const Text("Todo"),
            leading: const Icon(Icons.format_align_center),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const TodoScreen()));
            },
          ),
          const ContentDivision(),
          ListTile(
            title: const Text("Home"),
            leading: const Icon(Icons.home),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
          ),
          const ContentDivision(),
          ListTile(
            title: const Text("Categories"),
            leading: const Icon(Icons.category),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CategoriesScreen()));
            },
          ),
          const ContentDivision(),
        ],
      ),
    );
  }
}
