package com.sulake.habbo.avatar.pets
{
   public class PetEditorInfo
   {
       
      
      private var var_1929:Boolean;
      
      private var var_1723:Boolean;
      
      public function PetEditorInfo(param1:XML)
      {
         super();
         var_1929 = Boolean(parseInt(param1.@club));
         var_1723 = Boolean(parseInt(param1.@selectable));
      }
      
      public function get isClub() : Boolean
      {
         return var_1929;
      }
      
      public function get isSelectable() : Boolean
      {
         return var_1723;
      }
   }
}
