package com.sulake.habbo.room.object
{
   public class RoomPlaneMaskData
   {
       
      
      private var var_2105:Number = 0;
      
      private var var_2055:Number = 0;
      
      private var var_2056:Number = 0;
      
      private var var_2106:Number = 0;
      
      public function RoomPlaneMaskData(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         var_2055 = param1;
         var_2056 = param2;
         var_2105 = param3;
         var_2106 = param4;
      }
      
      public function get leftSideLoc() : Number
      {
         return var_2055;
      }
      
      public function get leftSideLength() : Number
      {
         return var_2105;
      }
      
      public function get rightSideLoc() : Number
      {
         return var_2056;
      }
      
      public function get rightSideLength() : Number
      {
         return var_2106;
      }
   }
}
