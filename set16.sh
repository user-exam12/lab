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

2>wap to print all prime no. in a range using shell progromimg 
write a program to print all the prime nos in a range using shell programing 

#!/bin/bash

# Prompt the user to enter the range (start and end)
echo "Enter the start of the range:"
read start
echo "Enter the end of the range:"
read end

echo "Prime numbers between $start and $end are:"

# Function to check if a number is prime
is_prime() {
    local num=$1
    if [ "$num" -le 1 ]; then
        return 1 # Not prime
    fi
    for (( i=2; i*i<=num; i++ )); do
        if (( num % i == 0 )); then
            return 1 # Not prime
        fi
    done
    return 0 # Prime
}

# Loop through the range and print primes
for (( num=start; num<=end; num++ )); do
    if is_prime $num; then
        echo "$num"
    fi
done
