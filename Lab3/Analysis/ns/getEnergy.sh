#!/bin/bash


nss=1
nsf=10
#---------------------------------------------------------------------------
echo ".............. START ANALYZING ....................."
#---------------------------------------------------------------------------

for (( i=${nss}; i<=${nsf}; i++ ))
do 
      echo "*** ANALYZING ${i}ns ***"
#Column number 7 should be multiplied by 0.0433634 to be converted to eV.        
      grep "ENERGY:  " ${i}ns.out | awk '{printf "%f\n",$7*0.0433634}' >> potentialE.dat

#      grep "ELECT_FORCE:    " ${i}ns.dat | awk '{printf "%f    %f    %f\n",$10*0.0433634,$11*0.0433634,$12*0.0433634}' >> force.eVPeA.dat.tmp


done

#---------------------------------------------------------------------------
echo "............. DONE ANALYZING ALL DATA ..................."
#---------------------------------------------------------------------------

exit



                  
