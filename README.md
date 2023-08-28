# cs50-lab3-tool
### A bash tool for automating runtime testing on cs50 lab 3

Timer.sh is a shell script to automate runtime testing for CS50 Lab 3.
Save this timer.sh in the same directory as the various .txt dataset 
files and sort program binary files included with this lab.
Next, open a bash terminal in this directory and run ```chmod +x timer.sh```
to set timer.sh as an executable file.
Run this script with no arguments, flags, or parameters.

This script checks runtime on all 9 data set lists through each of the sort
programs 10 times in total, then calculates an average runtime (in seconds)
of each program on each data set. The results are output to the terminal in
a table.

This script was written by Nathan C. Lee <nathan.christopher.lee@gmail.com>
1/27/2022
