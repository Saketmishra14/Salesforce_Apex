public class Demo4Class {
    
    public Demo4Class(){
        Map<Id,List<Contact>> accountIdToContactMap= new Map<Id,List<Contact>>();
        Set<Id> accountIdSet = new Set<Id>();
        
        for(Contact con : [SELECT Id,AccountId 
                          FROM Contact
                          WHERE CreatedDate=LAST_N_DAYS:7
                           AND AccountId != NULL]){
                               accountIdSet.add(con.AccountId);
                           }
        
        for(Account acc : [SELECT Id,Name,
                          (SELECT Id,Name,Level__c FROM Contacts) //It has a limitation of 200 records.
                          FROM Account
                           WHERE ID IN :accountIdSet]){
                               accountIdToContactMap.put(acc.Id,acc.Contacts);
                           }
        
        //iteration
        
        for(Id accountId : accountIdToContactMap.keySet()){
            List<Contact> contactList = accountIdToContactMap.get(accountId);
            String s= 'Account Id is '+accountId;
            for(Contact con: contactList){
                s=s+ '>>>>>>>>> contacts >>>>>>>' +con;
            }
            system.debug(s);
            
        }
        
        //update field for all contacts
        
        List<Contact> contactUpdateList =new List<Contact>();
        List<List<Contact>> tempContactList = accountIdToContactMap.values();//this return me the list of values and value in List<Contact>.
        
        for(List<Contact> conList: tempContactList){
            for(Contact con: conList){
                con.Level__c='Primary';
                contactUpdateList.add(con);
         }
        }
        update contactUpdateList;
        
    }

    
}