<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Edit Note</title>
    <link rel="stylesheet" type="text/css" href="Style1.css">
</head>
<body>
    <h1>Edit Note</h1>
    <form action="notes" method="post">
        <input type="hidden" name="action" value="edit">
        <input type="hidden" name="id" value="${param.id}">
        <label for="title">Title:</label>
        <input type="text" id="title" name="title" value="${param.title}" required>
        <label for="content">Content:</label>
        <textarea id="content" name="content" required>${param.content}</textarea>
        <button type="submit">Save</button>
    </form>
</body>
</html>