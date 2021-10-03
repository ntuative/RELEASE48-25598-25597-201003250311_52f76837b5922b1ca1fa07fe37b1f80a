package com.sulake.habbo.session.furniture
{
   public class FurnitureData implements IFurnitureData
   {
      
      public static const const_1499:String = "e";
      
      public static const const_1568:String = "i";
      
      public static const const_1608:String = "s";
       
      
      private var _id:int;
      
      private var _title:String;
      
      private var _type:String;
      
      private var var_1681:int;
      
      private var var_1313:Array;
      
      private var var_1677:int;
      
      private var var_1679:int;
      
      private var var_1678:int;
      
      private var _name:String;
      
      private var var_1680:int;
      
      private var var_1166:String;
      
      public function FurnitureData(param1:String, param2:int, param3:String, param4:int, param5:int, param6:int, param7:int, param8:int, param9:Array, param10:String, param11:String)
      {
         super();
         _type = param1;
         _id = param2;
         _name = param3;
         var_1681 = param4;
         var_1680 = param5;
         var_1677 = param6;
         var_1679 = param7;
         var_1678 = param8;
         var_1313 = param9;
         _title = param10;
         var_1166 = param11;
      }
      
      public function get tileSizeY() : int
      {
         return var_1679;
      }
      
      public function get tileSizeZ() : int
      {
         return var_1678;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function get title() : String
      {
         return _title;
      }
      
      public function get revision() : int
      {
         return var_1680;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get colourIndex() : int
      {
         return var_1681;
      }
      
      public function get tileSizeX() : int
      {
         return var_1677;
      }
      
      public function get colours() : Array
      {
         return var_1313;
      }
      
      public function get description() : String
      {
         return var_1166;
      }
   }
}
