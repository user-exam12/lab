#!/bin/bash

# Function to enter bank account information
enter_info() {
    local person_number=$1
    echo "Enter information for Person $person_number:"
    read -p "Enter Name: " name
    read -p "Enter Account Number: " account_number
    read -p "Enter Balance: " balance

    # Store the information in arrays
    names[$person_number]=$name
    account_numbers[$person_number]=$account_number
    balances[$person_number]=$balance
}

# Arrays to store information
declare -a names
declare -a account_numbers
declare -a balances

# Main Menu
while true; do
    echo "Choose an option:"
    echo "1. Enter information for Person 1"
    echo "2. Enter information for Person 2"
    echo "3. Enter information for Person 3"
    echo "4. Display all information"
    echo "5. Exit"
    read -p "Enter your choice: " choice

    case $choice in
        1)
            enter_info 1
            ;;
        2)
            enter_info 2
            ;;
        3)
            enter_info 3
            ;;
        4)
            echo "Displaying all bank account information:"
            for i in 1 2 3; do
                echo "Person $i:"
                echo "Name: ${names[$i]}"
                echo "Account Number: ${account_numbers[$i]}"
                echo "Balance: ${balances[$i]}"
                echo "----------------------"
            done
            ;;
        5)
            echo "Exiting..."
            break
            ;;
        *)
            echo "Invalid choice, please select an option from 1 to 5."
            ;;
    esac
done



2>
#!/bin/bash

# Function to calculate Fibonacci series
fibonacci() {
    local n=$1
    local a=0
    local b=1

    echo "Fibonacci series up to $n terms:"
    
    for ((i=0; i<n; i++))
    do
        echo -n "$a "
        # Update the next term in the series
        local next=$((a + b))
        a=$b
        b=$next
    done
    echo ""
}

# Prompt user for the number of terms
read -p "Enter the number of terms: " terms

# Check if the input is a non-negative integer
if [[ $terms =~ ^[0-9]+$ ]]; then
    fibonacci $terms
else
    echo "Please enter a valid non-negative integer."
fi
