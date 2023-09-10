function [TRUNK,THIGH,NECK_AND_HEAD,LOWER_LEG,UPPERARM,FOREARM,FOOT,HAND,HEAD_RATIO,SHOULDER_WAIST_RATIO,WAIST_KNEE_RATIO,KNEE_TOE_RATIO,WIDTH_SHOULDER,HEIGHT,WEIGHT,BODY_MASS_INDEX] = griding2(filename)

    i=imtool(filename)
    b=imcrop(i)
    imwrite(b,'static/images/cropped.jpg')
    saveas(i,'static/images/image.jpg')
    a =imresize(b,0.62);
    j=rgb2gray(a)
    imshow(j)
    [rows, columns] = size(j);
    for row = 1 : 10 : rows  %step size(middle number) https://in.mathworks.com/matlabcentral/answers/308892-how-to-add-grid-to-the-image
      line([1, columns], [row, row], 'Color', 'r');
    end
    for col = 1 : 10 : columns
      line([col, col], [1, rows], 'Color', 'r');
    end
    
    % %Get in correct directory with Excel File
      %be sure to initiate the cell array, just like you would for an array
     [b,c]=size(j) %Read excel file
     px= b.*c
     cm=px/37.795
    inches=cm/2.54
    feet=inches/12
    Human_feet=feet/24
    
    %Calculating weight using height as an input parameter
    %using Broca Index
    Height_in_cm=(Human_feet * 30.48)
    Height_in_meter=(Height_in_cm * 0.1)
    Height_Square=(Height_in_meter * Height_in_meter)
    Human_weight = ([Height_in_cm - 100] - ([Height_in_cm - 100] * 0.1))
    
    
    %Calculating BMI using Height and Weight as an input parameter
    %Body_Mass_Index=(Human_weight / Height_Square) 
    
    %Display Height, Weight, BMI.
    Human_feet=feet/24
    Human_weight = ([Height_in_cm - 100] - ([Height_in_cm - 100] * 0.1))
    Body_Mass_Index=([Human_weight / Height_Square] * 100)
    
    %---------------%
    %HEIGHT = [Human_feet]
    %WEIGHT = [Human_weight]
    %BODY_MASS_INDEX = [Body_Mass_Index]
    %BMI = table(HEIGHT, WEIGHT, BODY_MASS_INDEX)
    %--------------%
    
    Trunk = (Human_weight * 0.500)
    Thigh = (Human_weight * 0.115)
    Neck_and_Head = (Human_weight * 0.080)
    Lower_Leg = [(Human_weight * 0.050) * 2]
    Upperarm = [(Human_weight * 0.035) * 2]
    Forearm = [(Human_weight * 0.028) * 2]
    Foot = [(Human_weight * 0.023) * 2]
    Hand = [(Human_weight * 0.010) * 2]
    %--------------------------------------%
    
    Head_Height = (Height_in_cm / 8)
    Shoulder_Waist_Height = (Head_Height * 2)
    Waist_Knee_Height = (Head_Height * 3)
    Knee_Toe_Height = (Head_Height * 2)
    Width_Shoulder = (Head_Height * 2)


    %--------------------------------------%
    
    HEIGHT = [Human_feet]
    WEIGHT = [Human_weight]
    BODY_MASS_INDEX = [Body_Mass_Index]
    
    TRUNK = [Trunk]
    THIGH = [Thigh]
    NECK_AND_HEAD = [Neck_and_Head]
    LOWER_LEG = [Lower_Leg]
    UPPERARM = [Upperarm]
    FOREARM = [Forearm]
    FOOT = [Foot]
    HAND = [Hand]

    HEAD_RATIO = [Head_Height]
    SHOULDER_WAIST_RATIO = [Shoulder_Waist_Height]
    WAIST_KNEE_RATIO = [Waist_Knee_Height]
    KNEE_TOE_RATIO = [Knee_Toe_Height]
    WIDTH_SHOULDER = [Width_Shoulder]
    
     BMI = table(HEIGHT, WEIGHT, BODY_MASS_INDEX)
     BODY_WEIGHT_DISTRUBUTION = table(TRUNK,THIGH,NECK_AND_HEAD,LOWER_LEG,UPPERARM,FOREARM,FOOT,HAND)
     HEIGHT_DISTRIBUTION = table(HEAD_RATIO,SHOULDER_WAIST_RATIO,WAIST_KNEE_RATIO,KNEE_TOE_RATIO,WIDTH_SHOULDER)
imwrite(j,"static/images/enhanced.jpg")
end