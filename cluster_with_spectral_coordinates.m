function [idx_history, q_history, sumd_history] = cluster_with_spectral_coordinates(A,max_k)
    % Inputs:
    %   A: is the adjacency matrix of a (signed) graph
    %   max_k: maximum number of clusters
    %       Default: min(size(A,1), 10)
    %
    % Outputs:
    %   idx_history: columns are lists that assigns a cluster number 
    %       (1,2,3,...) to each vertex according to their clustering with 
    %       spectral coordinates method for each clustering
    %   q_history: row vector of the Girvan-Newman modularity index for
    %       each clustering
    %   sumd_history: sum of within-cluster sums of point-to-centroid
    %       distances for each clustering
    %
    % all k-th columns correspond to the clustering into k clusters.
    %   
    % Other routines used:
    %   k_cluster_with_spectral_coordinates.m
    
    n = size(A,1);
    if nargin < 2
        max_k = min(n, 10);
    end
    
    idx_history = zeros(n,max_k); %column i corresponds to clustering with k = i;
    q_history = zeros(1,max_k);
    sumd_history = zeros(1,max_k);
    
    for k = 1:max_k % for all possible sizes of clusterings
        [idx,q,sumd] = k_cluster_with_spectral_coordinates(A,k);
        idx_history(:,k) = idx;
        q_history(k) = q;
        sumd_history(k) = sum(sumd);
    end
end