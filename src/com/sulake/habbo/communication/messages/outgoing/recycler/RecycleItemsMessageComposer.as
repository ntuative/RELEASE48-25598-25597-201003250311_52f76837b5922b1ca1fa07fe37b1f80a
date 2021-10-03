package com.sulake.habbo.communication.messages.outgoing.recycler
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RecycleItemsMessageComposer implements IMessageComposer
   {
       
      
      private var var_791:Array;
      
      public function RecycleItemsMessageComposer(param1:Array)
      {
         super();
         var_791 = new Array();
         var_791.push(param1.length);
         var_791 = var_791.concat(param1);
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return var_791;
      }
   }
}
