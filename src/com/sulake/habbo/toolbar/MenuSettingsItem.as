package com.sulake.habbo.toolbar
{
   public class MenuSettingsItem
   {
       
      
      private var var_1976:Array;
      
      private var var_1711:String;
      
      private var var_1975:Boolean;
      
      public function MenuSettingsItem(param1:String, param2:Array = null, param3:Boolean = false)
      {
         super();
         var_1711 = param1;
         var_1976 = param2;
         var_1975 = param3;
      }
      
      public function get menuId() : String
      {
         return var_1711;
      }
      
      public function get yieldList() : Array
      {
         return var_1976;
      }
      
      public function get lockToIcon() : Boolean
      {
         return var_1975;
      }
   }
}
