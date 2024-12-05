%This function is used to validate the input to make sure it is a whole
%number and not empty.
function inputValidation(playerNumber1)%<SM:PDF:TURPENING> <SM:PDF_RETURN:TURPENING> <SM:PDF_PARAM:TURPENING> 
%"function" is the function call, "inputValidation" is the return value,
%and "playerNumber1" is the parameter
while (isempty(playerNumber1))|| mod(playerNumber1,1)~=0%<SM:WHILE:TURPENING> <SM:BOP:TURPENING>
     fprintf('\nError, that was not a valid input.');
     playerNumber1=input(['\nPlease enter a player on the Orlando Magic''s number. ' ...
    '\n Here are the numbers ' ...
    'you can enter: \n22   5   10  50  20  34   21    4   2    14\n' ...
    '31    11   25   7   3   13  35  1  0\n']); %This is asking the user to put a value to the parameter value
 end 
end