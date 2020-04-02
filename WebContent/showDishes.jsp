<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>select a dish</title>
<link rel="stylesheet" href="selectDish.css">
<style>
body{
    
    vertical-align: center;
    align-items: center;
    background-color: coral;

}
table{
    /* width: 100%; */
    align-items: center;
    margin-right: auto;
    /* border: black solid; */
    margin: auto;
    text-align: center;
}
button {
    width: 7rem;
    height: 50px;
    margin-top: 0.15rem;
    margin-bottom: 0.15rem;
    position: relative;
    padding: 1rem;
}

.panel{
    /* display: block; */
    /* border: solid black 2px; */
    size: 10rem;
    width: 100%;
    height: 100%;
    margin: 0;
    position: absolute;
    top: 20%;
    text-align: center;
    align-content: center;
    vertical-align: center;
}

</style>

</head>
<body>
	<div>
	
		<h3>Select the Dish to add for Table  <c:out value="${table.getTableNo() }"  /></h3> 
		bill id : <c:out value="${ table.getBillId() }" />
		<form method="post" action="main">
		<input value="${table.getBillId() }" type ="hidden" name="billId">
		<input value="${ table.getTableNo() }" type="hidden" name="tableNumber">
		<c:forEach  items = "${dishes}" var ="dish"> 
			<button name ="dishId" value="${dish.getId() }"> ${dish.getName()}</button>
			<c:if test="${ (dishes.indexOf(dish)+1) % 3 == 0  }" > <br> </c:if>

		
		</c:forEach>
		</form>

	</div>



</body>
</html>