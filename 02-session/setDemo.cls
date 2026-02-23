public class SetDemo {
    public SetDemo(){
        //Initialie a set 
        Set<String> colorSet=new Set<String>();
        //to add value to set we use add method
        colorSet.add('black');
        colorSet.add('white');
        colorSet.add('green');
        colorSet.add('yellow');
        colorSet.add('black');
        colorSet.add('BLACK');
        //to check size of set
        //Black is added 2 times and set only takes unique values it will show size as 4.
        system.debug('size of the set is ' +colorSet.size());
        //Remember that 
        //Apex is case insensitive and I add black in capital letter, will it be 2 values or 1.   
        //values in set are not case insensitive, BLACK in capital letter and small are different value.
        system.debug('size of the set is ' +colorSet.size());
        
        //to check if set contain the partieal value we use containes method
        
        system.debug('set contain Black value 1 ' +colorSet.contains('Black'));
        system.debug('set contain black value 2 ' +colorSet.contains('black'));
        
        Integer index = 0;
        
        for(String color:colorSet){
            system.debug('color at index ' +index+ ' is ' +color);
            index++;
        }
         //to clear all element from set
         colorSet.clear();
        system.debug('size of the set is ' +colorSet.size());
        
        //creating a set from a list
        
        List<String> colorList=new List<String>();
        colorList.add('black');
        colorList.add('green');
        colorList.add('yellow');
        colorList.add('black');
         system.debug('size of the List is ' +colorList.size());
        
        //add list value in set using addAll method
       colorSet.addAll(colorList);
        system.debug('size of the List is ' +colorSet.size());
        
         }
    
    public static void demo2PrimitiveSet(){
        //set<Account>
        //set<Student__c>
        //set is used to store unique value so whereever we need to use unique values we make use of set
        
        set<Account> accountSet=new Set<Account>();
        Account acc=new Account();
        acc.Name='Test Account';
        insert acc;
        system.debug(acc);
        accountSet.add(acc); 
        Account temp=new Account();
        temp.id=acc.id;
        temp.Name='Test Account@1';
        update temp;
        system.debug(temp);
        
        accountSet.add(temp);
        
        system.debug('the size of accountSet is ' +accountSet.size());
        system.debug('>>>>>>>>>>>>> ' +accountSet);
        
        //if all fields values of a record is same than set consider it as duplicate but
        //if any one field value also get changed, the set consider it as another record and it can cause errors in multiple scenarios.
        
        temp.Name='testme';
        update temp;
        system.debug('value of temp is ' +temp);     //testme
        system.debug(accountSet.contains(temp));    //false
         
    }

}