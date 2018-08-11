#!/bin/bash
clear
echo "----------------------------"
echo "Select ROM:"
echo "----------------------------"
echo ""
echo "a. Lineage and Lineage-based ROMs"
echo "b. Omni"
echo "c. Validus"
echo ""
read -p "Choose rom: " answer
. patcher.sh common
while true
do
  case $answer in
   [aA1]* ) . patcher.sh microg
            break;;

   [bB2]* ) . patcher.sh omni
            break;;

   [cC3]* ) . patcher.sh validus
            . patcher.sh microg
            break;;

   * )      break;;
  esac
done

