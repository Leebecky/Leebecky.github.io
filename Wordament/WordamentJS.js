//^ Event declarations
document.getElementById("RotateBtn").addEventListener("click", RotateBoard),
window.addEventListener("load", PopulateBoard),
document.getElementById("WordListBox").addEventListener("scroll", syncScroll);

//^ Rotate the Board
function RotateBoard() { //? Rotates the game board depending on the current orientation
    var degree = document.getElementById("RotateDeg"),
    GameBoard = document.getElementById("GameBoard"),
    Letter = document.getElementsByClassName("Tile");
    GameBoard.style.transition="linear 0.5s";    

    if (degree.value == "0") {
        GameBoard.style.transform="rotate(90deg)";  
            for (let index = 0; index < Letter.length; index++) {
                Letter[index].style.transform="rotate(-90deg)";
               }
                degree.value = "90";
    }
    else if (degree.value == "90") {
        GameBoard.style.transform="rotate(180deg)";  
            for (let index = 0; index < Letter.length; index++) {
                Letter[index].style.transform="rotate(-180deg)";
               }
                degree.value = "180";
    }
    else if (degree.value == "180") {
        GameBoard.style.transform="rotate(270deg)";  
            for (let index = 0; index < Letter.length; index++) {
                Letter[index].style.transform="rotate(-270deg)";
               }
                degree.value = "270";
    }
    else if (degree.value == "270") {
        GameBoard.style.transform="rotate(360deg)";  
            for (let index = 0; index < Letter.length; index++) {
                Letter[index].style.transform="rotate(-360deg)";
               }
                degree.value = "0";
    }

   }

//~ Populating the Game Board
var Alphabets = {
    "E": {letter: "E", probability: 12.02, point:1, type: "vowel"},
    "T": {letter: "T", probability: 9.10, point:1, type: "consonant"},
    "A": {letter: "A", probability: 8.12, point:1, type: "vowel"},
    "O": {letter: "O", probability: 7.68, point:1, type: "vowel"},
    "I": {letter: "I", probability: 7.31, point:1, type: "vowel"},
    "N": {letter: "N", probability: 6.95, point:1, type: "consonant"},
    "S": {letter: "S", probability: 6.28, point:1, type: "consonant"},
    "R": {letter: "R", probability: 6.02, point:1, type: "consonant"},
    "H": {letter: "H", probability: 5.92, point:4, type: "consonant"},
    "D": {letter: "D", probability: 4.32, point:2, type: "consonant"},
    "L": {letter: "L", probability: 3.98, point:1, type: "consonant"},
    "U": {letter: "U", probability: 2.88, point:1, type: "vowel"},
    "C": {letter: "C", probability: 2.71, point:3, type: "consonant"},
    "M": {letter: "M", probability: 2.61, point:3, type: "consonant"},
    "F": {letter: "F", probability: 2.30, point:4, type: "consonant"},
    "Y": {letter: "Y", probability: 2.11, point:4, type: "consonant"},
    "W": {letter: "W", probability: 2.09, point:4, type: "consonant"},
    "G": {letter: "G", probability: 2.03, point:2, type: "consonant"},
    "P": {letter: "P", probability: 1.82, point:3, type: "consonant"},
    "B": {letter: "B", probability: 1.49, point:3, type: "consonant"},
    "V": {letter: "V", probability: 1.11, point:4, type: "consonant"},
    "K": {letter: "K", probability: 0.69, point:5, type: "consonant"},
    "X": {letter: "X", probability: 0.17, point:8, type: "consonant"},
    "Q": {letter: "QU", probability: 0.11, point:10, type: "consonant"},
    "J": {letter: "J", probability: 0.10, point:8, type: "consonant"},
    "Z": {letter: "Z", probability: 0.07, point:10, type: "consonant"}
}, 
WordArray = [], PointArray = [], vowel = 0, duplicate = 0;

//^ Populates the Gameboard
function PopulateBoard() {
   var Tile = document.getElementsByClassName("TileValue"),
   Point = document.getElementsByClassName("TilePoint");

   for (let index = 0; index < 16; index++) {
       GenerateBoard();
       Tile[index].innerText = WordArray[index];
       Point[index].innerText = PointArray[index];
   }
   vowel = 0;
   duplicate = 0;
}

//^ Loops through the Alphabet object and returns a random letter
// TODO Set rules to for consonants/vowel spawn rate
function GenerateBoard(){
        var Random = Math.floor(Math.random()*100),
        randSelect = 0;
    
        for (const key in Alphabets) {
            if (Alphabets.hasOwnProperty(key)) {
               randSelect += parseFloat(Alphabets[key].probability);
            }

        if (randSelect >= Random) {
            //? Checks how many vowels there are, and reroll the Board if there are more than 3 vowels
            if (Alphabets[key].type == "vowel") {
                vowel += 1;
 
                if (vowel > 3) {
                    GenerateBoard();
                    return;
                }
            } 
            //? Generates an array to populate the Game Board with
                WordArray.push(Alphabets[key].letter);
                PointArray.push(Alphabets[key].point);
                return;           
            }
        }
    }

//~ Game Timer

function gameTimer(duration, display) {
    var timer = duration, 
        minutes, 
        seconds;

    setInterval(function () { //^ Triggers every 1 second
        minutes = parseInt(timer / 60, 10);
        seconds = parseInt(timer % 60, 10);

        //? Ternary operators: if minutes < 10, display with 0 prefix, else display as minute
        minutes = minutes < 10 ? "0" + minutes : minutes;
        seconds = seconds < 10 ? "0" + seconds : seconds;

        display.textContent = minutes + ":" + seconds;

        //TODO if timer reaches 0, go to score page
        //? What happens when timer reaches 0
        if (--timer < 0) {
            timer = duration;
            alert("Game has ended!");
        }

    }, 1000);
}
//? Timer is currently disabled for my sanity
/* window.onload = function () {
    var GameTime = 60* 2,
        display = document.querySelector('#Timer');
    gameTimer(GameTime, display);
}; */

function syncScroll() {
    var wordDiv = document.getElementById("PointListBox");
    var div = document.getElementById("WordListBox");
    wordDiv.scrollTop = div.scrollTop;
}