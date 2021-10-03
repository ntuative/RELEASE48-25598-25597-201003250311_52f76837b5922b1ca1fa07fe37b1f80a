package com.sulake.habbo.communication.messages.parser.room.session
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class CantConnectMessageParser implements IMessageParser
   {
      
      public static const const_1457:int = 2;
      
      public static const const_1214:int = 4;
      
      public static const const_1362:int = 1;
      
      public static const const_1253:int = 3;
       
      
      private var var_981:int = 0;
      
      private var var_820:String = "";
      
      public function CantConnectMessageParser()
      {
         super();
      }
      
      public function get reason() : int
      {
         return var_981;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_981 = param1.readInteger();
         if(var_981 == 3)
         {
            var_820 = param1.readString();
         }
         else
         {
            var_820 = "";
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         var_981 = 0;
         var_820 = "";
         return true;
      }
      
      public function get parameter() : String
      {
         return var_820;
      }
   }
}
