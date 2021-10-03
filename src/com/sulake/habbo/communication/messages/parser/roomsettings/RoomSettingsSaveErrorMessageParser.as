package com.sulake.habbo.communication.messages.parser.roomsettings
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class RoomSettingsSaveErrorMessageParser implements IMessageParser
   {
      
      public static const const_1552:int = 9;
      
      public static const const_1576:int = 4;
      
      public static const const_1506:int = 1;
      
      public static const const_1280:int = 10;
      
      public static const const_1612:int = 2;
      
      public static const const_1196:int = 7;
      
      public static const const_1367:int = 11;
      
      public static const const_1450:int = 3;
      
      public static const const_1141:int = 8;
      
      public static const const_1169:int = 5;
      
      public static const const_1596:int = 6;
      
      public static const const_1172:int = 12;
       
      
      private var var_2249:String;
      
      private var _roomId:int;
      
      private var var_1119:int;
      
      public function RoomSettingsSaveErrorMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get info() : String
      {
         return var_2249;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _roomId = param1.readInteger();
         var_1119 = param1.readInteger();
         var_2249 = param1.readString();
         return true;
      }
      
      public function get errorCode() : int
      {
         return var_1119;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
   }
}
