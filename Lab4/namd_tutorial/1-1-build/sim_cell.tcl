mol load pdb myo_wb.pdb

set all [atomselect top all]
# selecting all the atoms in the pdb file

set cn [measure center $all]
# measuring the geometrical center of the system

set vect [vecsub {0.0 0.0 0.0} $cn]
# making a vector from the geometrical center to the origin

$all moveby $vect
# moving all atoms along the vector to recenter to the origin

set mm [measure minmax $all]
# measuring the maximum and minimum x, y, and z among all coordinates
#-------------------------------------------------------#
# split the mm variable to extract the coordinates
set vec1 [split [lindex $mm 0]]
set vec2 [split [lindex $mm 1]]

# extract individual coordinates
set x1 [lindex $vec1 0]
set y1 [lindex $vec1 1]
set z1 [lindex $vec1 2]
set x2 [lindex $vec2 0]
set y2 [lindex $vec2 1]
set z2 [lindex $vec2 2]

# calculate the simulation cell edges
set newX [expr {$x2 - $x1}]
set newY [expr {$y2 - $y1}]
set newZ [expr {$z2 - $z1}]
#-------------------------------------------------------#

puts $newX 
puts $newY 
puts $newZ
# print the simulation cell edges

exit
