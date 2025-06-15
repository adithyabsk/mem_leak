#include <iostream>

int main() {
    // Allocate memory but never free it
    int* ptr = new int[100];
    
    // Use the allocated memory
    for (int i = 0; i < 100; i++) {
        ptr[i] = i;
    }
    
    std::cout << "Program ran successfully\n";
    
    // Memory leak: ptr is never deleted
    return 0;
}