public class MapDemo {
    
    public MapDemo(){
        //to initialize a map
        //Map<key,value>  - keys are unique(similar to set so keys are always primitive data types),Value can be duplicate and is like list so it can have anything.
        
        Map<String,String> keyToColorMap=new Map<String,String>();
        Map<Id,Account> accountIdToRecordMap = new Map<Id,Account>();
        Map<Id,List<Contact>> accountIdToContacttMap= new Map<Id,List<Contact>>();
        //to add element into the map we use put method
        
        keyToColorMap.put('key1','black');
        keyToColorMap.put('key2','red');
        keyToColorMap.put('key3','black');
        system.debug('>>>>>>1' +keyToColorMap);
        //if you put an element where key already exist, it will override the value of the key.
        keyToColorMap.put('key1','blue');
        system.debug('>>>>>2' +keyToColorMap);
        //to check size of the map we use size method
        system.debug('>>>>>3 Size is' +keyToColorMap.size());
        //to check if a map contains a key or not we use containsKey method
        system.debug('>>>>>4 map contains key1 ' +keyToColorMap.containsKey('key1'));
        
        //To get all keys from the map -- the values are extracted in form of Set
        Set<String> mapKeySet= keyToColorMap.keySet();
        system.debug('>>>>>5' +mapKeySet);
        
        //To get all values from the map -- the value are extracted in for of list
        List<String> mapValueList=keyToColorMap.values();
        system.debug('>>>>>6' +mapValueList);
        //getting a value a particular key
        system.debug('>>>>>7' +keyToColorMap.get('key1'));
        //to iterate on map we iterate on keys and get the value using get method
        for(String key:keyToColorMap.keySet()){
            system.debug('value for key:' +key+ 'is ' +keyToColorMap.get(key));
        }
        //to clear the map 
        keyToColorMap.clear();
        system.debug('>>>>>>9 size is ' +keyToColorMap.size());
        
        
        
    }

}