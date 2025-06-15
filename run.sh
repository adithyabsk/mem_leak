#!/bin/bash

# Compile the C++ program
g++ -g leak.cpp -o leak

# Run Valgrind to detect memory leaks
valgrind --leak-check=full --show-leak-kinds=all ./leak
