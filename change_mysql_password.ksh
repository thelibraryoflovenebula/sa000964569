#! /bin/ksh
#
#
stty -echo
 echo -n "Enter new MySQL password> ";
            read NEW_PASS; # Read user imput from keyboard
stty echo
#
############################################################
# If you want to use this beyond the first password change #
# then change the pass variable to your current password.  #
############################################################
#By default this reads in the password from mysql_password.txt
#
PASS=`cat mysql_password.txt`
#
echo "SET PASSWORD = PASSWORD('${NEW_PASS}');" > sql-chng-pwd.cmd
#
mysql -u $USER -p${PASS} < sql-chng-pwd.cmd
mysql -u $USER -h 'csunix.mohawkcollege.ca' -p${PASS} < sql-chng-pwd.cmd
#
rm -f sql-chng-pwd.cmd
#
echo ""
echo "Password changed."
echo ""
#
exit
