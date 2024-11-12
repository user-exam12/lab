write a program to find sum , sub , mul, div of two nos. using switch case using shell programing 
#!/bin/bash

# Prompt the user to enter two numbers
echo "Enter two numbers:"
read num1 num2

# Display the operation choices
echo "Choose an operation:"
echo "1) Addition"
echo "2) Subtraction"
echo "3) Multiplication"
echo "4) Division"
read choice

# Perform the chosen operation using case statement
case $choice in
    1) result=$((num1 + num2))
       echo "Sum: $result" ;;
    2) result=$((num1 - num2))
       echo "Difference: $result" ;;
    3) result=$((num1 * num2))
       echo "Product: $result" ;;
    4) 
       if [ $num2 -ne 0 ]; then
           result=$((num1 / num2))
           echo "Quotient: $result"
       else
           echo "Error: Division by zero is not allowed."
       fi ;;
    *) echo "Invalid choice" ;;
esac
