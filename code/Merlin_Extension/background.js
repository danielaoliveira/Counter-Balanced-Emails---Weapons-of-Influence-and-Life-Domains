createwebsocket();

function createwebsocket(){
var socket = new WebSocket('ws://merlin.ece.ufl.edu:8080/events/');
};


chrome.runtime.onInstalled.addListener(function() {

	function getRandomToken() {
	    // E.g. 8 * 32 = 256 bits token
	    var randomPool = new Uint8Array(32);
	    crypto.getRandomValues(randomPool);
	    var hex = '';
	    for (var i = 0; i < randomPool.length; ++i) {
		hex += randomPool[i].toString(16);
	    }
	    // E.g. db18458e2782b2b77e36769c569e263a53885a9944dd0a861e5064eac16f1a
	    return hex;
	}

	chrome.storage.sync.get('userid', function(items) {
	    var userid = items.userid;
	    if (userid) {
	//	useToken(userid);
	    } else {
		userid = getRandomToken();
		chrome.storage.sync.set({userid: userid}, function() {
	//	    useToken(userid);
		});
	    }
	});
	
});


/*
// Show a connected message when the WebSocket is opened.
socket.onopen = function(event) {
//  socketStatus.innerHTML = 'Connected to: ' + event.currentTarget.URL;
 // socketStatus.className = 'open';
};


// Handle any errors that occur.
socket.onerror = function(error) {
  console.log('WebSocket Error: ' + error);
};

*/
chrome.history.onVisited.addListener( function (hisitem) {
	savestring(hisitem.url);
});

/*
chrome.tabs.onUpdated.addListener( function(tabid, props){
      savestring(props.url);
});
*/
function savestring(url)
{
   //chrome.storage.sync.set({'url': url})
   chrome.storage.sync.get('userid', function(items) {

   		var d = new Date();

   		var send_data = items.userid + ' ' + d.getTime() + ' ' + url;
	
		if(typeof socket === 'undefined') {
			
		var socket = new WebSocket('ws://merlin.ece.ufl.edu:8080/events/');
		setTimeout(function(){
			socket.send(send_data);
		}, 1000);

		}

		if(socket.readyState == socket.CLOSED) {
			//var socket = new WebSocket('ws://localhost:8080/events/');
			//setTimeout(function(){
				socket.send(send_data);
			//}, 1000);
			  //console.log('WebSocket Error: socket closed' );
		}	
		if(socket.readyState == socket.OPEN) {
			socket.send(send_data);
		}

	});
	
};


chrome.storage.onChanged.addListener(function(changes, namespace) {
 for (key in changes) {
     var storageChange = changes[key];
      console.log('Storage key "%s" in namespace "%s" changed. ' +
        'Old value was "%s", new value is "%s".',
         key,
         namespace,
         storageChange.oldValue,
         storageChange.newValue);
     }
});

