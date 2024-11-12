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
