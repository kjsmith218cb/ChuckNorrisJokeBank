# ChuckNorrisJokeBank

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

ViewController - Add: 2 image Objects, 1 label Object and 3 button Objects
SingleJokeViewController - Add: 4 image Objects, 1 label Object and 1 button Object
JokeListViewController - Add: 1 image Object, 1 tableView Object (Add 1 prototype cell with 'identifier "Cell") and 1 button Object

1. Postition objects to suit your design
2. Add the IBOutlets to corresponding ViewController file
3. Add IBActions to corresponding ViewController file
4. Set images in Attribures Inspectors to relevant images you created

ViewController.swift
1. Edit the appearance of your IBOutlets to match your design
2. In your button 1 IBActions enter 'self.performSegue(withIdentifier: "goToSingle", sender: self)'
3. In your button 2 IBActions enter 'self.performSegue(withIdentifier: "goToList", sender: self)'
4. Button 3 has no specification and so does not require an action.
5. You will now be sent to the designated ViewController when the button is pressed

SingleJokeViewController.swift
1.

JokeListViewController.swift
1.
Add Label! ('Make sure set constraints!!!' wasted time!!! :()

Random Joke Manager Delegate
1.

Random Joke Data
1.

Joke Cell
1.
