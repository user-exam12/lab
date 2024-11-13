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
2>factorial
#!/bin/bash

echo "Enter a number:"
read num

factorial=1
counter=1

while [ $counter -le $num ]
do
    factorial=$((factorial * counter))
    counter=$((counter + 1))
done

echo "The factorial of $num is $factorial"
