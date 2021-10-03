package com.sulake.habbo.communication.messages.incoming.inventory.trading
{
   public class ItemDataStructure
   {
       
      
      private var var_998:String;
      
      private var var_1742:int;
      
      private var var_1745:int;
      
      private var var_1424:int;
      
      private var var_1743:int;
      
      private var _category:int;
      
      private var var_2358:int;
      
      private var var_1746:int;
      
      private var var_1747:int;
      
      private var var_1741:int;
      
      private var var_1744:int;
      
      private var var_1748:Boolean;
      
      private var var_1386:String;
      
      public function ItemDataStructure(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:int, param8:int, param9:int, param10:int, param11:int, param12:Boolean)
      {
         super();
         var_1742 = param1;
         var_998 = param2;
         var_1745 = param3;
         var_1741 = param4;
         _category = param5;
         var_1386 = param6;
         var_1424 = param7;
         var_1747 = param8;
         var_1746 = param9;
         var_1744 = param10;
         var_1743 = param11;
         var_1748 = param12;
      }
      
      public function get itemTypeID() : int
      {
         return var_1741;
      }
      
      public function get extra() : int
      {
         return var_1424;
      }
      
      public function get stuffData() : String
      {
         return var_1386;
      }
      
      public function get groupable() : Boolean
      {
         return var_1748;
      }
      
      public function get creationMonth() : int
      {
         return var_1744;
      }
      
      public function get roomItemID() : int
      {
         return var_1745;
      }
      
      public function get itemType() : String
      {
         return var_998;
      }
      
      public function get itemID() : int
      {
         return var_1742;
      }
      
      public function get songID() : int
      {
         return var_1424;
      }
      
      public function get timeToExpiration() : int
      {
         return var_1747;
      }
      
      public function get creationYear() : int
      {
         return var_1743;
      }
      
      public function get creationDay() : int
      {
         return var_1746;
      }
      
      public function get category() : int
      {
         return _category;
      }
   }
}
