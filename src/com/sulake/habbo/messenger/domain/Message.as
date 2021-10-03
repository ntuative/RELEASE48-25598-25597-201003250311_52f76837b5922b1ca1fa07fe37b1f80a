package com.sulake.habbo.messenger.domain
{
   public class Message
   {
      
      public static const const_584:int = 2;
      
      public static const const_1004:int = 6;
      
      public static const const_567:int = 1;
      
      public static const const_661:int = 3;
      
      public static const const_798:int = 4;
      
      public static const const_523:int = 5;
       
      
      private var var_1955:String;
      
      private var var_963:int;
      
      private var var_1954:String;
      
      private var _type:int;
      
      public function Message(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         _type = param1;
         var_963 = param2;
         var_1954 = param3;
         var_1955 = param4;
      }
      
      public function get time() : String
      {
         return var_1955;
      }
      
      public function get senderId() : int
      {
         return var_963;
      }
      
      public function get messageText() : String
      {
         return var_1954;
      }
      
      public function get type() : int
      {
         return _type;
      }
   }
}
