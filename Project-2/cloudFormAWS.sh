#!/bin/bash
################################################################################
#                              cloudFormAWS.sh                                 #
#                                                                              #
# This script takes 3 arguments and creates/ updates a stack on AWS via        #
# CloudForamtion                                                               #
#                                                                              #
# Change History                                                               #
# 02/29/2020  Donko Dimov    Original code. 
#                                                                              #
#                                                                              #
################################################################################
################################################################################
################################################################################
#                                                                              #
#  Copyright (C) 2020 Donko Dimov                                              #
#                                                                              #
#  This program is free software; you can redistribute it and/or modify        #
#  it under the terms of the GNU General Public License as published by        #
#  the Free Software Foundation; either version 2 of the License, or           #
#  (at your option) any later version.                                         #
#                                                                              #
#  This program is distributed in the hope that it will be useful,             #
#  but WITHOUT ANY WARRANTY; without even the implied warranty of              #
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the               #
#  GNU General Public License for more details.                                #
#                                                                              #
#  You should have received a copy of the GNU General Public License           #
#  along with this program; if not, write to the Free Software                 #
#  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA   #
#                                                                              #
################################################################################
################################################################################
################################################################################

## Check if 3 arguments are provided
if [ $# -ne 3 ]; then
    echo "No arguments provided"
    exit 1
fi
echo "arguments found: $#"

## Check if a stack with this name exist already
aws cloudformation list-stacks --stack-status-filter CREATE_COMPLETE | grep -A 2 "\"$1\"" ; ec=$?; echo $ec

if [ $ec -eq 1 ]; then
    aws cloudformation create-stack \
    --stack-name $1 \
    --template-body file://$2 \
    --parameters file://$3 \
    --region=us-west-2 \
    --capabilities CAPABILITY_IAM
elif [ $ec -eq 0 ]; then
    aws cloudformation update-stack \
    --stack-name $1 \
    --template-body file://$2 \
    --parameters file://$3 \
    --region=us-west-2 \
    --capabilities CAPABILITY_IAM
fi
