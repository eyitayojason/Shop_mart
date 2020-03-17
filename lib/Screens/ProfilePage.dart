import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  Settings({Key key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.lightBlueAccent,
          title: Text("Settings")),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Card(
                  elevation: 8.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  color: Colors.lightBlueAccent,
                  child: ListTile(
                    onTap: () {
                      //open edit profile
                    },
                    title: Text(
                      "User's Name",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage("assets/images/chanel.jpg"),
                    ),
                    trailing: Icon(Icons.edit, color: Colors.white),
                  ),
                ),
                SizedBox(height: 10.0),
                Card(
                  elevation: 4.0,
                  margin: EdgeInsets.fromLTRB(32, 8, 32, 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: Icon(
                          Icons.lock_outline,
                          color: Colors.lightBlueAccent,
                        ),
                        title: Text("Change Password"),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          //open change password
                        },
                      ),
                      _buildDivider(),
                      ListTile(
                        leading: Icon(
                          Icons.language,
                          color: Colors.lightBlueAccent,
                        ),
                        title: Text("Change Language"),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          //open change language
                        },
                      ),
                      _buildDivider(),
                      ListTile(
                        leading: Icon(
                          Icons.location_on,
                          color: Colors.lightBlueAccent,
                        ),
                        title: Text("Change Location"),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          //open change language
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  "Notification Settings",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo),
                ),
                SwitchListTile(
                    activeColor: Colors.lightBlueAccent,
                    contentPadding: EdgeInsets.all(0),
                    value: true,
                    title: Text("Received Notifications"),
                    onChanged: (val) {}),
                SwitchListTile(
                    activeColor: Colors.lightBlueAccent,
                    contentPadding: EdgeInsets.all(0),
                    value: true,
                    title: Text("Received Newsletters"),
                    onChanged: (val) {}),
                SwitchListTile(
                    activeColor: Colors.lightBlueAccent,
                    contentPadding: EdgeInsets.all(0),
                    value: true,
                    title: Text("Received Offer Notifications"),
                    onChanged: (val) {}),
                SwitchListTile(
                    activeColor: Colors.lightBlueAccent,
                    contentPadding: EdgeInsets.all(0),
                    value: true,
                    title: Text("Received Updates"),
                    onChanged: (val) {}),
                SizedBox(height: 60.0),
              ],
            ),
          ),
          Positioned(
            bottom: -20,
            left: -20,
            child: Container(
              alignment: Alignment.center,
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: IconButton(onPressed: (){
              //implement log out
            },
              icon: Icon(
                Icons.offline_bolt,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildDivider() {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      width: double.infinity,
      height: 1.0,
      color: Colors.grey.shade400,
    );
  }
}
