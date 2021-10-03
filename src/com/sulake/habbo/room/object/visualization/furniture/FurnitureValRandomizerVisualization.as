package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureValRandomizerVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1055:int = 31;
      
      private static const const_1056:int = 32;
      
      private static const const_490:int = 30;
      
      private static const const_758:int = 20;
      
      private static const const_491:int = 10;
       
      
      private var var_584:Boolean = false;
      
      private var var_223:Array;
      
      public function FurnitureValRandomizerVisualization()
      {
         var_223 = new Array();
         super();
         super.setAnimation(const_490);
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == 0)
         {
            var_584 = true;
            var_223 = new Array();
            var_223.push(const_1055);
            var_223.push(const_1056);
            return;
         }
         if(param1 > 0 && param1 <= const_491)
         {
            if(var_584)
            {
               var_584 = false;
               var_223 = new Array();
               if(_direction == 2)
               {
                  var_223.push(const_758 + 5 - param1);
                  var_223.push(const_491 + 5 - param1);
               }
               else
               {
                  var_223.push(const_758 + param1);
                  var_223.push(const_491 + param1);
               }
               var_223.push(const_490);
               return;
            }
            super.setAnimation(const_490);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(super.getLastFramePlayed(11))
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
