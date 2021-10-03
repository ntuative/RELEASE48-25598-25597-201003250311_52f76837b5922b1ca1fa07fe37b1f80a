package com.sulake.habbo.catalog.marketplace
{
   public class MarketplaceItemStats
   {
       
      
      private var var_1582:Array;
      
      private var var_1756:int;
      
      private var var_1755:int;
      
      private var var_1759:int;
      
      private var var_1757:int;
      
      private var _dayOffsets:Array;
      
      private var var_1758:int;
      
      private var var_1583:Array;
      
      public function MarketplaceItemStats()
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
      
      public function set averagePrices(param1:Array) : void
      {
         var_1582 = param1.slice();
      }
      
      public function set dayOffsets(param1:Array) : void
      {
         _dayOffsets = param1.slice();
      }
      
      public function get furniTypeId() : int
      {
         return var_1755;
      }
      
      public function set soldAmounts(param1:Array) : void
      {
         var_1583 = param1.slice();
      }
      
      public function set averagePrice(param1:int) : void
      {
         var_1756 = param1;
      }
      
      public function get historyLength() : int
      {
         return var_1759;
      }
      
      public function get furniCategoryId() : int
      {
         return var_1757;
      }
      
      public function get offerCount() : int
      {
         return var_1758;
      }
      
      public function set offerCount(param1:int) : void
      {
         var_1758 = param1;
      }
      
      public function get soldAmounts() : Array
      {
         return var_1583;
      }
      
      public function get averagePrice() : int
      {
         return var_1756;
      }
      
      public function set furniCategoryId(param1:int) : void
      {
         var_1757 = param1;
      }
      
      public function set historyLength(param1:int) : void
      {
         var_1759 = param1;
      }
      
      public function set furniTypeId(param1:int) : void
      {
         var_1755 = param1;
      }
   }
}
