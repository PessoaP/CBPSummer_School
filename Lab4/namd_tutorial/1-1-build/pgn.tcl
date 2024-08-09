package require psfgen              
# loading the PSF generator package (included in the VMD software)

topology top_all27_prot_lipid.inp   
topology toppar_all36_prot_heme.str
topology Fe4S4_mod_clusters.top
# the topology file is needed to generate PSF

pdbalias residue HIS HSE
pdbalias residue HEM HEME
pdbalias residue HOH TIP3
# change the residue name of the HIS to HSE, this should be customized based on the redox state

pdbalias atom ILE CD1 CD            
# change the atom name of carbon delta in ILE residue for compatibility purpose

segment U {pdb 1UBQ.pdb}           
# laods ubqp.pdb (should be in the same directory) and changes the segment name to U
# segment U also adds H to the protein as X-ray crystallography cannot resolve them

coordpdb 1UBQ.pdb U                 
# read coordinates from PDB file, matching segment, residue and atom names

guesscoord                          
# guesses coordinates of atoms for which they were not explicitly set

writepdb UBQ.pdb                    
# write pdb file with all new info

writepsf UBQ.psf                    
# write psf file

exit