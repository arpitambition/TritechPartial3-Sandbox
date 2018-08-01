trigger AssociatePriceBook on Opportunity (before insert, before update)
{
    Opportunity_Utility.setOpportunityPriceBook(trigger.new);
}