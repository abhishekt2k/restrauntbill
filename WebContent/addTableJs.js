// console.log("ejets");



function numberButtonClicked(number) {
    console.log(number);
    var currentNumber = document.getElementById("tableNumber").value;
    currentNumber = currentNumber + number;
    document.getElementById("tableNumber").value = currentNumber;

}