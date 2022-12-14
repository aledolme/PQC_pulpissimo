import random
import sys
import secrets


# defining number of test cases
N_data_test = 100 
N=136  #lenght of the desired input/2
filename = "inputs_SHA3.txt"  # filename

# opening input file
try:
    input_file = open(filename, 'w')
except:
    print("ERROR: unable to create the file " + filename + "\n")
    sys.exit()
    
    
for n in range(N_data_test):
#INPUTS GENERATION

    A=secrets.token_hex(N)
    input_file.write(format(A))
    input_file.write("\n-\n")
        
input_file.close()