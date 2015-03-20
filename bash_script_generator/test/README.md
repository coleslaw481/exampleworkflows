Unit Testing
============

This directory contains unit tests written in BATS: Bash Automated Testing
System to test CHM Train Workflow.

BATS can be obtained from here:  https://github.com/sstephenson/bats

To run the main unit tests simply run the command below from this directory:

 bats .

test_helper.sh
--------------

This script should be included in each *.bats* file at the top of the *.bats*
file like so:

    load test_helper

This script contains several helper functions which are described below:

* *setup()*  Called before each @test.  The function sets some environment 
  variables and creates a temp directory as well as copies the *bin/* directory

* *teardown()* Called after each @test.  This function deletess the 
  temp directory

* *skipIfKeplerNotInPath()* Contains code to skip a test if kepler is 
  not in the path

* *echoArray()* Can be passed an array of text and it will output each 
  element of the array on its own line.


