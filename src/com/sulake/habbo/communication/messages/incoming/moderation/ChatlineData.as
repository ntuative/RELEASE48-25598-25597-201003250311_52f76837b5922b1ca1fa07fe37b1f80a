package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChatlineData
   {
       
      
      private var var_1565:String;
      
      private var var_2092:int;
      
      private var var_2094:int;
      
      private var var_2095:int;
      
      private var var_2093:String;
      
      public function ChatlineData(param1:IMessageDataWrapper)
      {
         super();
         var_2092 = param1.readInteger();
         var_2095 = param1.readInteger();
         var_2094 = param1.readInteger();
         var_2093 = param1.readString();
         var_1565 = param1.readString();
      }
      
      public function get msg() : String
      {
         return var_1565;
      }
      
      public function get hour() : int
      {
         return var_2092;
      }
      
      public function get minute() : int
      {
         return var_2095;
      }
      
      public function get chatterName() : String
      {
         return var_2093;
      }
      
      public function get chatterId() : int
      {
         return var_2094;
      }
   }
}
