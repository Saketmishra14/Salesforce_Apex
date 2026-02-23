public class Demo1CreateRecords {
    
    public Demo1CreateRecords(){
        
        List<Account> accountList= new List<Account>();
        for(Integer i=1;i<=2;i++){
            Account acc= new Account();
            acc.name='Demo Account ' +i;
            accountList.add(acc);
        }
        insert accountList;
        system.debug('>>>>>'+accountList);
        
        List<Contact> contactList=new List<Contact>();
        for(Integer i=1;i<=4;i++){
            Contact con=new Contact();
            con.FirstName='Contact' +i;
            con.LastName='Test';
            if(i<3){
                con.AccountId=accountList.get(0).Id;      
            }else{
                con.AccountId=accountList.get(1).Id;
            }
            contactList.add(con);  
         }
        insert contactList;
    }

}