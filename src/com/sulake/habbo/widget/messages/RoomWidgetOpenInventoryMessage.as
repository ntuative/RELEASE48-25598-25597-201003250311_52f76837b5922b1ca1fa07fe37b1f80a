package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenInventoryMessage extends RoomWidgetMessage
   {
      
      public static const const_808:String = "inventory_badges";
      
      public static const const_1314:String = "inventory_clothes";
      
      public static const const_1368:String = "inventory_furniture";
      
      public static const const_657:String = "RWGOI_MESSAGE_OPEN_INVENTORY";
      
      public static const const_983:String = "inventory_effects";
       
      
      private var var_2178:String;
      
      public function RoomWidgetOpenInventoryMessage(param1:String)
      {
         super(const_657);
         var_2178 = param1;
      }
      
      public function get inventoryType() : String
      {
         return var_2178;
      }
   }
}
