# Created by Setare Sarhangi
# 07-11-2024 


# Print the start message with date and time
puts "Starting Analysis - date/time"                                            
date                                                                            

# Set the base directory path to the trajectories
set baseDir ./2500Frames   

# Load the pbctools package for periodic boundary condition tools
package require pbctools

# Open a file to write the center of mass coordinates
set outfile [open coordinate_COM_Protein.txt w]

# Load the trajectory file (PSF and DCD files)
set traj  [ mol load psf ./molPdbPsf/1ubq.psf dcd ${baseDir}/1ubqNVT.dcd]
puts "trajectory  is loaded"

# Unwrap all molecules to account for periodic boundary conditions
pbc unwrap -all
puts "trajectory is Unwrapped "

# Select all atoms excluding water molecules
set prot [atomselect top "all and not water"]
# Alternatively, select only protein atoms
#set prot [atomselect top "protein"]

# Get the number of frames in the trajectory
set nf [molinfo $traj get numframes]
puts $nf

# Loop over each frame in the trajectory
for {set frame 0} {$frame < $nf} {incr frame} {
    # Go to the current frame
    animate goto $frame

    # Measure the center of mass of the selected atoms
    set protCOM [measure center $prot weight mass]

    # Write the center of mass coordinates to the output file
    puts $outfile [format " %.6f    %.6f    %.6f " [lindex $protCOM 0] [lindex $protCOM 1] [lindex $protCOM 2]]
}

# Close the output file
close $outfile

# Exit the script
exit
