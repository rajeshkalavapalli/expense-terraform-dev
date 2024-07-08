#!/bin/bash 
dnf install ansible -y 
cd /tmp 
git clone https://github.com/rajeshkalavapalli/expense-ansible-roles.git
cd expense-ansible-roles 
ansible-play main.yaml -e component=backend -e sql_password=ExpenseApp1


# for frontend 
ansible-play main.yaml -e component=backend 