#--------- IMPORT MODULS ---------------------------------------------------------------------------------
import sys
from hashlib  import sha3_224, sha3_256, sha3_384, sha3_224, sha3_384, sha3_512, shake_128, shake_256
from tkinter import S
import os
import subprocess
import random
import codecs


def compare_results(sim_result, ref_result):

    sim_result = sim_result.strip()
    ref_result = ref_result.strip()
    if (sim_result==ref_result):
        err=0
    else:
        err=1
        
    return err

#-------------------------------------------------------------------------------------------------------------------------------------------------

input_ref_filename = 'perm_ref_out.txt'
input_sim_filename = "perm_out_high_speed_core_vhdl.txt"
log_filename = "log_file.txt"



script_dir = os.path.abspath(os.path.join(os.path.dirname(__file__),"../test_vectors/"))
script_dir_OUT = os.path.abspath(os.path.join(os.path.dirname(__file__),"./LOG_FILES"))

input_ref_filename = os.path.join(script_dir, input_ref_filename)
input_sim_filename = os.path.join(script_dir, input_sim_filename)
log_filename= os.path.join(script_dir_OUT, log_filename)

#open and check input file
try:
	input_ref_filename = open(input_ref_filename, 'r')
except:
	print("error: fail in opening file " + input_ref_filename + "\n")
	sys.exit()
 
#open and check output file
try:
	input_sim_filename = open(input_sim_filename, 'r')
except:
	print("error: fail in opening file " + input_sim_filename + "\n")
	sys.exit()
	
# open and check log file
try:
	log_file = open(log_filename, 'w')
except:
	print("error: fail in opening file " + log_filename + "\n")
	sys.exit()


#----------------------------------------------------------------------------------------------------------------------------------------------

file_line = 0
error=0
tot_error=0

file1_lines = input_sim_filename.readlines()
file2_lines = input_ref_filename.readlines()
    
for i in range(len(file1_lines)):
    if file1_lines[i] != file2_lines[i]:
        log_file.write("Line " + str(i+1) + " doesn't match.")
        log_file.write("------------------------")
        log_file.write("File1: " + file1_lines[i])
        log_file.write("File2: " + file2_lines[i])
        error+=1

if(error==0):
    log_file.write("The two files are identical!")
    print("The two files are identical!")
    
           
input_ref_filename.close()
input_sim_filename.close()
log_file.close()