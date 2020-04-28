# ENEL373 Assignment
This repo is arranged in the same way that is expected for the ENEL373 2020 Assignment submission.
It is expected that students use this format while working on the assignment as it decreases the
number of files on Eng Git as well as the amount of storage used. Tutors will also expect this layout when helping you, we don't
want to clog up our computers with endless cached/sim/run files.

## Contents

- [1. The Layout](#1-the-layout)
- [2. Test-benches](#2-test-benches)
    - [Setting up your repository](#setting-up-your-repository)
- [3. Adding files to Vivado](#3-adding-files-to-Vivado)
- [3.1 Manually copying files](#31-manually-copying-files)
- [4. Help](#4-help)
- [5. Tools](#5-tools)
- [5.1 GHDL](#51-ghdl)
- [6. Authors](#6-authors)
- [TODO](#todo)

## 1. The Layout
Your file structure should look something like this:

<img alt="File structure" src="https://storage.googleapis.com/enle373students/templatestructure.png" width="500" height="auto"/>

## 2. Test-benches
As you should have seen, the assignment has been changed rather significantly due to COVID-19. As a result the 
ENEL373 Assignment has been changed significantly. This has affected the way that the assignment is being run, 
we will doing some of the marking using testbenches. We also hope that the examples that we give will help increase everyone's understanding of 
testbenches. These prepared testbenches can be found in the testbench [directory](testbenches/). More info 
about these testbenches can be found in the README of the testbench directory.

## Setting up your repository
Please use the commands below to setup your code inside this structure.
<!-- 
```console
user@device:~$ git clone https://eng-git.canterbury.ac.nz/enel373-2020/enel373-template.git
	# Note: this will clone this temple repository
    # Copy your .vhd and .xdc files into the appropriate folders
    
user@device:~$ cd enel373-template/
    # Navigate into the project directory to preform the rest of the commands

user@device:~$ git add .
	# This stages the files you just added for commit
    
user@device:~$ git commit -m "Added my project files to template"
	# This commits the changes to you local repository with the commit
    # message: "Added my project files to template"'
    
user@device:~$ git remote set-url origin https://eng-git.canterbury.ac.nz/enel373-2020/$YOUR_PROJECT
	# The project you cloned has the url of origin at:
    # "https://eng-git.canterbury.ac.nz/enel373-2020/enel373-template.git"
    # this is not the url for your group so this command changes that url to your groups project
    
user@device:~$ git push origin master
	# This command pushes all of your commits to the remote (Eng Git). This
    # command could fail as the current layout and this my be very different
    # if this occurs use the next command.
    
user@device:~$ git push -f origin master
	# This command uses the -f flag to force push to the remote repository
    # this overwrites the remote repository with the local one. Only do this
    # if the previous command fails
```
 -->
<img alt="Git Instructions for setting up your repo" src="https://storage.googleapis.com/enle373students/git-instructions-v3.png" width="auto" height="700"/>

## 3. Adding files to Vivado
There are two options for adding the git files into your project, the first is to do a manual copy, the second is to use Jesse's awesome script which is discussed further in the 
[Tools](#tools) section.

### 3.1 Manually copying files
To import your files open Vivado and create a new project and import your newly setup files into a Vivado project.
To assist with this there is a quick refresher found [here](wiki/vivado-setup.md). Note: For people not reading the refresher, make sure
you make the Vivado project in a different location on your computer to the source files and make sure the box is unchecked for `copy sources into project`

## 4. Help
The tutors will still be available to help you however, we will be moving to an online drop in session format within lab hours. If you have questions/concerns outside of lab times 
please post them on Learn, the tutors and lecturers are happy to answer your questions there.

<a name="tools"></a>

## 5. Tools
The wonderful Jesse Sheehan has very kindly written a python script that will automatically fix the paths for the Vivado `.xpr` files the source code for which can be found 
[here](https://github.com/jpsheehan/vivado-xpr-fixer). I have packaged the script and made it available on PyPI as a script so you can either run from source, 
the directions for which are available in Jesse's repository or use `pip`.

<img alt="File structure" src="https://storage.googleapis.com/enle373students/pip-install-fixed.png" width="auto" height="250"/>

Remember that to use this script you must have python installed. On Linux, install python using your preferred package manager.
On Windows, download python [here](https://www.python.org/downloads/windows/).
Note: The script has only been tested for Python3 (not Python 2), so make sure that is the version you have installed.

### 5.1 GHDL
For those interested there is a project called GHDL that allows you to compile VHDL files into C. This can make testing easier, however it is in no way expected for you to know 
about this. However if you would like to investigate this I will include a few links as it make it easier to automate and run VHDL test-benches on lower power machines or
 automated using CI/CD pipelines

-   [GHDL](https://github.com/ghdl/ghdl)
-   [GHDL Docker](https://github.com/ghdl/docker)

## 6. Authors
Jos Craw <jcr124@uclive.ac.nz> @jcr124

## TODO
-   Do we want to talk about GitLab issues?
-   Am I talking too much about the assignment?
-   Include adding testbench sources into a Vivado project. (Would look better once the test benches are done)
-   Should we add a .gitignore and a gitignore document
-   Note the link is not currently correct as the project is in my personal account, not the group
-   update testbench list with correct list of testbenches students are provided.
-   update to say that the students will make the testbench for the FSM we provide
-   I claim that we test every module with a testbench, as far as I'm aware this is not true? 
-   For the Quad four bit testbench I made the path relative, it looks like this should work but I haven't tested it [source](https://www.xilinx.com/support/answers/66843.html)
