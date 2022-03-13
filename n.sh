#!/bin/bash 

#script that use nmap to scan a single IP or a list, version and all ports
#creating a new file with the results

echo "IP or list"
 
 read $1 
   
   case $1 in 
              "ip")
                 echo"what is the IP"
                 read $2   #store the ip
                 echo "the file name where is going to be store the scan (without .txt)"
                 read $3
                 #check if there is any file with that name
                 #-e if the file exist 
         if [ -e $3];then 
               echo "File $3 exist"
               exit 1
          else 
              touch $3.txt
              
              nmap -p- -A $2 | tail -n 5| head -n -3 >> $3.txt
              
              fi
              ;;
             
              
               "list")
               
               echo "what is the file name: "
               read $4
               
               echo "the file name where is going to be store the scan (without .txt)"
               read $5
               
               for ip in $(cat $4): do  nmap -p- -A $2 | tail -n 5| head -n -3 >> $5.txt; done
               
               fi
               ;;
               
       esac
               
         
