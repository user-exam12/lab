1>
#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

// Function that will be executed by each thread
void* print_message(void* arg) {
    int thread_id = *(int*)arg;
    printf("Hello from thread %d\n", thread_id);
    free(arg); // Free the dynamically allocated memory for the thread ID
    return NULL;
}

int main() {
    pthread_t threads[5]; // Array to hold thread identifiers
    int num_threads = 5;

    // Create threads
    for (int i = 0; i < num_threads; i++) {
        int* thread_id = malloc(sizeof(int)); // Allocate memory to store thread ID
        *thread_id = i + 1; // Set the thread ID

        if (pthread_create(&threads[i], NULL, print_message, thread_id) != 0) {
            perror("Failed to create thread");
            return 1;
        }
    }

    // Wait for all threads to finish
    for (int i = 0; i < num_threads; i++) {
        pthread_join(threads[i], NULL);
    }

    printf("All threads have finished execution.\n");
    return 0;
}
2>
#!/bin/bash

# Function to calculate factorial
factorial() {
    local num=$1
    local fact=1

    # Loop to calculate factorial
    for ((i=1; i<=num; i++)); do
        fact=$((fact * i))
    done

    echo $fact
}

# Prompt user for input
read -p "Enter a number: " number

# Check if the input is a non-negative integer
if [[ $number =~ ^[0-9]+$ ]]; then
    result=$(factorial $number)
    echo "Factorial of $number is: $result"
else
    echo "Please enter a non-negative integer."
fi
