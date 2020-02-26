# ChuckNorrisJokeBank

Firstly Download and reaserch the Co-op Bank iOS App and make notes about the UI.

MAKE SURE YOUR MACHINES XCODE IS UPTO DATE!!!!!!!!

Create a new XCode Project (Single View App)

Give it a Name and User Interface of Storyboard (All tickboxes should be empty)

Deployment Info is the newest version (we will reset this to iOS 10 later)

Device's should be iPhone & iPad

Orientation should be set to Portrait only (As this seems matches Co-op Banks App)

Find your favorite 'Chuck Norris' image from  google search and save it. [Assumed knowledge of Google]

Use Canva.com to create images [Assumed knowledge of this site]
1. An App Icon
2. Mission Statement [When App is loading]
2. Business Logo [To appear on all View Controllers]
3. An Opened Lock
4. A pair of Nun-'chucks'
5. A bruised up bad guy

Use appicon.io to create your images [Assumed knowledge of this site]

Add the created images to your Assets.xcassets within your project

LaunchScreen.storyboard
1. Add image Object and position to suit your design
2. Set image in Attribures Inspector to 'Mission Statement'

Create the MVC layout
Add 3 new Groups (File > New > Group)
1. Model
2. View
3. Controller

Move
*.storyboard to View Group
*.ViewController to Controller Group

Create 2 new [UIViewController SubClass] files in the Controller Group (File > New > File > Coca Touch Class)
1. SingleJokeViewController.swift
2. JokeListViewController.swift

Add 2 new ViewController Objects to your Main.storyboard
Give one a class (within Identity Inspector) of SingleJokeViewController
Give the other a class of JokeListViewController
(This now links your code to the 'Assistant' when viewing through Main.storybord)

Create Segues
From View Controller Scene - Click on the ViewController icon [yellow symbol]
Hold 'Control Button' and drag the blue line to one of the new view controllers created.
Repeat this and drag to the other newly created view controller.

Click on the 1st Segue arrow and from within the attributes inspector give the identifier the name 'goToSingle' (Present Modally)
Click on the 2nd Segue arrow and from within the attributes inspector give the identifier the name 'goToList' (Present Modally)

Main.storyboard
SingleJokeViewController - Will already appear over the first screen (ViewController) with part of the first screen still showing
JokeListViewController - To make this not appear as a pop-up message... Within the View Controller Attributes Inspector, set 'Transition Style' to 'Flip Horizontal' and set 'Presentation' to 'Full Screen'

[VC] ViewController - Add: 2 image Objects, 1 label Object and 3 button Objects
[VC] SingleJokeViewController - Add: 4 image Objects, 1 label Object and 1 button Object
[VC] JokeListViewController - Add: 1 image Object, 1 tableView Object (Add 1 prototype cell with 'identifier "Cell") and 1 button Object
[VC] JokeListViewController/TableView - Add: 1 label Object to the prototype cell and format the text to suit your design [refer to Co-op Bank App research]

1. Postition objects to suit your design [refer to Co-op Bank App research]
2. Add the IBOutlets to corresponding ViewController file
3. Add IBActions to corresponding ViewController file
4. Set images in Attribures Inspectors to relevant images you created

Create a new [UITableViewCell] files in the View Group (File > New > File > Coca Touch Class)
1. JokeCell - Used to format the text of the joke retrieved for displaying in our table

Create 2 new Swift Files in your 'Model' group (File > New > File > Swift File)
1. RandomJokeManagerJokeDelegate - Used to fetch a random joke from the API
2. RandomJokeData

MODEL: RandomJokeManagerDelegate
1. Set protocol and functions we require to pass the data back to SingleJokeViewController or JokeListViewController
2. Provide API address that we will use to fetch a random joke
3. Perform a request to get hold of that random joke
4. Decode the JSON Data ready to pass back

MODEL: RandomJokeData
1. Set struct format that will hold the joke returned from RandomJokeManagerDelegate

CONTROLLER: ViewController.swift
1. Edit the appearance of your IBOutlets to match your design [refer to Co-op Bank App research]
2. In your 'Button 1' IBActions enter 'self.performSegue(withIdentifier: "goToSingle", sender: self)'
3. In your 'Button 2' IBActions enter 'self.performSegue(withIdentifier: "goToList", sender: self)'
4. Button 3 has no specification and so does not require an action.
5. You will now be sent to the designated ViewController when the button is pressed
/You know have a 'Starting' view that provides links to 2 other views via the buttons coded with Segue's in steps 2 & 3

CONTROLLER: SingleJokeViewController.swift
1. Edit the appearance of your IBOutlets to match your design [refer to Co-op Bank App research]
2. Add the dismiss code ('self.dismiss(animated: true, completion: nil)') to your buttons IBAction
3. Add RandomJokeManagerDelegate to your class
4. Set RandomJokeManagerDelegate to .self
5. Call the function to retrieve a random joke from the API (fetchRandomJoke)
6. Display the data returned to the UILabel on screen

CONTROLLER: JokeListViewController.swift
1. Edit the appearance of your IBOutlets to match your design [refer to Co-op Bank App research]
2. Set the Table View's Prototype cell class to JokeCell (UITableViewCell created earlier)
3. You will now be able to Control + Drag the Label Object from Main.storyboard to JokeCell.swift to create an IBOutlet
VIEW: JokeCell.swift
4. Create a function that will be passed a joke in string format 'func myFunc (randomJoke: String)'
5. Set the IBOutlet UILabel text to the joke received (ie. randomJoke)
CONTROLLER: JokeListViewController.swift
6. Add RandomJokeManagerDelegate, UITableViewDelegate & UITableViewDataSource to your class
7. Set RandomJokeManager & TableView delegates equal to .self
8. Create a loop that we can use to call and retrieve 'x' amount of jokes each time its requested
9. In ViewDidLoad - Call the function to retrieve a random joke from the API (fetchRandomJoke) for the number set in our loop
10. Create a ViewDidAppear and reload() the table view so the fetched jokes appear when the screen loads
11. Add a numberOfRowsInSection & cellForRowAt so out UITable will work
12. Create an empty array to hold the retrieved random jokes
13. numberOfRowsInSection needs to be equal to the array we createds .count
14. cellForRowAt now needs to populate the JokeCell we created earlier with the array[indexPath.row] in order to display all jokes held in our array
15. In order to make the table scroll infinatly we need to introduce scrollViewDidScroll to calaculate when we have reached the bottom of the table
16. Once we have confirmed the user has reached the bottom of the page we can call for the app to fetch another batch of jokes from the function we created earlier and the table reloaded with the new data
17. I have set a 1 second delay so the spinner function will be seen by the user
18. SPINNER FUNCTION IS COMMENTED OUT AS ONLY WORKS ONCE THEN CRASHES - WORKING ON A FIX.
/Add Label! ('Make sure set constraints!!!' wasted time!!! :()

SET CONSTRAINTS & TEST ON DEVICES...

ADD UNIT TESTS
1. Within your project (under TARGETS) add 'Unit Testing Bundle'
2. Enter your tests within the swift file created.
