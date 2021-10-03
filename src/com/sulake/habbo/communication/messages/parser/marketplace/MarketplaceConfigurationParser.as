package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceConfigurationParser implements IMessageParser
   {
       
      
      private var var_1693:int;
      
      private var var_1414:int;
      
      private var var_1689:int;
      
      private var var_1687:int;
      
      private var var_1688:int;
      
      private var var_1413:int;
      
      private var var_1690:int;
      
      private var var_1181:Boolean;
      
      public function MarketplaceConfigurationParser()
      {
         super();
      }
      
      public function get offerMaxPrice() : int
      {
         return var_1693;
      }
      
      public function get tokenBatchPrice() : int
      {
         return var_1414;
      }
      
      public function get averagePricePeriod() : int
      {
         return var_1690;
      }
      
      public function get offerMinPrice() : int
      {
         return var_1687;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get expirationHours() : int
      {
         return var_1688;
      }
      
      public function get tokenBatchSize() : int
      {
         return var_1413;
      }
      
      public function get commission() : int
      {
         return var_1689;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1181 = param1.readBoolean();
         var_1689 = param1.readInteger();
         var_1414 = param1.readInteger();
         var_1413 = param1.readInteger();
         var_1687 = param1.readInteger();
         var_1693 = param1.readInteger();
         var_1688 = param1.readInteger();
         var_1690 = param1.readInteger();
         return true;
      }
      
      public function get isEnabled() : Boolean
      {
         return var_1181;
      }
   }
}
