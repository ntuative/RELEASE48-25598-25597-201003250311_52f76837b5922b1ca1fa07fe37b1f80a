package com.sulake.habbo.communication.messages.outgoing.roomsettings
{
   public class SaveableRoomSettingsData
   {
       
      
      private var _password:String;
      
      private var var_1917:int;
      
      private var var_1714:int;
      
      private var var_1919:Boolean;
      
      private var var_1916:Boolean;
      
      private var var_1918:Array;
      
      private var var_1719:Boolean;
      
      private var var_1154:int;
      
      private var _name:String;
      
      private var _roomId:int;
      
      private var var_625:Array;
      
      private var var_1166:String;
      
      public function SaveableRoomSettingsData()
      {
         super();
      }
      
      public function get doorMode() : int
      {
         return var_1714;
      }
      
      public function get description() : String
      {
         return var_1166;
      }
      
      public function get allowFoodConsume() : Boolean
      {
         return var_1916;
      }
      
      public function get maximumVisitors() : int
      {
         return var_1917;
      }
      
      public function set description(param1:String) : void
      {
         var_1166 = param1;
      }
      
      public function get password() : String
      {
         return _password;
      }
      
      public function set allowPets(param1:Boolean) : void
      {
         var_1719 = param1;
      }
      
      public function set maximumVisitors(param1:int) : void
      {
         var_1917 = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get categoryId() : int
      {
         return var_1154;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get controllers() : Array
      {
         return var_1918;
      }
      
      public function get tags() : Array
      {
         return var_625;
      }
      
      public function get allowPets() : Boolean
      {
         return var_1719;
      }
      
      public function set doorMode(param1:int) : void
      {
         var_1714 = param1;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function set allowWalkThrough(param1:Boolean) : void
      {
         var_1919 = param1;
      }
      
      public function set tags(param1:Array) : void
      {
         var_625 = param1;
      }
      
      public function set roomId(param1:int) : void
      {
         _roomId = param1;
      }
      
      public function set controllers(param1:Array) : void
      {
         var_1918 = param1;
      }
      
      public function set categoryId(param1:int) : void
      {
         var_1154 = param1;
      }
      
      public function get allowWalkThrough() : Boolean
      {
         return var_1919;
      }
      
      public function set password(param1:String) : void
      {
         _password = param1;
      }
      
      public function set allowFoodConsume(param1:Boolean) : void
      {
         var_1916 = param1;
      }
   }
}
