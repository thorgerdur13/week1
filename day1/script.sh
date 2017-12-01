 #!/bin/bash

clear
#displays the date and time at start of the script
date
#save for later the start time of the script
start=`date +%s`

#delete existing logs
[ -e script-success.log ] && rm script-success.log
[ -e script-error.log ] && rm script-error.log

#calculates the runtime of the script
runtime(){
	end=`date +%s`
 	echo "The script took $((end-start))s to run"
}

echo
#welcome message including current user's username
echo "Welcome, $USER"
echo "This script installs necessary programs and dependencies"
echo
#information about the system
echo "running on Linux system $(uname -a)"

#checking whether the user wants to install or not
echo "are you sure you want to continue y/n"
read input
if [[ $input == "y" || $input == "Y" ]]; then
	#Homebrew is needed to install Sublime and Git later
 	echo
 	echo "Installing Homebrew"
 	#install Homebrew
 	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
 	#if install is successful, display success message and log it in a success log
 	if  [[ $? -eq 0 ]]; then
 		echo "$(date) Homebrew install successful" | tee script-success.log
 	#if install is unsuccessful, display error message and log it in an error log
 	else
 		echo
 		echo "$(date) Error installing Homebrew" | tee script-error.log 
 		#delete the success log if it exists
 		[ -e script-success.log ] && rm script-success.log
 		#displays the runtime of the script
		echo $(runtime)
		#exit the script
		echo
		exit 1;
	fi

 	#Sublime is the chosen text editor to be installed
 	echo
 	echo "Installing Sublime text editor"
 	#install caskroom, which is an extension of Homebrew, where sublime can be accessed
 	brew install caskroom/cask/brew-cask
	brew tap caskroom/versions
	#install Sublime
	brew cask install sublime-text 
	#if install is successful, display success message and log it in a success log
	if  [[ $? -eq 0 ]]; then
		echo "$(date) Sublime install successful" | tee -a script-success.log 
	#if install is unsuccessful, display error message and log it in an error log
	else
		echo
		echo "$(date) Error installing Sublime" | tee -a script-error.log
		#delete the success log if it exists
		[ -e script-success.log ] && rm script-success.log
		#displays the runtime of the script
		echo $(runtime)
		#exit the script
		echo
		exit 1; 
	fi
	
	echo
	echo "Installing Git"
	#install Git
	brew install git
	#if install is successful, display success message and log it in a success log
	if [[ $? -eq 0 ]]; then
		echo "$(date) Git install successful" | tee -a script-success.log
	#if install is unsuccessful, display error message and log it in an error log
	else
		echo
		echo "$(date) Error installing Git" | tee -a script-error.log
		#delete the success log if it exists
		[ -e script-success.log ] && rm script-success.log
		#displays the runtime of the script
		echo $(runtime)
		#exit the script
		echo
		exit 1;
	fi
else
 	echo
 	echo "Installs cancelled, exiting script"
 	echo
 	#displays the runtime of the script
 	echo $(runtime)
 	#display the date and time at time of exit
 	date
 	echo
 	#exit the script
 	exit
fi

#if all installs were successful these messages are displayed
echo
echo "all programs were successfully installed"
echo
#displays the runtime of the script
echo $(runtime)
#display the date and time at time of exit
date
echo


