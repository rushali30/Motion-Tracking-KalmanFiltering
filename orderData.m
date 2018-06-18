function dataOrdered = orderData(datac3d)

dataOrdered = zeros(117,datac3d.nFrames);
data = datac3d.data';
counter = 40;
name = datac3d.markerName;
for i = 1:length(name)
    
    index = (i-1)*3 + 1;
    switch name{i}
        case 'LFHD'
            dataOrdered(1:3,:) = data(index:index+2,:);
%             datac3d.markerName(1) = 'LFHD';
        case 'RFHD'
            dataOrdered(4:6,:) = data(index:index+2,:);
%             datac3d.markerName(2) = 'RFHD';
        case 'LBHD'
            dataOrdered(7:9,:) = data(index:index+2,:);
%             datac3d.markerName(3) = 'LBHD';
        case 'RBHD'
            dataOrdered(10:12,:) = data(index:index+2,:);
%             datac3d.markerName(4) = 'RBHD';
        case 'C7'
            dataOrdered(13:15,:) = data(index:index+2,:);
%             datac3d.markerName(5) = 'C7';
        case 'T10'
            dataOrdered(16:18,:) = data(index:index+2,:);
%             datac3d.markerName(6) = 'CLAV';
        case 'CLAV'
            dataOrdered(19:21,:) = data(index:index+2,:);
%             datac3d.markerName(7) = 'STRN';
        case 'STRN'
            dataOrdered(22:24,:) = data(index:index+2,:);
        case 'RBAK'
            dataOrdered(25:27,:) = data(index:index+2,:);
        case 'LSHO'
            dataOrdered(28:30,:) = data(index:index+2,:);
        case 'LUPA'
            dataOrdered(31:33,:) = data(index:index+2,:);
        case 'LELB'
            dataOrdered(34:36,:) = data(index:index+2,:);
        case 'LFRM'
            dataOrdered(37:39,:) = data(index:index+2,:);
        case 'LWRA'
            dataOrdered(40:42,:) = data(index:index+2,:);
        case 'LWRB'
            dataOrdered(43:45,:) = data(index:index+2,:);
        case 'LFIN'
            dataOrdered(46:48,:) = data(index:index+2,:);
        case 'RSHO'
            dataOrdered(49:51,:) = data(index:index+2,:);
        case 'RUPA'
            dataOrdered(52:54,:) = data(index:index+2,:);
        case 'RELB'
            dataOrdered(55:57,:) = data(index:index+2,:);
        case 'RFRM'
            dataOrdered(58:60,:) = data(index:index+2,:);
        case 'RWRA'
            dataOrdered(61:63,:) = data(index:index+2,:);
        case 'RWRB'
            dataOrdered(64:66,:) = data(index:index+2,:);
        case 'RFIN'
            dataOrdered(67:69,:) = data(index:index+2,:);
        case 'LASI'
            dataOrdered(70:72,:) = data(index:index+2,:);
        case 'RASI'
            dataOrdered(73:75,:) = data(index:index+2,:);
        case 'LPSI'
            dataOrdered(76:78,:) = data(index:index+2,:);
        case 'RPSI'
            dataOrdered(79:81,:) = data(index:index+2,:);
        case 'LTHI'
            dataOrdered(82:84,:) = data(index:index+2,:);
        case 'LKNE'
            dataOrdered(85:87,:) = data(index:index+2,:);
        case 'LTIB'
            dataOrdered(88:90,:) = data(index:index+2,:);
        case 'LANK'
            dataOrdered(91:93,:) = data(index:index+2,:);
        case 'LHEE'
            dataOrdered(94:96,:) = data(index:index+2,:);
        case 'LTOE'
            dataOrdered(97:99,:) = data(index:index+2,:);
        case 'RTHI'
            dataOrdered(100:102,:) = data(index:index+2,:);
        case 'RKNE'
            dataOrdered(103:105,:) = data(index:index+2,:);
        case 'RTIB'
            dataOrdered(106:108,:) = data(index:index+2,:);
        case 'RANK'
            dataOrdered(109:111,:) = data(index:index+2,:);
        case 'RHEE'
            dataOrdered(112:114,:) = data(index:index+2,:);
        case 'RTOE'
            dataOrdered(115:117,:) = data(index:index+2,:);
        otherwise
            display(['no label match for marker ' num2str(counter)]);
            index_c = (counter-1)*3 + 1;
            dataOrdered(index_c:index_c+2,:) = data(index:index+2,:);
            counter = counter +1;
    end
end

%% fix marker names in output c3d

% correctNames = ['LFHD'; 'RFHD'; 'LBHD'; 'RBHD'; 'C7'; 'CLAV'; 'STRN'; 'RBAK';'T10'; ...
%     'LSHO';'LUPA';'LELB';'LFRA';'LWRA';'LWRB';'LFIN';'RSHO';'RUPA';'RELB';'RFRA';...
%     'RWRA';'RWRB';'RFIN';'LASI';'RASI';'LPSI';'RPSI';'LTHI';'LKNE';'LTIB';...
%     'LANK';'LHEE';'LTOE';'RTHI';'RKNE';'RTIB';'RANK';'RHEE';'RTOE';];

end
