function d = readMocapData39(filename)
% reads mocap c3d file and arranges 39 body markers in a specific order


% read raw c3d file
d = mcread(filename);

% reorder data in c3d structure to have markers in the order expected
% for drawing the skeleton (which draws line segments between certain
% pairs of markers.
d.data = orderData(d)'; 
d.data = d.data(:,1:3*39);
d.nMarkers = 39;
d.markerName = orderNames;


return 

