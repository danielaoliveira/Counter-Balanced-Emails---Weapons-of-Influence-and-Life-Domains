/**
 * 
 */

/*function form_submit_function() { 
		var formElement = document.getElementById('hidden_form');
		console.log(formElement);
		$(formElement).submit();
		return false; 
	};*/
	
function form_submit_function() {
  console.log('start');
  var currentStatus = validate();
  console.log('AFTER CURRENTSTATUS');
  console.log('currentStatus is: ' + currentStatus);
  if (!currentStatus) {
    console.log('ERROR: not all fields are complete');
    alert('Please fill out all fields on the page, or write a longer answer.');
    return false;
  } else if (currentStatus) {
    console.log('SUCCESS! Next page');
    //return true;
    //console.log('after TRUE');
       var formElement = document.getElementById('hidden_form');
       console.log(formElement);
       $(formElement).submit();
      return false; 
  } else {
    console.log('ERROR: validate() didn\'t return anything');
  } 
}

function validate() {
    console.log('foo');

    var responses = document.getElementsByClassName('visible-elements'); //no hidden-form elements

    if (responses == undefined || responses.length < 1) { //no visible-elements
        console.log('NOTE: Page has no visible form elements');
        return true;
        console.log('AFTER RETURN');
    }

    //validating DOB
    if (responses[0].name == 'dob' && responses[0].value.length < 10) { return false; }

    for (var i = 0; i < responses.length; i++) { //parse through every answer element
        var current = responses[i];
        console.log('FOR LOOP\n\ncurrent is now ' + current.name + '_' + i);

        if (current.type === "text") {
            console.log('------TYPE IS TEXT');
            if (current.value == "" || current.value.length < 3) { //no text or not a long enough answer
                console.log('NO TEXT');
                return false;
            } else {
                console.log('textfield ' + i + ' has been filled');
                continue; //continue to next iteration
            }
        } else if (current.type === "radio") {
        	if (i == responses.length - 1) { //last case, last radio button should've already been checked in while loop
        		break;
        	}

            var radioQuestion = current.name;
            console.log('radioQuestion is ' + radioQuestion);
            var nextIndex = i + 1;
            console.log('index is ' + i + ' & nextIndex is ' + nextIndex);
            //alert('------TYPE IS RADIO');

            // 	HELPER
            function findNextQuestion(currentIndex){ //returns index of next question
            	console.log('- in findNextQuestion FUNCTION');
            	var foundNextQuestion = false;

            	while (!foundNextQuestion){
            		if (nextIndex == responses.length || responses[nextIndex].name == undefined || responses[nextIndex].name === undefined) { //past all answer options
            			return -1;
            		} else if (responses[nextIndex].name != radioQuestion){
            			foundNextQuestion = true;
            			console.log('foundNextQuestion = true');
            			return (nextIndex - 1); //because next for loop will ++ it
            		} else {
            			nextIndex++;
            			console.log('looking for next radio button under question <' + radioQuestion + '>, ' + i + '+1');
            		}
            	}

            } //findNextQuestion function

  			if (current.checked == false){
  				console.log('CHECKED IS FALSE');
  				var isChecked = false; 
  				var endOfResponses = false;

  				while(!isChecked){
  					console.log('\nISCHECKED LOOP');
  					var foundNextQuestion = false;
  					if (nextIndex == responses.length){ //last case
  						console.log('ERROR: reached end of responses');
  						console.log('isChecked is ' + isChecked);
  						endOfResponses = true;
  						break; //out of while
  					} else {//find next question

  						while(!foundNextQuestion){
  							console.log('\nWHILE FOUNDNEXTQUESTION\ncurrent is type is ' + responses[i].type + ' and nextIndex type is ' + responses[nextIndex].type);
  							console.log('- in foundNextQuestion while looop');
  							console.log('i is ' + i + ' and nextIndex is ' + nextIndex);
  							if (nextIndex == responses.length - 1) { //last case
  								endOfResponses = true;
  								console.log('I IS ' + i + ' and nextIndex is ' + nextIndex);
  								// console.log('is radio button BEFORE the last checked? ' + responses[i-1].checked);
  								// console.log('is last radio button checked? ' + responses[i].checked);
  								// console.log('is radio button AFTER the last checked? ' + responses[i+1].checked);
  								if (responses[nextIndex].checked){
  									console.log('CHECKING IF CURRENT (LAST) INDEX HAS BEEN CHECKED');
  									console.log('IS CHECKED HAS BEEN CHANGED TO TRUE');
  									isChecked = true;
  								}

  								foundNextQuestion = true; //found last radio button
  								console.log('----------------FOUND END OF RESPONSES');

   							} else if (responses[nextIndex].name != radioQuestion || responses[nextIndex].type === "text"){ //new question
  								console.log('nextIndex\'s name is ' + responses[nextIndex].name + '\tand radioQuestion is ' + radioQuestion);
  								console.log('++++++++++++++++FOUND NEXT QUESTION');
  								foundNextQuestion = true;

  							} else { //same question
  								console.log('// foundNextQuestion loop: still in same question');
  								if(responses[nextIndex].checked == true){
  									console.log('NEXT RADIO BUTTON in this question has been checked!');
  									isChecked = true;
  									console.log('IS CHECKED HAS BEEN CHANGED TO TRUE');
  								 }

  								nextIndex++; //go to next radio button
  								i++;
  							}

  							if(foundNextQuestion && !isChecked){
  								console.log('foundNextQ is true and isChecked is false');
  								return false;
  							}

  							// if (foundNextQuestion){ //change i to next question's i
  							// 	console.log('increasing i to ' + i + ' and ndext index to ' + nextIndex);
  							// 	i++;
  							// 	nextIndex++;
  							// 	break;
  							// }
  						} //while foundNextQuestion

  						if (foundNextQuestion && isChecked){
  							console.log('TRYING TO BREAK INTO FOR LOOP')
  							continue; //out of isChecked while loop into next for loop iteration
  						}
  					}
  				} //isChecked while loop

  				if (endOfResponses && !isChecked){2
  					return false; //out of for loop
  				}

  			} else { //(current.checked == true); note: isChecked doesn't exist here
  				console.log('CHECKED IS TRUE');
  				if (findNextQuestion(i) == -1){
  					console.log('at responses.length + 1');
  					break; //have iterated through all of responses
  				} else {
  					i = findNextQuestion(i);
  					continue; //go to next iteration
  				}

  				console.log('ERROR: shouldn\'t be in this part of current.checked == true');
  			} //current.checked == true
        } //else if (radio buttons)
        console.log('out here');
    } //for

    //iterated through all of the answers - if there was an error earlier, it would've been returned as false already
    return true;
} //validate()