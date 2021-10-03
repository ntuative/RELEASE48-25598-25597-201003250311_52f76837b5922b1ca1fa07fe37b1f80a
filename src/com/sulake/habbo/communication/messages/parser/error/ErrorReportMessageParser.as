package com.sulake.habbo.communication.messages.parser.error
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ErrorReportMessageParser implements IMessageParser
   {
       
      
      private var var_1120:int;
      
      private var var_1119:int;
      
      private var var_1118:String;
      
      public function ErrorReportMessageParser()
      {
         super();
      }
      
      public function get messageId() : int
      {
         return var_1120;
      }
      
      public function flush() : Boolean
      {
         var_1119 = 0;
         var_1120 = 0;
         var_1118 = null;
         return true;
      }
      
      public function get errorCode() : int
      {
         return var_1119;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1120 = param1.readInteger();
         var_1119 = param1.readInteger();
         var_1118 = param1.readString();
         return true;
      }
      
      public function get timestamp() : String
      {
         return var_1118;
      }
   }
}
