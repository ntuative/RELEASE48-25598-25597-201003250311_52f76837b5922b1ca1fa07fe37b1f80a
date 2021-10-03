package com.sulake.core.assets
{
   public class AssetTypeDeclaration
   {
       
      
      private var var_2229:Class;
      
      private var var_2230:Class;
      
      private var var_2228:String;
      
      private var var_1355:Array;
      
      public function AssetTypeDeclaration(param1:String, param2:Class, param3:Class, ... rest)
      {
         super();
         var_2228 = param1;
         var_2230 = param2;
         var_2229 = param3;
         if(rest == null)
         {
            var_1355 = new Array();
         }
         else
         {
            var_1355 = rest;
         }
      }
      
      public function get loaderClass() : Class
      {
         return var_2229;
      }
      
      public function get assetClass() : Class
      {
         return var_2230;
      }
      
      public function get mimeType() : String
      {
         return var_2228;
      }
      
      public function get fileTypes() : Array
      {
         return var_1355;
      }
   }
}
