package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class RoomVisitData
   {
       
      
      private var var_662:String;
      
      private var var_2072:int;
      
      private var var_1452:Boolean;
      
      private var _roomId:int;
      
      private var var_2071:int;
      
      public function RoomVisitData(param1:IMessageDataWrapper)
      {
         super();
         var_1452 = param1.readBoolean();
         _roomId = param1.readInteger();
         var_662 = param1.readString();
         var_2071 = param1.readInteger();
         var_2072 = param1.readInteger();
      }
      
      public function get isPublic() : Boolean
      {
         return var_1452;
      }
      
      public function get roomName() : String
      {
         return var_662;
      }
      
      public function get enterMinute() : int
      {
         return var_2072;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get enterHour() : int
      {
         return var_2071;
      }
   }
}
