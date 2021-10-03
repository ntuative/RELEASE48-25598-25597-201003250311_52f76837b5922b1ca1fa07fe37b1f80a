package com.sulake.habbo.widget.messages
{
   public class RoomWidgetStickieSendUpdateMessage extends RoomWidgetMessage
   {
      
      public static const const_428:String = "RWSUM_STICKIE_SEND_UPDATE";
      
      public static const const_636:String = "RWSUM_STICKIE_SEND_DELETE";
       
      
      private var var_675:String;
      
      private var var_149:int;
      
      private var var_191:String;
      
      public function RoomWidgetStickieSendUpdateMessage(param1:String, param2:int, param3:String = "", param4:String = "")
      {
         super(param1);
         var_149 = param2;
         var_191 = param3;
         var_675 = param4;
      }
      
      public function get objectId() : int
      {
         return var_149;
      }
      
      public function get text() : String
      {
         return var_191;
      }
      
      public function get colorHex() : String
      {
         return var_675;
      }
   }
}
