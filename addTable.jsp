<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>addtable</title>
    <link rel="stylesheet" href="../ResBill/../resources/addtable.css">
    <style>
    	body{
    
    vertical-align: center;
    align-items: center;
    background-color: coral;
   background-image: url('https://wellbeingcoaches.com/wp-content/uploads/2018/09/heart-health-cholesterol-b.png');
    background-position: center; 
   background-repeat: no-repeat;
   background-size: 100%;

}
table{
    /* width: 100%; */
    align-items: center;
    margin-right: auto;
    /* border: black solid; */
    margin: auto;
    text-align: center;
    
   
}
.b{
  background-color: white;
  color: black;
  border: 2px solid cyan;
  transition-duration: 0.4s;
  border-radius: 8px;
  font-size: 35px;
  padding: 23px ;
    
}
.b:hover {
  background-color:cyan; 
  color: white;
}
.tableno{
    background-color: white;
    color: black;
    border: 2px solid cyan;
    border-radius: 8px;
    font-size: 30px;
    padding :10px 10px 25px 25px;
  

}
.registerbtn{
    position: relative;
    top:0;
  background-color:crimson;
  color: black;
  border: 2px solid cyan;
  transition-duration: 0.4s;
  border-radius: 8px;
  font-size: 28px;
  padding: 20px 20px  ;
}
.registerbtn :hover{
    background-color:crimson; /* Green */
  color: white}
.panel{
    /* display: block; */
    /* border: solid black 2px; */
    size: 10rem;
    width: 100%;
    margin: auto;
    text-align: center;
    align-content: center;
    vertical-align: center;
}
    </style>
    <script >
    function numberButtonClicked(number) {
        var currentNumber = document.getElementById("tableNumber").value;
        currentNumber = currentNumber + number;
        document.getElementById("tableNumber").value = currentNumber;

    }
    
    </script>
</head>
<body>
<div class="panel">
        <h3>Add the Table Number</h3>
        <form action="addtable" method="post">
        <input class="tableno" type="text" id="tableNumber" name="tableNumber">
        <table>
            <tr>
                <td>
                    <button class="b" type="button" onclick=numberButtonClicked(1)>1</button>
                </td>
                <td>
                    <button  class="b"type="button" onclick=numberButtonClicked(2)>2</button>
                </td>
                <td>
                    <button class="b" type="button" onclick=numberButtonClicked(3)>3</button>
                </td>
            </tr>
            <tr >
                <td>
                    <button class="b" type="button" onclick=numberButtonClicked(4)>4</button>
                </td>
                <td>
                    <button class="b" type="button" onclick=numberButtonClicked(5)>5</button>
                </td>
                <td>
                    <button class="b" type="button" onclick=numberButtonClicked(6)>6</button>
                </td>
            </tr>
            <tr>
                <td>
                    <button class="b" type="button" onclick=numberButtonClicked(7)>7</button>
                </td>
                <td>
                    <button class="b" type="button" onclick=numberButtonClicked(8)>8</button>
                </td>
                <td>
                    <button class="b" type="button" onclick=numberButtonClicked(9)>9</button>
                </td>
            </tr>
        </table>

		
		<button class="registerbtn" type ="submit">Register Table</button>
		</form>
            
    </div>



</body>
</html>