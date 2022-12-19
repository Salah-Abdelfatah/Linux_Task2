# General Instructions
  mainmenu () {

        echo "Press i to add new contact"
        echo "Press v to view all contacts"
        echo "Press s to search for record"
        echo "Press e to delete all contacts"
        echo "Press d to delete one contact"
        echo "Press q to exit" 

# Read enter letter choice from user to select opreation needed
         read -p "Enter your choice: " userinput
         echo $userinput


}

# Call Main Menu 
mainmenu

#ask user to go to main menu or exit 
userchoice () {
        # check user choice to return to main menu or exit
                read -p  "to return to main menu press m, or press q for exit: " userinput
                if [ $userinput = m ]
                then
                        ./tasks.sh

                # exit from script
                elif [ $userinput = q  ]
                then
                        exit
                fi
}


# asking user to enter contact details and store it in database file
if [ $userinput = i ]
then
               echo "Please Enter your First Name, Last Name, Email, Phone Number ..!"

        # Let user enter there details 
        addcontact () {
                # read user contact details
                read -r  -p "Enter your First Name: " fname
                read -r  -p "Enter your Last Name: " lname
                read -r  -p "Enter your Email: " email
                read -r  -p "Enter your Phone Number: " pnumber

                echo "$fname" "$lname" "$email" "$pnumber" >> database.txt

                echo "Your contact has been saved..."

                # check user choice to return to main menu or exit
                userchoice
}

addcontact

#  shows all contacts with all info
elif [ $userinput = v ]
then
        cat database.txt
        if [ $userinput = m  ]
        then
             mainmenu
        fi

#  enter anything related to your search
elif [ $userinput = s ]
then
        # Read user input search query keyword 
        read -r -p "Enter your search keyword: " searchquery

        # Search result for keyword  
        grep -r -n $searchquery database.txt

        # check user choice to return to main menu or exit
        userchoice




# delete all records
elif [ $userinput = e ]
then
        # delete all records 
           > database.txt

# delete record related to search entry
elif [ $userinput = d ]
then
        # Read user input search query keyword 
          read -r -p "Enter your search keyword to delete related record: " searchquery

        # Search result for keyword and delete related record 
        grep -v $searchquery  database.txt > tmpfile && mv tmpfile database.txt



#terminate script
elif [ $userinput = q  ]
then
        exit
fi




