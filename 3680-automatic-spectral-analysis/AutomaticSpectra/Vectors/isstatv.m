function s = isstatv(pc)%function s = isstatv(pc)%% Determines whether the set of partial correlations pc% defines a stationary process%% It checks whether I-pc*pc'>0 for all pc's%% It does this by checking whether the singular values% of all pc's are smaller than 1.%Lmax = size(pc,3)-1;nons = 0;for i = 1:Lmax,   nons = nons+any(svd(pc(:,:,i+1))>1);ends = ~nons;