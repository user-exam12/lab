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
