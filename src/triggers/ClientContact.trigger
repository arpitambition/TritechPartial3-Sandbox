trigger ClientContact on Event (after insert, after update, after delete)
{
     set<id> eventid = new set<id>();
    
     if(trigger.isInsert || trigger.isUpdate)
     {
     for(event con :trigger.new)
     {
       eventid.add(con.Accountid);
     }
     }
     
      if(trigger.isDelete)
     {
     for(event con :trigger.old)
     {
       eventid.add(con.Accountid);
     }
     }
    
     map<id,double> accmap = new map<id,double>();
    for(aggregateresult ar :[ select Accountid , sum(Contact_Count__c) from event where Accountid = : eventid AND ((Type LIKE '%Account%') or (Type LIKE '%Client%')) 
        and accountid != null and Z_Logged_Client_Relations_Contact__c = true group by accountid])
    {
        accmap.put((id)ar.get('Accountid'),(double)ar.get('expr0'));
    }
    




    map<id,double> accmap1 = new map<id,double>();
    
    AggregateResult[] count = [Select sum(Contact_Count__c) from task where Accountid = : eventid and ((Type LIKE '%Account%') or (Type LIKE '%Client%')) and Z_Logged_Client_Relations_Contact__c = true AND CONTACT_COUNT__C != NULL and accountid != null];
    if(count != null)
    {
       
        for(aggregateresult ar1 :[Select AccountId,sum(Contact_Count__c) from task where Accountid = : eventid and ((Type LIKE '%Account%') or (Type LIKE '%Client%')) and Z_Logged_Client_Relations_Contact__c = true AND CONTACT_COUNT__C != NULL 
            and accountid != null group by accountid])
        {
            accmap1.put((id)ar1.get('AccountId'),(double)ar1.get('expr0'));
        }
    }
    else
    {
        
        for(aggregateresult ar1 :[Select AccountId from task where Accountid = : eventid and ((Type LIKE '%Account%') or (Type LIKE '%Client%')) and Z_Logged_Client_Relations_Contact__c = true AND CONTACT_COUNT__C != NULL 
            and accountid != null group by accountid])
        {
            accmap1.put((id)ar1.get('AccountId'),0);
        }
    }
    
    
    List<event> c= [select ActivityDateTime,Type,Customer_Risk_Level__c,id from event where Accountid = : eventid AND ((Type LIKE '%Account%') or (Type LIKE '%Client%')) 
        and accountid != null and ActivityDateTime > LAST_YEAR and Z_Logged_Client_Relations_Contact__c = true ORDER BY ActivityDateTime desc LIMIT 1];
    datetime actdate = NULL;
    string evt = '';
    string risk = '';
    string what = '';
    if(c.size()>0){
    actdate = c[0].ActivityDateTime;
    evt = c[0].Type;
    what = c[0].id;
    risk = c[0].Customer_Risk_Level__c;}
    
    List<task> d= [select ActivityDate,Type,Customer_Risk_Level__c,id from task where Accountid = : eventid AND ((Type LIKE '%Account%') or (Type LIKE '%Client%')) and
        accountid != null and ActivityDate > LAST_YEAR and Z_Logged_Client_Relations_Contact__c = true ORDER BY ActivityDate desc LIMIT 1];
        datetime actdate1 = NULL;
        string evt1 = '';
        string risk1 = '';
        string what1 = '';
        if(d.size()>0 && d[0].ActivityDate != null){
        actdate1 = d[0].ActivityDate;
        actdate1 = actdate1.addDays(1);
        what1 = d[0].id;
        evt1 = d[0].Type;
        risk1 = d[0].Customer_Risk_Level__c;}
    
   
    List<account> accounttoupdate = new List<account>();
   
    for( account a :[select id , Z_Completed_Yearly_Contacts__c from account where id  = : eventid])
    {
     double totalcost = 0.00;
     if((accmap1.get(a.id) != null) && (accmap.get(a.id) == null))
     {
         totalcost = accmap1.get(a.id);
     }
     else if ((accmap.get(a.id) != null) && (accmap1.get(a.id) == null))
     {
         totalcost = accmap.get(a.id);
     }
     else if((accmap.get(a.id) != null) && (accmap1.get(a.id) != null))
     {
         totalcost= accmap.get(a.id) + accmap1.get(a.id);
     }
     
     /*string s = string.valueofgmt(actdate.date());*/
       if((actdate != null) && (evt.startswith('Account') || evt1.startswith('Account') || evt.startswith('Client') || evt1.startswith('Client')))
     {
        if(actdate1 != null)
            {
            if (actdate < actdate1)
                {
                    a.Z_Last_Yearly_Contact_Date__c = actdate.date();
                    a.Z_Last_Yearly_Contact_Type__c = evt;
                    a.Last_Yearly_Contact_Customer_Risk_Level__c = risk;
                    a.what_activity__c = what;
                    a.who_activity__c = UserInfo.getuserid();
                    a.when_activity__c = datetime.now();
                }
            else
                {
                    a.Z_Last_Yearly_Contact_Date__c = actdate1.date();
                    a.Last_Yearly_Contact_Customer_Risk_Level__c = risk1;
                    a.Z_Last_Yearly_Contact_Type__c = evt1;
                    a.what_activity__c = what1;
                    a.who_activity__c = UserInfo.getuserid();
                    a.when_activity__c = datetime.now();
                }
            }
        else
            {
            a.Z_Last_Yearly_Contact_Date__c = actdate.date();
            a.Z_Last_Yearly_Contact_Type__c = evt;
            a.Last_Yearly_Contact_Customer_Risk_Level__c = risk;
            a.what_activity__c = what;
            a.who_activity__c = UserInfo.getuserid();
            a.when_activity__c = datetime.now();
            }
     }
     
     if((actdate1 != null) && (evt.startswith('Account') || evt1.startswith('Account') || evt.startswith('Client') || evt1.startswith('Client')))
     {
        if(actdate != null)
            {
            if (actdate < actdate1)
                {
                    a.Z_Last_Yearly_Contact_Date__c = actdate1.date();
                    a.Z_Last_Yearly_Contact_Type__c = evt1;
                    a.Last_Yearly_Contact_Customer_Risk_Level__c = risk1;
                    a.what_activity__c = what1;
                    a.who_activity__c = UserInfo.getuserid();
                    a.when_activity__c = datetime.now();
                }
            else
                {
                    a.Z_Last_Yearly_Contact_Date__c = actdate.date();
                    a.Last_Yearly_Contact_Customer_Risk_Level__c = risk;
                    a.Z_Last_Yearly_Contact_Type__c = evt;
                    a.what_activity__c = what;
                    a.who_activity__c = UserInfo.getuserid();
                    a.when_activity__c = datetime.now();
                }
            }
        else
            {
            a.Z_Last_Yearly_Contact_Date__c = actdate1.date();
            a.Z_Last_Yearly_Contact_Type__c = evt1;
            a.Last_Yearly_Contact_Customer_Risk_Level__c = risk1;
            a.what_activity__c = what1;
            a.who_activity__c = UserInfo.getuserid();
            a.when_activity__c = datetime.now();
            }
     }
     /*a.Z_Last_Yearly_Contact_Type__c = evt;*/
     a.Z_Completed_Yearly_Contacts__c = totalcost;
     /*a.Last_Yearly_Contact_Customer_Risk_Level__c = risk;*/
     accounttoupdate.add(a);
     }
    
     update accounttoupdate;
    
     }