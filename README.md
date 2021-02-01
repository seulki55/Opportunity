# README.md

* Stata tips to avoid hardcoded paths  
https://reifjulian.github.io/guide/
    * Find a list of the eligible paths for profile.do file by typing `adopath` at the Stata 
    * Create or update profile.do file by adding the following globals (example)
    ```
    global HPCC_Drive "N:"
    global DatasetProcessor_Path "D:/Projects/DatasetProcessor"
    global DatasetProcessor_Cache "D:/Projects/DatasetProcessor/.cache"
    ```
    * Use globals in your code as follows (example)
    ```
    local projectFolder "$DatasetProcessor_Path/NLSY/NLSY97"
    local dataFolder "$HPCC_Drive/NLSY/NLSY97/rawData"
