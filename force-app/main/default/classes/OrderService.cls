public class OrderService {
        public static void countTax(List<Order__c> orderList){
        for(Order__c order : orderList){
            if(order.Payment_Type__c == 'Cash'){
                order.Tax_Percentage__c = 0.05;
            } else if (order.Payment_Type__c == 'Credit Card'){
                order.Tax_Percentage__c = 0.055; 
            } else if (order.Payment_Type__c == 'Check'){
                order.Tax_Percentage__c = 0.07;
            }
            order.Tax_Amount__c = order.Payment_Amount__c * order.Tax_Percentage__c;
            order.Income__c = order.Payment_Amount__c - order.Tax_Amount__c;  
        }
    }
    
    public static void createTask(List<Order__c> orderList){
        List<Task> newTasks = new List<Task>();
        for(Order__c ord : orderList){         
            newTasks.add(new Task(Priority = 'High', Status = 'Not Started', Subject = 'Prepare Order - ' + Ord.Name, 
                               OwnerId = UserInfo.getUserId(), Description = ord.Description__c, WhatId = Ord.Id));
        }
        insert newTasks;    
    }
    
    public static void countTotalIncome(List<Order__c> orderList){
        set<ID> orderId = new set<ID>();
        for(Order__c ord : orderList){
            orderId.add(ord.Account__c);
        }
        
        List<AggregateResult> res = [SELECT Account__c, SUM(Income__c) Income, MAX(lastmodifieddate) lastdate FROM Order__c 
                                            WHERE Account__c IN : orderId GROUP BY Account__c];
        
        list<Account> acc = [SELECT id, Total_Income__c, Last_Payment_Date__c FROM Account WHERE id IN : orderId];
        
        for(Account a : acc){   
            for(AggregateResult agg : res){
                if(a.id == agg.get('Account__c')){
            		a.Total_Income__c = (Decimal)agg.get('Income');
            		a.Last_Payment_Date__c = (Datetime)agg.get('lastdate');
                }
            }
        }
        upsert acc;                    
           	
    }

}