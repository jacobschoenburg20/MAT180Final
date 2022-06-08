function test_predictions = digit_identification(training_data, training_solutions, test_data, k)
%k = # of singular vectors to use for each class

%Divide the training data into 10 classes, 1 for each digit
classArray = cell(10,1);
for i = 1:9
    classArray{i} = getClassMatrix(training_data, training_solutions, i);
end
%Note that 0 is represented by array index 10
classArray{10} =  getClassMatrix(training_data, training_solutions, 0);

%Compute singular values for each class matrix
singularVectorArray = cell(10,1);
for i = 1:10
    [U,S,V] = svd(classArray{i});
    singularVectorArray{i} = U(:,1:k(i));
    singularValueArray{i} = S(:,1:k(i));
end

%Predict each digit by comparing the residual error
test_predictions = [1, size(test_data,2)];
for i = 1:size(test_data,2)
        min_error = find_residual(test_data(:,i), singularVectorArray{1});
        digit_prediction = 1;
    for j = 2:10
        error = find_residual(test_data(:,i), singularVectorArray{j});
        if error < min_error
            min_error = error;
            digit_prediction = j;
            if digit_prediction == 10
                digit_prediction = 0;
            end
        end
        test_predictions(i) = digit_prediction;
    end
end