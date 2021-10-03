package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserUpdateMessageData
   {
       
      
      private var _y:Number = 0;
      
      private var var_84:Number = 0;
      
      private var var_230:int = 0;
      
      private var var_1875:int = 0;
      
      private var var_2157:Number = 0;
      
      private var var_2161:Number = 0;
      
      private var var_2158:Number = 0;
      
      private var var_2160:Number = 0;
      
      private var var_2159:Boolean = false;
      
      private var var_83:Number = 0;
      
      private var _id:int = 0;
      
      private var var_196:Array;
      
      public function UserUpdateMessageData(param1:int, param2:Number, param3:Number, param4:Number, param5:Number, param6:int, param7:int, param8:Number, param9:Number, param10:Number, param11:Boolean, param12:Array)
      {
         var_196 = [];
         super();
         _id = param1;
         var_83 = param2;
         _y = param3;
         var_84 = param4;
         var_2160 = param5;
         var_230 = param6;
         var_1875 = param7;
         var_2157 = param8;
         var_2161 = param9;
         var_2158 = param10;
         var_2159 = param11;
         var_196 = param12;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get z() : Number
      {
         return var_84;
      }
      
      public function get dir() : int
      {
         return var_230;
      }
      
      public function get localZ() : Number
      {
         return var_2160;
      }
      
      public function get isMoving() : Boolean
      {
         return var_2159;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get dirHead() : int
      {
         return var_1875;
      }
      
      public function get targetX() : Number
      {
         return var_2157;
      }
      
      public function get targetY() : Number
      {
         return var_2161;
      }
      
      public function get targetZ() : Number
      {
         return var_2158;
      }
      
      public function get x() : Number
      {
         return var_83;
      }
      
      public function get actions() : Array
      {
         return var_196.slice();
      }
   }
}
