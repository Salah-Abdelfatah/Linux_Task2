#!/usr/bin/bash

# General Instructions
 mainmenu () {
echo "Press i to add new contact"
echo "Press v to view all contacts"
echo "Press s to search for record"
echo "Press e to delete all contacts"
echo "Press d to delete one contact"
echo "Press q to exit" 

}

mainmenu

#ask user to go to main menu or exit 
userchoice () {
        # check user choice to return to main menu or exit
                read -p  "to return to main menu press m, or press q for exit: " userchoiceinput
                if [ $userchoiceinput = m ]
                then
                        mainmenu
                elif [ $userchoiceinput = q  ]
                then
                        exit

                fi
}


# Read enter letter choice from user to select opreation needed
read -p "Enter your choice: " userinput

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
        echo "you enteried s"


# delete all records
elif [ $userinput = e ]
then
        echo "you enteried e"

# delete record related to search entry
elif [ $userinput = d]
then
        echo "you enteried d"

#terminate script
elif [ $userinput = q  ]
then
        exit
fi
