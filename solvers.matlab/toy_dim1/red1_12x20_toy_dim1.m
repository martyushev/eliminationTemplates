% Input: cell array CC of 3 coefficient matrices of size 3x11
% Output: cell arrays TT0 and TT1, each containing 3 matrices of size 8x8

function [TT0,TT1] = red1_12x20_toy_dim1(CC)

    MM = cell([1,3]);
    MM{1} = sparse([1,1,1,2,2,2,3,3,3,4,4,5,5,5,6,6,6,7,7,7,7,8,8,9,9,9,10,10,10,11,11,11,12,12,12],[12,17,19,11,14,16,6,10,14,3,19,1,4,18,7,11,15,6,13,16,20,5,9,2,3,8,7,12,13,4,5,11,1,2,10],CC{1}([31,13,19,31,13,19,13,31,19,13,31,13,19,31,11,32,17,11,17,23,32,11,32,11,17,32,6,33,3,3,6,33,3,6,33]),12,20);
    MM{2} = sparse([1,1,2,2,3,3,4,4,5,5],[11,12,9,11,8,10,16,19,15,18],CC{2}([28,31,28,31,28,31,28,31,28,31]),12,20);
    MM{3} = sparse([6,7,8,9,10,11,12],[11,20,9,8,20,19,17],CC{3}([32,32,32,32,27,27,27]),12,20);

    TT0 = mat2cell(repmat(zeros(8),1,3),8,repmat(8,1,3));
    TT1 = mat2cell(repmat(zeros(8),1,3),8,repmat(8,1,3));
    TT0{1}([41,51,62]) = 1;
    TT1{1}([1,19,46]) = 1;
    [L,~,P] = lu(MM{1}(:,1:7));
    P = P';
    P = [P*L P(:,8:end)];
    for i = 1:3
        M = P\MM{i}(:,8:end);
        M = M(end-4:end,:);
        TT0{i}([2,4,5,7,8],:) = -M(:,6:end);
        TT1{i}([2,4,5,7,8],[2,4,5,7,8]) = M(:,1:5);
    end

end