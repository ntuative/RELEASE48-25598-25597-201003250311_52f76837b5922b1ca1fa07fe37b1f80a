package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class ObjectMessageData
   {
       
      
      private var var_1090:int = 0;
      
      private var _data:String = "";
      
      private var var_1424:int = -1;
      
      private var var_31:int = 0;
      
      private var _type:int = 0;
      
      private var var_1091:int = 0;
      
      private var var_2361:String = "";
      
      private var var_1631:int = 0;
      
      private var _id:int = 0;
      
      private var var_206:Boolean = false;
      
      private var var_230:int = 0;
      
      private var var_2227:String = null;
      
      private var var_83:Number = 0;
      
      private var _y:Number = 0;
      
      private var var_84:Number = 0;
      
      public function ObjectMessageData(param1:int)
      {
         super();
         _id = param1;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function set type(param1:int) : void
      {
         if(!var_206)
         {
            _type = param1;
         }
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_206)
         {
            _y = param1;
         }
      }
      
      public function get dir() : int
      {
         return var_230;
      }
      
      public function get extra() : int
      {
         return var_1424;
      }
      
      public function get state() : int
      {
         return var_31;
      }
      
      public function set dir(param1:int) : void
      {
         if(!var_206)
         {
            var_230 = param1;
         }
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function set x(param1:Number) : void
      {
         if(!var_206)
         {
            var_83 = param1;
         }
      }
      
      public function set extra(param1:int) : void
      {
         if(!var_206)
         {
            var_1424 = param1;
         }
      }
      
      public function get z() : Number
      {
         return var_84;
      }
      
      public function set state(param1:int) : void
      {
         if(!var_206)
         {
            var_31 = param1;
         }
      }
      
      public function get data() : String
      {
         return _data;
      }
      
      public function get expiryTime() : int
      {
         return var_1631;
      }
      
      public function get staticClass() : String
      {
         return var_2227;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function set expiryTime(param1:int) : void
      {
         if(!var_206)
         {
            var_1631 = param1;
         }
      }
      
      public function set data(param1:String) : void
      {
         if(!var_206)
         {
            _data = param1;
         }
      }
      
      public function set staticClass(param1:String) : void
      {
         if(!var_206)
         {
            var_2227 = param1;
         }
      }
      
      public function setReadOnly() : void
      {
         var_206 = true;
      }
      
      public function set sizeX(param1:int) : void
      {
         if(!var_206)
         {
            var_1090 = param1;
         }
      }
      
      public function set sizeY(param1:int) : void
      {
         if(!var_206)
         {
            var_1091 = param1;
         }
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_206)
         {
            var_84 = param1;
         }
      }
      
      public function get sizeX() : int
      {
         return var_1090;
      }
      
      public function get x() : Number
      {
         return var_83;
      }
      
      public function get sizeY() : int
      {
         return var_1091;
      }
   }
}
