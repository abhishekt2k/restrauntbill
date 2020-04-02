<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
  <title>Hello, world!</title>
    <link rel="stylesheet" href="./resources/mainpage.css">
        <link rel="stylesheet" href="mainpage.css">
    <style>
    
div {
    /* border: 1px solid #909090; */
    width: 100%;
    /* align-content: center; */
}

.borderLayout {
    /* display: table; */
    width: 100%;
    /* margin: auto; */
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

    /* padding-right: 2rem; */

}

.borderLayout .center {
    display: table-cell;
    width: 100%;
}

.borderLayout .right {
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
    margin-top: 0.15rem;
    margin-bottom: 0.15rem;
    position: relative;
    padding: 1rem;
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
    
    </style>
    
 
</head>
<body>

<div>
	<h2>Vishnu's Multicusine Restraunt</h2>
</div>
<div class="borderLayout">

	<div class="left">

		<div class="borderLayout">
		<form  method="get" action="showdishes" >
			<input name="tableNumber" value="${table.getTableNo() }"  type="hidden">
		
			<div class="right">

				<ul>
					<li >Veg</li>
					<li><button name = "category" value ="vegstarters">Starters</button></li>
					<li><button name = "category" value = "vegsoups" data-type = "veg">Soups</button></li>
					<li><button name = "category" value = "vegmain course" data-type = "veg">Main Course</button></li>
				</ul>

			</div>
			<div class="left">
				<ul>
					<li>Non Veg</li>
					<li><button name = "category" value ="nvegstarters" >Starters</button></li>
					<li><button name = "category" value = "nvegsoups" >Soups</button></li>
					<li><button name = "category" value = "nvegmain course" >Main Course</button></li>

				</ul>

			</div>

			<ul>
				<li id="bvgs"><button name = "category" value="beverages">Beverages</button></li>
				<li id="bvgs"><button name = "category" value="deserts">Deserts</button></li>
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
			<div class="center">
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
	<div class="bottom">bottom</div>
</div>
</body>

</html>