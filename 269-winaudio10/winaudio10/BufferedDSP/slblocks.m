function blkStruct = slblocks
%SLBLOCKS Defines the block library for a specific Toolbox or Blockset.

%	Version 1.0 May 21, 1998
%	Copyright (c) 1998   Steve Mitchell

blkStruct.Name = 'Buffered DSP';
blkStruct.OpenFcn = 'BufferedDSP';
blkStruct.MaskDisplay = ['plot([.2 0 0 1 1],[.4 .4 1.8 1.8 1.6],'...
   '[.4 .2 .2 1.2 1.2],[.2 .2 1.6 1.6 1.4],'...
   '[1.4 1.4 .4 .4 1.4 1.4],[1 1.4 1.4 0 0 .4],'...
   '[1.4000 1.4357 1.4714 1.5071 1.5429 1.5786 1.6143 1.6500 1.6857 1.7214 1.7571 1.7929 1.8286 1.8643 1.9000 1.9357 1.9714 2.0071 2.0429 2.0786 2.1143 2.1500 2.1857 2.2214 2.2571 2.2929 2.3286 2.3643 2.4000],'...
   '[1.0000 1.0088 1.0347 1.0764 1.1318 1.1981 1.2721 1.3500 1.4279 1.5019 1.5682 1.6236 1.6653 1.6912 1.7000 1.6824 1.6307 1.5473 1.4364 1.3037 1.1558 1.0000 0.8442 0.6963 0.5636 0.4527 0.3693 0.3176 0.3000],'...
   '[1.4 2.4],[.1 .1]);'...
   'text(.9,.7,''DSP'')'];
