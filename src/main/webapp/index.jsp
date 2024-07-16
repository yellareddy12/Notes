<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Notes Application</title>
    <link rel="stylesheet" type="text/css" href="Style.css">
</head>
<body>
    <marquee scrollamount="6" bgcolor="pink"><span style="color:blue"><h3>Notes Application</span></marquee></h3>
    <h2>Add Note</h2>
    <table align="center" >
        <tr>
            <td>
                <form action="notes" method="post">
                    <input type="hidden" name="action" value="add">
                    <label for="title">Title:</label>
                    <input type="text" id="title" name="title" required>
                    <br><br>
                    <label for="content">Content:</label>
                    <textarea id="content" name="content" required></textarea>
                    <br><br>
                    <button type="submit">Add Note</button>
                </form>
            </td>
        </tr>
        <tr>
            <td>
                <h4>All Notes</h4>
                <table width="100%">
                    <c:forEach var="note" items="${notes}">
                        <tr>
                            <td>
                                <div class="note">
                                    <h3>${note.title}</h3>
                                    <p>${note.content}</p>
                                    <form action="notes" method="post" style="display:inline;">
                                        <input type="hidden" name="action" value="delete">
                                        <input type="hidden" name="id" value="${note.id}">
                                        <button type="submit">Delete</button>
                                    </form>
                                    <form action="editNote.jsp" method="get" style="display:inline;">
                                        <input type="hidden" name="id" value="${note.id}">
                                        <input type="hidden" name="title" value="${note.title}">
                                        <input type="hidden" name="content" value="${note.content}">
                                        <button type="submit">Edit</button>
                                    </form>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </td>
        </tr>
    </table>
</body>
</html>