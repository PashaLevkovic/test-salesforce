trigger AccountTrigger on Account (after insert, after update) {
	/*List<Order__c> orderList = [SELECT id, Income__c, Account__c FROM Order__c WHERE Account__c IN : Trigger.newMap.keyset()];
    for(Account a : Trigger.new){
        for(Order__c o : orderList){
            if(a.id == o.Account__c){
                a.Total_Income__c += o.Income__c;
            }
        }
    }*/
}