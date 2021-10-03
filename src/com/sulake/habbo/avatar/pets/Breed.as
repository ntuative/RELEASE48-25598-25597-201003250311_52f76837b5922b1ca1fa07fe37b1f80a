package com.sulake.habbo.avatar.pets
{
   public class Breed extends PetEditorInfo implements IBreed
   {
       
      
      private var var_660:String;
      
      private var _id:int;
      
      private var var_1959:String = "";
      
      private var var_1960:int;
      
      private var var_1958:String;
      
      private var var_1725:Boolean;
      
      public function Breed(param1:XML)
      {
         super(param1);
         _id = parseInt(param1.@id);
         var_1960 = parseInt(param1.@pattern);
         var_660 = String(param1.@gender);
         var_1725 = Boolean(parseInt(param1.@colorable));
         var_1959 = String(param1.@localizationKey);
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get localizationKey() : String
      {
         return var_1959;
      }
      
      public function get isColorable() : Boolean
      {
         return var_1725;
      }
      
      public function get gender() : String
      {
         return var_660;
      }
      
      public function get patternId() : int
      {
         return var_1960;
      }
      
      public function get avatarFigureString() : String
      {
         return var_1958;
      }
      
      public function set avatarFigureString(param1:String) : void
      {
         var_1958 = param1;
      }
   }
}
