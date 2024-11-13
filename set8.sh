1>write a program for switch case to input the bank account information of 3 person using shell programming

#!/bin/bash

# Function to input bank account information
input_account_info() {
    echo "Enter Account Number for Person $1:"
    read account_number
    echo "Enter Name for Person $1:"
    read name
    echo "Enter Balance for Person $1:"
    read balance
    echo "Account Number: $account_number, Name: $name, Balance: $balance"
}

# Menu to select which person's information to input
echo "Choose an option to input bank account information:"
echo "1) Person 1"
echo "2) Person 2"
echo "3) Person 3"
echo "4) Exit"
read choice

case $choice in
    1)
        echo "Entering information for Person 1"
        input_account_info 1
        ;;
    2)
        echo "Entering information for Person 2"
        input_account_info 2
        ;;
    3)
        echo "Entering information for Person 3"
        input_account_info 3
        ;;
    4)
        echo "Exiting..."
        ;;
    *)
        echo "Invalid choice. Please select a valid option."
        ;;
esac

2>fibonacci series
#!/bin/bash

echo "Enter the number of terms: "
read n

a=0
b=1

echo "The Fibonacci series up to $n terms is:"

for (( i=0; i<n; i++ ))
do
    echo -n "$a "
    next=$((a + b))
    a=$b
    b=$next
done

echo
