trigger APTS_AssociatePriceBook on Opportunity (before update) {
    List<PriceBook2> pbsList = [Select p.Id From Pricebook2 p Where p.IsStandard = true and p.IsActive = true LIMIT 1];
    for (Opportunity opp : Trigger.new) {
        if(pbsList != null && pbsList.size() > 0) {
            opp.PriceBook2Id = pbsList[0].Id;
        }       
    }
}