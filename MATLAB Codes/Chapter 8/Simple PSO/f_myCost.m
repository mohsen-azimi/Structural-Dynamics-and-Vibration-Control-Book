function z = f_myCost(x)

    global NFE;
    if isempty(NFE)
        NFE=0;
    end
    
    NFE=NFE+1;

    z = sum(x.^2);

end