function writeInpFile(directory,alpha)
% Write .inp file for Flite2D solver
% Written by Manon Forey

idFile = fopen(strcat(directory,'/reentry_1.con'),'w');

%U = 500

u0 = 500*cosd(alpha);

v0 = 500*sind(alpha);

fprintf(idFile, ...
  [  '&Input \n' ...
 'IVD%%TORDER = 120,  !LOBATTO QUADRATURE ORDER FOR V-SPACE \n' ...
 'IVD%%rv = 13000,  !RADIAL EXTENT OF THE V-SPACE \n' ...
 'IVD%%NTIME = 1000, !NUMBER OF TIMESTEPS \n' ...
 'IVD%%FORCEOUT = 1, !OUTPUT THE LIFT AND DRAG? \n' ...
 'IVD%%IMMAT = 1,   !SWITCH FOR MASS MATRIX LUMPING \n' ...
 'IVD%%ALPHA = 0.9,  !MOLECULAR WALL REFLECTION PARAMETER \n' ...
 'IVD%%CSAFM = 0.5,  !TIMESTEPPING SAFETY FACTOR \n' ...
 'IVD%%RS = 0,  !RESTART PARAMETER \n' ...
 'IVD%%T1 = 300, !INITIAL TEMP IN DOMAIN \n' ...
 'IVD%%P1 = 0.00000075, !INITIAL PRESSURE IN DOMAIN \n' ...
 'IVD%%U0 = ' num2str(u0) ', !INITIAL U-VEL IN DOMAIN \n' ...
 'IVD%%V0 =  ' num2str(v0) ', !INITIAL V-VEL IN DOMAIN \n' ...
 'IVD%%INF = 1, !INFLOW BOUNDARY SWITCH ON/OFF \n' ...
 'IVD%%CINF(1) = 300, !INFLOW TEMP \n' ...
 'IVD%%CINF(2) = 0.00000075, !INFLOW PRESSURE \n' ...
 'IVD%%CINF(3) = ' num2str(u0) ', !INFLOW U-VEL \n' ...
 'IVD%%CINF(4) = ' num2str(v0) ',   !INFLOW V-VEL \n' ...
 'IVD%%W = 1.0,  !INICON(orig) INITIAL CONDITION PARAMETER \n' ...
 'IVD%%LobattoFile = Lobatto120.txt, !Lobatto Quadrature File \n' ...
 'IVD%%PSpaceFile = reentry.plt, !PSpace Mesh File \n' ...
 'IVD%%OutFile = FILE.OUT, !Output File \n' ...
 'IVD%%PartitionFile = reentry.con.npart.7, !METIS PARTITION FILE \n' ...
 'IVD%%RestartInFile = RESTART.RES !RESTART INPUT FILE \n' ...
 'IVD%%ResidualFile = RESIDUAL.RES !RESIDUAL FILE \n' ...
 'IVD%%ResultsFile1 = RESULTS1.RES !RESULTS FILE 1 \n' ...
 'IVD%%ResultsFile2 = RESULTS2.RES !RESULTS FILE 2 \n' ...
 'IVD%%RestartOutFile = RESTART.RES !RESTART OUTPUT FILE \n' ...
 'IVD%%GIDMeshFile = GIDMESH.RES !GID MESH FILE \n' ...
'/']);


 
 fclose(idFile) ;
end
