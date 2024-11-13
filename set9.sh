1>c program for FCFS CPU scheduling algorthim

#include <stdio.h>

// Structure to represent a process
struct Process {
    int id;
    int arrival_time;
    int burst_time;
    int waiting_time;
    int turnaround_time;
};

// Function to calculate waiting time and turnaround time for each process
void calculateTimes(struct Process processes[], int n) {
    int total_waiting_time = 0, total_turnaround_time = 0;
    int completion_time = 0;
    
    for (int i = 0; i < n; i++) {
        // Calculate waiting time
        if (completion_time < processes[i].arrival_time) {
            completion_time = processes[i].arrival_time;
        }
        processes[i].waiting_time = completion_time - processes[i].arrival_time;
        completion_time += processes[i].burst_time;
        
        // Calculate turnaround time
        processes[i].turnaround_time = processes[i].waiting_time + processes[i].burst_time;
        
        // Add to total times for calculating average
        total_waiting_time += processes[i].waiting_time;
        total_turnaround_time += processes[i].turnaround_time;
    }

    // Print results
    printf("Process\tArrival Time\tBurst Time\tWaiting Time\tTurnaround Time\n");
    for (int i = 0; i < n; i++) {
        printf("P%d\t\t%d\t\t%d\t\t%d\t\t%d\n",
            processes[i].id,
            processes[i].arrival_time,
            processes[i].burst_time,
            processes[i].waiting_time,
            processes[i].turnaround_time);
    }

    // Print average waiting and turnaround times
    printf("\nAverage Waiting Time: %.2f\n", (float)total_waiting_time / n);
    printf("Average Turnaround Time: %.2f\n", (float)total_turnaround_time / n);
}

int main() {
    int n;

    // Input number of processes
    printf("Enter the number of processes: ");
    scanf("%d", &n);

    struct Process processes[n];

    // Input arrival time and burst time for each process
    for (int i = 0; i < n; i++) {
        processes[i].id = i + 1;
        printf("Enter arrival time and burst time for Process P%d: ", processes[i].id);
        scanf("%d %d", &processes[i].arrival_time, &processes[i].burst_time);
    }

    // Calculate waiting and turnaround times
    calculateTimes(processes, n);

    return 0;
}
output 
Enter the number of processes: 3
Enter arrival time and burst time for Process P1: 0 5
Enter arrival time and burst time for Process P2: 2 3
Enter arrival time and burst time for Process P3: 4 2

Process Arrival Time    Burst Time   Waiting Time    Turnaround Time
P1         0            5            0              5
P2         2            3            3              6
P3         4            2            4              6

Average Waiting Time: 2.33
Average Turnaround Time: 5.67

2>fibonacci series
#!/bin/bash

echo "Enter the number of terms: "
read n

a=0
b=1

echo "The Fibonacci series up to $n terms is:"

for (( i=0; i<n; i++ ))
do
    echo -n "$a "
    next=$((a + b))
    a=$b
    b=$next
done

echo
