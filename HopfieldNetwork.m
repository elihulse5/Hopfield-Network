%copyright 2013 Eli Hulse
%duplication is allowed as long as my name is referenced somewhere in
%the application or source code.
%thank you, enjoy, if you have any questions, email me at 
%elihulse5@gmail.com
%%
%trainingData is the initial inputs
%weights is a matrix that stores the learned weights
%output is the recalled value of the network with an inputted new matrix
%%
trainingData = [0 0 0 0; 1 1 0 1; 1 0 1 0;];

%training
trainingDataUnModified = trainingData;
[y,x] = size(trainingData);
trainingData=trainingData*2-1;

%learning
weights=zeros(x,x);
for i=1:x
    for j=1:x
        weights(i,i)=0;
        weights_i=trainingData(:,i);
        weights_j=trainingData(:,j);
        weight_ij=weights_i'*weights_j;
        weights(i,j)=weight_ij;
    end
end

%recalling
matrix=input('input matrix:');
fprintf('input:');
fprintf('%d ',matrix);
output=rand(size(matrix));
for i=1:100
    if ismember(output,trainingDataUnModified,'rows')==1
       break;
    else
        output_absolute=matrix*weights';
        output=output_absolute>=1;
        fprintf(' output%d:',i);
        fprintf('%d ',output);
    end
    fprintf('\n');
end
