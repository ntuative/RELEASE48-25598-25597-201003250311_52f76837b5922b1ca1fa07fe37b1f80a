package com.sulake.habbo.room.utils
{
   public class PublicRoomWorldData
   {
       
      
      private var var_2193:Number = 1;
      
      private var var_195:Number = 1;
      
      private var var_1882:String = "";
      
      public function PublicRoomWorldData(param1:String, param2:Number, param3:Number)
      {
         super();
         var_1882 = param1;
         var_195 = param2;
         var_2193 = param3;
      }
      
      public function get scale() : Number
      {
         return var_195;
      }
      
      public function get heightScale() : Number
      {
         return var_2193;
      }
   }
}
