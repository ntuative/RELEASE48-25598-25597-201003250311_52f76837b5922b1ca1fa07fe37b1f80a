package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionPollEvent extends RoomSessionEvent
   {
      
      public static const const_109:String = "RSPE_POLL_CONTENT";
      
      public static const const_123:String = "RSPE_POLL_OFFER";
      
      public static const const_58:String = "RSPE_POLL_ERROR";
       
      
      private var var_973:Array = null;
      
      private var var_1184:String = "";
      
      private var var_1210:String;
      
      private var var_1183:String = "";
      
      private var var_972:int = 0;
      
      private var _id:int = -1;
      
      public function RoomSessionPollEvent(param1:String, param2:IRoomSession, param3:int)
      {
         _id = param3;
         super(param1,param2);
      }
      
      public function get questionArray() : Array
      {
         return var_973;
      }
      
      public function get startMessage() : String
      {
         return var_1184;
      }
      
      public function get summary() : String
      {
         return var_1210;
      }
      
      public function set startMessage(param1:String) : void
      {
         var_1184 = param1;
      }
      
      public function set numQuestions(param1:int) : void
      {
         var_972 = param1;
      }
      
      public function set summary(param1:String) : void
      {
         var_1210 = param1;
      }
      
      public function get numQuestions() : int
      {
         return var_972;
      }
      
      public function set endMessage(param1:String) : void
      {
         var_1183 = param1;
      }
      
      public function get endMessage() : String
      {
         return var_1183;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function set questionArray(param1:Array) : void
      {
         var_973 = param1;
      }
   }
}
