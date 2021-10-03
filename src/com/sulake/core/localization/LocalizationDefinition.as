package com.sulake.core.localization
{
   public class LocalizationDefinition implements ILocalizationDefinition
   {
       
      
      private var _name:String;
      
      private var var_1510:String;
      
      private var var_930:String;
      
      private var var_1511:String;
      
      private var var_1512:String;
      
      public function LocalizationDefinition(param1:String, param2:String, param3:String)
      {
         super();
         var _loc4_:Array = param1.split("_");
         var_1512 = _loc4_[0];
         var _loc5_:Array = String(_loc4_[1]).split(".");
         var_1510 = _loc5_[0];
         var_1511 = _loc5_[1];
         _name = param2;
         var_930 = param3;
      }
      
      public function get countryCode() : String
      {
         return var_1510;
      }
      
      public function get languageCode() : String
      {
         return var_1512;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get url() : String
      {
         return var_930;
      }
      
      public function get encoding() : String
      {
         return var_1511;
      }
      
      public function get id() : String
      {
         return var_1512 + "_" + var_1510 + "." + var_1511;
      }
   }
}
