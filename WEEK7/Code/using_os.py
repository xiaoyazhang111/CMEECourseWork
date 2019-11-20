""" This is blah blah"""

# Use the subprocess.os module to get a list of files and directories 
# in your ubuntu home directory 

# Hint: look in subprocess.os and/or subprocess.os.path and/or 
# subprocess.os.walk for helpful functions

import subprocess

subprocess.Popen("Rscript --verbose TestR.R > ../Results/TestR.Rout 2> ../Results/TestR_errFile.Rout", shell=True).wait()
subprocess.Popen("Rscript --verbose NonExistScript.R > ../Results/outputFile.Rout 2> ../Results/errorFile.Rout", shell=True).wait()

#################################
#~Get a list of files and 
#~directories in your home/ that start with an uppercase 'C'

# Type your code here:

# Get the user's home directory.
home = subprocess.os.path.expanduser("~")

# Create a list to store the results.
FilesDirsStartingWithC = []

# Use a for loop to walk through the home directory.

  
#################################
# Get files and directories in your home/ that start with either an 
# upper or lower case 'C'

# Type your code here:

#################################
# Get only directories in your home/ that start with either an upper or 
#~lower case 'C' 

# Type your code here:
