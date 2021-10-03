package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ScrSendUserInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1838:int;
      
      private var var_1283:String;
      
      private var var_1834:int;
      
      private var var_1836:int;
      
      private var var_1835:int;
      
      private var var_1837:Boolean;
      
      public function ScrSendUserInfoMessageParser()
      {
         super();
      }
      
      public function get productName() : String
      {
         return var_1283;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get hasEverBeenMember() : Boolean
      {
         return var_1837;
      }
      
      public function get responseType() : int
      {
         return var_1836;
      }
      
      public function get daysToPeriodEnd() : int
      {
         return var_1834;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1283 = param1.readString();
         var_1834 = param1.readInteger();
         var_1838 = param1.readInteger();
         var_1835 = param1.readInteger();
         var_1836 = param1.readInteger();
         var_1837 = param1.readBoolean();
         return true;
      }
      
      public function get memberPeriods() : int
      {
         return var_1838;
      }
      
      public function get periodsSubscribedAhead() : int
      {
         return var_1835;
      }
   }
}
