global class UpdateRollUpFieldOnAccount {
    @future
    public static void rollupSwornOfficerCount(List<Id> accRecordId, Set<Id> remParentIds, Boolean isInsert) {
        
        Map<Id,Account> accounts = new Map<Id,Account>();
        Map<Id,Id> families2 = new Map<Id,Id>();
        Map<Id,Account> families = new Map<Id,Account>();
        Set<Id> parentIds = new Set<Id>();
        Boolean run = false;
        List<Account> nextRun = new List<Account>();
        
        List<Account> accNewList = [select Id,
                                         Number_of_Sworn_Personnel_WMP__c,
                                         CAD_Parent_Total_Sworn_Officers__c,
                                         Fire_Career__c,
                                         CAD_Parent_Fire_EMS_Users__c,
                                         ParentId 
                                         from Account 
                                         where Id IN :accRecordId];
                                         
            for(Account acc : accNewList) {
                accounts.put(acc.Id, acc);
            }
            
            for(Account a: [select Id,Number_of_Sworn_Personnel_WMP__c,CAD_Parent_Total_Sworn_Officers__c,Fire_Career__c,CAD_Parent_Fire_EMS_Users__c,ParentId from Account where Id in :remParentIds and Id not in :accounts.keyset()]){
              accounts.put(a.Id,a);
            }
            
            for(Account a: accounts.values()){
                if(a.ParentId == null){
                    families2.put(a.Id,a.Id);
                } else{
                    parentIds.add(a.ParentId); 
                    if(!isInsert){
                      a.CAD_Parent_Total_Sworn_Officers__c = 0;
                      a.CAD_Parent_Fire_EMS_Users__c = 0;
                    }    
                }
            }//ENd of for(Account a: accounts.values())
            do {
                nextRun = [select Id,name,Number_of_Sworn_Personnel_WMP__c,CAD_Parent_Total_Sworn_Officers__c,Fire_Career__c,CAD_Parent_Fire_EMS_Users__c,ParentId from Account where Id in :parentIds and Id not in :accounts.keyset()];
                run = false;
                if(nextRun.size() >0){
                    for(Account a:nextRun){
                        if(a.ParentId <> null){
                            parentIds.add(a.ParentId);
                            run = true;        
                        }
                        accounts.put(a.Id,a);
                    }
                }
            }while (run == true);
            nextRun.clear();
            do {
                nextRun = [select Id,Number_of_Sworn_Personnel_WMP__c,CAD_Parent_Total_Sworn_Officers__c,Fire_Career__c,CAD_Parent_Fire_EMS_Users__c,ParentId from Account where ParentId in :accounts.keyset() and Id not in :accounts.keyset()];
                run = false;
                if(nextRun.size() >0){
                    for(Account a:nextRun){
                        if(a.ParentId <> null){
                            parentIds.add(a.Id);
                            run = true;        
                        }
                        accounts.put(a.Id,a);
                    }
                }
            }while(run == true);
            
            //initialize and set the top level family
            for(Account a: accounts.values()){
                if(a.ParentId == null){
                    families2.put(a.Id,a.Id);
                    a.CAD_Parent_Total_Sworn_Officers__c = (a.Number_of_Sworn_Personnel_WMP__c == null?0:a.Number_of_Sworn_Personnel_WMP__c);
                    a.CAD_Parent_Fire_EMS_Users__c = (a.Fire_Career__c == null?0:a.Fire_Career__c);
                    families.put(a.Id,a);
                }
            }
            
            //set the family on the child records
            do{
                run = false;
                for(Account a: accounts.values()){ 
                    if(a.ParentId <> null){
                        if(!families2.containsKey(a.Id) && families2.containsKey(a.ParentId)){
                            families2.put(a.Id,families2.get(a.ParentId));
                        }else{
                            if(!families2.containsKey(a.Id)){
                                run = true;
                            }
                        }
                    }
                }
            }while(run == true);
            //sum the total sworn officers by family
            for(Account a: accounts.values()){
                if(a.ParentId <> null){
                    families.get(families2.get(a.Id)).CAD_Parent_Total_Sworn_Officers__c += (a.Number_of_Sworn_Personnel_WMP__c == null?0:a.Number_of_Sworn_Personnel_WMP__c);
                    families.get(families2.get(a.Id)).CAD_Parent_Fire_EMS_Users__c += (a.Fire_Career__c == null?0:a.Fire_Career__c);
                }
            }
            
            //Final update and parse records for update
            for(Account a: accounts.values()){
                if(!isInsert){
                    a.triggerupdate__c = Datetime.now().getTime();
                }
            
                if(a.ParentId == null){
                    a.CAD_Parent_Total_Sworn_Officers__c = families.get(a.Id).CAD_Parent_Total_Sworn_Officers__c;
                    a.CAD_Parent_Fire_EMS_Users__c = families.get(a.Id).CAD_Parent_Fire_EMS_Users__c;
                } 
                //AV 27-May-2018: Adding a condition as per request #2.
                else {
                    a.CAD_Parent_Total_Sworn_Officers__c = families.get(families2.get(a.Id)).CAD_Parent_Total_Sworn_Officers__c;
                }
                System.debug('a.CAD_Parent_Total_Sworn_Officers__c::::'+a.CAD_Parent_Total_Sworn_Officers__c);
            }
            Account_c.fromFutureMethod = false;
            System.debug('accounts.values() Before ::::'+accounts.values());
            update accounts.values();
            System.debug('accounts.values() After ::::'+accounts.values());
    }
    
    @future
    public static void rollup911SwornOfficerCount(List<Id> accRecordId, Set<Id> remParentIds, Boolean isInsert) {
        
        Map<Id,Account> accounts = new Map<Id,Account>();
        Map<Id,Id> families2 = new Map<Id,Id>();
        Map<Id,Account> families = new Map<Id,Account>();
        Set<Id> parentIds = new Set<Id>();
        Boolean run = false;
        List<Account> nextRun = new List<Account>();
        
        List<Account> accNewList = [select Id,
                                         Number_of_Sworn_Personnel_WMP__c,
                                         X911_Parent_Total_Sworn_Officers__c,
                                         Fire_Career__c,
                                         CAD_Parent_Fire_EMS_Users__c,
                                         X911_Parent_Account__c 
                                         from Account 
                                         where Id IN :accRecordId];
                                         
            for(Account acc : accNewList) {
                accounts.put(acc.Id, acc);
            }
            
            for(Account a: [select Id,
                                   Number_of_Sworn_Personnel_WMP__c,
                                   X911_Parent_Total_Sworn_Officers__c,
                                   Fire_Career__c,
                                   CAD_Parent_Fire_EMS_Users__c,
                                   X911_Parent_Account__c 
                                   from Account 
                                   where Id in :remParentIds 
                                   and Id not in :accounts.keyset()]){
              accounts.put(a.Id,a);
            }
            
            for(Account a: accounts.values()){
                if(a.X911_Parent_Account__c == null){
                    families2.put(a.Id,a.Id);
                } else{
                    parentIds.add(a.X911_Parent_Account__c); 
                    if(!isInsert){
                      a.X911_Parent_Total_Sworn_Officers__c = 0;
                    }    
                }
            }//ENd of for(Account a: accounts.values())
            do {
                nextRun = [select Id,name,Number_of_Sworn_Personnel_WMP__c,X911_Parent_Total_Sworn_Officers__c,Fire_Career__c,CAD_Parent_Fire_EMS_Users__c,X911_Parent_Account__c from Account where Id in :parentIds and Id not in :accounts.keyset()];
                run = false;
                if(nextRun.size() >0){
                    for(Account a:nextRun){
                        if(a.X911_Parent_Account__c <> null){
                            parentIds.add(a.X911_Parent_Account__c);
                            run = true;        
                        }
                        accounts.put(a.Id,a);
                    }
                }
            }while (run == true);
            nextRun.clear();
            do {
                nextRun = [select Id,Number_of_Sworn_Personnel_WMP__c,X911_Parent_Total_Sworn_Officers__c,Fire_Career__c,CAD_Parent_Fire_EMS_Users__c,X911_Parent_Account__c from Account where X911_Parent_Account__c in :accounts.keyset() and Id not in :accounts.keyset()];
                run = false;
                if(nextRun.size() >0){
                    for(Account a:nextRun){
                        if(a.X911_Parent_Account__c <> null){
                            parentIds.add(a.Id);
                            run = true;        
                        }
                        accounts.put(a.Id,a);
                    }
                }
            }while(run == true);
            
            //initialize and set the top level family
            for(Account a: accounts.values()){
                if(a.X911_Parent_Account__c == null){
                    families2.put(a.Id,a.Id);
                    a.X911_Parent_Total_Sworn_Officers__c = (a.Number_of_Sworn_Personnel_WMP__c == null?0:a.Number_of_Sworn_Personnel_WMP__c);
                    families.put(a.Id,a);
                }
            }
            
            //set the family on the child records
            do{
                run = false;
                for(Account a: accounts.values()){ 
                    if(a.X911_Parent_Account__c <> null){
                        if(!families2.containsKey(a.Id) && families2.containsKey(a.X911_Parent_Account__c)){
                            families2.put(a.Id,families2.get(a.X911_Parent_Account__c));
                        }else{
                            if(!families2.containsKey(a.Id)){
                                run = true;
                            }
                        }
                    }
                }
            }while(run == true);
            //sum the total sworn officers by family
            for(Account a: accounts.values()){
                if(a.X911_Parent_Account__c <> null){
                    families.get(families2.get(a.Id)).X911_Parent_Total_Sworn_Officers__c += (a.Number_of_Sworn_Personnel_WMP__c == null?0:a.Number_of_Sworn_Personnel_WMP__c);
                }
            }
            
            //Final update and parse records for update
            for(Account a: accounts.values()){
                if(!isInsert){
                    a.triggerupdate__c = Datetime.now().getTime();
                }
            
                if(a.X911_Parent_Account__c == null){
                    a.X911_Parent_Total_Sworn_Officers__c = families.get(a.Id).X911_Parent_Total_Sworn_Officers__c;
                } 
                //AV 27-May-2018: Adding a condition as per request #2.
                else {
                    a.X911_Parent_Total_Sworn_Officers__c = families.get(families2.get(a.Id)).X911_Parent_Total_Sworn_Officers__c;
                }
                System.debug('a.X911_Parent_Total_Sworn_Officers__c::::'+a.X911_Parent_Total_Sworn_Officers__c);
            }
            Account_c.fromFutureMethod = false;
            System.debug('accounts.values() Before ::::'+accounts.values());
            update accounts.values();
            System.debug('accounts.values() After ::::'+accounts.values());
    }
    
     @future
    public static void rollupRMSSwornOfficerCount(List<Id> accRecordId, Set<Id> remParentIds, Boolean isInsert) {
        
        Map<Id,Account> accounts = new Map<Id,Account>();
        Map<Id,Id> families2 = new Map<Id,Id>();
        Map<Id,Account> families = new Map<Id,Account>();
        Set<Id> parentIds = new Set<Id>();
        Boolean run = false;
        List<Account> nextRun = new List<Account>();
        
        List<Account> accNewList = [select Id,
                                         Number_of_Sworn_Personnel_WMP__c,
                                         RMS_Parent_Total_Sworn_Officers__c,
                                         Fire_Career__c,
                                         CAD_Parent_Fire_EMS_Users__c,
                                         RMS_Parent_Account__c 
                                         from Account 
                                         where Id IN :accRecordId];
                                         
            for(Account acc : accNewList) {
                accounts.put(acc.Id, acc);
            }
            
            for(Account a: [select Id,
                                   Number_of_Sworn_Personnel_WMP__c,
                                   RMS_Parent_Total_Sworn_Officers__c,
                                   Fire_Career__c,
                                   CAD_Parent_Fire_EMS_Users__c,
                                   RMS_Parent_Account__c 
                                   from Account 
                                   where Id in :remParentIds 
                                   and Id not in :accounts.keyset()]){
              accounts.put(a.Id,a);
            }
            
            for(Account a: accounts.values()){
                if(a.RMS_Parent_Account__c == null){
                    families2.put(a.Id,a.Id);
                } else{
                    parentIds.add(a.RMS_Parent_Account__c); 
                    if(!isInsert){
                      a.RMS_Parent_Total_Sworn_Officers__c = 0;
                    }    
                }
            }//ENd of for(Account a: accounts.values())
            do {
                nextRun = [select Id,
                                  name,
                                  Number_of_Sworn_Personnel_WMP__c,
                                  RMS_Parent_Total_Sworn_Officers__c,
                                  Fire_Career__c,
                                  CAD_Parent_Fire_EMS_Users__c,
                                  RMS_Parent_Account__c 
                                  from Account 
                                  where Id in :parentIds 
                                  and Id not in :accounts.keyset()];
                run = false;
                if(nextRun.size() >0){
                    for(Account a:nextRun){
                        if(a.RMS_Parent_Account__c <> null){
                            parentIds.add(a.RMS_Parent_Account__c);
                            run = true;        
                        }
                        accounts.put(a.Id,a);
                    }
                }
            }while (run == true);
            nextRun.clear();
            do {
                nextRun = [select Id,
                                  Number_of_Sworn_Personnel_WMP__c,
                                  RMS_Parent_Total_Sworn_Officers__c,
                                  Fire_Career__c,
                                  CAD_Parent_Fire_EMS_Users__c,
                                  RMS_Parent_Account__c 
                                  from Account 
                                  where RMS_Parent_Account__c in :accounts.keyset() 
                                  and Id not in :accounts.keyset()];
                run = false;
                if(nextRun.size() >0){
                    for(Account a:nextRun){
                        if(a.RMS_Parent_Account__c <> null){
                            parentIds.add(a.Id);
                            run = true;        
                        }
                        accounts.put(a.Id,a);
                    }
                }
            }while(run == true);
            
            //initialize and set the top level family
            for(Account a: accounts.values()){
                if(a.RMS_Parent_Account__c == null){
                    families2.put(a.Id,a.Id);
                    a.RMS_Parent_Total_Sworn_Officers__c = (a.Number_of_Sworn_Personnel_WMP__c == null?0:a.Number_of_Sworn_Personnel_WMP__c);
                    families.put(a.Id,a);
                }
            }
            
            //set the family on the child records
            do{
                run = false;
                for(Account a: accounts.values()){ 
                    if(a.RMS_Parent_Account__c <> null){
                        if(!families2.containsKey(a.Id) && families2.containsKey(a.RMS_Parent_Account__c)){
                            families2.put(a.Id,families2.get(a.RMS_Parent_Account__c));
                        }else{
                            if(!families2.containsKey(a.Id)){
                                run = true;
                            }
                        }
                    }
                }
            }while(run == true);
            //sum the total sworn officers by family
            for(Account a: accounts.values()){
                if(a.RMS_Parent_Account__c <> null){
                    System.debug('a.Number_of_Sworn_Personnel_WMP__c::::'+a.Number_of_Sworn_Personnel_WMP__c);
                    System.debug('a.Id::::'+a.Id);
                    families.get(families2.get(a.Id)).RMS_Parent_Total_Sworn_Officers__c += (a.Number_of_Sworn_Personnel_WMP__c == null?0:a.Number_of_Sworn_Personnel_WMP__c);
                }
            }
            System.debug('families::::'+families);
            System.debug('families2::::'+families2);
            //Final update and parse records for update
            for(Account a: accounts.values()){
                if(!isInsert){
                    a.triggerupdate__c = Datetime.now().getTime();
                }
            
                if(a.RMS_Parent_Account__c == null){
                    a.RMS_Parent_Total_Sworn_Officers__c = families.get(a.Id).RMS_Parent_Total_Sworn_Officers__c;
                } 
                //AV 27-May-2018: Adding a condition as per request #2.
                else {
                    a.RMS_Parent_Total_Sworn_Officers__c = families.get(families2.get(a.Id)).RMS_Parent_Total_Sworn_Officers__c;
                }
                System.debug('a.RMS_Parent_Total_Sworn_Officers__c::::'+a.RMS_Parent_Total_Sworn_Officers__c);
            }
            Account_c.fromFutureMethod = false;
            System.debug('accounts.values() Before ::::'+accounts.values());
            update accounts.values();
            System.debug('accounts.values() After ::::'+accounts.values());
    }
}