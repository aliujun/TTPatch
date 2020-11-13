#!/bin/bash

################################################################################
# Print help information
################################################################################
cleanup_before_exit(){
	cd ${OriginalDir}
}

################################################################################
# Print a line of information in color red
################################################################################
print_info_in_red(){
    echo -e "\033[31m ${1} \033[0m"
}

################################################################################
# Print a line of information in color green
################################################################################
print_info_in_green(){
    echo -e "\033[32m ${1} \033[0m"
}

################################################################################
# Print a warning
################################################################################
print_error_and_exit(){
    print_info_in_red "${1}!!!"
	cleanup_before_exit
    exit 1
}

################################################################################
# Check the execution result of the previous command, and exit with 1 if there's
# any error
################################################################################
show_result(){
	if [[ ${1} = 0 ]]; then
        echo "████████╗████████╗██████╗  █████╗ ████████╗ ██████╗██╗  ██╗"
        echo "╚══██╔══╝╚══██╔══╝██╔══██╗██╔══██╗╚══██╔══╝██╔════╝██║  ██║"
        echo "   ██║      ██║   ██████╔╝███████║   ██║   ██║     ███████║"
        echo "   ██║      ██║   ██╔═══╝ ██╔══██║   ██║   ██║     ██╔══██║"
        echo "   ██║      ██║   ██║     ██║  ██║   ██║   ╚██████╗██║  ██║"
        echo "   ╚═╝      ╚═╝   ╚═╝     ╚═╝  ╚═╝   ╚═╝    ╚═════╝╚═╝  ╚═╝"
        print_info_in_green "-----------------------------------------------------------"
        print_info_in_green "🎉 $2 successful !!!"
        print_info_in_green "-----------------------------------------------------------"
    else
        print_info_in_red "======================================================"
        print_info_in_red "== $*: failed!!!"
        print_info_in_red "======================================================"
		cleanup_before_exit
        exit 1
    fi
}