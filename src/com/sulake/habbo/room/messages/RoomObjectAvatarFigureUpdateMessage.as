package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarFigureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_1934:String;
      
      private var var_395:String;
      
      public function RoomObjectAvatarFigureUpdateMessage(param1:String, param2:String = "")
      {
         super();
         var_395 = param1;
         var_1934 = param2;
      }
      
      public function get race() : String
      {
         return var_1934;
      }
      
      public function get figure() : String
      {
         return var_395;
      }
   }
}
