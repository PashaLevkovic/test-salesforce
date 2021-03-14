@isTest
public class OrderTemplateTriggerTest {
    @testSetup static void setup(){
        List<Order__c> testOrders = new List<Order__c>();
        for(Integer i = 0; i < 2; i++){
            testOrders.add(new Order__c(Payment_Amount__c = 100, Description__c = 'pasha' + i, Payment_Type__c = paymentType(i)));
        }
        Account acc = new Account(name = 'pasha');
        insert acc;
        insert testOrders;
    }
    
    private static String paymentType(Integer i){
        if(i == 0){
            return 'Cash';
        } else if(i == 1){
            return 'Credit Card';
        } else {
            return 'Check';
        }
    }
    
    @isTest static void insertOrders(){
        Account acc = [SELECT id FROM Account WHERE Name = 'pasha'];
        Order__c ordInsert = new Order__c(Payment_Amount__c = 100, Description__c = 'pashaInsertTest', 
                                          Payment_Type__c = paymentType(0), Account__c = acc.id);
        
        Test.startTest();
        insert ordInsert;
        Test.stopTest();
        
        ordInsert = [SELECT id, Tax_Percentage__c, Tax_Amount__c, Income__c, Name, Description__c FROM Order__c 
                     WHERE id = : ordInsert.id limit 1];
        
        System.assertEquals(0.05, ordInsert.Tax_Percentage__c);
        System.assertEquals(5, ordInsert.Tax_Amount__c);
        System.assertEquals(95, ordInsert.Income__c);
        
        Task task = [SELECT id, Priority, Status, Subject, Description FROM Task WHERE WhatId = : ordInsert.id limit 1];
        
        System.assertEquals('High', task.Priority);
        System.assertEquals('Not Started', task.status);
        System.assertEquals('Prepare Order - ' + ordInsert.Name, Task.Subject);
        System.assertEquals(ordInsert.Description__c, task.Description);
        
        Account account = [SELECT id, Total_Income__c FROM Account WHERE Name = 'pasha'];
         
        System.assertEquals(95, account.Total_Income__c);        
    }
    
    @isTest static void updateOrders(){
        Account acc = [SELECT id FROM Account WHERE Name = 'pasha'];
        Order__c updateOrder = [SELECT id, Tax_Percentage__c, Tax_Amount__c, Income__c FROM Order__c 
                                WHERE Description__c = 'pasha0'];
        updateOrder.Account__c = acc.id;
        updateOrder.Payment_Amount__c = 200;
        
        Test.startTest();
        update updateOrder;
        Test.stopTest();
        
        updateOrder = [SELECT id, Tax_Percentage__c, Tax_Amount__c, Income__c FROM Order__c 
                                WHERE Description__c = 'pasha0'];
        
        System.assertEquals(0.05, updateOrder.Tax_Percentage__c);
        System.assertEquals(10, updateOrder.Tax_Amount__c);
        System.assertEquals(190, updateOrder.Income__c);
        
        acc = [SELECT id, Total_Income__c FROM Account WHERE Name = 'pasha'];
        System.assertEquals(190, acc.Total_Income__c);
    }
    
    @isTest static void deleteOrders(){
        List<Order__c> orders = [SELECT id, Tax_Percentage__c, Tax_Amount__c, Income__c FROM Order__c];
        Account acc = [SELECT id, Total_Income__c FROM Account WHERE Name = : 'pasha'];
        for(Order__c order : orders){
            order.Account__c = acc.id;
        }
        update orders;
        
        Test.startTest();
        delete orders[1];
        Test.stopTest();
        
        acc = [SELECT id, Total_Income__c FROM Account WHERE Name = : 'pasha'];
        System.assertEquals(95, acc.Total_Income__c);
    }
    

}