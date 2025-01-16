#!/bin/bash

# Define the default output filename variable
output="" 

# Initialize a variable to hold -D parameters
d_params=""

# Parse input arguments
while [[ $# -gt 0 ]]; do
  case $1 in
    -o)
      # Get the output filename argument
      output="$2"
      shift 2
      ;;
    -DP)
      # Directly append the quoted string, assuming it might contain multiple -D options
      d_params+="$2"
      shift 2
      ;;
    *)
      # Get the input mojo filename
      input="$1"
      shift
      ;;
  esac
done

# If no output filename is specified, set it to the input filename by default
if [ -z "$output" ]; then
  output="${input%.*}"
fi

# Construct mojoc command
cmd="./scripts/mojoc $d_params $input -lfurnace_connect -lsonic -L . -o $output"

# Print the command to be executed
echo "Executing command: $cmd"

# Execute the command 
$cmd

# Check return status
if [ $? -eq 0 ]; then
  echo "Command executed successfully"
else
  echo "Command execution failed" 
fi