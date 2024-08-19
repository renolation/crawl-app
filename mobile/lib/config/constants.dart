
String characterElement = 'All';
const String sharedDarkModeKey = 'isDarkModeEnabled';

final String htmlContent = """
  <!DOCTYPE html>
  <html lang="en">
  <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Settings Page</title>
      <style>
          body {
              font-family: Arial, sans-serif;
              margin: 0;
              padding: 0;
              background-color: #f4f4f4;
          }
          .container {
              width: 80%;
              margin: auto;
              overflow: hidden;
          }
          header {
              background: #333;
              color: #fff;
              padding-top: 30px;
              min-height: 70px;
              border-bottom: #77aaff 3px solid;
          }
          header a {
              color: #fff;
              text-decoration: none;
              text-transform: uppercase;
              font-size: 16px;
          }
          header ul {
              padding: 0;
              list-style: none;
          }
          header li {
              display: inline;
              padding: 0 20px 0 20px;
          }
          .settings {
              background: #fff;
              padding: 20px;
              margin-top: 20px;
          }
          .settings h2 {
              margin-top: 0;
          }
          .settings label {
              display: block;
              margin: 10px 0 5px;
          }
          .settings select, .settings input[type="checkbox"] {
              margin-bottom: 20px;
          }
      </style>
  </head>
  <body>
      <header>
          <div class="container">
              <h1>Settings</h1>
          </div>
      </header>
      <div class="container">
          <div class="settings">
              <h2>Theme</h2>
              <label for="theme">Select Theme:</label>
              <select id="theme">
                  <option value="light">Light</option>
                  <option value="dark">Dark</option>
              </select>

              <h2>Language</h2>
              <label for="language">Select Language:</label>
              <select id="language">
                  <option value="english">English</option>
                  <option value="spanish">Spanish</option>
                  <option value="french">French</option>
              </select>

              <h2>Notifications</h2>
              <label for="notifications">Enable Notifications:</label>
              <input type="checkbox" id="notifications" checked>

              <h2>Account Settings</h2>
              <a href="#account-settings">Update Profile Information</a>

              <h2>Privacy Settings</h2>
              <a href="#privacy-settings">Manage Data Sharing and Privacy Preferences</a>

              <h2>About</h2>
              <a href="#about">Information about the App</a>

              <h2>Help & Support</h2>
              <a href="#help-support">FAQs, Support Contact, and Feedback Forms</a>
          </div>
      </div>
  </body>
  </html>
  """;