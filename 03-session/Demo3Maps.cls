public class Demo3Map {
    
    public Demo3Map(){
        Map<Id,Account> recordIdToAccountMap=new Map<Id,Account>();
        for(Contact con:[SELECT Id,Name,FirstName,Email,Title,Department,Phone,OwnerId,
                         CreatedById,AssistantPhone,Birthdate,CleanStatus,LastName,AccountId
                         FROM Contact
                         WHERE LastName LIKE 'Test'
                         AND AccountId != NULL]){
                             Account acc = new Account();
                             acc.Active__c='yes';
                             acc.Id=con.AccountId;
                             recordIdToAccountMap.put(acc.Id,acc);
                         }
        update recordIdToAccountMap.values();
        
        system.debug('>>>>>'+recordIdToAccountMap);
        system.debug('>>>>'+recordIdToAccountMap.values());
        system.debug('>>>>>'+recordIdToAccountMap.keySet());
        
      }

}


