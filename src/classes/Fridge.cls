public class Fridge {
public String modelNumber;
public Integer numberInStock;
public static Integer stockThreshold = 5;
public Fridge() {
    modelNumber = 'XX-XX';
    numberInStock = 0;
}
public Fridge(String theModelNumber, Integer theNumberInStock) {
    modelNumber = theModelNumber;
    numberInStock = theNumberInStock;
}
public string getModelNumber(){
return modelNumber;
}
}