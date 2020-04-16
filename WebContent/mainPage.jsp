<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
  <title>Home page</title>
    <link rel="stylesheet" href="./resources/mainpage.css">
        <link rel="stylesheet" href="mainpage.css">
    <style>
    
div {
    /* border: 1px solid #909090; */
    width: 100%;
    /* align-content: center; */
	padding: 10px;
	
}

.borderLayout {
    /* display: table; */
    width: 100%;
    /* margin: auto; */
	padding: 1px;
	
	
}

.borderLayout .top {
    display: table-row;
    /* align-items: center; */
}

.borderLayout .left {
    display: table-cell;
    vertical-align: middle;
    width: 10%;
    width: auto;
    text-align: center;
    align-items: center;
    justify-content: center;
	background-color: yellow;

}
.borderLayout .center {
    display: table-cell;
    width: 100%;
	background-color: salmon;
}

.borderLayout .right {
    display: table-cell;
    vertical-align: middle;
    width: 10%;
    width: auto;
    text-align: center;
    align-items: center;
    justify-content: center;
	background-color: yellow;
	
}
.borderLayout .right1 {
    display: table-cell;
    vertical-align: middle;
    width: 10%;
    width: auto;
    text-align: center;
    align-items: center;
    justify-content: center;
	
}

.borderLayout .bottom {
    display: table-row;
	

}


button {
    width: 7rem;
    height: 50px;
	font-weight: 100;
    margin-top: 0.15rem;
    margin-bottom: 0.15rem;
    position: relative;
    padding: 1rem;
	background-color: white;
  color: black;
  border: 2px solid blue;
  transition-duration: 0.4s;
  border-radius: 8px;
}

select {
    height: 30px;
    width: 160px;
    margin-top: 5rem;

}

table {
    border: solid 2px;
    stroke: black;
    width: 100%;
}

ul {
    list-style: none;
    position: relative;
    align-items: center;
}

#restrauntName {
    align-content: center;
    color: #656565;
}

h2 {
    text-align: center;
}

#bvgs {
    text-align: center;
}

tr{
    border: solid 1px black;
}
td{
    border: solid 1px black;
    text-align: center;
}
.heading{
	/* border-radius:16px; */
	font-weight: 400;
	font-family: Georgia, 'Times New Roman', Times, serif;
	font-size: 30px;
	font-style: oblique;
	background-color:white;
	width:auto;
	color: darkblue;
	position: relative;
	top:10px;
	padding-top: 40px;
	
}
body{
	background-color: aquamarine;
	width: auto;
	border: 10px solid transparent;
  padding: 15px;
  border-image: url(border.png) 30 stretch;
  
}

button:hover {
  background-color:cyan; 
  color: white;
}
 img {
  border-radius: 50%;
  widows: 80px;
  height: 120px;
  float: left;
  position: relative;
  left: 260px;
}

    
    </style>
    
 
</head>
<body>

<div class="heading">
		<img src="https://seeklogo.com/images/F/food-chief-logo-64EB8ED1D9-seeklogo.com.png">

	<h2>TRASV's Multicusine Restaurant</h2>
</div>
<div class="borderLayout">

	<div class="left">

		<div class="borderLayout">
		<form  method="get" action="showdishes" >
			<input name="tableNumber" value="${table.getTableNo() }"  type="hidden">
		
			<div class="right1">

				<ul>
					<li >Veg</li>
					<li><button class =" b"name = "category" value ="vegstarters">Starters</button></li>
					<li><button  class =" b" name = "category" value = "vegsoups" data-type = "veg">Soups</button></li>
					<li><button  class =" b" name = "category" value = "vegmain course" data-type = "veg">Main Course</button></li>
				</ul>

			</div>
			<div class="left">
				<ul>
					<li>Non Veg</li>
					<li><button  class =" b" name = "category" value ="nvegstarters" >Starters</button></li>
					<li><button  class =" b" name = "category" value = "nvegsoups" >Soups</button></li>
					<li><button  class =" b" name = "category" value = "nvegmain course" >Main Course</button></li>

				</ul>

			</div>

			<ul>
				<li id="bvgs"><button  class =" b" name = "category" value="beverages">Beverages</button></li>
				<li id="bvgs"><button  class =" b" name = "category" value="deserts">Deserts</button></li>
			</ul>
		</form>
		</div>




	</div>
	<div class="center">
		<div>
			<table>
				<tr>
					<th>S No</th>
					<th>ITEM</th>
					<th>PRICE</th>
					<th>QTY</th>

					<th>TOTAL</th>
				</tr>
				<c:forEach items="${table.getOrderedItems() }" var="dish" >
					<tr>
						<td> <c:out value ="${(table.getOrderedItems().indexOf(dish)+1)}" /> </td>
						<td> <c:out value ="${dish.getName()}" /></td>
						<td> <c:out value ="${dish.getPrice()}" /></td>
						<td> 1</td>
						<td> <c:out value ="${dish.getPrice()}" /></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>

	<div class="right">
		<div class="borderLayout">
			<div >
				<ul>
					<li>
					<h3>Table Selected : <c:out value="${table.getTableNo() }" /></h3>
					</li>
					<li>
					<form action="addtable">
							<button>Add Table</button>
							
					</form>
					
					</li>
					<li>
						<form action="main" method="GET">
						
						<select name="tableNumber" id="" onchange="this.form.submit()" placeholder="">
								<option selected disabled hidden> <c:out value="${table.getTableNo() }" /></option>
								<c:forEach items="${activeTables}" var="tableNo" >
									<option value="${tableNo}"  > ${tableNo} </option>
								</c:forEach>
						</select>
						</form>
					</li>
					
					<li>
					<form action="PrintBill" method="GET" >
					
					<input type=hidden value="${table.getTableNo() }" name="tableNumber">
					<button>Print Bill</button>
					</form>
					</li>
				</ul>
			</div>

		</div>
	</div>
	<div class="bottom"></div>
</div>
</body>

</html>