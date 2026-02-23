public class Demo2ListSolution {
    
    public Demo2ListSolution(){
        List<Contact> contactList=[SELECT Id,Name,FirstName,Email,Title,Department,Phone,OwnerId,
                                   CreatedById,AssistantPhone,Birthdate,CleanStatus,LastName,AccountId
                                   FROM Contact
                                   WHERE LastName
                                   LIKE 'Test'];
        
        //Total records-4
        Set<Id> accountIdSet=new Set<Id>();
        List<Account> accountList=new List<Account>();
        for(Contact con: contactList ){
            if(!accountIdSet.contains(con.AccountId)){   //if my set contains account id or not, if it do not contains, execute the logic write in if condition
            Account acc=new Account();   //contact -1,2,3,4 , List - Demo Account  record added again, Demo Account 2 record, Demo Account 3 record, Demo account 4 record added one by one
            acc.Active__c='Yes';
            acc.Id=con.AccountId;
            accountList.add(acc);       //Your list has 4 records and both of them are duplicate 
                accountIdSet.add(con.AccountId);     //adding account id to set which is being added to list.
            }
        }
        update accountList;   // once we try to update the records and our list has duplicate records , an exception is thrown
        system.debug(accountList);
} 
    
    //Iterate 
    //Contact- 1
    //Set -IT do not contain Demo Account 1 id so it allow to execute code inside if.
    //List -Demo Account 1 record
    //Set Demo Account 1 record id is added to set.
    //Contact-2
    //Set- set already have id of  demo account 1, it will check if it contains id of demo account 1, and it contains that code inside if will not execute.
    //List - nothing get added here 
    //Set - nothing get added
    //Contact -3 
    //Set - IT  do not contain Demo Account 2 id  so it allow to execute code inside if
    //List - Demo Account 2 record
    //Set - Demo Account 2 record id is added to set.
    //Contact -4 
    //Set- set already have id of demo account 2 , it will check if it contains id of demo account 2, and it contains that code inside if will not execute.
    //List - Nothing get added here 
    //Set - nothing get added
    
    
    
    
    
    
    
    public static void alternateCode(){
        Set<Id> accountIdSet =new Set<Id>();
        for(Contact con : [SELECT Id,Name,FirstName,Email,Title,Department,
                           AccountId
                           FROM Contact
                           WHERE LastName LIKE 'Test'
                           AND AccountId !=NULL]){
                               accountIdSet.add(con.AccountId);
                           }
       List<Account> accountList=[SELECT Id,Active__c 
                                  FROM Account 
                                  WHERE Id IN:accountIdSet];
        for(Account acc:accountList){
            acc.Active__c='yes';
        }
        update accountList;
    }
    
    public static void alternateCode2(){
        Set<Id> accountIdSet =new Set<Id>();
        for(Contact con : [SELECT Id,Name,FirstName,Email,Title,Department,
                           AccountId
                           FROM Contact
                           WHERE LastName LIKE 'Test'
                           AND AccountId !=NULL]){
                               accountIdSet.add(con.AccountId);
                           }
        List<Account> accountList=new List<Account>();
        for(Id accountId :accountIdSet){
            Account acc=new Account();
            acc.Id=accountId;
            acc.Active__c='yes';
            accountList.add(acc);
            //updating this account record will only update active field for a particular account id and rest all fields remain intact as it is.
        }
        update accountList;
    }

}