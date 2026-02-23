public class DatabaseOperationsDemo {
    
    public static void createSingleAccountRecor(){
        //Never ever create a class same as object API name e.g NEVER create a class named Account,contact, Student__c, etc...
        //Salesforce automatically created a class corresponding to each objects,if you create a user defined class with same name, your object will stop working 
        Account acc=new Account();
        acc.name='Test User01';
        acc.Industry='Technology';
        acc.AnnualRevenue=9000000;
        acc.Active__c='no';
        insert acc;
        
        //we do not have system.out.printIn here in order to print anything in console
        //in case of apex, we need to print all stuff in Logs and we can read those logs.
         
        System.debug('created Account id is '+ acc.id);
        System.debug('Account detial is '+ acc);
        
    }
    
    public static void createMultipleAccountRecord(){
        //we will create 200 account records 
     /*  for(Integer i=1;i<=200;i++){
            Account acc=new Account();
            acc.name='Test Account' +i;
            acc.Industry='Technology';
            acc.Active__c='no';
            acc.AnnualRevenue=100000000;
            insert acc;
        }*/
        //the above code written in WRONG,it thrown an exception TOO MANY DML(DATA MANIPULATION LANGUAGE) 151
        //In a single transaction, we can only write 150 DMLs, anytie we hit more than 150 DML, we will get an erro as DML limit is 150.
        //NEVER EVER WRITE DML IN LOOP
        //to solve above scenario we make use of collection in Apex and we make use of List.
        
        List<Account> accountList=new List<Account>();
        for(Integer i=1;i<20;i++){
            Account acc=new Account();
            acc.Name='Demo Test' + i;
            acc.industry='Technology';
            acc.Active__c='no';
            acc.AnnualRevenue=1000000;
            accountList.add(acc);
        }
        //Loop ends here
        insert accountList;
        
    }

}