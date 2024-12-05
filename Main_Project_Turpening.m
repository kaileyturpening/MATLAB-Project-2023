% ------------------------------------------------------------------------
%   Name: Kailey Turpening
%   Section: EGR 115 section 08DB
%   Submission Date: 12/10/23
%
%   File Description: [ Looking at the roster of the NBA Team: Orlando 
% Magic. The user will input a jersey number of one of the players and then
% a plot with all of that player's statistics will appear next to a plot 
% with the team average statistics to compare. Then, the user will have the
% option of creating a random stat line to compare to the pervious chosen
% player and team stats as well.]
%
%   Citation: [
%                    Resources  |  Line Number
%https://www.espn.com/nba/team/stats/_/name/orl/orlando-magic |  61
%            ]
%   Rubirc score markers: [
%               Score Marker    |Line Number |File Name
%           <SM:DIM:TURPENING>  |  51        |Main_ProjectDraft_Turpening.m
%         <SM:SEARCH:TURPENING> |  69        |Main_ProjectDraft_Turpening.m
%          <SM:SLICE:TURPENING> |  65        |Main_ProjectDraft_Turpening.m
%           <SM:ROP:TURPENING > |  67        |Main_ProjectDraft_Turpening.m
%             <SM:IF:TURPENING> |  69        |Main_ProjectDraft_Turpening.m
%          <SM:VIEW:TURPENING>  |  165       |Main_ProjectDraft_Turpening.m
%           <SM:PLOT:TURPENING> |  174       |Main_ProjectDraft_Turpening.m
%          <SM:RANDOM:TURPENING>|  266       |Main_ProjectDraft_Turpening.m
%          <SM:WHILE:TURPENING> |  6         |inputValidation.m
%          <SM:PDF:TURPENING>   |  3         |inputValidation.m
%     <SM:PDF_RETURN:TURPENING> |  3         |inputValidation.m
%       <SM:PDF_PARAM:TURPENING>|  3         |inputValidation.m
%           <SM:BOP:TURPENING>  |  6         |inputValidation.m]
%           <SM:FOR:TURPENING>  |  68        |Main_ProjectDraft_Turpening.m
%          <SM:READ:TURPENING>  |  50        |Main_ProjectDraft_Turpening.m
%         <SM:STRING:TURPENING> |  237       |Main_ProjectDraft_Turpening.m
%
% -------------------------------------------------------------------------

% Introduction:


clear
clc
close all
commandwindow

fprintf(['Welcome to Orlando Magic Statistics Analytics! \nThis program will let you choose a player on the Orlando' ...
    'Magic and compare their stats to the rest of the team, \nas well as create a random player and compare those ' ...
    'statistics! \nFirst, you will search a player''s jersey number and then you will view a plot to show their stats.'])
    
projectData=readcell("EGR115Project.xlsx");%<SM:READ:TURPENING> 
projectData(3:2:39,:)=[]; %<SM:DIM:TURPENING> %removing every other row from matrix because the code had blank rows
projectData(20,:)=[];
%diminuition with for loop odd numbers except 1 because title
playerNumber=input(['\nPlease enter a player on the Orlando Magic''s number ' ...
    'who you would like to see their average stats.\nHere are the numbers ' ...
    'you can enter: \n22   5   10  50  20  34   21    4   2    14\n' ...
    '31    11   25   7   3   13  35  1  0\n']); %Asking the user to input a jersey number of a player from the Orlando Magic.
inputValidation(playerNumber)
%Return variable for the function call in the "inputValidation.m" file.
[rowSize, colSize]=size(projectData); %finding the row and column size.
  
found=0;  
%making found have an initial value so it can increase when doing the
%following input validation
jerseyNumbersArray=projectData(2:20,1); %<SM:SLICE:TURPENING> turning the column of jersey numbers into one array.
jerseyNumbersArrayMat=cell2mat(jerseyNumbersArray); %Changing the cells to a matrix so the values can be analyzed.
while found==0 %<SM:ROP:TURPENING> Validating user input again to make sure only jersey number from the roster was picked.
    for k=1:length(jerseyNumbersArrayMat)%<SM:FOR:TURPENING> 
        if playerNumber== jerseyNumbersArrayMat(k) %<SM:IF:TURPENING> <SM:SEARCH:TURPENING>
            found=1;
            rowNumber=k;
        end
    end %For loop checked to see if input was equal to a number from the sliced array.
    if found==0 
        fprintf('\nError, that was not a valid input.');
      playerNumber=input(['\nPlease enter a player on the Orlando Magic''s number. ' ...
          '\n Here are the numbers you can enter: \n22   5   10  50  20  34   21    4   2    14\n' ...
    '31    11   25   7   3   13  35  1  0\n']); 
    end %This if statement makes the user re-enter their value if they did not enter a proper jersey number before.
end
playerName=projectData{(rowNumber+1),2}; %storing the row of that player as a cell matrix
        fprintf(['\nThe player you chose is %s! He wears jersey #%d.\n \nHere are his average stats compared to the team averages:\n\n' ...
            '(On the graphs, FGM= Field Goals Made, 3M=3 pointers Made, 3A= 3 pointers Attempted\n' ...
            'FTM= Free Throws Made, FTA=Free Throws Attempted,  P=Points,\n' ...
            'OB=Offensive Rebounds, DB=Defensive Rebounds, R=Rebounds,\n' ...
            'A=Assists, S=Steals, B= Blocks, T=Turnovers, F=Fouls, \n' ...
            'FG%= Field Goal Percentage, 3%=3 Point Percentage, FT%= Free Throw Percentage'], playerName, playerNumber)
%This fprintf explains the labels on the provided plots.
FGM=projectData(2:20,6); 
FGMMat=cell2mat(FGM);
FGMTeamAverages=mean(FGMMat);

FGA=projectData(2:20,7);
FGAMat=cell2mat(FGA);
FGATeamAverages=mean(FGAMat);

FGPercent=projectData(2:20,8);
FGPercentMat=cell2mat(FGPercent);
FGPercentAverages=mean(FGPercentMat);

ThreesMade=projectData(2:20,9);
ThreesMadeMat=cell2mat(ThreesMade);
ThreesMadeAverages=mean(ThreesMadeMat);

ThreesAttempted=projectData(2:20,10);
ThreesAttemptedMat=cell2mat(ThreesAttempted);
ThreesAttemptedAverages=mean(ThreesAttemptedMat);

ThreesPercent=projectData(2:20,11);
ThreesPercentMat=cell2mat(ThreesPercent);
ThreesPercentAverages=mean(ThreesPercentMat);

FTM=projectData(2:20,12);
FTMMat=cell2mat(FTM);
FTMTeamAverages=mean(FTMMat);

FTA=projectData(2:20,13);
FTAMat=cell2mat(FTA);
FTATeamAverages=mean(FTAMat);

FTPercent=projectData(2:20,14);
FTPercentMat=cell2mat(FTPercent);
FTPercentAverages=mean(FTPercentMat);

OREB=projectData(2:20,15);
OREBMat=cell2mat(OREB);
OREBAverages=mean(OREBMat);

DREB=projectData(2:20,16);
DREBMat=cell2mat(DREB);
DREBAverages=mean(DREBMat);

REB=projectData(2:20,17);
REBMat=cell2mat(REB);
REBAverages=mean(REBMat);

Assists=projectData(2:20,18);
AssistsMat=cell2mat(Assists);
AssistsAverages=mean(AssistsMat);

Steals=projectData(2:20,19);
StealsMat=cell2mat(Steals);
StealsAverages=mean(StealsMat);

Blocks=projectData(2:20,20);
BlocksMat=cell2mat(Blocks);
BlocksAverages=mean(BlocksMat);

Turnovers=projectData(2:20,21);
TurnoversMat=cell2mat(Turnovers);
TurnoversAverages=mean(TurnoversMat);

Fouls=projectData(2:20,22);
FoulsMat=cell2mat(Fouls);
FoulsAverages=mean(FoulsMat);

Points=projectData(2:20,23);
PointsMat=cell2mat(Points);
PointsAverages=mean(PointsMat);
%Each one of these sliced a column and changed the cell form to an array so that the values could be plotted.        

teamScoringStatistics=[FGMTeamAverages, FGATeamAverages,  ...
    ThreesMadeAverages, ThreesAttemptedAverages, FTMTeamAverages, ...
    FTATeamAverages, PointsAverages]; %Creating the matrix that will be in the team subplots.
subplot(3,3,1) %<SM:VIEW:TURPENING>
hold on
title('Team Scoring Average Statistics')
bar(teamScoringStatistics, 'blue')
xlabel('FGM, FGA, 3M, 3A, FTM, FTA, P')
hold off
%subplot of the team scoring statistics
teamOtherStatistics=[OREBAverages, DREBAverages, REBAverages, ...
    AssistsAverages, StealsAverages, BlocksAverages, TurnoversAverages, FoulsAverages,];%<SM:SORT:TURPENING>
subplot(3,3,2) %<SM:PLOT:TURPENING>
hold on
title('Other Team Statistics')
bar(teamOtherStatistics, 'blue')
xlabel('OB, DB, R, A, S, B, T, F')
hold off
%subplot of team other statistics that don't have to do with scoring.
teamAveragePercentages=[FGPercentAverages, ThreesPercentAverages, FTPercentAverages,];
subplot(3,3,3)
hold on
title('Team Average Percentages')
bar(teamAveragePercentages, 'blue')
xlabel('FG%, 3%, FT%')
hold off
%subplot of team average percentages when trying to score.
rowNumber=rowNumber+1; %adding one to the row number of that player because the first row is a header
rowNumberArray=projectData(rowNumber,:);
rowNumberArray(1:2)=[];
rowNumberArrayMat=cell2mat(rowNumberArray);
%The following is taking each value from the array and labeling it as a
%variable
FGM1=rowNumberArrayMat(4);

FGA1=rowNumberArrayMat(5);

FGPercent1=rowNumberArrayMat(6);

ThreesMade1=rowNumberArrayMat(7);

ThreesAttempted1=rowNumberArrayMat(8);

ThreesPercent1=rowNumberArrayMat(9);

FTM1=rowNumberArrayMat(10);

FTA1=rowNumberArrayMat(11);

FTPercent1=rowNumberArrayMat(12);

OREB1=rowNumberArrayMat(13);

DREB1=rowNumberArrayMat(14);

REB1=rowNumberArrayMat(15);

Assists1=rowNumberArrayMat(16);

Steals1=rowNumberArrayMat(17);

Blocks1=rowNumberArrayMat(18);

Turnovers1=rowNumberArrayMat(19); 

Fouls1=rowNumberArrayMat(20);

Points1=rowNumberArrayMat(21);

playerScoringStatistics=[FGM1, FGA1,  ...
    ThreesMade1, ThreesAttempted1, FTM1, ...
    FTA1, Points1];
%Creating an array of all of the new variables
subplot(3,3,4)
hold on
plotTitle=sprintf('%s Average Scoring Statistics',playerName); %<SM:STRING:TURPENING> sprintf allows for the player's name to be in the plot title later on
title(plotTitle)
bar(playerScoringStatistics, 'r')
xlabel('FGM, FGA, 3M, 3A, FTM, FTA, P')
hold off
%subplot of the chosen player's scoring statistics
playerOtherStatistics=[OREB1, DREB1, REB1, ...
    Assists1, Steals1, Blocks1, Turnovers1, Fouls1];
subplot(3,3,5)
hold on
plotTitle2=sprintf('Other %s Statistics',playerName);
title(plotTitle2)
bar(playerOtherStatistics, 'red')
xlabel('OB, DB, R, A, S, B, T, F')
hold off
%subplot of the chosen player's non-scoring statistics
playerAveragePercentages=[FGPercent1, ThreesPercent1, FTPercent1];
subplot(3,3,6)
hold on
plotTitle3=sprintf('%s Average Percentages',playerName);
title(plotTitle3)
bar(playerAveragePercentages, 'red')
xlabel('FG%, 3%, FT%')
hold off
%subplot of the chosen player's average percentages of scoring.
userInput=input('\nDo you want to create a new stat line with randomly generated numbers to compare\nthe stats to the player you chose and team statistics?',"s");
yes="yes"; %asking if the user wants to create a random stat line and seeing if they answered "yes"

if  strcmpi(userInput,yes)==1 %comparing the string value to see if the user said yes.
    randomScoringStatistics=randi([0,10],length(teamScoringStatistics),1);%<SM:RANDOM:TURPENING> Creating scoring matrix
    randomOtherStatistics=randi([0,8],length(teamOtherStatistics),1); %creaing other statistics matrix
    if randomScoringStatistics(1) > randomScoringStatistics(2) 
        randomScoringStatistics(1)=randi([0,randomScoringStatistics(2)]);%making sure that field goals made is less than field goals attempted
    elseif randomScoringStatistics(3) > randomScoringStatistics(4)
        randomScoringStatistics(3)=randi([0,randomScoringStatistics(4)]);%making sure that 3 pointers made is less than 3 pointers attempted
    elseif randomScoringStatistics(5) > randomScoringStatistics(6)
        randomScoringStatistics(5)=randi([0,randomScoringStatistics(6)]);%making sure that free throws made is less than free throws attempted
    end
    randomFGPercentage=100*(randomScoringStatistics(1)/randomScoringStatistics(2)); %275-278 change the values to percentages
    random3Percentage=100*(randomScoringStatistics(3)/randomScoringStatistics(4));
    randomFTPercentage=100*(randomScoringStatistics(5)/randomScoringStatistics(6));
    randomPerecentages=[randomFGPercentage, random3Percentage, randomFTPercentage];

        subplot(3,3,7) 
        hold on
        title('Random Player Scoring Statistics')
        bar(randomScoringStatistics, 'yellow')
        xlabel('FGM, FGA, 3M, 3A, FTM, FTA, P')
        hold off
%plotting the random scoring values
        subplot(3,3,8) 
        hold on
        title('Other Random Player Statistics')
        bar(randomOtherStatistics, 'yellow')
        xlabel('OB, DB, R, A, S, B, T, F')
        hold off
%plotting the random other statistics
        subplot(3,3,9)
        hold on
        title('Random Player Percentages')
        bar(randomPerecentages, 'yellow')
        xlabel('FG%, 3%, FT%')
        hold off
%plotting the percentages that were calculated from the random values made
        fprintf('Thank you!')
else
    fprintf('Thank you!')
end 

%Trial Run 1
% Welcome to Orlando Magic Statistics Analytics! 
% This program will let you choose a player on the OrlandoMagic and compare their stats to the rest of the team, 
% as well as create a random player and compare those statistics! 
% First, you will search a player's jersey number and then you will view a plot to show their stats.
% Please enter a player on the Orlando Magic's number who you would like to see their average stats.
% Here are the numbers you can enter: 
% 22   5   10  50  20  34   21    4   2    14
% 31    11   25   7   3   13  35  1  0
% 
% 
% Error, that was not a valid input.
% Please enter a player on the Orlando Magic's number. 
%  Here are the numbers you can enter: 
% 22   5   10  50  20  34   21    4   2    14
% 31    11   25   7   3   13  35  1  0
% 42
% 
% Error, that was not a valid input.
% Please enter a player on the Orlando Magic's number. 
%  Here are the numbers you can enter: 
% 22   5   10  50  20  34   21    4   2    14
% 31    11   25   7   3   13  35  1  0
% 31
% 
% The player you chose is Terrence Ross! He wears jersey #31.
% 
% Here are his average stats compared to the team averages:
% 
% (On the graphs, FGM= Field Goals Made, 3M=3 pointers Made, 3A= 3 pointers Attempted
% FTM= Free Throws Made, FTA=Free Throws Attempted,  P=Points,
% OB=Offensive Rebounds, DB=Defensive Rebounds, R=Rebounds,
% A=Assists, S=Steals, B= Blocks, T=Turnovers, F=Fouls, 
% FG%= Field Goal Percentage, 3%=3 Point Percentage, FT%= Free Throw
% Percentage)
% Do you want to create a new stat line with randomly generated numbers to compare
% the stats to the player you chose and team statistics?yes
% Thank you!>> 

%Trial Run 2 
% Welcome to Orlando Magic Statistics Analytics! 
% This program will let you choose a player on the OrlandoMagic and compare their stats to the rest of the team, 
% as well as create a random player and compare those statistics! 
% First, you will search a player's jersey number and then you will view a plot to show their stats.
% Please enter a player on the Orlando Magic's number who you would like to see their average stats.
% Here are the numbers you can enter: 
% 22   5   10  50  20  34   21    4   2    14
% 31    11   25   7   3   13  35  1  0
% 5
% 
% The player you chose is Paolo Banchero! He wears jersey #5.
% 
% Here are his average stats compared to the team averages:
% 
% (On the graphs, FGM= Field Goals Made, 3M=3 pointers Made, 3A= 3 pointers Attempted
% FTM= Free Throws Made, FTA=Free Throws Attempted,  P=Points,
% OB=Offensive Rebounds, DB=Defensive Rebounds, R=Rebounds,
% A=Assists, S=Steals, B= Blocks, T=Turnovers, F=Fouls, 
% FG%= Field Goal Percentage, 3%=3 Point Percentage, FT%= Free Throw
% Percentage)
% Do you want to create a new stat line with randomly generated numbers to compare
% the stats to the player you chose and team statistics?yes
% Thank you!>> 