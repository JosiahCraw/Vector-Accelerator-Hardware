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

<img alt="File structure" src="https://storage.googleapis.com/enle373students/filestructure.png" width="500" height="auto"/>

## 2. Test-benches
As you should have seen, the assignment has been changed rather significantly due to the COVID-19 pandemic. As a result the ENEL373 Assignment has been changed significantly. This has affected the way that the marking is done, the tutors technical marking requirements are now in the form of available test-benches. This
has been done to hopefully make everyone's life a little easier. This means that we will be marking using the test-benches found in the test-benches [directory](testbenches/). More info about these test-benches can be found in this directory

## Setting up your repository
Please use the commands below to setup your code inside this structure.

<img alt="Git Instructions for setting up your repo" src="https://storage.googleapis.com/enle373students/git-instructions.png" width="auto" height="600"/>

## 3. Adding files to Vivado
There are two options for adding the git files into your project, the first is to do a manual copy, the second is to use Jesse's awesome script which is discussed further in the 
[Tools](#tools) section.

### 3.1 Manually copying files
To import your files open Vivado and create a new project and import your newly setup files into a Vivado project.
To assist with this there is a quick refresher found [here](wiki/vivado-setup.md). Note: For people not reading the refresher, make sure
you make the Vivado project in a different location on your computer to the source files and make sure the box is unchecked for `copy sources into project`

## 4. Help
The tutors will still be available to help you however, we will be moving to an online drop in session format within lab hours. If you have questions/concerns outside of lab times 
please post on the Learn forum the tutors and lecturers for the course are happy to answer your question there.

<a name="tools"></a>

## 5. Tools
The wonderful Jesse Sheehan has very kindly written a python script that will automatically fix the paths for the Vivado `.xpr` files the source code for which can be found 
[here](https://github.com/jpsheehan/vivado-xpr-fixer). I have packaged the script and made it available on PyPI as a script so you can either run from source, 
the directions for which are available in Jesse's repository or use `pip`.

<img alt="File structure" src="https://storage.googleapis.com/enle373students/pip-install-fixed.png" width="auto" height="250"/>

Remember that to use this script you must have python installed, for the Linux users install using your preferred package manager for Windows the download can be found [here](https://www.python.org/downloads/windows/) Note: The script has only been tested for Python3 so make sure that is the version you have installed.

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
