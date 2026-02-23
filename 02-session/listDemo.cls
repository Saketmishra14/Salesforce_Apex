public class ListDemo {
    
    //constructor
    public ListDemo(){
        //Initialize a blank list
        //List<Datatype> varName=new List<Datatype>();
        List<String> dayNameList=new List<String>();
        dayNameList.add('sunday');
        List<String> colorList=new List<String>();
        //to add elements to list we use add method
        colorList.add('Black');
        colorList.add('Green');
        colorList.add('Blue');
        colorList.add('White');
        colorList.add('Red');
        //List can have duplicate elements
        //to display the size of list - how many element list has
        system.debug('size of the colorList is ' +colorList.size());
        //to get an element at particular index we use get method 
        //get color at index 3;
        String color=colorList.get(3);
        system.debug('color at index 3 is ' +color);
        //we can add one list to another list as well using addAll
        colorList.addAll(dayNameList);
        //To iterate on complete list - use foreach
        Integer index=0;
        for(String colors : colorList){
            system.debug('color at index - ' +index+ ' is ' +colors);
            index++;
        }
        //to clear all element from the list
        colorList.clear();
        system.debug('colorList size is ' +colorList.size());
    }

}