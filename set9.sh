#include <stdio.h>

struct Process {
    int pid;         // Process ID
    int arrival_time;  // Arrival time
    int burst_time;   // Burst time
    int waiting_time;  // Waiting time
    int turnaround_time; // Turnaround time
};

void calculate_times(struct Process processes[], int n) {
    int current_time = 0;
    
    // Calculate waiting and turnaround times for each process
    for (int i = 0; i < n; i++) {
        // Waiting time = current time - arrival time
        processes[i].waiting_time = current_time - processes[i].arrival_time;

        // Ensure the waiting time is not negative
        if (processes[i].waiting_time < 0) {
            processes[i].waiting_time = 0;
            current_time = processes[i].arrival_time; // Adjust current time if process arrives later
        }

        // Turnaround time = waiting time + burst time
        processes[i].turnaround_time = processes[i].waiting_time + processes[i].burst_time;

        // Update current time
        current_time += processes[i].burst_time;
    }
}

void print_table(struct Process processes[], int n) {
    float total_waiting_time = 0;
    float total_turnaround_time = 0;

    printf("PID\tArrival\tBurst\tWaiting\tTurnaround\n");
    printf("------------------------------------------------\n");

    for (int i = 0; i < n; i++) {
        printf("%d\t%d\t%d\t%d\t%d\n", processes[i].pid, processes[i].arrival_time,
               processes[i].burst_time, processes[i].waiting_time, processes[i].turnaround_time);
        total_waiting_time += processes[i].waiting_time;
        total_turnaround_time += processes[i].turnaround_time;
    }

    printf("\nAverage Waiting Time: %.2f\n", total_waiting_time / n);
    printf("Average Turnaround Time: %.2f\n", total_turnaround_time / n);
}

int main() {
    int n;

    // Prompt for number of processes
    printf("Enter the number of processes: ");
    scanf("%d", &n);

    struct Process processes[n];

    // Input process details
    for (int i = 0; i < n; i++) {
        processes[i].pid = i + 1;
        printf("Enter arrival time and burst time for process %d: ", processes[i].pid);
        scanf("%d %d", &processes[i].arrival_time, &processes[i].burst_time);
    }

    // Calculate waiting and turnaround times
    calculate_times(processes, n);

    // Display results
    print_table(processes, n);

    return 0


2>
#!/bin/bash

# Function to calculate factorial
factorial() {
    local num=$1
    local fact=1

    # Loop to calculate factorial
    for ((i=1; i<=num; i++))
    do
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
