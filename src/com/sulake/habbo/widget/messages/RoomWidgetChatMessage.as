package com.sulake.habbo.widget.messages
{
   public class RoomWidgetChatMessage extends RoomWidgetMessage
   {
      
      public static const const_118:int = 0;
      
      public static const const_126:int = 1;
      
      public static const const_103:int = 2;
      
      public static const const_503:String = "RWCM_MESSAGE_CHAT";
       
      
      private var var_1160:int = 0;
      
      private var var_2207:String = "";
      
      private var var_191:String = "";
      
      public function RoomWidgetChatMessage(param1:String, param2:String, param3:int = 0, param4:String = "")
      {
         super(param1);
         var_191 = param2;
         var_1160 = param3;
         var_2207 = param4;
      }
      
      public function get recipientName() : String
      {
         return var_2207;
      }
      
      public function get chatType() : int
      {
         return var_1160;
      }
      
      public function get text() : String
      {
         return var_191;
      }
   }
}
