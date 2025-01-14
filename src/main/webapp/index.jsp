<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WebSocket Chat</title>
</head>
<body>
<div id="chat-container">
    <div id="chat-window"></div>
    <input type="text" id="message-input" placeholder="Type your message...">
    <button onclick="sendMessage()">Send</button>
</div>

<script>
    var socket = new WebSocket("ws://localhost:8090/chat");
    socket.onmessage = function(event) {
        var message = event.data;
        appendMessage(message);
    };

    function sendMessage() {
        var messageInput = document.getElementById("message-input");
        var message = messageInput.value.trim();
        if (message !== "") {
            socket.send(message);
            messageInput.value = "";
        }
    }

    function appendMessage(message) {
        var chatWindow = document.getElementById("chat-window");
        var messageElement = document.createElement("div");
        messageElement.textContent = message;
        chatWindow.appendChild(messageElement);
    }
</script>
</body>
</html>
