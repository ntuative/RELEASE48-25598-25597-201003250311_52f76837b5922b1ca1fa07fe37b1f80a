package com.sulake.habbo.communication.messages.incoming.recycler
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class PrizeMessageData
   {
       
      
      private var var_1522:int;
      
      private var var_2079:String;
      
      public function PrizeMessageData(param1:IMessageDataWrapper)
      {
         super();
         var_2079 = param1.readString();
         var_1522 = param1.readInteger();
      }
      
      public function get productItemTypeId() : int
      {
         return var_1522;
      }
      
      public function get productItemType() : String
      {
         return var_2079;
      }
   }
}
