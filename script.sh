#!/bin/bash

#Creating the courses folder
mkdir courseList

#Creating a text file for each Course
for((i=1;i<=6;i++))
do 
	touch ./courseList/Term$i
done

#Term 1 courses
echo "BA001" >> ./courseList/Term1
echo "BA101" >> ./courseList/Term1
echo "BA113" >> ./courseList/Term1
echo "CS111" >> ./courseList/Term1
echo "IS171" >> ./courseList/Term1
echo "LH130" >> ./courseList/Term1
echo "LH135" >> ./courseList/Term1
echo "NC172" >> ./courseList/Term1

#Term 2 courses
echo "BA102" >> ./courseList/Term2
echo "CS143" >> ./courseList/Term2
echo "EC134" >> ./courseList/Term2
echo "GM111" >> ./courseList/Term2
echo "LH136" >> ./courseList/Term2
echo "NC133" >> ./courseList/Term2

#Term 3 courses
echo "BA201" >> ./courseList/Term3
echo "BA203" >> ./courseList/Term3
echo "BA216" >> ./courseList/Term3
echo "CE216" >> ./courseList/Term3
echo "CS202" >> ./courseList/Term3
echo "CS243" >> ./courseList/Term3

#Term 4 courses
echo "CE231" >> ./courseList/Term4
echo "CE243" >> ./courseList/Term4
echo "CS212" >> ./courseList/Term4
echo "CS244" >> ./courseList/Term4
echo "IS273" >> ./courseList/Term4
echo "IT291" >> ./courseList/Term4
echo "SE291" >> ./courseList/Term4

#Term 5 courses
echo "BA301" >> ./courseList/Term5
echo "BA304" >> ./courseList/Term5
echo "CS311" >> ./courseList/Term5
echo "CS321" >> ./courseList/Term5
echo "CS333" >> ./courseList/Term5
echo "CS352" >> ./courseList/Term5
echo "IT321" >> ./courseList/Term5

#Term 6 courses
echo "CS301" >> ./courseList/Term6
echo "CS305" >> ./courseList/Term6
echo "CS312" >> ./courseList/Term6
echo "CS322" >> ./courseList/Term6
echo "CS366" >> ./courseList/Term6
echo "Minor 1" >> ./courseList/Term6
echo "ProfTrain I" >> ./courseList/Term6

#Term 7 courses
echo "CS401" >> ./courseList/Term7
echo "CS445" >> ./courseList/Term7
echo "CS481" >> ./courseList/Term7
echo "Major 1" >> ./courseList/Term7
echo "Major 2	" >> ./courseList/Term7
echo "Minor 2	" >> ./courseList/Term7
echo "ProfTrain II	" >> ./courseList/Term7

#Term 8 courses
echo "CS402" >> ./courseList/Term8
echo "CS421" >> ./courseList/Term8
echo "CS451" >> ./courseList/Term8
echo "Major 3" >> ./courseList/Term8
echo "Major 4" >> ./courseList/Term8
echo "Minor 3" >> ./courseList/Term8
echo "ProfTrain III" >> ./courseList/Term8



read -p "Enter Student Name: " outputFolder
mkdir /home/ironhide/Desktop/$outputFolder
touch /home/ironhide/Desktop/$outputFolder/transcript.txt

read -n 1 -p "Enter Current Term: " currentTerm

for((i=1;i<=currentTerm;i++))
do
    mkdir /home/ironhide/Desktop/$outputFolder/Term$i
    file="./courseList/Term$i"
    while read -r -u 7 course
    do
        touch ~/Desktop/$outputFolder/Term$i/$course
        echo -e "\n $course"
        read -n 2 -e -p " 7th assesment grade: " seventh_Grade
        read -n 2 -e -p " 12th assesment grade: " twelvth_Grade
        read -n 2 -e -p " Semester work grade: " work_Grade
        read -n 2 -e -p " Final assesment grade: " final_Grade
        echo -e "7th grade= $seventh_Grade\n12th grade= $twelvth_Grade\nSemester Work grade= $work_Grade\nFinal grade= $final_Grade" >> ~/Desktop/$outputFolder/Term$i/$course
        total=$(($seventh_Grade+$twelvth_Grade+$work_Grade+$final_Grade))
        
        if [ "$total" -ge "95" ]; then
            grade='A+'
        elif [ "$total" -ge "90" ]; then
            grade='A'
        elif [ "$total" -ge "85" ]; then
            grade='A-'
        elif [ "$total" -ge "80" ]; then
            grade='B'
        elif [ "$total" -ge "75" ]; then
            grade='B+'
        elif [ "$total" -ge "70" ]; then
            grade='B-'
        elif [ "$total" -ge "65" ]; then
            grade='C+'
        elif [ "$total" -ge "60" ]; then
            grade='C'
        elif [ "$total" -ge "55" ]; then
            grade='C-'
        else
            grade='F'
        fi
        echo -e "$course = $grade" >> ~/Desktop/$outputFolder/transcript.txt
    done 7<"$file"
done


