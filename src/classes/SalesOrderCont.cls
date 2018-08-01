//Class to gather data for Sales Order Log Excel output
//written by Scott Key
//8-17-2017

public class SalesOrderCont {
	public Transient List<Sales_Order__c> soc{get; set;}
	public string quote {get; set;}
    public SalesOrderCont()
    {
      	soc = new List<Sales_Order__c>();
      	for (Sales_Order__c c : [Select Quote_Number__c,Sales_Order_Number__c,Name,Bookings_Date__c,client__c,GP_Customer_ID__c,Opportunity_Owner__c,
      		Inform_Bookings_Amount__c,Related_Opportunity__c from Sales_Order__c where Bookings_Date__c = THIS_YEAR order by Bookings_Date__c desc])
    	{
    		soc.add(c);
    	}
    }
    public SalesOrderCont(ApexPages.StandardController stdController)
    {
    	
    }
    
     public PageReference redirectcurrent()
    {
        PageReference pr1 = new PageReference('/apex/scottExcellTest2');
        return pr1;
    }
    public PageReference redirectlast()
    {
        PageReference pr2 = new PageReference('/apex/salesorderloglastyear');
        return pr2;
    }
   
    public PageReference searchSalesOrders()
    {
    	soc = [select Quote_Number__c,Sales_Order_Number__c,Name,Bookings_Date__c,client__c,GP_Customer_ID__c,Opportunity_Owner__c,
      		Inform_Bookings_Amount__c,Related_Opportunity__c from sales_Order__c where quote_number__c = :quote];
    	return null;
    }
}