1>c program for priority cpu shedulling algorithm

#include <stdio.h>

struct Process {
    int pid;
    int burst_time;
    int priority;
    int waiting_time;
    int turnaround_time;
};

void sortByPriority(struct Process proc[], int n) {
    int i, j;
    struct Process temp;
    for (i = 0; i < n - 1; i++) {
        for (j = i + 1; j < n; j++) {
            if (proc[i].priority > proc[j].priority) {
                temp = proc[i];
                proc[i] = proc[j];
                proc[j] = temp;
            }
        }
    }
}

void calculateWaitingTime(struct Process proc[], int n) {
    proc[0].waiting_time = 0;
    for (int i = 1; i < n; i++) {
        proc[i].waiting_time = proc[i-1].waiting_time + proc[i-1].burst_time;
    }
}

void calculateTurnaroundTime(struct Process proc[], int n) {
    for (int i = 0; i < n; i++) {
        proc[i].turnaround_time = proc[i].waiting_time + proc[i].burst_time;
    }
}

void calculateAverageTimes(struct Process proc[], int n) {
    float total_waiting_time = 0, total_turnaround_time = 0;
    for (int i = 0; i < n; i++) {
        total_waiting_time += proc[i].waiting_time;
        total_turnaround_time += proc[i].turnaround_time;
    }
    printf("\nAverage Waiting Time: %.2f", total_waiting_time / n);
    printf("\nAverage Turnaround Time: %.2f\n", total_turnaround_time / n);
}

void displayProcesses(struct Process proc[], int n) {
    printf("Process\tPriority\tBurst Time\tWaiting Time\tTurnaround Time\n");
    for (int i = 0; i < n; i++) {
        printf("%d\t%d\t\t%d\t\t%d\t\t%d\n", proc[i].pid, proc[i].priority, proc[i].burst_time, proc[i].waiting_time, proc[i].turnaround_time);
    }
}

int main() {
    int n;
    
    printf("Enter the number of processes: ");
    scanf("%d", &n);
    
    struct Process proc[n];
    
    for (int i = 0; i < n; i++) {
        proc[i].pid = i + 1;
        printf("Enter burst time for process %d: ", proc[i].pid);
        scanf("%d", &proc[i].burst_time);
        printf("Enter priority for process %d: ", proc[i].pid);
        scanf("%d", &proc[i].priority);
    }
    
    sortByPriority(proc, n);
    calculateWaitingTime(proc, n);
    calculateTurnaroundTime(proc, n);
    
    displayProcesses(proc, n);
    calculateAverageTimes(proc, n);
    
    return 0;
}

2>
write a program to find sum , sub , mul, div of two nos. using switch case using shell programing 
#!/bin/bash

# Prompt the user to enter two numbers
echo "Enter two numbers:"
read num1 num2

# Display the operation choices
echo "Choose an operation:"
echo "1) Addition"
echo "2) Subtraction"
echo "3) Multiplication"
echo "4) Division"
read choice

# Perform the chosen operation using case statement
case $choice in
    1) result=$((num1 + num2))
       echo "Sum: $result" ;;
    2) result=$((num1 - num2))
       echo "Difference: $result" ;;
    3) result=$((num1 * num2))
       echo "Product: $result" ;;
    4) 
       if [ $num2 -ne 0 ]; then
           result=$((num1 / num2))
           echo "Quotient: $result"
       else
           echo "Error: Division by zero is not allowed."
       fi ;;
    *) echo "Invalid choice" ;;
esac
