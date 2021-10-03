package com.sulake.habbo.toolbar
{
   public class ToolbarIconBouncer
   {
       
      
      private var var_2127:Number;
      
      private var var_596:Number = 0;
      
      private var var_2126:Number;
      
      private var var_597:Number;
      
      public function ToolbarIconBouncer(param1:Number, param2:Number)
      {
         super();
         var_2127 = param1;
         var_2126 = param2;
      }
      
      public function update() : void
      {
         var_597 += var_2126;
         var_596 += var_597;
         if(var_596 > 0)
         {
            var_596 = 0;
            var_597 = var_2127 * -1 * var_597;
         }
      }
      
      public function reset(param1:int) : void
      {
         var_597 = param1;
         var_596 = 0;
      }
      
      public function get location() : Number
      {
         return var_596;
      }
   }
}
