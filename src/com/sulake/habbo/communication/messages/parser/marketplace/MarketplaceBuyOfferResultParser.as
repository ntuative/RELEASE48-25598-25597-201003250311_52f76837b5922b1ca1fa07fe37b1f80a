package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceBuyOfferResultParser implements IMessageParser
   {
       
      
      private var var_2052:int = -1;
      
      private var var_2051:int = -1;
      
      private var var_2053:int = -1;
      
      private var _result:int;
      
      public function MarketplaceBuyOfferResultParser()
      {
         super();
      }
      
      public function get newPrice() : int
      {
         return var_2051;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get requestedOfferId() : int
      {
         return var_2052;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _result = param1.readInteger();
         var_2053 = param1.readInteger();
         var_2051 = param1.readInteger();
         var_2052 = param1.readInteger();
         return true;
      }
      
      public function get result() : int
      {
         return _result;
      }
      
      public function get offerId() : int
      {
         return var_2053;
      }
   }
}
