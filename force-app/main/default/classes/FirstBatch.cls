global class FirstBatch implements Database.Batchable<sObject>{
    
    global Database.QueryLocator start(Database.BatchableContext context){
        return Database.getQueryLocator([SELECT Tax_Percentage__c, Tax_Amount__c, Payment_Amount__c, Income__c FROM order__c]);
    }
    
    global void execute(Database.BatchableContext context, list<Order__c> scope){
        for(Order__c ord : scope){
            ord.Tax_Percentage__c = 0.03;
            ord.Tax_Amount__c = ord.Payment_Amount__c * ord.Tax_Percentage__c;
            ord.Income__c = ord.Payment_Amount__c - ord.Tax_Amount__c;
        }
        update scope;
    }
    
    global void finish(Database.BatchableContext context){
        system.debug('finish ' + context);
    }
		
}