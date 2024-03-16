# Weather
 ===============

Welcome to the project! This README file provides simple instructions on how to set up and run the project on your local machine.


Prerequisites 
----------
Before you begin, make sure you have the following installed on your system:
Xcode at least version 15.2

You can download and install Xcode from the Mac App Store.

Cloning the Repository 
----------

1. Open Xcode on your Mac

2. In the menu bar, go to "Integrate" and select "Clone...".

3. In the dialog that appears, enter the repository URL.


Opening the Project
-----
Navigate to the project directory.

Open the file project Weather.xcodeproj in Xcode.



Building and Running the Project
-----
Once the project is open in Xcode, select the target device (e.g., iPhone simulator) from the dropdown menu in the top left corner.

Click the "Run" button (a play button) or press Cmd + R to build and run the project.

The project should now compile and launch on the selected device.


Conventions, architecture, and general considerations
-----
### Features

- **Input Validation**: Ensures the search field is not empty before submitting a request.
- **Keyboard Management**: Automatically hides the keyboard when tapping outside the input field.
- **Search Button Activity Control**:
  - The search button becomes inactive while a request is being sent or if the search field is empty.
  - Uses `configurationUpdateHandler` to manage the activity state of the button.
- **Error Handling**:
  - Displays user-friendly warnings on network request failures.
  - Notifies the user if no recipes can be found.

### Technical Details

#### Architecture

- **MVC**: The application uses the Model-View-Controller (MVC) architectural pattern, providing flexibility and scalability.

### Networking

- **Alamofire**: Network requests are made using the popular Alamofire library.
- **ApiRouter**: Facilitates convenient interaction with various endpoints.
- **Kingfisher**: Images in cells are loaded and cached for reuse with the Kingfisher library.

### UI Components

- **UITableViewDiffableDataSource**: Used for efficient data display and management in tables.

### Compatibility

- **iOS Version**: The app supports devices running iOS 15 and above.
