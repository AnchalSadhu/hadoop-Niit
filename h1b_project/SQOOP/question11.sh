#11) Export result for question no 10 to MySql database.
#Create a Database in mysql and create a table in it as:
mysql -u root -p '' -e 'Create database h1b_project;use h1b_project;create table question11(job_title varchar(100),success_rate float,petitions int);';
#Create directory on HDFS having Question10 output(Already created during storagae of question 10 output i.e p*) as:
hadoop fs -mkdir -p  /h1b_project/Pig/question10
sqoop export --connect jdbc:mysql://localhost/question11 --username root --password '' --table question11 --update-mode allowinsert  --export-dir /h1b_project/Pig/question10/p* --input-fields-terminated-by '\t' ;
echo -e '\n\nDisplay contents from MySQL Database.\n\n'
echo -e '\n10) Which are the top 10 job positions that have  success rate more than 70% in petitions and total petitions filed more than 1000?\n\n'
mysql -u root -p '' -e 'select * from h1b_project.question11';
