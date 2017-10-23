#!/bin/bash 

show_menu()

{

    NORMAL=`echo "\033[m"`

    MENU=`echo "\033[36m"` #Cyan

    NUMBER=`echo "\033[97m"` #white

    FGRED=`echo "\033[34m"`

    MAGENTA_TEXT=`echo "\033[35m"`

    ENTER_LINE=`echo "\033[33m"`

    echo -e "${MENU}**********************H1B APPLICATIONS***********************${NORMAL}"

    echo -e "${MENU}**${NUMBER} 1) ${MENU} Is the number of petitions with Data Engineer job title increasing over time?${NORMAL}"

    echo -e "${MENU}**${NUMBER} 2) ${MENU} Find top 5 job titles who are having highest growth in applications. ${NORMAL}"

    echo -e "${MENU}**${NUMBER} 3) ${MENU} Which part of the US has the most Data Engineer jobs for each year? ${NORMAL}"

    echo -e "${MENU}**${NUMBER} 4) ${MENU} find top 5 locations in the US who have got certified visa for each year.${NORMAL}"
 
    echo -e "${MENU}**${NUMBER} 5)   ${MENU} Which industry has the most number of Data Scientist positions?${NORMAL}"

    echo -e "${MENU}**${NUMBER} 6)   ${MENU} Which top 5 employers file the most petitions each year? ${NORMAL}"

    echo -e "${MENU}**${NUMBER} 7) ${MENU} Find the most popular top 10 job positions for H1B visa applications for each year? (for all the applications)${NORMAL}"

    echo -e "${MENU}**${NUMBER} 8) ${MENU} Find the most popular top 10 job positions for H1B visa applications for each year? (for only certified applications)${NORMAL}"

    echo -e "${MENU}**${NUMBER} 9)   ${MENU} Find the percentage and the count of each case status on total applications for each year. Create a graph depicting the pattern of All the cases over the period of time.${NORMAL}"
 
    echo -e "${MENU}**${NUMBER} 10)   ${MENU} Create a bar graph to depict the number of applications for each year${NORMAL}"

    echo -e "${MENU}**${NUMBER} 11)   ${MENU}Find the average Prevailing Wage for each Job for each Year (take part time and full time separate) arrange output in descending order${NORMAL}"

    echo -e "${MENU}**${NUMBER} 12)   ${MENU} Which are employers who have the highest success rate in petitions more than 70% in petitions and total petions filed more than 1000?${NORMAL}"

    echo -e "${MENU}**${NUMBER} 13)  ${MENU} Which are the top 10 job positions which have the  success rate more than 70% in petitions and total petitions filed more than 1000? ${NORMAL}"

    echo -e "${MENU}**${NUMBER} 14)  ${MENU}Export result for option no 10 to MySQL database.${NORMAL}"

    echo -e "${MENU}*********************************************${NORMAL}"

    echo -e "${ENTER_LINE}Please enter a menu option and enter or ${MAGENTA_TEXT}enter to exit. ${NORMAL}"

    read opt

}

function option_picked() 

{

    COLOR='\033[01;32m' # bold green

    RESET='\033[00;00m' # normal white

    MESSAGE="$1"  #modified to post the correct option selected

    echo -e "${COLOR}${MESSAGE}${RESET}"

}

clear

show_menu

	while [ opt != '' ]

    do

    if [[ $opt = "" ]]; then 

            exit;

    else

        case $opt in

        1) clear;
        option_picked "1 a) Is the number of petitions with Data Engineer job title increasing over time?";
	        	
	        	
		hadoop fs -cat /MapReduce/DataEngineerGrowthOutput/p*
                show_menu;
        ;;

        2) clear;

        option_picked "1 b) Find top 5 job titles who are having highest growth in applications. ";
                pig /home/hduser/Downloads/H1Project/question1b.pig
		hadoop fs -cat /h1b_project/pig/question1b/p*
                show_menu;
        ;;  

        3) clear;

        option_picked "2 a) Which part of the US has the most Data Engineer jobs for each year?";
		       
	       
	        hadoop fs -cat /MapReduce/USPartDataEngineerOutput/p*	
                show_menu;
        ;;

	    4) clear;

        option_picked "2 b) find top 5 locations in the US who have got certified visa for each year.";
	    hive -f /home/hduser/Downloads/H1Project/question2b.sql 
            
            show_menu;
        ;;  

	    5) clear;

        option_picked "3) Which industry has the most number of Data Scientist positions?";
              
              
	      hadoop fs -cat /MapReduce/DataScientistOutput/p*	
              show_menu;
        ;;

        6) clear;

        option_picked "4)Which top 5 employers file the most petitions each year?";
		
             
	        hadoop fs -cat /MapReduce/Top5EmployeesOutput/p*	
                show_menu;
        ;;

        7) clear;

        option_picked "5 a) Find the most popular top 10 job positions for H1B visa applications for each year?  (for all the applications)";
                		
                hive -f /home/hduser/Downloads/H1Project/question5a.sql
                	
	        
                show_menu;
        ;;


        8) clear;

        option_picked "5 b) Find the most popular top 10 job positions for H1B visa applications for each year?  (for only certified applications)";
              	
                
                hive -f /home/hduser/Downloads/H1Project/question5b.sql
	        
                show_menu;
        ;;

        9) clear;

	option_picked "6) Find the percentage and the count of each case status on total applications for each year. Create a graph depicting the pattern of All the cases over the period of time.";
                 pig /home/hduser/Downloads/H1Project/question6.pig
		hadoop fs -cat /h1b_project/pig/question6/p*
                show_menu;
        ;;

        10) clear;

        option_picked "7) Create a bar graph to depict the number of applications for each year";
		hive -e "select year,count(*) as count_all from h1b_project.h1b_final group by year order by year;"
                show_menu;
        ;;

        11) clear;

        option_picked "8) Find the average Prevailing Wage for each Job for each Year (take part time and full time separate) arrange output in descending order";
	        
                hive -f /home/hduser/Downloads/H1Project/question8.sql
                           	
                show_menu;
        ;;

	12) clear;

	option_picked "9) Which are   employers who have the highest success rate in petitions more than 70% in petitions and total petions filed more than 1000?"
               
                pig /home/hduser/Downloads/H1Project/question9.pig
		hadoop fs -cat /h1b_project/pig/question9/p*
                show_menu;
        ;;

	13) clear;
		
        option_picked "10) Which are the top 10 job positions which have the  success rate more than 70% in petitions and total petitions filed more than 1000?"

		pig /home/hduser/Downloads/H1Project/question10.pig
		hadoop fs -cat /h1b_project/pig/question10/p*
                show_menu;
        ;;

	14) clear;

	option_picked "11) Export result for question no 10 to MySql database."
     
                
                
                echo -e '\n\nDisplay contents from MySQL Database.\n\n'
                echo -e '\n10) Which are the top 10 job positions that have  success rate more than 70% in petitions and total petitions filed more than 1000?\n\n'
                mysql -u root -p '' -e 'select * from h1b_project.question11';
                show_menu;
        ;;

		\n) exit;   

		;;

        *) clear;

        option_picked "Pick an option from the menu";
        show_menu;
        ;;

    esac

fi

done
