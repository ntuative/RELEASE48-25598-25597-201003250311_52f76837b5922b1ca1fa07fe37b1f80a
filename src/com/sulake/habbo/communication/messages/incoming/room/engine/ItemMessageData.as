package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class ItemMessageData
   {
       
      
      private var var_84:Number = 0;
      
      private var _data:String = "";
      
      private var var_1424:int = 0;
      
      private var var_31:int = 0;
      
      private var _type:int = 0;
      
      private var _y:Number = 0;
      
      private var var_1860:Boolean = false;
      
      private var var_2361:String = "";
      
      private var _id:int = 0;
      
      private var var_206:Boolean = false;
      
      private var var_230:String = "";
      
      private var var_1861:int = 0;
      
      private var var_1862:int = 0;
      
      private var var_1859:int = 0;
      
      private var var_1858:int = 0;
      
      public function ItemMessageData(param1:int, param2:int, param3:Boolean)
      {
         super();
         _id = param1;
         _type = param2;
         var_1860 = param3;
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_206)
         {
            _y = param1;
         }
      }
      
      public function get isOldFormat() : Boolean
      {
         return var_1860;
      }
      
      public function set type(param1:int) : void
      {
         if(!var_206)
         {
            _type = param1;
         }
      }
      
      public function get dir() : String
      {
         return var_230;
      }
      
      public function get state() : int
      {
         return var_31;
      }
      
      public function set localX(param1:Number) : void
      {
         if(!var_206)
         {
            var_1859 = param1;
         }
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function set wallX(param1:Number) : void
      {
         if(!var_206)
         {
            var_1861 = param1;
         }
      }
      
      public function set wallY(param1:Number) : void
      {
         if(!var_206)
         {
            var_1862 = param1;
         }
      }
      
      public function set dir(param1:String) : void
      {
         if(!var_206)
         {
            var_230 = param1;
         }
      }
      
      public function get data() : String
      {
         return _data;
      }
      
      public function set localY(param1:Number) : void
      {
         if(!var_206)
         {
            var_1858 = param1;
         }
      }
      
      public function set state(param1:int) : void
      {
         if(!var_206)
         {
            var_31 = param1;
         }
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get localX() : Number
      {
         return var_1859;
      }
      
      public function set data(param1:String) : void
      {
         if(!var_206)
         {
            _data = param1;
         }
      }
      
      public function get wallX() : Number
      {
         return var_1861;
      }
      
      public function get wallY() : Number
      {
         return var_1862;
      }
      
      public function get localY() : Number
      {
         return var_1858;
      }
      
      public function setReadOnly() : void
      {
         var_206 = true;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get z() : Number
      {
         return var_84;
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_206)
         {
            var_84 = param1;
         }
      }
   }
}
