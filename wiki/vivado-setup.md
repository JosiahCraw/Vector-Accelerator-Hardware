# Setting up Vivado use this template
This is a quick run through of how to create a new Vivado project and import your source code from the git repository that you made earlier

## Steps
1. [Step 1](#1-create-a-new-project)
2. [Step 2](#2-configure-project)
3.
4.
5.


## 1. Create a new Project
<img alt="Creating a new Vivado Project" src="https://storage.googleapis.com/enle373students/create-project.png" width="auto" height="auto"/>

Launch Xilinx Vivado and click `Create Project`. Then click `Next >`.

<img alt="Creating a new Vivado Project" src="https://storage.googleapis.com/enle373students/new-project-path.png" width="auto" height="auto"/>
Give the project a sensible name and location, as I have done in the example shown above.

NOTE: This project is in a different location to my ENEL373-Template folder which is in `/home/USER/Projects/ENEL373-Template`.
This is intentional.

## 2. Configure Project
<img alt="Creating a new Vivado Project" src="https://storage.googleapis.com/enle373students/rtl-project.png" width="auto" height="auto"/>

Specify the project type as `RTL Project`.

## 3. Import Sources
<img alt="Creating a new Vivado Project" src="https://storage.googleapis.com/enle373students/import_sources.png" width="auto" height="auto"/>

Import your existing `.vhd` sources from your new repo folder using 'Add Files'. NOTE: That the `Copy sources into project` box is NOT ticked, this means that the project will update the files in the 
git folder without adding all of the rubbish that Vivado normally adds.

Also set the `Target language` and `Simulator language` both to `VHDL`.

## 4. Import Constraints
<img alt="Creating a new Vivado Project" src="https://storage.googleapis.com/enle373students/import-constraints.png" width="auto" height="auto"/>

Follow the same process for the constraints file. NOTE: Same as above the `Copy sources into project` box is not ticked

## 5. Configure Board
<img alt="Creating a new Vivado Project" src="https://storage.googleapis.com/enle373students/board-config.png" width="auto" height="auto"/>

Finally select the correct board. We want `xc7a100tcsg324-3`

## 6. Wrap up
Your project and repository should now be set up correctly if I left anything out please tell me, one of the other tutors or Ciaran. Don't hesitate to ask myself, the other tutors or 
Ciaran questions about any problem you many be having. We are here to help and know this is a difficult adjustment. Please use the forum for questions, that means that everyone can benefit from the answers. We will also see you in the labs next semester.

## Author
Jos Craw <jcr124@uclive.ac.nz>
