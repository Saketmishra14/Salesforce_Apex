public class DatabaseOperationsDemo {
    
    public static void createSingleAccountRecord(){
        //Never ever create a class same as object API name e.g NEVER create a class named Account,contact, Student__c, etc...
        //Salesforce automatically created a class corresponding to each objects,if you create a user defined class with same name, your object will stop working 
        Account acc=new Account();
        acc.name='Test User03';
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
    
    public static void readMultipleRecords(){
        List<Account> accountList=new List<Account>();
        accountList=[Select ID,Name,Active__c,Industry,AnnualRevenue From Account WHERE Name LIKE 'Demo Test%' ORDER BY Name];
      /*  for(Integer i=0;i<accountList.size();i++){
            Account acc=accountList.get(i);
            system.debug('>>>>>'+ acc.Id+ '>>>>>'+ acc.Name);
           }  */
        //For Each loop 
        for(Account acc : accountList){
            system.debug('>>>>>'+ acc.Id+ '>>>>>'+ acc.Name);
          }
         }
    public static void updateMultipleRecords(){
        List<Account> accountList = new List<Account>();
        accountList=[Select ID,Name,Active__c,Industry,AnnualRevenue From Account WHERE Name LIKE 'Demo Test%' ORDER BY Name];
        //for Each loop
        
        for(Account acc: accountList){
            acc.Active__c='Yes';   
            //update acc; // we do not write like this as this is DML in loop
            
         }
        update accountList;  
    }
    public static void deleteMultipleRecords(){
        List<Account> accountList=new List<Account>();
        accountList=[Select ID from Account where Name LIKE 'Test Account%' ];     
        delete accountList;        
        //for Each loop  
       
    }
    
    
}