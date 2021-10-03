package com.sulake.habbo.session
{
   public class PetInfo implements IPetInfo
   {
       
      
      private var var_1609:int;
      
      private var var_1776:int;
      
      private var var_1815:int;
      
      private var var_1817:int;
      
      private var _nutrition:int;
      
      private var var_1201:int;
      
      private var var_1818:int;
      
      private var var_1821:int;
      
      private var _energy:int;
      
      private var var_1812:int;
      
      private var var_1823:int;
      
      private var _ownerName:String;
      
      private var var_1769:int;
      
      public function PetInfo()
      {
         super();
      }
      
      public function get level() : int
      {
         return var_1609;
      }
      
      public function get energy() : int
      {
         return _energy;
      }
      
      public function set respect(param1:int) : void
      {
         var_1776 = param1;
      }
      
      public function set energy(param1:int) : void
      {
         _energy = param1;
      }
      
      public function set level(param1:int) : void
      {
         var_1609 = param1;
      }
      
      public function get petId() : int
      {
         return var_1201;
      }
      
      public function get experienceMax() : int
      {
         return var_1821;
      }
      
      public function get nutritionMax() : int
      {
         return var_1817;
      }
      
      public function set levelMax(param1:int) : void
      {
         var_1818 = param1;
      }
      
      public function get ownerId() : int
      {
         return var_1769;
      }
      
      public function get nutrition() : int
      {
         return _nutrition;
      }
      
      public function set petId(param1:int) : void
      {
         var_1201 = param1;
      }
      
      public function set nutrition(param1:int) : void
      {
         _nutrition = param1;
      }
      
      public function get energyMax() : int
      {
         return var_1823;
      }
      
      public function get respect() : int
      {
         return var_1776;
      }
      
      public function get levelMax() : int
      {
         return var_1818;
      }
      
      public function set ownerName(param1:String) : void
      {
         _ownerName = param1;
      }
      
      public function set experienceMax(param1:int) : void
      {
         var_1821 = param1;
      }
      
      public function set experience(param1:int) : void
      {
         var_1815 = param1;
      }
      
      public function set nutritionMax(param1:int) : void
      {
         var_1817 = param1;
      }
      
      public function set ownerId(param1:int) : void
      {
         var_1769 = param1;
      }
      
      public function get experience() : int
      {
         return var_1815;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function set energyMax(param1:int) : void
      {
         var_1823 = param1;
      }
      
      public function set age(param1:int) : void
      {
         var_1812 = param1;
      }
      
      public function get age() : int
      {
         return var_1812;
      }
   }
}
