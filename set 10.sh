#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <syslog.h>
#include <signal.h>

void create_daemon() {
    pid_t pid;

    // Fork off the parent process
    pid = fork();

    // If fork failed, exit
    if (pid < 0) {
        exit(EXIT_FAILURE);
    }

    // If we got a good PID, exit the parent process
    if (pid > 0) {
        exit(EXIT_SUCCESS);
    }

    // Set file permissions to 0 to prevent unexpected file access
    umask(0);

    // Create a new session ID for the child process
    if (setsid() < 0) {
        exit(EXIT_FAILURE);
    }

    // Catch, ignore and handle signals (here, for example, SIGCHLD)
    signal(SIGCHLD, SIG_IGN);

    // Fork again to prevent the daemon from acquiring a terminal
    pid = fork();

    if (pid < 0) {
        exit(EXIT_FAILURE);
    }

    if (pid > 0) {
        exit(EXIT_SUCCESS);
    }

    // Change the working directory to root to avoid locking a directory
    chdir("/");

    // Close all open file descriptors
    for (int x = sysconf(_SC_OPEN_MAX); x >= 0; x--) {
        close(x);
    }

    // Open the syslog for logging
   
2>
#!/bin/bash

# Function to check if a number is prime
is_prime() {
    local num=$1
    if (( num <= 1 )); then
        return 1 # Not prime
    fi
    for ((i=2; i*i<=num; i++)); do
        if (( num % i == 0 )); then
            return 1 # Not prime
        fi
    done
    return 0 # Prime
}

# Prompt user for range
read -p "Enter the start of the range: " start
read -p "Enter the end of the range: " end

# Print all prime numbers in the range
echo "Prime numbers between $start and $end:"
for ((num=start; num<=end; num++)); do
    if is_prime "$num"; then
        echo -n "$num "
    fi
done
echo ""

