package com.sulake.habbo.communication.messages.incoming.recycler
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class PrizeLevelMessageData
   {
       
      
      private var var_1636:int;
      
      private var var_1222:int;
      
      private var var_719:Array;
      
      public function PrizeLevelMessageData(param1:IMessageDataWrapper)
      {
         super();
         var_1222 = param1.readInteger();
         var_1636 = param1.readInteger();
         var_719 = new Array();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            var_719.push(new PrizeMessageData(param1));
            _loc3_++;
         }
      }
      
      public function get probabilityDenominator() : int
      {
         return var_1636;
      }
      
      public function get prizes() : Array
      {
         return var_719;
      }
      
      public function get prizeLevelId() : int
      {
         return var_1222;
      }
   }
}
