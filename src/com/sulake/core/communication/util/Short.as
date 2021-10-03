package com.sulake.core.communication.util
{
   import flash.utils.ByteArray;
   
   public class Short
   {
       
      
      private var var_753:ByteArray;
      
      public function Short(param1:int)
      {
         super();
         var_753 = new ByteArray();
         var_753.writeShort(param1);
         var_753.position = 0;
      }
      
      public function get value() : int
      {
         var _loc1_:int = 0;
         var_753.position = 0;
         if(false)
         {
            _loc1_ = var_753.readShort();
            var_753.position = 0;
         }
         return _loc1_;
      }
   }
}
