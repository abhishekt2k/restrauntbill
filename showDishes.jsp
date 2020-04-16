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
    background-image: url( 'https://uploads-ssl.webflow.com/5b1fa99f611b011198e1990f/5c7e938410414db53d5006f8_Main%20image-%20healthy%20diet%20(1).png');

}
table{
    /* width: 100%; */
    align-items: center;
    margin-right: auto;
    /* border: black solid; */
    margin: auto;
    text-align: center;
    border: 5px solid black;
}

.button {
  display: block;
  transition-duration: 0.4s;
}
.button:hover {
  background-color: palevioletred; 
  color: white;
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
.button {
  float: left;
  border: 1px solid green;
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