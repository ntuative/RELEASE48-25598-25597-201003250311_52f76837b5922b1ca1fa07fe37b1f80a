package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserMessageData
   {
      
      public static const const_1187:String = "F";
      
      public static const const_892:String = "M";
       
      
      private var var_83:Number = 0;
      
      private var var_395:String = "";
      
      private var var_2220:int = 0;
      
      private var var_1857:String = "";
      
      private var var_1856:int = 0;
      
      private var var_1855:int = 0;
      
      private var var_1854:String = "";
      
      private var var_1341:String = "";
      
      private var _id:int = 0;
      
      private var var_206:Boolean = false;
      
      private var var_230:int = 0;
      
      private var var_2219:String = "";
      
      private var _name:String = "";
      
      private var var_1853:int = 0;
      
      private var _y:Number = 0;
      
      private var var_84:Number = 0;
      
      public function UserMessageData(param1:int)
      {
         super();
         _id = param1;
      }
      
      public function get z() : Number
      {
         return var_84;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get dir() : int
      {
         return var_230;
      }
      
      public function set dir(param1:int) : void
      {
         if(!var_206)
         {
            var_230 = param1;
         }
      }
      
      public function set name(param1:String) : void
      {
         if(!var_206)
         {
            _name = param1;
         }
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get userType() : int
      {
         return var_2220;
      }
      
      public function set groupStatus(param1:int) : void
      {
         if(!var_206)
         {
            var_1856 = param1;
         }
      }
      
      public function get subType() : String
      {
         return var_2219;
      }
      
      public function set groupID(param1:String) : void
      {
         if(!var_206)
         {
            var_1854 = param1;
         }
      }
      
      public function set subType(param1:String) : void
      {
         if(!var_206)
         {
            var_2219 = param1;
         }
      }
      
      public function set xp(param1:int) : void
      {
         if(!var_206)
         {
            var_1855 = param1;
         }
      }
      
      public function set figure(param1:String) : void
      {
         if(!var_206)
         {
            var_395 = param1;
         }
      }
      
      public function set userType(param1:int) : void
      {
         if(!var_206)
         {
            var_2220 = param1;
         }
      }
      
      public function set sex(param1:String) : void
      {
         if(!var_206)
         {
            var_1341 = param1;
         }
      }
      
      public function get groupStatus() : int
      {
         return var_1856;
      }
      
      public function get groupID() : String
      {
         return var_1854;
      }
      
      public function set webID(param1:int) : void
      {
         if(!var_206)
         {
            var_1853 = param1;
         }
      }
      
      public function set custom(param1:String) : void
      {
         if(!var_206)
         {
            var_1857 = param1;
         }
      }
      
      public function setReadOnly() : void
      {
         var_206 = true;
      }
      
      public function get sex() : String
      {
         return var_1341;
      }
      
      public function get figure() : String
      {
         return var_395;
      }
      
      public function get webID() : int
      {
         return var_1853;
      }
      
      public function get custom() : String
      {
         return var_1857;
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_206)
         {
            _y = param1;
         }
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_206)
         {
            var_84 = param1;
         }
      }
      
      public function set x(param1:Number) : void
      {
         if(!var_206)
         {
            var_83 = param1;
         }
      }
      
      public function get x() : Number
      {
         return var_83;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get xp() : int
      {
         return var_1855;
      }
   }
}
