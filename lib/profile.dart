import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.green,
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/profile_image.png'), // Ganti dengan path gambar yang baru
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Text(
                      'Amr Elmadawy',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text('Edit Profile'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildListTile(Icons.settings, 'Settings', context),
                buildListTile(Icons.account_balance_wallet, 'My Wallet', context),
                buildListTile(Icons.location_on, 'Location', context),
                buildListTile(Icons.language, 'Language', context),
                buildListTile(Icons.help_outline, 'Get help', context),
                buildSwitchTile(Icons.notifications, 'Notification'),
                buildSwitchTile(Icons.dark_mode, 'Dark Mode'),
                buildListTile(Icons.support, 'Support', context),
                ListTile(
                  leading: Icon(Icons.logout, color: Colors.red),
                  title: Text('Log out', style: TextStyle(color: Colors.red)),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
      ),
    );
  }

  ListTile buildListTile(IconData icon, String title, BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.green),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {},
    );
  }

  SwitchListTile buildSwitchTile(IconData icon, String title) {
    return SwitchListTile(
      secondary: Icon(icon, color: Colors.green),
      title: Text(title),
      value: false,
      onChanged: (bool value) {},
    );
  }
}
