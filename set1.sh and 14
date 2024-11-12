#include <iostream>
#include <unistd.h>
using namespace std;

int main() {
    
    pid_t pid = fork();

    if (pid < 0) {
        
        cerr << "Fork failed!" << endl;
        return 1;
    } else if (pid == 0) {
        
        cout << "Child Process:" << endl;
        cout << "Child PID: " << getpid() << endl;
        cout << "Parent PID: " << getppid() << endl;
    } else {
        
        cout << "Parent Process:" << endl;
        cout << "Parent PID: " << getpid() <<endl;
        cout << "Child PID: " << pid <<endl;
    }

    return 0;
}
