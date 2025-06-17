<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Active Users</title>
</head>
<body>

	<c:set var="user" value="${activeUsers }"/>
	<c:set var="users" value="${commonVO}"/>
	
    <h1>Active Users</h1>
    <ul>
         <c:forEach var="user" items="${activeUsers}">
            <li>${user}</li>
        </c:forEach>
    </ul>
    <h1>Non Active Users</h1>
    <ul>
    	<c:forEach var="users" items="${commonVO }">
    	<c:if test="${user != users.empId }">
    		<li>${users.empId }</li>
    	</c:if>
    	</c:forEach>
    
    </ul>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	var user = '${activeUsers }';
	var users = '${commonVO}';
	console.log("user"+user);
	console.log("users"+users);
});
</script>
</html>
