package com.sulake.habbo.communication.messages.parser.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class FlatCreatedMessageParser implements IMessageParser
   {
       
      
      private var var_1901:String;
      
      private var var_419:int;
      
      public function FlatCreatedMessageParser()
      {
         super();
      }
      
      public function get flatName() : String
      {
         return var_1901;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_419 = param1.readInteger();
         this.var_1901 = param1.readString();
         Logger.log("FLAT CREATED: " + this.var_419 + ", " + this.var_1901);
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get flatId() : int
      {
         return var_419;
      }
   }
}
