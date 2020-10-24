// Define the time limit
const TIME_LIMIT = 60;

// Define quotes to be used
const QUOTES_ARRAY = [
    "Don't wait for opportunity, create it!", 
    "Failure is the condiment that gives success its flavour",
    "It be like that sometimes",
    "YEET!",
    "Understandable, have a nice day Sir",
    "The only way to do great work is to love what you do"
]; 

// Selecting required elements
const timerText = document.querySelector(".header-time");
const accuracyText = document.querySelector(".header-accuracy");
const errorText = document.querySelector(".header-errors");
const cpmText = document.querySelector(".header-cpm");
const wpmText = document.querySelector(".header-wpm");
const quoteText = document.querySelector(".quote");
const inputArea = document.querySelector(".input_area");
const restartBtn = document.querySelector(".restart_btn");
const cpmGroup = document.querySelector(".cpm");
const wpmGroup = document.querySelector(".wpm");
const errorGroup = document.querySelector(".errors");
const accuracyGroup = document.querySelector(".accuracy");

var timeLeft = TIME_LIMIT;
var timeElapsed = 0;
var totalErrors = 0;
var errors = 0;
var accuracy = 0;
var charactersTyped = 0;
var currentQuote = "";
var quoteNo = 0;
var timer = null;

function updateQuote() {
    quoteText.textContent = null; 
    currentQuote = QUOTES_ARRAY[quoteNo];

    //? Separate each character and turn it into an element <span> so that it can be individually styled
    currentQuote.split('').forEach(char => {
        const CHAR_SPAN = document.createElement("span");
        CHAR_SPAN.innerText = char;
        quoteText.appendChild(CHAR_SPAN);
    })

    //? if all quotes has been cycled through, roll back to the first quote in the array
    if (quoteNo < QUOTES_ARRAY.length - 1) {
        quoteNo++;
    } else {
        quoteNo = 0;
    }
}

function processCurrentText() {
    //? Get current text input and split it
    let currentInput = inputArea.value; 
    let currentInputArray = currentInput.split(''); 

    //? Increment total characters typed
    charactersTyped++;
    errors = 0;
    
   let quoteSpanArray = quoteText.querySelectorAll("span");
   quoteSpanArray.forEach((char, index) => {
       let typedChar = currentInputArray[index];
       
        //? If character is not typed
        if (typedChar == null) {
            char.classList.remove("correct_char");
            char.classList.remove("incorrect_char");
        } else if (typedChar === char.innerText) { //? if correct character is typed
                char.classList.add("correct_char");
                char.classList.remove("incorrect_char");
        } else { //? if incorrect character is typed
            char.classList.remove("correct_char");
            char.classList.add("incorrect_char");

            //? incremenet errors
            errors++;
        }
   });

   //? display the number of errors
   errorText.textContent = totalErrors + errors;

   //? update accuracy text
   let correctCharacters = (charactersTyped - (totalErrors + errors));
   let accuracyVal = ((correctCharacters/charactersTyped) * 100);
   accuracyText.textContent = Math.round(accuracyVal);

   //? Once the quote has been fully typed 
   if (currentInput.length == currentQuote.length) {
       updateQuote();

        //? update total errors
        totalErrors += errors;

        //? clear the input area
        inputArea.value = "";
   }
}

function startGame() {
    resetValues();
    updateQuote();

    //Reset the timer
    clearInterval(timer);
    timer = setInterval(updateTimer, 1000);
}

function resetValues() {
    timeLeft = TIME_LIMIT;
    timeElapsed = 0;
    errors = 0;
    totalErrors = 0;
    accuracy = 0;
    charactersTyped = 0;
    quoteNo = 0;
    inputArea.disabled = false;

    inputArea.value = "";
    quoteText.textContent = "Click on the area below to start the game";
    accuracyText.textContent = 100;
    timerText.textContent = timeLeft + "s";
    errorText.textContent = 0;
    restartBtn.style.display = "none";
    cpmGroup.style.display = "none";
    wpmGroup.style.display = "none";
}

function updateTimer() {
    if (timeLeft > 0) {
        timeLeft--;
        timeElapsed++;
        timerText.textContent = timeLeft + "s";
    } else {
        finishGame();
    }
}

function finishGame() {
    //stop the timer
    clearInterval(timer);
    
    //? disable the input area
    inputArea.disabled = true;

    //? show finishing text
    quoteText.textContent = "Click on restart to start a new game";
    
    //? display the restart button
    restartBtn.style.display = "block";

    //? calculate cpm and wpm
    let cpm = Math.round((charactersTyped/timeElapsed) * 60);
    let wpm = Math.round(((charactersTyped/5) / timeElapsed) * 60);

    //? update cpm and wpm text
    cpmText.textContent = cpm;
    wpmText.textContent = wpm;  

    //? display the cpm and wpm
    cpmGroup.style.display = "block";
    wpmGroup.style.display = "block";
}