
set 18
1>write a program for round robin scheduling algorithm in c++
#include <iostream>
#include <vector>

using namespace std;

struct Process {
    int pid;
    int burst_time;
    int remaining_time;
    int waiting_time;
    int turnaround_time;
};

void roundRobinScheduling(vector<Process>& processes, int time_quantum) {
    int n = processes.size();
    int time = 0;
    bool done;

    while (true) {
        done = true;

        for (int i = 0; i < n; i++) {
            if (processes[i].remaining_time > 0) {
                done = false;
                if (processes[i].remaining_time > time_quantum) {
                    time += time_quantum;
                    processes[i].remaining_time -= time_quantum;
                } else {
                    time += processes[i].remaining_time;
                    processes[i].waiting_time = time - processes[i].burst_time;
                    processes[i].remaining_time = 0;
                }
            }
        }
        if (done) break;
    }

    for (int i = 0; i < n; i++) {
        processes[i].turnaround_time = processes[i].burst_time + processes[i].waiting_time;
    }
}

void calculateAverageTimes(const vector<Process>& processes) {
    float total_waiting_time = 0, total_turnaround_time = 0;
    int n = processes.size();

    for (const auto& process : processes) {
        total_waiting_time += process.waiting_time;
        total_turnaround_time += process.turnaround_time;
    }

    cout << "\nAverage Waiting Time: " << (total_waiting_time / n);
    cout << "\nAverage Turnaround Time: " << (total_turnaround_time / n) << endl;
}

void displayProcesses(const vector<Process>& processes) {
    cout << "Process\tBurst Time\tWaiting Time\tTurnaround Time\n";
    for (const auto& process : processes) {
        cout << process.pid << "\t" << process.burst_time << "\t\t"
             << process.waiting_time << "\t\t" << process.turnaround_time << "\n";
    }
}

int main() {
    int n, time_quantum;
    
    cout << "Enter the number of processes: ";
    cin >> n;
    cout << "Enter the time quantum: ";
    cin >> time_quantum;

    vector<Process> processes(n);

    for (int i = 0; i < n; i++) {
        processes[i].pid = i + 1;
        cout << "Enter burst time for process " << processes[i].pid << ": ";
        cin >> processes[i].burst_time;
        processes[i].remaining_time = processes[i].burst_time;
        processes[i].waiting_time = 0;
        processes[i].turnaround_time = 0;
    }

    roundRobinScheduling(processes, time_quantum);
    displayProcesses(processes);
    calculateAverageTimes(processes);

    return 0;
}

2>write a program for switch case to input the bank account information of 3 person using shell programming

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
