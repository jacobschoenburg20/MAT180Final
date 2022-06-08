function percentCorrect = digit_checker(test_solutions, test_predictions)
%Returns the percentage of correctly identified digits, broken down by
%correct digit

numErrors = zeros(10,1);
numDigits = zeros(10,1);
for i = 1:size(test_solutions,2)
    if test_solutions(i) ~= 0
        numDigits(test_solutions(i)) =  numDigits(test_solutions(i)) + 1;
    else
        numDigits(10) = numDigits(10) + 1;
    end
    if test_solutions(i) ~= test_predictions(i)
        if test_solutions(i) ~= 0
            numErrors(test_solutions(i)) = numErrors(test_solutions(i)) + 1;
        else
            numErrors(10) = numErrors(10) + 1;
        end
    end
end

percentCorrect = zeros(10,1)';
for i = 1:10
    percentCorrect(i) = 1 - numErrors(i)/numDigits(i);
end