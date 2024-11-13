#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>

int main() {
    pid_t pid;

    // Fork a child process
    pid = fork();

    if (pid < 0) {  // Fork failed
        fprintf(stderr, "Fork failed\n");
        return 1;
    }
    else if (pid == 0) {  // Child process
        printf("Child process: PID = %d\n", getpid());
        printf("Child process is running...\n");
        sleep(2);  // Simulate work with sleep
        printf("Child process finished\n");
        exit(0);
    }
    else {  // Parent process
        printf("Parent process: PID = %d\n", getpid());
        printf("Parent is waiting for the child to finish...\n");

        // Wait for child process to complete
        wait(NULL);

        printf("Child process completed. Parent process resumes.\n");
    }

    return 0;
}
2>
write a program for switch case to input the bank account information of 3 person using shell programming

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
