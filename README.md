# List Compare #

Compares two input files, looking for matches by line.

Created by Sean McAllister

## Usage ##

    list_compare.pl [-h] -1 <first_file.txt> -2 <second_file.txt>

### Command line arguments ###

    -1 = First input file.
    -2 = Second input file.
    -h = Help file.

### Output files ###

    match.txt
    missingfrom1.txt
    missingfrom2.txt

**NOTE**: If you run `list_compare.pl` mutliple times in the same
  directory, these output files will be overwritten each time.
