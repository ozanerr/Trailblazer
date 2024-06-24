import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:profile_page1/provider/settingnotifprov.dart';
import 'package:profile_page1/pages/ProfilePage.dart';
import 'package:profile_page1/provider/paymentprov.dart';
import 'package:profile_page1/provider/languageprov.dart';
import 'package:profile_page1/pages/paymentmethodpage.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    final notif = Provider.of<NotificationProvider>(context, listen: false);
    final paymentProvider = Provider.of<PaymentProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ProfilePage())
                  );
                },
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey, width: 1),
                      ),
                      child: ClipOval(
                        child: Image.network(
                          "https://img.freepik.com/free-photo/side-view-unknown-man-posing_23-2149417555.jpg?size=626&ext=jpg&ga=GA1.1.1152997229.1709223401&semt=ais",
                          fit: BoxFit.cover,),
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('John Doe', style: TextStyle(fontSize: 18),),
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            border: Border.all(color: Colors.grey, width: 1),
                          ),
                          child: const Text('Silver', style: TextStyle(fontSize: 12, color: Colors.grey),),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              const Text('Notifications',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16
                ),
              ),
              ..._buildSwitchListTiles(notif),
              const SizedBox(height: 20,),
              const Text('Language',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16
                ),
              ),
              ..._buildDropdownButtonsLang(),
              const SizedBox(height: 20,),
              const Text('Payment Method',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16
                ),
              ),
              ListTile(
                title: const Text('Payment Method'),
                trailing: Text(paymentProvider.Selected),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentMethodPage(
                        paymentMethodProvider: paymentProvider, 
                      ),
                    ),
                  ).then((_) {
                    if (mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Payment method changed successfully'),
                          duration: Duration(seconds: 3),
                          ),
                        );
                      }
                  }
                  );
                }
                ),
            const SizedBox(height: 20,),
            ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const LoginPage()));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              
            ),
            child: Text("Logout",
            style: TextStyle(
              color: Colors.black,
            )),
            )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add code here to contact customer service
        },
        backgroundColor: Colors.orange,
        shape: const CircleBorder(),
        child: const Icon(Icons.support_agent_sharp),
      ),
    );
  }

  List<Widget> _buildSwitchListTiles(NotificationProvider notif) {
    return [
      SwitchListTile(
        value: notif.Selected == 0,
        onChanged: (val){
          setState(() {
            if (val) {
              notif.choice(0);
            } else {
              notif.choice(1);
            }
          });
        },
        title: const Text("All"),
        subtitle: const Text("Receive notifications for all orders"),
        activeColor: Colors.orange,
      ),
      SwitchListTile(
        value: notif.Selected == 1,
        onChanged: (val){
          setState(() {
            if (val) {
              notif.choice(1);
            } else {
              notif.choice(0);
            }
          });
        },
        title: const Text("Order updates"),
        subtitle: const Text("Get notified when an order is prepared or ready for pickup"),
        activeColor: Colors.orange,
      ),
      SwitchListTile(
        value: notif.Selected == 2,
        onChanged: (val){
          setState(() {
            if (val) {
              notif.choice(2);
            } else {
              notif.choice(0);
            }
          });
        },
        title: const Text("Promotions"),
        subtitle: const Text("Receive notifications about promotions and discounts"),
        activeColor: Colors.orange,
      ),
    ];
  }

  List<Widget> _buildDropdownButtonsLang() {
    return [
      Row(
        children: [
          const Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 20),
              child: Text('Language'),
            ),
          ),
          Consumer<LanguageProvider>(
            builder: (context, langProvider, child) {
              return DropdownButton<String>(
                isDense: true,
                value: langProvider.Selected,
                items: langProvider.options.map((lang) {
                  return DropdownMenuItem<String>(
                    value: lang,
                    child: Text(lang),
                  );
                }).toList(),
                onChanged: (value) {
                  langProvider.choice(value);
                },
              );
            },
          ),
        ],
      ),
    ];
  }
}