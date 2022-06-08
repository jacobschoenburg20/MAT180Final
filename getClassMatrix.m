function classMatrix = getClassMatrix(A,b,c)
%A =  training data, b = training data solutions, c = desired class
classMatrix = [];

for i = 1:size(A,2)
    if b(i) == c
        classMatrix(:, end+1) = A(:,i);
    end
end