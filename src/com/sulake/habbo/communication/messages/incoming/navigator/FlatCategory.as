package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FlatCategory
   {
       
      
      private var var_354:Boolean;
      
      private var var_1211:int;
      
      private var var_1558:String;
      
      public function FlatCategory(param1:IMessageDataWrapper)
      {
         super();
         var_1211 = param1.readInteger();
         var_1558 = param1.readString();
         var_354 = param1.readBoolean();
      }
      
      public function get visible() : Boolean
      {
         return var_354;
      }
      
      public function get nodeName() : String
      {
         return var_1558;
      }
      
      public function get nodeId() : int
      {
         return var_1211;
      }
   }
}
