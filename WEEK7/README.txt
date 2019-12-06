LV1:
Created a self-standing script using the example in Jupyter.

LV2:
It modifys LV1.py that has the following features:
It takes arguments for the four LV model parameters r, a, z ,e from the command line:
LV2.py arg1 arg2 ... etc
And it runs the Lotka-Volterra model with prey density dependence rR(1−RK),
which changes the coupled ODEs to,dRdtdCdt=rR(1−RK)−aCR=−zC+eaCR

DrawFW.py:
It plots a food web network in a program file and saves the plotted network as a pdf.

blackbirds.py:
Read the file blackbirds.txt, replace \t's and \n's in code with a spaces.
It extends this script to make it captures the Kingdom, Phylum and Species
name for each species and prints it out to screen neatly.

using_os.py:
Uses the subprocess.os module to get a list of files and directories.
Gets a list of files and directories that start with an uppercase 'C'

