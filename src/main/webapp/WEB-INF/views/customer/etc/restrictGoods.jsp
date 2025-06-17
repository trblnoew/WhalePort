<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/libs/quill/dist/quill.snow.css">
<script src="${pageContext.request.contextPath}/resources/assets/libs/quill/dist/quill.js"></script>

<style>
    body {
        margin: 0;
        padding: 0;
        display: flex;
        flex-direction: column;
        font-family: Arial, sans-serif;
    }

    .restrictGoods-container {
        display: flex;
        margin-top: 60px;
    }

    .restrictGoods-banner {
        width: 30%;
        height: 70vh;
        position: fixed;
        top: 20vh;
        left: 3vh;
        border: 1px solid #ccc;
        border-radius: 10px;
        padding: 20px;
        margin-bottom: 25px;
        background-color: #f0f8ff;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    .restrictGoods-content {
        margin-left: 35%;
        width: 65%;
        padding: 20px;
    }

    #chatbox {
        width: 100%;
        height: 300px;
        border: 1px solid #ccc;
        border-radius: 5px;
        padding: 10px;
        background-color: #fff;
        overflow-y: auto;
        margin-top: 20px;
    }

    .message-container {
        margin-bottom: 10px;
    }

    .user-message {
        padding: 8px;
        border-radius: 5px;
        background-color: #e6f7ff;
        margin-bottom: 5px;
        max-width: 80%;
        word-wrap: break-word;
    }

    .response-message {
        padding: 8px;
        border-radius: 5px;
        background-color: #dff0d8;
        margin-left: 20px;
        max-width: 80%;
        word-wrap: break-word;
    }

    #userInput {
        width: 70%;
        padding: 10px;
        border-radius: 5px;
        border: 1px solid #ccc;
        margin-right: 10px;
        box-sizing: border-box;
    }

    #sendButton {
        padding: 10px 20px;
        background-color: #007bff;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    #sendButton:hover {
        background-color: #0056b3;
    }

    @media screen and (max-width: 768px) {
        .restrictGoods-banner {
            width: 100%;
            height: auto;
            position: relative;
            top: 0;
            left: 0;
        }

        .restrictGoods-content {
            margin-left: 0;
            width: 100%;
        }
    }
</style>

<div class="restrictGoods-container">
    <div class="restrictGoods-banner">
        <h1>항공기 반입 물품 검색</h1>
        <input type="text" id="userInput" placeholder="확인할 물품을 검색하세요..." />
        <button id="sendButton">Send</button>
        <div id="chatbox">
            <div class="response-message">물품을 입력하면 항공 반입 가능 여부를 알려드릴게요!</div>
        </div>
    </div>

    <div class="restrictGoods-content">
        <h1>Restricted Goods Information</h1>
        <p>This is the content area that takes up 70% of the page width.</p>
        <p>Add details heusere about what items are restricted for flights.</p>
    </div>
</div>

<script>
    $(document).ready(function() {
        $('#sendButton').click(function() {
            var userInput = $('#userInput').val().trim();

            if (userInput !== '') {
                var userMessage = $('<div class="message-container"><div class="user-message"></div></div>');
                userMessage.find('.user-message').text(userInput);
                $('#chatbox').append(userMessage);

                var responseMessage = $('<div class="response-message"></div>');
                responseMessage.text('답변: 해당 물품은 항공기 반입이 가능합니다.');
                userMessage.append(responseMessage);

                $('#userInput').val('');
                $('#chatbox').scrollTop($('#chatbox')[0].scrollHeight);
            }
        });

        $('#userInput').keypress(function(e) {
            if (e.which === 13) {
                $('#sendButton').click();
            }
        });
    });
</script>
