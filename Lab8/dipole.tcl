# Created by Setare Sarhangi
# 07-11-2024 



# Print the start message with date and time
puts "Starting Analysis - date/time"                                            
date                                                                            

                                                         
# Set the base directory path to the trajectories
set baseDir ../2500Frames                  
                  

# Open a file to write the dipole moment data
set outfile [open  dipole_Protein.txt w]                                

# Load the trajectory file (PSF and DCD files)
set traj  [ mol load psf ../molPdbPsf/1ubq.psf dcd ${baseDir}/1ubqNVT.dcd]


# Select all atoms excluding water molecules
set protein [atomselect top "all and not water"]

# Get the number of frames in the trajectory
set nf [molinfo $traj get numframes]                                            
puts  "Total number of frames:  $nf "                                                                      

# Loop over each frame in the trajectory
for {set frame 0} {$frame < $nf} {incr frame} {                                 
    # Go to the current frame
    animate goto $frame  

    # Calculate the dipole moment of the protein in Debye, using the mass center
    set dipoleProt [measure dipole $protein -debye -masscenter]
                                                                                
    # Write the dipole moment components to the output file
    puts $outfile  [format  " %.5f    %.5f    %.5f " [lindex $dipoleProt 0]  [lindex $dipoleProt 1]  [lindex $dipoleProt 2]]                                    
}                                                               
                                       

# Close the output file
close $outfile    
   

# Exit the script
exit 

