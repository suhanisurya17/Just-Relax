/*
Name: Suhani Surya
Project: Just Relax
Project Description: Just Relax program that helps students study
and manage their productive lives. Firstly, the theme will be of cafe and calms. I plan
to have different mindscapes, like a cafe, library and home. Each mindscape has a 
soundscape where users can choose background music. Moreover, there are reminders to take 
breaks and a choice to select a study technique like pomodoro. There is also a “take a break” 
section that has choices fora water droplet catching game and a breathing game.
Date: June 6th - June 14th, 2024

*/

import java.util.ArrayList; // Import the ArrayList class from the java.util package

// Declare variables for buttons and text elements
Button landingPageButton; // Button for the landing page
Text welcomeText; // Text for the welcome message
Button studyTipsButton; // Button for the study tips section
Button mindScapesButton; // Button for the mind scapes section
Button takeABreakButton; // Button for the take a break section
Text studyTipsButtonText; // Text for the study tips button
Text mindScapesButtonText; // Text for the mind scapes button
Text takeABreakButtonText; // Text for the take a break button
Text waterDropGameText;
Text homePageText; // Text for the home page
Button cafeButton; // Button for the cafe section
Button homeButton; // Button for the home section
Button libraryButton; // Button for the library section
Text cafeButtonText; // Text for the cafe button
Text homeButtonText; // Text for the home button
Text libraryButtonText; // Text for the library button
Text homePageInstructionsText;
Button waterDropGameButton; // Button for the water drop game
Button breathingExerciseButton; // Button for the breathing exercise
Text waterDropGameButtonText; // Text for the water drop game button
Text breathingExerciseButtonText; // Text for the breathing exercise button
Button backToMindScapesFromCafeButton; // Button to go back to mind scapes from the cafe
Button backToMindScapesFromHomeButton; // Button to go back to mind scapes from the home section
Button backToMindScapesFromLibraryButton; // Button to go back to mind scapes from the library
Button backToHomePageFromStudyTipsButton; // Button to go back to the home page from the study tips section
Button backToHomePageFromMindScapesButton; // Button to go back to the home page from the mind scapes section
Button backToHomePageFromTakeABreakButton; // Button to go back to the home page from the take a break section
Button backToTakeABreakButtonfromWaterDrop; // Button to go back to the take a break section from the water drop game
Button backToTakeABreakButtonfromBreathing; // Button to go back to the take a break section from the breathing exercise

BreathingEllipse circle; // Declare a variable for a breathing ellipse object
WaterGlass glass; // Declare a global variable for the glass
ArrayList<WaterDroplet> droplets = new ArrayList<WaterDroplet>(); // Initialize the ArrayList for water droplets

boolean buttonClicked = false; // Track if the button is clicked
boolean showHomePage = false; // Flag to show the home page
boolean showStudyTips = false; // Flag to show the study tips section
boolean showMindScapes = false; // Flag to show the mind scapes section
boolean showTakeABreak = false; // Flag to show the take a break section
boolean showCafe = false; // Flag to show the cafe section
boolean showHome = false; // Flag to show the home section
boolean showLibrary = false; // Flag to show the library section
boolean showWaterDropGame = false; // Flag to show the water drop game
boolean showBreathingExercise = false; // Flag to show the breathing exercise
boolean showPomodoroTimer = false; // Flag to show the Pomodoro timer

PImage cafeBackground; // Variable to store the cafe background image
PImage homeBackground; // Variable to store the home background image
PImage libraryBackground; // Variable to store the library background image
PImage relax; // Variable to store an image related to relaxation


PFont font1; // Variable to store a font

// Pomodoro Timers
PomodoroTimer pomodoroTimerCafe; // Pomodoro timer for the cafe section
PomodoroTimer pomodoroTimerHome; // Pomodoro timer for the home section
PomodoroTimer pomodoroTimerLibrary; // Pomodoro timer for the library section
PomodoroTimer pomodoroTimerBreathing; // Pomodoro timer for the breathing exercise

String[] tips = { // Array of study tips
    "Create a dedicated study space that is quiet, well-lit, and free from distractions.",
    "Make a study schedule and stick to it. Allocate specific times for studying each subject.",
    "Take breaks regularly to recharge and avoid burnout.",
    "Practice active learning by making flashcards, taking notes, and teaching the material to someone else.",
    "Stay organized by keeping your notes, assignments, and study materials in order.",
    "Attend all classes, participate actively, and ask questions when you don't understand something.",
    "Form or join a study group to discuss concepts, share notes, and quiz each other.",
    "Get enough sleep and exercise, as these are crucial for maintaining focus and retaining information.",
    "Minimize distractions by turning off notifications on your devices and avoiding multitasking while studying.",
    "Review your notes regularly, and don't wait until the last minute to start studying for exams.",
    "Use visual aids, diagrams, and mind maps to help you understand and remember complex concepts.",
    "Take practice tests or quizzes to identify areas where you need further study.",
    "Reward yourself with breaks or small treats after completing study sessions or achieving goals."
};

void setup() {
  size(1440, 800); // Set the window size to 1440x800 pixels
  
  // Load background images
  cafeBackground = loadImage("Cafe.jpeg"); // Load the cafe background image
  homeBackground = loadImage("HomeStudy.jpeg"); // Load the home background image
  libraryBackground = loadImage("Library.jpeg"); // Load the library background image
  relax = loadImage("relax.jpeg"); // Load an image related to relaxation

  
  // Initialize other elements
  landingPageButton = new Button(720, 100, 500, 100, 5); // Create a button for the landing page
  welcomeText = new Text(width/2, 100, 40, 5, "Welcome to Just Relax"); // Create a welcome text
  studyTipsButton = new Button(350, 400, 300, 100, 0); // Create a button for the study tips section
  mindScapesButton = new Button(700, 400, 300, 100, 0); // Create a button for the mind scapes section
  takeABreakButton = new Button(1050, 400, 300, 100, 0); // Create a button for the take a break section
  studyTipsButtonText = new Text(360, 400, 30, 0, "Study Tips"); // Create text for the study tips button
  mindScapesButtonText = new Text(710, 400, 30, 0, "MindScapes"); // Create text for the mind scapes button
  takeABreakButtonText = new Text(1060, 400, 30, 0, "Take a Break"); // Create text for the take a break button
  homePageText = new Text(width/2, 200, 40, 0, "Welcome to the homepage of Just Relax!"); // Create text for the home page
  homePageInstructionsText = new Text(width/2, 250, 20, 0, "Click on one of the buttons to get started!"); // Create text for the home page

  cafeButton = new Button(200, 600, 300, 100, 0); // Create a button for the cafe section
  homeButton = new Button(720, 600, 300, 100, 0); // Create a button for the home section
  libraryButton = new Button(1240, 600, 300, 100, 0); // Create a button for the library section
  cafeButtonText = new Text(200, 600, 30, 0, "Cafe"); // Create text for the cafe button
  homeButtonText = new Text(720, 600, 30, 0, "Home"); // Create text for the home button
  libraryButtonText = new Text(1240, 600, 30, 0, "Library"); // Create text for the library button
  waterDropGameButton = new Button(300, 600, 300, 100, 0); // Create a button for the water drop game
  breathingExerciseButton = new Button(1200, 600, 300, 100, 0); // Create a button for the breathing exercise
  waterDropGameButtonText = new Text(300, 600, 30, 0, "Water Drop Game"); // Create text for the water drop game button
  breathingExerciseButtonText = new Text(1200, 600, 30, 0, "Breathing Exercise"); // Create text for the breathing exercise button
  waterDropGameText = new Text(width/2, 100, 20, 0, "Move your mouse horizontally to control the glass");
  // Back buttons setup
  backToMindScapesFromCafeButton = new Button(150, 50, 200, 50, 0); // Create a button to go back to mind scapes from the cafe
  backToMindScapesFromHomeButton = new Button(150, 50, 200, 50, 0); // Create a button to go back to mind scapes from the home section
  backToMindScapesFromLibraryButton = new Button(150, 50, 200, 50, 0); // Create a button to go back to mind scapes from the library
  backToHomePageFromStudyTipsButton = new Button(100, 50, 150, 50, 0); // Create a button to go back to the home page from the study tips section
  backToHomePageFromMindScapesButton = new Button(100, 50, 150, 50, 0); // Create a button to go back to the home page from the mind scapes section
  backToHomePageFromTakeABreakButton = new Button(100, 50, 150, 50, 0); // Create a button to go back to the home page from the take a break section
  backToTakeABreakButtonfromWaterDrop = new Button(150, 50, 200, 50, 0); // Create a button to go back to the take a break section from the water drop game
  backToTakeABreakButtonfromBreathing = new Button(150, 50, 200, 50, 0); // Create a button to go back to the take a break section from the breathing exercise

  font1 = createFont("ArialRoundedMTBold-48.vlw", 20); // Load a font
  textFont(font1); // Set the text font
  
  // Initialize Pomodoro timers
  int pomodoroDuration = 25 * 60; // 25 minutes in seconds
  int breakDuration = 5 * 60; // 5 minutes in seconds
  pomodoroTimerCafe = new PomodoroTimer(pomodoroDuration, breakDuration, 255, 255, 255); // Create a Pomodoro timer for the cafe section
  pomodoroTimerHome = new PomodoroTimer(pomodoroDuration, breakDuration, 0, 0, 0); // Create a Pomodoro timer for the home section
  pomodoroTimerLibrary = new PomodoroTimer(pomodoroDuration, breakDuration, 255, 255, 255); // Create a Pomodoro timer for the library section
  pomodoroTimerBreathing = new PomodoroTimer(breakDuration, 0, 0, 0, 0); // Create a Pomodoro timer for the breathing exercise

  glass = new WaterGlass(width / 2, height - 100, 100, 200, 200); // Create a new WaterGlass object with example dimensions and maxWaterLevel
  circle = new BreathingEllipse(width/2, height/2, 20, 400, 1); // Create a new BreathingEllipse object with example dimensions and parameters
}



void draw() {
  background(#F0E6D9); // Set the default background color to a light beige

  if (!buttonClicked) { // If the button hasn't been clicked yet
    // Display landing page elements
    landingPageButton.move(); // Move the landing page button (if it has any animation)
    landingPageButton.display(); // Display the landing page button
    welcomeText.move(); // Move the welcome text (if it has any animation)
    welcomeText.display(); // Display the welcome text
    textAlign(CENTER); // Set the text alignment to center
    fill(0); // Set the text color to black
    textFont(font1, 20); // Set the text font and size
    text("A place for you to get your work done and not be overwhelmed", width/2, 500);
    text("Click the moving box to get started", width/2, 530); // Display a message
// Display a message
  } else { // If the button has been clicked
    // Display elements based on flags
    if (showHomePage) { // If the home page flag is set
      // Display home page elements
      homePageText.display(); // Display the home page text
      homePageInstructionsText.display();//display the instructions
      studyTipsButton.display(); // Display the study tips button
      mindScapesButton.display(); // Display the mind scapes button
      takeABreakButton.display(); // Display the take a break button
      studyTipsButtonText.display(); // Display the study tips button text
      mindScapesButtonText.display(); // Display the mind scapes button text
      takeABreakButtonText.display(); // Display the take a break button text
    } else if (showStudyTips) { // If the study tips flag is set
      // Display study tips content
      textAlign(CENTER); // Set the text alignment to center
      textFont(font1, 30); // Set the text font and size
      fill(0); // Set the text color to black
      text("Study Tips", width/2, 100); // Display the "Study Tips" heading
      textFont(font1, 20); // Set the text font and size for the tips
      
      for(int i = 0, y = 200; i < tips.length; i++, y+= 40) { // Loop through the tips array
        text(tips[i], width/2, y); // Display each tip centered on the screen
      }
      
      backToHomePageFromStudyTipsButton.display(); // Display the "Back to Home" button
      fill(0); // Set the text color to black
      text("Back to Home", backToHomePageFromStudyTipsButton.xPos, backToHomePageFromStudyTipsButton.yPos); // Display the "Back to Home" button text
    } else if (showMindScapes) { // If the mind scapes flag is set
      // Display mindscapes content
      textAlign(CENTER); // Set the text alignment to center
      fill(0); // Set the text color to black
      textFont(font1, 30); // Set the text font and size
      text("Welcome to MindScapes! Choose your ideal study setting!", width/2, height/2 - 200); // Display a welcome message

      
      cafeButton.display(); // Display the cafe button
      cafeButtonText.display(); // Display the cafe button text
      homeButton.display(); // Display the home button
      homeButtonText.display(); // Display the home button text
      libraryButton.display(); // Display the library button
      libraryButtonText.display(); // Display the library button text
      
      backToHomePageFromMindScapesButton.display(); // Display the "Back to Home" button
      fill(0); // Set the text color to black
      textFont(font1, 20); // Set the text font and size
      text("Back to Home", backToHomePageFromMindScapesButton.xPos, backToHomePageFromMindScapesButton.yPos); // Display the "Back to Home" button text
    } else if (showTakeABreak) { // If the take a break flag is set
      // Display take a break content
      textAlign(CENTER); // Set the text alignment to center
      fill(0); // Set the text color to black
      textFont(font1, 30); // Set the text font and size
      text("Take a Break Content", width/2, height/2 - 200); // Display a heading
      
      image(relax, width / 2 - 200, height / 2 - 100, 400, 200); // Display an image related to relaxation
      waterDropGameButton.display(); // Display the water drop game button
      waterDropGameButtonText.display(); // Display the water drop game button text
      breathingExerciseButton.display(); // Display the breathing exercise button
      breathingExerciseButtonText.display(); // Display the breathing exercise button text
      backToHomePageFromTakeABreakButton.display(); // Display the "Back to Home" button
      fill(0); // Set the text color to black
      textFont(font1, 20); // Set the text font and size
      text("Back to Home", backToHomePageFromTakeABreakButton.xPos, backToHomePageFromTakeABreakButton.yPos); // Display the "Back to Home" button text
      showMindScapes = false; // Set the mind scapes flag to false
    } else if (showCafe) { // If the cafe flag is set
      // Display cafe content
      image(cafeBackground, 0, 0, width, height); // Display the cafe background image
      pomodoroTimerCafe.display(width/2, 100); // Display the Pomodoro timer for the cafe setting
      pomodoroTimerCafe.update(); // Update the Pomodoro timer for the cafe setting
      
      backToMindScapesFromCafeButton.display(); // Display the "Back to MindScapes" button
      fill(0); // Set the text color to black
      textFont(font1, 20); // Set the text font and size
      text("Back to MindScapes", backToMindScapesFromCafeButton.xPos, backToMindScapesFromCafeButton.yPos); // Display the "Back to MindScapes" button text
    } else if (showLibrary) { // If the library flag is set
      // Display library content
      image(libraryBackground, 0, 0, width, height); // Display the library background image
      pomodoroTimerLibrary.display(width/2, 100); // Display the Pomodoro timer for the library setting
      pomodoroTimerLibrary.update(); // Update the Pomodoro timer for the library setting
      
      backToMindScapesFromLibraryButton.display(); // Display the "Back to MindScapes" button
      fill(0); // Set the text color to black
      textFont(font1, 20); // Set the text font and size
      text("Back to MindScapes", backToMindScapesFromLibraryButton.xPos, backToMindScapesFromLibraryButton.yPos); // Display the "Back to MindScapes" button text
    } else if (showHome) { // If the home flag is set
      // Display home content
      image(homeBackground, 0, 0, width, height); // Display the home background image
      pomodoroTimerHome.display(width/2, 100); // Display the Pomodoro timer for the home setting
      pomodoroTimerHome.update(); // Update the Pomodoro timer for the home setting
      
      backToMindScapesFromHomeButton.display(); // Display the "Back to MindScapes" button
      fill(0); // Set the text color to black
      textFont(font1, 20); // Set the text font and size
      text("Back to MindScapes", backToMindScapesFromHomeButton.xPos, backToMindScapesFromHomeButton.yPos); // Display the "Back to MindScapes" button text
    } else if (showWaterDropGame) { // If the water drop game flag is set
      // Display Water Drop Game content
      
      background(135, 206, 235); // Set the background color to a light blue for the game
      glass.display(); // Display the water glass
      glass.updatePosition(mouseX); // Update the position of the water glass based on the mouse X coordinate
      waterDropGameText.display();
      // Update and display droplets
      for (int i = droplets.size() - 1; i >= 0; i--) { // Loop through the droplets in reverse order
        WaterDroplet droplet = droplets.get(i); // Get the current droplet
        droplet.display(); // Display the droplet
        droplet.update(); // Update the droplet's position
        
        // Check collision with glass
        if (droplet.collidesWithGlass(glass)) { // If the droplet collides with the glass
          glass.updateWaterLevel(1); // Increase the water level in the glass
          droplets.remove(i); // Remove the droplet from the list
        }
        
        // Check if droplet is off-screen
        if (droplet.isOffScreen()) { // If the droplet is off-screen
          droplets.remove(i); // Remove the droplet from the list
        }
      }
      
      // Optionally add new droplets based on game logic
      // For example, randomly generate new droplets
      if (frameCount % 60 == 0) { // Add a new droplet every second (60 frames)
        int randomX = int(random(width)); // Generate a random X coordinate within the window width
        int randomSize = int(random(20, 40)); // Generate a random size between 20 and 40
        droplets.add(new WaterDroplet(randomX, 0, randomSize, 5)); // Add a new droplet to the list
      }
      
      // Display back button
      backToTakeABreakButtonfromWaterDrop.display(); // Display the "Back to Take A Break" button
      fill(0); // Set the text color to black
      textFont(font1, 15); // Set the text font and size
      text("Back to Take A Break", backToTakeABreakButtonfromWaterDrop.xPos, backToTakeABreakButtonfromWaterDrop.yPos); // Display the "Back to Take A Break" button text
    } else if (showBreathingExercise) { // If the breathing exercise flag is set
      // Display breathing exercise content
      textAlign(CENTER); // Set the text alignment to center
      fill(0); // Set the text color to black
      textFont(font1, 30); // Set the text font and size
      textAlign(CENTER); // Set the text alignment to center
      fill(0); // Set the text color to black
      textSize(24); // Set the text size
      text("Follow the breathing exercise", width/2, height/2 + 300); // Display a message
      pomodoroTimerBreathing.display(width/2, 100); // Display the Pomodoro timer for the breathing exercise
      pomodoroTimerBreathing.start(); // Start the Pomodoro timer for the breathing exercise
      pomodoroTimerBreathing.update(); // Update the Pomodoro timer for the breathing exercise
      
      circle.update(); // Update the breathing circle animation
      circle.display(); // Display the breathing circle animation
      
      // Display back button
      backToTakeABreakButtonfromBreathing.display(); // Display the "Back to Take A Break" button
      fill(0); // Set the text color to black
      textFont(font1, 17); // Set the text font and size
      text("Back to Take A Break", backToTakeABreakButtonfromBreathing.xPos, backToTakeABreakButtonfromBreathing.yPos); // Display the "Back to Take A Break" button text
    }
  }
}



void mousePressed() {
  // Check if the landing page button is clicked
  if (!buttonClicked && mouseX >= landingPageButton.xPos - landingPageButton.widthButton / 2 &&
     mouseX <= landingPageButton.xPos + landingPageButton.widthButton / 2 &&
     mouseY >= landingPageButton.yPos - landingPageButton.heightButton / 2 &&
     mouseY <= landingPageButton.yPos + landingPageButton.heightButton / 2) {
    buttonClicked = true; // Set the buttonClicked flag to true
    showHomePage = true; // Set the showHomePage flag to true
  } else if (buttonClicked) { // If the button has been clicked
    // Check if the study tips button is clicked
    if (mouseX >= studyTipsButton.xPos - studyTipsButton.widthButton / 2 &&
    mouseX <= studyTipsButton.xPos + studyTipsButton.widthButton / 2 && mouseY >= studyTipsButton.yPos - studyTipsButton.heightButton / 2 &&
       mouseY <= studyTipsButton.yPos + studyTipsButton.heightButton / 2) {
      resetFlags(); // Reset all flags
      showStudyTips = true; // Set the showStudyTips flag to true
    // Check if the mind scapes button is clicked
    } else if (mouseX >= mindScapesButton.xPos - mindScapesButton.widthButton / 2 &&
       mouseX <= mindScapesButton.xPos + mindScapesButton.widthButton / 2 &&
       mouseY >= mindScapesButton.yPos - mindScapesButton.heightButton / 2 &&
       mouseY <= mindScapesButton.yPos + mindScapesButton.heightButton / 2) {
      resetFlags(); // Reset all flags
      showMindScapes = true; // Set the showMindScapes flag to true
    // Check if the take a break button is clicked
    } else if (mouseX >= takeABreakButton.xPos - takeABreakButton.widthButton / 2 &&
       mouseX <= takeABreakButton.xPos + takeABreakButton.widthButton / 2 &&
       mouseY >= takeABreakButton.yPos - takeABreakButton.heightButton / 2 &&
       mouseY <= takeABreakButton.yPos + takeABreakButton.heightButton / 2) {
      resetFlags(); // Reset all flags
      showTakeABreak = true; // Set the showTakeABreak flag to true
    // Check if the cafe button is clicked
    } else if (mouseX >= cafeButton.xPos - cafeButton.widthButton / 2 &&
       mouseX <= cafeButton.xPos + cafeButton.widthButton / 2 &&
       mouseY >= cafeButton.yPos - cafeButton.heightButton / 2 &&
       mouseY <= cafeButton.yPos + cafeButton.heightButton / 2 && showMindScapes) {
      resetFlags(); // Reset all flags
      showCafe = true; // Set the showCafe flag to true
      pomodoroTimerCafe.start(); // Start the Pomodoro timer for the cafe
    // Check if the home button is clicked
    } else if (mouseX >= homeButton.xPos - homeButton.widthButton / 2 &&
       mouseX <= homeButton.xPos + homeButton.widthButton / 2 &&
       mouseY >= homeButton.yPos - homeButton.heightButton / 2 &&
       mouseY <= homeButton.yPos + homeButton.heightButton / 2 && showMindScapes) {
      resetFlags(); // Reset all flags
      showHome = true; // Set the showHome flag to true
      pomodoroTimerHome.start(); // Start the Pomodoro timer for the home
    // Check if the library button is clicked
    } else if (mouseX >= libraryButton.xPos - libraryButton.widthButton / 2 &&
       mouseX <= libraryButton.xPos + libraryButton.widthButton / 2 &&
       mouseY >= libraryButton.yPos - libraryButton.heightButton / 2 &&
       mouseY <= libraryButton.yPos + libraryButton.heightButton / 2 && showMindScapes) {
      resetFlags(); // Reset all flags
      showLibrary = true; // Set the showLibrary flag to true
      pomodoroTimerLibrary.start(); // Start the Pomodoro timer for the library

    // Check if the water drop game button is clicked
    } else if (mouseX >= waterDropGameButton.xPos - waterDropGameButton.widthButton / 2 &&
       mouseX <= waterDropGameButton.xPos + waterDropGameButton.widthButton / 2 &&
       mouseY >= waterDropGameButton.yPos - waterDropGameButton.heightButton / 2 &&
       mouseY <= waterDropGameButton.yPos + waterDropGameButton.heightButton / 2 && showTakeABreak) {
      resetFlags(); // Reset all flags
      showWaterDropGame = true; // Set the showWaterDropGame flag to true
    // Check if the breathing exercise button is clicked
    } else if (mouseX >= breathingExerciseButton.xPos - breathingExerciseButton.widthButton / 2 &&
       mouseX <= breathingExerciseButton.xPos + breathingExerciseButton.widthButton / 2 &&
       mouseY >= breathingExerciseButton.yPos - breathingExerciseButton.heightButton / 2 &&
       mouseY <= breathingExerciseButton.yPos + breathingExerciseButton.heightButton / 2 && showTakeABreak) {
      resetFlags(); // Reset all flags
      showBreathingExercise = true; // Set the showBreathingExercise flag to true
    // Check if the "Back to MindScapes" button from the cafe is clicked
    } else if (mouseX >= backToMindScapesFromCafeButton.xPos - backToMindScapesFromCafeButton.widthButton / 2 &&
       mouseX <= backToMindScapesFromCafeButton.xPos + backToMindScapesFromCafeButton.widthButton / 2 &&
       mouseY >= backToMindScapesFromCafeButton.yPos - backToMindScapesFromCafeButton.heightButton / 2 &&
       mouseY <= backToMindScapesFromCafeButton.yPos + backToMindScapesFromCafeButton.heightButton / 2 && showCafe) {
      resetFlags(); // Reset all flags
      showMindScapes = true; // Set the showMindScapes flag to true
      pomodoroTimerCafe.reset(); // Reset the Pomodoro timer for the cafe
    // Check if the "Back to MindScapes" button from the home is clicked
    } else if (mouseX >= backToMindScapesFromHomeButton.xPos - backToMindScapesFromHomeButton.widthButton / 2 &&
       mouseX <= backToMindScapesFromHomeButton.xPos + backToMindScapesFromHomeButton.widthButton / 2 &&
       mouseY >= backToMindScapesFromHomeButton.yPos - backToMindScapesFromHomeButton.heightButton / 2 &&
       mouseY <= backToMindScapesFromHomeButton.yPos + backToMindScapesFromHomeButton.heightButton / 2 && showHome) {
      resetFlags(); // Reset all flags
      showMindScapes = true; // Set the showMindScapes flag to true
      pomodoroTimerHome.reset(); // Reset the Pomodoro timer for the home
    // Check if the "Back to MindScapes" button from the library is clicked
    } else if (mouseX >= backToMindScapesFromLibraryButton.xPos - backToMindScapesFromLibraryButton.widthButton / 2 &&
       mouseX <= backToMindScapesFromLibraryButton.xPos + backToMindScapesFromLibraryButton.widthButton / 2 &&
       mouseY >= backToMindScapesFromLibraryButton.yPos - backToMindScapesFromLibraryButton.heightButton / 2 &&
       mouseY <= backToMindScapesFromLibraryButton.yPos + backToMindScapesFromLibraryButton.heightButton / 2 && showLibrary) {
      resetFlags(); // Reset all flags
      showMindScapes = true; // Set the showMindScapes flag to true
      pomodoroTimerLibrary.reset(); // Reset the Pomodoro timer for the library
      
    // Check if the "Back to Home" button from the study tips is clicked
    } else if (mouseX >= backToHomePageFromStudyTipsButton.xPos - backToHomePageFromStudyTipsButton.widthButton / 2 &&
       mouseX <= backToHomePageFromStudyTipsButton.xPos + backToHomePageFromStudyTipsButton.widthButton / 2 &&
       mouseY >= backToHomePageFromStudyTipsButton.yPos - backToHomePageFromStudyTipsButton.heightButton / 2 &&
       mouseY <= backToHomePageFromStudyTipsButton.yPos + backToHomePageFromStudyTipsButton.heightButton / 2 && showStudyTips) {
      resetFlags(); // Reset all flags
      showHomePage = true; // Set the showHomePage flag to true
    // Check if the "Back to Home" button from the mind scapes is clicked
    } else if (mouseX >= backToHomePageFromMindScapesButton.xPos - backToHomePageFromMindScapesButton.widthButton / 2 &&
       mouseX <= backToHomePageFromMindScapesButton.xPos + backToHomePageFromMindScapesButton.widthButton / 2 &&
       mouseY >= backToHomePageFromMindScapesButton.yPos - backToHomePageFromMindScapesButton.heightButton / 2 &&
       mouseY <= backToHomePageFromMindScapesButton.yPos + backToHomePageFromMindScapesButton.heightButton / 2 && showMindScapes) {
      resetFlags(); // Reset all flags
      showHomePage = true; // Set the showHomePage flag to true
    // Check if the "Back to Home" button from the take a break is clicked
    } else if (mouseX >= backToHomePageFromTakeABreakButton.xPos - backToHomePageFromTakeABreakButton.widthButton / 2 &&
       mouseX <= backToHomePageFromTakeABreakButton.xPos + backToHomePageFromTakeABreakButton.widthButton / 2 &&
       mouseY >= backToHomePageFromTakeABreakButton.yPos - backToHomePageFromTakeABreakButton.heightButton / 2 &&
       mouseY <= backToHomePageFromTakeABreakButton.yPos + backToHomePageFromTakeABreakButton.heightButton / 2 && showTakeABreak) {
      resetFlags(); // Reset all flags
      showHomePage = true; // Set the showHomePage flag to true
    }
    
    // Handle back to Take a Break button click from Water Drop Game
    if (showWaterDropGame) {
      if (mouseX >= backToTakeABreakButtonfromWaterDrop.xPos - backToTakeABreakButtonfromWaterDrop.widthButton / 2 &&
          mouseX <= backToTakeABreakButtonfromWaterDrop.xPos + backToTakeABreakButtonfromWaterDrop.widthButton / 2 &&
          mouseY >= backToTakeABreakButtonfromWaterDrop.yPos - backToTakeABreakButtonfromWaterDrop.heightButton / 2 &&
          mouseY <= backToTakeABreakButtonfromWaterDrop.yPos + backToTakeABreakButtonfromWaterDrop.heightButton / 2) {
        resetFlags(); // Reset all flags
        showTakeABreak = true; // Set the showTakeABreak flag to true
      }
    }
    
    // Handle back to Take a Break button click from Breathing Exercise
    if(showBreathingExercise) { 
      if (mouseX >= backToTakeABreakButtonfromBreathing.xPos - backToTakeABreakButtonfromBreathing.widthButton / 2 &&
          mouseX <= backToTakeABreakButtonfromBreathing.xPos + backToTakeABreakButtonfromBreathing.widthButton / 2 &&
          mouseY >= backToTakeABreakButtonfromBreathing.yPos - backToTakeABreakButtonfromBreathing.heightButton / 2 &&
          mouseY <= backToTakeABreakButtonfromBreathing.yPos + backToTakeABreakButtonfromBreathing.heightButton / 2) {
        resetFlags(); // Reset all flags
        showTakeABreak = true; // Set the showTakeABreak flag to true
      }
    }
  }
}

void resetFlags() {
  showHomePage = false; // Reset the flag for showing the home page
  showStudyTips = false; // Reset the flag for showing the study tips section
  showMindScapes = false; // Reset the flag for showing the mind scapes section
  showTakeABreak = false; // Reset the flag for showing the take a break section
  showCafe = false; // Reset the flag for showing the cafe section
  showHome = false; // Reset the flag for showing the home section
  showLibrary = false; // Reset the flag for showing the library section
  showWaterDropGame = false; // Reset the flag for showing the water drop game
  showBreathingExercise = false; // Reset the flag for showing the breathing exercise
  showPomodoroTimer = false; // Reset the flag for showing the Pomodoro timer
}

class Button {
  float xPos; // X-coordinate of the button
  float yPos; // Y-coordinate of the button
  float widthButton; // Width of the button
  float heightButton; // Height of the button
  float ySpeed; // Vertical speed of the button's movement

  Button() {
    // Default constructor
  }

  Button(float xPos, float yPos, float widthButton, float heightButton, float ySpeed) {
    this.xPos = xPos; // Initialize the x-coordinate
    this.yPos = yPos; // Initialize the y-coordinate
    this.widthButton = widthButton; // Initialize the width
    this.heightButton = heightButton; // Initialize the height
    this.ySpeed = ySpeed; // Initialize the vertical speed
  }

  void display() {
    rectMode(CENTER); // Set the rectMode to CENTER for drawing the button
    fill(#D3C4B1); // Set the fill color for the button
    rect(xPos, yPos, widthButton, heightButton); // Draw the button as a rectangle
  }

  void move() {
    yPos += ySpeed; // Update the y-coordinate based on the vertical speed

    yPos = constrain(yPos, 0, height / 2); // Constrain the y-coordinate within the top half of the screen
    float middleY = height / 2; // Calculate the middle y-coordinate of the screen
    float tolerance = 1; // Tolerance value for stopping the button at the middle

    if (yPos >= middleY - tolerance && yPos <= middleY + tolerance) {
      yPos = middleY; // Stop the button at the middle of the screen
    }
  }
}

class Text {
  float xPos; // X-coordinate of the text
  float yPos; // Y-coordinate of the text
  float textSize; // Size of the text
  float ySpeed; // Vertical speed of the text's movement
  String text; // Text string

  Text(float xPos, float yPos, float textSize, float ySpeed, String text) {
    this.xPos = xPos; // Initialize the x-coordinate
    this.yPos = yPos; // Initialize the y-coordinate
    this.textSize = textSize; // Initialize the text size
    this.ySpeed = ySpeed; // Initialize the vertical speed
    this.text = text; // Initialize the text string
  }

  void display() {
    textAlign(CENTER, CENTER); // Set the text alignment to center
    textSize(textSize); // Set the text size
    fill(0); // Set the text color to black
    text(text, xPos, yPos); // Draw the text at the specified position
  }

  void move() {
    yPos += ySpeed; // Update the y-coordinate based on the vertical speed

    yPos = constrain(yPos, 0, height / 2); // Constrain the y-coordinate within the top half of the screen
    float middleY = height / 2; // Calculate the middle y-coordinate of the screen
    float tolerance = 1; // Tolerance value for stopping the text at the middle

    if (yPos >= middleY - tolerance && yPos <= middleY + tolerance) {
      yPos = middleY; // Stop the text at the middle of the screen
    }
  }
}

class PomodoroTimer {
  int sessionDuration; // Duration of one pomodoro session in seconds
  int breakDuration;   // Duration of the break in seconds
  int currentTime;     // Current time left in seconds
  boolean active;      // Flag to indicate if the timer is active
  int lastSecondUpdate; // Store the frameCount when the last second was updated
  int r;
  int g;
  int b;

  PomodoroTimer(int sessionDuration, int breakDuration, int r, int g, int b) {
    this.sessionDuration = sessionDuration; // Initialize the session duration
    this.breakDuration = breakDuration; // Initialize the break duration
    this.currentTime = sessionDuration; // Set the initial current time to the session duration
    this.active = false; // Timer is initially inactive
    this.lastSecondUpdate = 0; // Initialize with frameCount 0
    this.r = r;
    this.g = g;
    this.b = b;
  }
  
  void start() {
    active = true; // Start the timer
  }
  
  void pause() {
    active = false; // Pause the timer
  }
  
  void reset() {
    active = false; // Stop the timer
    currentTime = sessionDuration; // Reset the current time to the session duration
  }
  
  void update() {
    if (active && currentTime > 0) { // If the timer is active and there is time remaining
      int currentFrame = frameCount; // Get the current frame count
      if (currentFrame - lastSecondUpdate >= 60) { // Check if 1 second has passed (assuming 60 fps)
        currentTime--; // Decrement the current time by 1 second
        lastSecondUpdate = currentFrame; // Update the last second update frame count
      }
    }
  }
  
  boolean isSessionOver() {
    return active && currentTime <= 0; // Check if the session is over (timer is active and current time is 0 or less)
  }
  
  boolean isBreakOver() {
    return !active && currentTime <= 0; // Check if the break is over (timer is inactive and current time is 0 or less)
  }
  
  void display(int x, int y) {
    String timerText = getTimeText(); // Get the timer text
    textAlign(CENTER); // Set the text alignment to center
    textSize(32); // Set the text size
    fill(r,g,b); // Set the text color to black
    text(timerText, x, y); // Display the timer text
  }
  
  String getTimeText() {
    int minutes = currentTime / 60; // Calculate the minutes
    int seconds = currentTime % 60; // Calculate the remaining seconds
    return nf(minutes, 2) + ":" + nf(seconds, 2); // Format the time as "MM:SS"
  }
}

class WaterGlass {
  int x, y; // Position of the glass
  int width, height; // Dimensions of the glass
  int waterLevel; // Current water level in the glass
  int maxWaterLevel; // Maximum water level before reset

  // Constructor
  WaterGlass(int x, int y, int width, int height, int maxWaterLevel) {
    this.x = x; // Initialize the x-coordinate
    this.y = y; // Initialize the y-coordinate
    this.width = width; // Initialize the width
    this.height = height; // Initialize the height
    this.maxWaterLevel = maxWaterLevel; // Initialize the maximum water level
    this.waterLevel = 0; // Initialize water level to zero
  }

  // Method to draw the glass
  void display() {
    fill(#D3C4B1); // Set the fill color for the glass
    rect(x, y + (height - maxWaterLevel), width, maxWaterLevel); // Draw the glass container, adjusting the y-position to align with the water level
    
    // Draw the water level in the glass
    fill(0, 0, 255); // Set the fill color for the water
    float waterHeight = map(waterLevel, 0, maxWaterLevel, 0, maxWaterLevel); // Map the water level to the glass height
    rect(x, y + 100, width, waterHeight); // Draw the water level, adjusting the y-position
  }
  
  // Method to update the x position of the glass
  void updatePosition(int mouseX) {
    x = mouseX; // Update the x-coordinate of the glass based on the mouse position
  }

  // Method to update water level
  void updateWaterLevel(int amount) {
    waterLevel += amount; // Increase the water level by the specified amount
    
    // Ensure water level does not exceed maximum
    if (waterLevel > maxWaterLevel) {
      waterLevel = maxWaterLevel; // Cap the water level at the maximum
    }
  }

  // Method to check if the glass is full
  boolean isGlassFull() {
    return waterLevel >= maxWaterLevel; // Return true if the water level is greater than or equal to the maximum
  }
}

class WaterDroplet {
  int x, y; // Position of the droplet
  int size; // Size of the droplet
  int speed; // Speed at which the droplet falls

  // Constructor
  WaterDroplet(int x, int y, int size, int speed) {
    this.x = x; // Initialize the x-coordinate
    this.y = y; // Initialize the y-coordinate
    this.size = size; // Initialize the size
    this.speed = speed; // Initialize the speed
  }

  // Method to draw the droplet
  void display() {
    fill(61, 159, 232); // Set the fill color for the droplet
    ellipse(x, y, size, size); // Draw the droplet as an ellipse
  }

  // Method to update droplet position
  void update() {
    y += speed; // Update the y-coordinate based on the speed (make the droplet fall)
  }

  // Method to check if droplet is off-screen
  boolean isOffScreen() {
    return y > height; // Return true if the droplet's y-coordinate is greater than the height (off-screen)
  }

  // Method to check collision with the glass
  boolean collidesWithGlass(WaterGlass glass) {
    // Check if the droplet's position intersects with the glass
    return y + size / 2 >= glass.y && y + size / 2 <= glass.y + glass.height &&
           x + size / 2 >= glass.x && x - size / 2 <= glass.x + glass.width;
  }
}

// BreathingEllipse class
class BreathingEllipse {
  float x, y; // Position of the ellipse
  float diameterMin, diameterMax; // Minimum and maximum diameter of the ellipse
  float currentDiameter; // Current diameter of the ellipse
  float growthSpeed; // Speed at which the diameter changes
  boolean growing = true; // Flag to determine if the ellipse is growing or shrinking
  
  // Constructor
  BreathingEllipse(float x, float y, float diameterMin, float diameterMax, float growthSpeed) {
    this.x = x; // Initialize the x-coordinate
    this.y = y; // Initialize the y-coordinate
    this.diameterMin = diameterMin; // Initialize the minimum diameter
    this.diameterMax = diameterMax; // Initialize the maximum diameter
    this.currentDiameter = diameterMin; // Start with the minimum diameter
    this.growthSpeed = growthSpeed; // Initialize the growth speed
  }
  
  // Method to update the ellipse (called in draw())
  void update() {
    if (growing) { // If the ellipse is growing
      currentDiameter += growthSpeed; // Increase the diameter
      text("Inhale", 200, 300); // Display "Inhale" text
      if (currentDiameter >= diameterMax) { // If the diameter reaches the maximum
        growing = false; // Switch to shrinking mode
      }
    } else { // If the ellipse is shrinking
      currentDiameter -= growthSpeed; // Decrease the diameter
      text("Exhale", 200, 300); // Display "Exhale" text
      if (currentDiameter <= diameterMin) { // If the diameter reaches the minimum
        growing = true; // Switch to growing mode
      }
    }
  }
  
  // Method to display the ellipse (called in draw())
  void display() {
    ellipseMode(CENTER); // Set the ellipse mode to CENTER
    noStroke(); // Disable stroke
    fill(#D3C4B1); // Set the fill color for the ellipse
    ellipse(x, y, currentDiameter, currentDiameter); // Draw the ellipse with the current diameter
  }
}
