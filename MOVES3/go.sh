Remember, we need to compile GO and rename output to be consistent with Windows' version.  There are two places for Go.
The GO must be compiled using configurations in MOVES3 source code folders and its executables should be renamed (i.e., not as bin/go or bin/gofmt).  
Please take a look at corresponding folder for MOVES2014b in

     /groups/deq/cascades/models/MOVES/statics_moves2014b/MOVES2014b/calc/go/ 

    In addition, take a look at the MOVESConfiguration.txt.orig and WorkerConfiguration.txt.orig for MOVES3 Windows version in

     /groups/deq/cascades/models/MOVES3/statics_moves3/Windows/

    Renaming executables is obvious from the two configuration files for Windows version.  
    Note that there are two go-related folders for MOVES3 in calc/ and in generators/.  Both of them must be locally compiled and renamed.  
    I have tried symbolic links to use the go executables located in /opt/apps/go/1.13.5/bin/ but it does not work.  

    Work on this problem and treat it as your top priority when you return from the break.  

# 
https://riptutorial.com/go/example/17006/go-build
env GOOS=linux go build externalgenerator.go