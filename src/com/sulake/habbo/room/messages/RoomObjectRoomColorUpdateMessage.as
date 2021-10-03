package com.sulake.habbo.room.messages
{
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   
   public class RoomObjectRoomColorUpdateMessage extends RoomObjectUpdateMessage
   {
      
      public static const const_1186:String = "RORCUM_BACKGROUND_COLOR";
       
      
      private var _color:uint = 0;
      
      private var var_1798:Boolean = true;
      
      private var var_1145:int = 0;
      
      private var _type:String = "";
      
      public function RoomObjectRoomColorUpdateMessage(param1:String, param2:uint, param3:int, param4:Boolean)
      {
         super(null,null);
         _type = param1;
         _color = param2;
         var_1145 = param3;
         var_1798 = param4;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get bgOnly() : Boolean
      {
         return var_1798;
      }
      
      public function get light() : uint
      {
         return var_1145;
      }
      
      public function get type() : String
      {
         return _type;
      }
   }
}
