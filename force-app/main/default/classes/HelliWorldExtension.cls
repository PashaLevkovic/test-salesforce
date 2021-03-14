public class HelliWorldExtension {
    private Order__c order;
    private ApexPages.StandardController stdController;
    
    public HelliWorldExtension(){
		this.order = (Order__c)stdController.getRecord();


    }
    
    
    public Order__c getOrder(){
        return order;
    }
    
    
	
}