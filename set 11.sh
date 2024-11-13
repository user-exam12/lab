1>implemenation of singal handling 
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <signal.h>

// Signal handler function for SIGINT
void handle_sigint(int sig) {
    printf("Caught SIGINT (signal %d). You pressed Ctrl+C.\n", sig);
}

// Signal handler function for SIGTERM
void handle_sigterm(int sig) {
    printf("Caught SIGTERM (signal %d). Terminating gracefully.\n", sig);
    exit(0); // Exit gracefully
}

int main() {
    // Register signal handlers
    signal(SIGINT, handle_sigint);   // Handle Ctrl+C (SIGINT)
    signal(SIGTERM, handle_sigterm); // Handle SIGTERM (terminate signal)

    printf("Signal handling example. Press Ctrl+C to trigger SIGINT.\n");
    printf("Send SIGTERM to this process (kill -SIGTERM <pid>) to terminate gracefully.\n");

    // Infinite loop to keep the program running
    while (1) {
        printf("Running...\n");
        sleep(3); // Sleep for 3 seconds in each loop iteration
    }

    return 0;
}

2>leap year
#!/bin/bash

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
