#!/bin/bash

# Welcome to the Mysterious Script Challenge!
# Your task is to unravel the mystery behind this script and understand what it does.
# Once you've deciphered its objective, your mission is to improve the script by adding comments and explanations for clarity.

# DISCLAIMER: This script is purely fictional and does not perform any harmful actions.
# It's designed to challenge your scripting skills and creativity.

# The Mysterious Function
# The Mysterious Function encrypts the contents of "input_file" and store the cryptic text in "output_file"
mysterious_function() {
    local input_file="$1"
    local output_file="$2"
    
    # Using "tr" to translate each character from all lines in "input_file" and write them to "output_file"
    # The Translation mechanism works as all alphabets from A-M or a-m are replced with N-Z or n-z respectively
    # Similarly all alphabets from "N-Z or n-z" are "replced" with "A-M or a-m" respectively, one way to encrypt it.
    # Example if inputfile contains "ABNOZabnoz", the output_file will contain "NOABMnoabm"
    # This encrypted text is written into output_file.
    tr 'A-Za-z' 'N-ZA-Mn-za-m' < "$input_file" > "$output_file"

    # Using "rev" utility, the encrypted lines are written into "reversed_temp.txt" by reversing the order of letters in each line
    # That means if output file contains NOABMnoabm the "reversed_temp.txt" contains mbaonMBAON
    rev "$output_file" > "reversed_temp.txt"

    # Generates a random number between 1-10 (inclusive).
    # random_number=$(( ( RANDOM % 10 ) + 1 )) 
    # Changed above existing line to below line to improve performance. We will discuss how it improves after the execution of loop.
    random_number=$(( ( RANDOM % 2 ) + 1 )) 
    echo $random_number

    # Mystery loop:
    # Loop iterations for "generated random_number" of times 
    #This loop does not actually affect the output_file. It just plays around with "reversed_temp.txt" and manipulates text in it.
    for (( i=0; i<$random_number; i++ )); do
        # Uses "rev" utility to write lines in "reversed_temp.txt" into "temp_rev.txt" by reversing order of letters in each line.
        # That means it contains the original content from "output_file"
        rev "reversed_temp.txt" > "temp_rev.txt"

        # Using "tr" to translate each character from all lines in "temp_rev.txt" and write them to "temp_enc.txt"
        # The Translation mechanism works as all alphabets from A-M or a-m are replced with N-Z or n-z respectively
        # Similarly all alphabets from "N-Z or n-z" are "replced" with "A-M or a-m" respectively, one way to encrypt it.
        # Example if inputfile contains "ABNOZabnoz", the "temp_enc.txt" will contain "NOABMnoabm"
        # This encrypted text is written into "temp_enc.txt".
        tr 'A-Za-z' 'N-ZA-Mn-za-m' < "temp_rev.txt" > "temp_enc.txt"

        # Renaming the "temp_enc.txt" to "reversed_temp.txt"
        mv "temp_enc.txt" "reversed_temp.txt"
    done
    # The main takeaway after the execution of this loop is-
    # If "random_number is odd : "reversed_temp.txt" contains same content as of "input_file"
    # If "random_number is even : "reversed_temp.txt" contains content as of "output_file" but order of letters is reversed in each line.
    # As the loop output has only two possibilities based on "random_number" is even or odd. We can just loop it once or twice to explore all possibilites.
    # Looping once or twice gives same output as lopping between (1-10) times as it comes down to if the random_number is even or odd.
    # So performance will be improved.

    # Clean up temporary files
    rm "temp_rev.txt"

    # The mystery continues...
    # The script will continue with more operations that you need to figure out!
}

# Main Script Execution

# Check if two arguments are provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 <input_file> <output_file>"
    exit 1
fi

input_file="$1"
output_file="$2"

# Check if the input file exists
if [ ! -f "$input_file" ]; then
    echo "Error: Input file not found!"
    exit 1
fi

# Call the mysterious function to begin the process
# Calling the function to encrypt the content of input_file into output_file
mysterious_function "$input_file" "$output_file"

#Example output if input_file contains: ABCnop
    # output_file will contain : NOPabc
    # "reversed_temp.txt" will contain : ABCnop;  if "random_number" is odd or 1
    # "reversed_temp.txt" will contain : cbaPON;  if "random_number" is even or 2

# Display the mysterious output
# Eureka! The mysterious process is encrypting content of input_file into output_file
echo "The mysterious process is complete. Check the '$output_file' for the result!"
