#1
# Function to find the greatest number
find_greatest() {
    num1=$1
    num2=$2
    num3=$3

    if (( $num1 >= $num2 && $num1 >= $num3 )); then
        echo "The greatest number is $num1"
    elif (( $num2 >= $num1 && $num2 >= $num3 )); then
        echo "The greatest number is $num2"
    else
        echo "The greatest number is $num3"
    fi
}

# Read the input numbers
read -p "Enter the first number: " num1
read -p "Enter the second number: " num2
read -p "Enter the third number: " num3

# Call the function with the input numbers
find_greatest $num1 $num2 $num3


#2
# Function to check if the year is a leap year
check_leap_year() {
    year=$1

    # Leap year conditions
    if (( year % 400 == 0 )); then
        echo "$year is a leap year."
    elif (( year % 100 == 0 )); then
        echo "$year is not a leap year."
    elif (( year % 4 == 0 )); then
        echo "$year is a leap year."
    else
        echo "$year is not a leap year."
    fi
}

# Read the input year
read -p "Enter a year: " year

# Call the function with the input year
check_leap_year $year
