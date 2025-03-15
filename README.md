# nasm-build-scripts
A batch file for Windows and a bash file for Linux.   
I made this so you don't have to use the NASM command and linker everytime to compile assembly code.

##
There are two scripts in the repo: 
- `asm.bat` (batch, for windows)
- `asm.sh` (bash, for linux)

You need to have nasm installed and a linker, too.   
If you are using the batch script, make sure you run it from `Visual Studio 2022 Developer Command Prompt`

##
The basic usage for the batch script is   
`asm <file (without .asm extension)>`   
For the bash script, use   
`bash asm.sh <file (without .asm extension)>`   

<br>
<br>
   
> Optionally, you can set an alias on Ubuntu using   
`echo "alias asm='bash asm.sh'" >> ~/.bashrc`
