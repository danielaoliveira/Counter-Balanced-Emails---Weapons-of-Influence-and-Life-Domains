

function register() {
  var sender_age = document.getElementById("age_group").value.trim();
  var sender_email_id = document.getElementById("email_id").value.trim();
  //chrome.gcm.register([senderId], registerCallback);

  // Prevent register button from being click again before the registration
  // finishes.
  //document.getElementById("register").disabled = true;
  chrome.storage.sync.get('userid', function(items) {
    
    var send_data = 'age_group:'+ ' ' + sender_age + ' ' + 'email_id:' +' ' + sender_email_id + ' ' + items.userid;
  
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
    document.getElementById("age_group").style.display = 'none';
    document.getElementById("divtext").style.display = 'none';
    document.getElementById("register").style.display = 'none';
    document.getElementById("divtext-email").style.display = 'none';
  var element = document.createElement('div');
    element.id = "someID";
    document.body.appendChild(element);

    element.appendChild(document.createTextNode
     ('Thank you'));

  });


}

window.onload = function() {
  document.getElementById("register").onclick = register;
}
