public class Fridge {
    private string modelNumber;
    private Integer numberInStock;
    
    public Fridge(){
        this.modelNumber = 'xx-xx';
        this.numberInStock = 0;
    }
    
    public Fridge(string modelNumber, integer numberInStock){
        this.modelNumber = modelNumber;
        this.numberInStock = numberInStock;
    }
    
    public void setModelNumber(string modelNumber){
        this.modelNumber = modelNumber;
    }
    
    public string getModelNumber(){
        return modelNumber;
    }
    
    public void setNumberInStock(Integer numberInStock){
        this.numberInStock = numberInStock;
    }
    
    public Integer getNumberInStock(){
        return numberInStock;
    }
    
    public void updateStock(Integer justSold){
        numberInStock -= justSold;
    }

}