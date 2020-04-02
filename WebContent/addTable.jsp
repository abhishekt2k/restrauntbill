<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Hello, world!</title>
    <link rel="stylesheet" href="../ResBill/../resources/addtable.css">
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
        <input type="text" id="tableNumber" name="tableNumber">
        <table>
            <tr>
                <td>
                    <button type="button" onclick=numberButtonClicked(1)>1</button>
                </td>
                <td>
                    <button type="button" onclick=numberButtonClicked(2)>2</button>
                </td>
                <td>
                    <button type="button" onclick=numberButtonClicked(3)>3</button>
                </td>
            </tr>
            <tr>
                <td>
                    <button type="button" onclick=numberButtonClicked(4)>4</button>
                </td>
                <td>
                    <button type="button" onclick=numberButtonClicked(5)>5</button>
                </td>
                <td>
                    <button type="button" onclick=numberButtonClicked(6)>6</button>
                </td>
            </tr>
            <tr>
                <td>
                    <button type="button" onclick=numberButtonClicked(7)>7</button>
                </td>
                <td>
                    <button type="button" onclick=numberButtonClicked(8)>8</button>
                </td>
                <td>
                    <button type="button" onclick=numberButtonClicked(9)>9</button>
                </td>
            </tr>
        </table>

		
		<button type ="submit">Register Table</button>
		</form>
            
    </div>



</body>
</html>