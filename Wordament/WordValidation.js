function checkWord(playerWord) {  
    var notFound;

    $.getJSON("dictionary.json", function(data){
        $.each(data, function(word, model){
            
            if (model.word === playerWord) {
                console.log(model.definition);    
                console.log(model.word);    
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
    
console.log(notFound);
    if (notFound == false) {
        console.log("Word found");
        
    
        return false;

    } else if (notFound == true) {
        console.log("Word not found!");
        // found = false;
      
        return true;
    }
}