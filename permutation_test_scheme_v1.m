% first half of all_data is number of curved flowers emptied; second half
% is number of flat flowers emptied
all_data = [8
7
3
2
2
7
8
7
8
8
4
5
4
5
7
7
1
3
1
0
5
5
5
3
5
2
6
3
6
6];

% curved minus flat:
actual_diffs = zeros(length(all_data)/2,1);
for i = 1:length(actual_diffs)
    actual_diffs(i) = all_data(i)-all_data(i+length(actual_diffs));
end

actual_mean = mean(actual_diffs);

% ======================

indexed_data = zeros(length(all_data),2);
indexed_data(:,1) = 1:1:length(all_data);
indexed_data(:,2) = all_data;

indexed_perm_data = indexed_data;

permuted_data = zeros(length(all_data),2);

diffs = zeros(length(all_data)/2,1);

stored_means = zeros(10000,1);

stored_shuffled_data = zeros(length(all_data),10000);

tic

for j = 1:10000
    
    permutation = randperm(length(all_data));
    
    permuted_data(:,1) = permutation;
    
    for k = 1:length(all_data)
        permuted_data(k,2) = all_data(permutation(k));
    end

    for k = 1:length(diffs)
        diffs(k) = permuted_data(k,2)-permuted_data(k+length(diffs),2);
    end

    mean_of_diffs = mean(diffs);
    
    stored_shuffled_data(:,j) = permuted_data(:,2);

    stored_means(j) = mean_of_diffs;
end

sorted_stored_means = sort(stored_means);

toc

figure(1), hist(stored_means,100)
bins = hist(stored_means,100);
