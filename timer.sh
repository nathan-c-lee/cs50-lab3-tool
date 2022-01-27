#!/bin/bash

# Timer.sh is a bash script to automate runtime testing for CS50 Lab 3.
# Save this file in the same folder as the various .txt dataset files and
# sort program binary files included with this lab. Make sure to chmod +x!
# Run this script with no arguments, flags, or parameters.

# This script checks runtime on all 9 data set lists through each of the sort
# programs 10 times in total, then calculates an average runtime (in seconds)
# of each program on each data set. The results are output to the terminal in
# a table.

# This script was written by Nathan C. Lee <nathan.christopher.lee@gmail.com>
# 1/27/2022

lists=(sorted5000.txt sorted10000.txt sorted50000.txt random5000.txt random10000.txt random50000.txt reversed5000.txt reversed10000.txt reversed50000.txt)

s1sums=(0 0 0 0 0 0 0 0 0)
s2sums=(0 0 0 0 0 0 0 0 0)
s3sums=(0 0 0 0 0 0 0 0 0)

for h in {0..9}; do
    for i in {0..8}; do
    sort1=$({ time ./sort1 ${lists[$i]} >/dev/null; } 2>&1 | awk -F "m|s" '/real/ {print $2}')
    sort2=$({ time ./sort2 ${lists[$i]} >/dev/null; } 2>&1 | awk -F "m|s" '/real/ {print $2}')
    sort3=$({ time ./sort3 ${lists[$i]} >/dev/null; } 2>&1 | awk -F "m|s" '/real/ {print $2}')

    s1sums[$i]=$( echo "${s1sums[$i]} $sort1" | awk '{print $1+$2}')
    s2sums[$i]=$( echo "${s2sums[$i]} $sort2" | awk '{print $1+$2}')
    s3sums[$i]=$( echo "${s3sums[$i]} $sort3" | awk '{print $1+$2}')
    done
done

for i in {0..8}; do
s1averages[$i]=$( echo "${s1sums[$i]}" | awk '{printf "%0.3f", $1/10}')
s2averages[$i]=$( echo "${s2sums[$i]}" | awk '{printf "%0.3f", $1/10}')
s3averages[$i]=$( echo "${s3sums[$i]}" | awk '{printf "%0.3f", $1/10}')
done

echo
echo "Each value in the table represents the average of 10 tests per sorting method, per list."
echo
echo "      ||sorted                      ||random                      ||reversed                    ||"
echo "      ||5000       10000     50000  ||5000       10000     50000  ||5000       10000     50000  ||"
echo "======||========|=========|=========||========|=========|=========||========|=========|=========||"
echo "sort1 || ${s1averages[0]}  |  ${s1averages[1]}  |  ${s1averages[2]}  || ${s1averages[3]}  |  ${s1averages[4]}  |  ${s1averages[5]}  || ${s1averages[6]}  |  ${s1averages[7]}  |  ${s1averages[8]}  ||"
echo "sort2 || ${s2averages[0]}  |  ${s2averages[1]}  |  ${s2averages[2]}  || ${s2averages[3]}  |  ${s2averages[4]}  |  ${s2averages[5]}  || ${s2averages[6]}  |  ${s2averages[7]}  |  ${s2averages[8]}  ||"
echo "sort3 || ${s3averages[0]}  |  ${s3averages[1]}  |  ${s3averages[2]}  || ${s3averages[3]}  |  ${s3averages[4]}  |  ${s3averages[5]}  || ${s3averages[6]}  |  ${s3averages[7]}  |  ${s3averages[8]}  ||"
echo "======||========|=========|=========||========|=========|=========||========|=========|=========||"
echo

exit
