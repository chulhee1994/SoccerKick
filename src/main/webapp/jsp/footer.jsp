<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    body {
        font-family: Arial, sans-serif;
    }

    footer {
        color: #2c3e50;
        text-align: center;
        border-top: 3px solid #ecf0f1;
    }

    footer a {
        color: #2c3e50;
        text-decoration: none;
        font-weight: bold;
        transition: color 0.3s ease;
    }

    footer a:hover {
        color: #3498db;
    }

    footer img {
        width: 40px;
        height: 40px;
        vertical-align: middle;
        margin-right: 10px;
    }

    footer p {
        font-size: 16px;
        margin: 10px 0;
    }

    footer address {
        font-style: normal;
    }

</style>
</head>
<body>
    <footer class="pt-3 mt-4 text-body-secondary border-top">
        <p>&copy; SoccerKick</p>
        <address>Copyright SoccerKick</address>
        <p>Kim Chul Hee</p>
        <a href="https://devkch.notion.site/531b93bb4bcc4577a5a90ca91780451d?pvs=4">
        <img src="${contextPath}/img/notion.png">
        Notion</a>
        </footer>
