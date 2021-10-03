package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureQueueTileVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1099:int = 1;
      
      private static const const_1056:int = 3;
      
      private static const const_1101:int = 2;
      
      private static const const_1100:int = 15;
       
      
      private var var_869:int;
      
      private var var_223:Array;
      
      public function FurnitureQueueTileVisualization()
      {
         var_223 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == const_1101)
         {
            var_223 = new Array();
            var_223.push(const_1099);
            var_869 = const_1100;
         }
         super.setAnimation(param1);
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(var_869 > 0)
         {
            --var_869;
         }
         if(var_869 == 0)
         {
            if(false)
            {
               super.setAnimation(var_223.shift());
            }
         }
         return super.updateAnimation(param1);
      }
   }
}
