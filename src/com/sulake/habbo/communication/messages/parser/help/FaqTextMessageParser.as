package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class FaqTextMessageParser implements IMessageParser
   {
       
      
      private var var_1337:int;
      
      private var var_1336:String;
      
      public function FaqTextMessageParser()
      {
         super();
      }
      
      public function get questionId() : int
      {
         return var_1337;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1337 = param1.readInteger();
         var_1336 = param1.readString();
         return true;
      }
      
      public function get answerText() : String
      {
         return var_1336;
      }
      
      public function flush() : Boolean
      {
         var_1337 = -1;
         var_1336 = null;
         return true;
      }
   }
}
