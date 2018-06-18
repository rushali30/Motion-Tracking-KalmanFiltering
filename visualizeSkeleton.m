function p = visualizeSkeleton(d, outfilename, startframe, endframe)
% Creates animation of mocap data and saves it to avi file
% based on mcanimate and mcplotframe from MotionCapture Toolbox 
%
% comments
% Creates and returns an animpar structure by calling the function mcinitanimpar and 
% setting the .limits field of the animpar structure automatically so that all the markers 
% fit into all frames.

if nargin < 2
    outfilename = 'flagtest.avi';
end

if nargin < 3
    startframe = d.fFrame;
    endframe = d.fFrame+d.nFrames-1;
end

% initialize animpar structure that determines how the visualization looks
p = mcinitanimparSkeleton;

% reorder data in c3d structure to have markers in the order expected
% for drawing the skeleton (which draws line segments between certain
% pairs of markers.
d.data = orderData(d)'; 
d.markerName = orderNames;


p.animate = 1;
p.output = outfilename;

p = mcplotframe(d,(startframe-d.fFrame+1):(endframe-d.fFrame+1),p); 

return



