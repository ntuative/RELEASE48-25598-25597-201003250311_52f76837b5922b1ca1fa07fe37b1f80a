package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceItemStatsParser implements IMessageParser
   {
       
      
      private var var_1582:Array;
      
      private var var_1756:int;
      
      private var var_1755:int;
      
      private var var_1757:int;
      
      private var var_1759:int;
      
      private var _dayOffsets:Array;
      
      private var var_1758:int;
      
      private var var_1583:Array;
      
      public function MarketplaceItemStatsParser()
      {
         super();
      }
      
      public function get dayOffsets() : Array
      {
         return _dayOffsets;
      }
      
      public function get averagePrices() : Array
      {
         return var_1582;
      }
      
      public function get furniTypeId() : int
      {
         return var_1755;
      }
      
      public function get historyLength() : int
      {
         return var_1759;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get furniCategoryId() : int
      {
         return var_1757;
      }
      
      public function get offerCount() : int
      {
         return var_1758;
      }
      
      public function get soldAmounts() : Array
      {
         return var_1583;
      }
      
      public function get averagePrice() : int
      {
         return var_1756;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1756 = param1.readInteger();
         var_1758 = param1.readInteger();
         var_1759 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         _dayOffsets = [];
         var_1582 = [];
         var_1583 = [];
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _dayOffsets.push(param1.readInteger());
            var_1582.push(param1.readInteger());
            var_1583.push(param1.readInteger());
            _loc3_++;
         }
         var_1757 = param1.readInteger();
         var_1755 = param1.readInteger();
         return true;
      }
   }
}
