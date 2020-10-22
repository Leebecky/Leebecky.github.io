$(document).ready(function() {
    
 //^ Event Declarations
    window.addEventListener("keydown", deleteLetter);
    window.addEventListener("keydown", endWord);
    var Tile = document.getElementsByClassName("Tile");
    for (let index = 0; index < Tile.length; index++) {
        Tile[index].addEventListener("click", mapTile);
    }
    //^ Variable declaration
    var LimitL = 8, LimitR = 345, LimitT = 141, LimitB = 479, TileLength = 82,
        currentTile = [],
        Word = [],
        Points = 0, 
        state = false, 
        prevMouse = 0, 
        currentMouse = 0,
        WordDisplay = document.getElementById("Word"),
        playerScore = 0;
 

 function mapTile() {
     
     //^ Checks if you are within the game board
     if (event.clientX >= LimitL && event.clientX <= LimitR && event.clientY >= LimitT && event.clientY <= LimitB) {
         
        //? state indicates if a word is in the process of being built
        //? if word is being initialised, then first tile is onclick
         if (state == false) {
             currentTile[0] = getIndex(this);   
             prevMouse = event.clientX;
             this.setAttribute("class", "Tile-Hover Tile");   
             Word.push(this.innerText[2]); //! WILL CAUSE ERRORS WHEN QU COMES OUT
             WordDisplay.innerText = Word.join(""); 
             Points += parseInt(this.innerText[0]);
        }
            currentMouse = event.clientX;
            currentTile[1] = getIndex(this);
        /*  
        ? If the selected tile is a neighbouring tile (Determined by index), 
        ? then the value of the prevTile is updated and the  tile is highlighted */
        if (currentMouse <= (prevMouse + 232)) { //^ Max distance of neighbouring tiles
            if (isNeighbour(currentTile[1], currentTile[0])) {
                currentTile[0] = getIndex(this);
                prevMouse = event.clientX;
                this.setAttribute("class", "Tile-Hover Tile");

                Word.push(this.innerText[2]); //! WILL CAUSE ERRORS WHEN QU COMES OUT
                WordDisplay.innerText = Word.join("");

                Points += parseInt(this.innerText[0]);
            } 
        }
        state = true; //^ Word in Progress. Will be reset to false in endWord()
    }
}

function getIndex(nodeIndex) {
    //? Returns the index of the Tile that was clicked
    let index = 0;
            while ( (nodeIndex = nodeIndex.previousElementSibling) ) {
                index++;
            }
    return index;
}

//? Checks if the position of the next selected tile is a valid neighbour of the previously selected tile
//TODO Figure out how to tidy this shit up
function isNeighbour(currentTilePos, prevTilePos) {
    let topNeighbour = prevTilePos - 4, 
        bottomNeighbour = prevTilePos + 4,
        leftNeighbour = prevTilePos + 1,
        rightNeighbour = prevTilePos - 1,
        diagonalRightDownNeighbour = prevTilePos + 5,
        diagonalRightUpNeighbour = prevTilePos - 5,
        diagonalLeftDownNeighbour = prevTilePos + 3,
        diagonalLeftUpNeighbour = prevTilePos - 3;

    if (currentTilePos == topNeighbour || currentTilePos == bottomNeighbour || currentTilePos == leftNeighbour
        || currentTilePos == rightNeighbour || currentTilePos == diagonalLeftDownNeighbour ||
        currentTilePos == diagonalRightDownNeighbour || currentTilePos == diagonalRightUpNeighbour
        || currentTilePos == diagonalLeftUpNeighbour) {
        return true;
    } else {
        return false;
    }
}


//? Word validation
function checkWord(playerWord) {  
    var notFound;
    $.getJSON("dictionary.json", function(data){
        $.each(data, function(word, model){
            
            if (model.word === playerWord) {
                notFound = false;
                return notFound;
            } else {
                notFound = true;
                return notFound;
            }
        });    
        foundWord(notFound);        
    })
}

function foundWord(notFound) {
    if (notFound == false) {
        WordList();

        for (let index = 0; index < playerWordList.length; index++) {
            something.push(playerWordList[index].innerText);     
        }

        console.log(something);
   console.log(hasDuplicates(something));

   if (hasDuplicates(something) == false) {
    //    WordList();
       calculatePoints(Word.length);
       PointList();
       calculateScore();
       Points = 0;
       Word.length = 0;
       WordDisplay.innerText = "";            
       
       let SelectedTile = document.querySelectorAll(".Tile-Hover");
       for (let index = 0; index < SelectedTile.length; index++) {
           
           SelectedTile[index].setAttribute("class", "GameTile Tile");
           state = false;
        }} else {
            WordList(true);
            clearWord();
        }

        something.length = 0;
        return false;
    } else if (notFound == true) {
        clearWord();
        return true;
    }
}

var playerWordList = document.getElementById("WordList").childNodes, something = [];
function endWord() { 
    
    //? When Enter is pressed, the word is saved to the list and the array is reset
    if (state == true && Word.length >= 3) {
        if (event.keyCode == 13) {
            // if (hasDuplicates(playerWordList)) {
                checkWord(sentenceCase(Word));
                        
            // }
        }               
    }
}

//^ Adds the created word to the Word List
function WordList(remove) {
    var WordList = document.getElementById("WordList"),
        List = document.createElement("li"),
        WordItem = document.createTextNode(Word.join(""));
    List.appendChild(WordItem);
    

    if (remove) {
        WordList.removeChild(WordList.firstElementChild);
    } else {
        WordList.prepend(List);
    }
}

function PointList() {
    var PointList = document.getElementById("PointList"),
        PointItem = document.createElement("li"),
        WordPoint = document.createTextNode(Points);
    PointItem.appendChild(WordPoint);
    PointList.prepend(PointItem);
}

function deleteLetter() { 
    if (event.keyCode == 8) {
        //? If backspace is pressed, the tiles and array is reset
        if (state == true) { 
            
            let SelectedTile = document.querySelectorAll(".Tile-Hover");
            for (let index = 0; index < SelectedTile.length; index++) {
            
                SelectedTile[index].setAttribute("class", "GameTile Tile");
                state = false;
            }
            Word.length = 0;
            WordDisplay.innerText = ""; 
            Points = 0;
        }
    }
}

function calculatePoints(word) {
    let wordLength = parseInt(word);

    if (wordLength >= 9) {
        return Points *= 4;
    } else if (wordLength >= 7) {
        return Points *= 3;
    } else if (wordLength >= 5) {
        return Points *= 2;
    } else {
        return Points;
    }
}
function calculateScore () {
        totalPoints = document.getElementById("PointList").childNodes;
         
        for (let i = 0; i < totalPoints.length; i++) {
            playerScore += parseInt(totalPoints[i].innerText);
        }
        document.getElementById("Score").innerText = playerScore;
        playerScore = 0;
}


function clearWord() { 
            
            let SelectedTile = document.querySelectorAll(".Tile-Hover");
            for (let index = 0; index < SelectedTile.length; index++) {
            
                SelectedTile[index].setAttribute("class", "GameTile Tile");
                state = false;
            }
            Word.length = 0;
            WordDisplay.innerText = ""; 
            Points = 0;
}
})

function sentenceCase(wordMade) { //^ Converts the word to sentence case for verification within the dictionary
    var sentenceWord = [];
    sentenceWord.push(wordMade[0]);

    for (let i = 1; i < wordMade.length; i++) {
        sentenceWord.push(wordMade[i].toLowerCase());
    }
        return sentenceWord.join("");
}

function hasDuplicates(arr) {  //? Checks if there is a duplicate word
    // https://stackoverflow.com/questions/49215358/checking-for-duplicate-strings-in-javascript-array/54974076
    return arr.some(function(item){
        return arr.indexOf(item) !== arr.lastIndexOf(item);
    });
}
