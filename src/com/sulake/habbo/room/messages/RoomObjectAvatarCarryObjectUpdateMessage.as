package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarCarryObjectUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_998:int;
      
      private var var_1228:String;
      
      public function RoomObjectAvatarCarryObjectUpdateMessage(param1:int, param2:String)
      {
         super();
         var_998 = param1;
         var_1228 = param2;
      }
      
      public function get itemType() : int
      {
         return var_998;
      }
      
      public function get itemName() : String
      {
         return var_1228;
      }
   }
}
