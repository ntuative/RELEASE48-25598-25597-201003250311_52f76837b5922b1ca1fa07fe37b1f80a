package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1812:int;
      
      private var var_395:String;
      
      private var var_1609:int;
      
      private var var_1776:int;
      
      private var var_1815:int;
      
      private var var_1816:int;
      
      private var _nutrition:int;
      
      private var var_1201:int;
      
      private var var_1813:int;
      
      private var var_1814:int;
      
      private var _energy:int;
      
      private var _name:String;
      
      private var _ownerName:String;
      
      private var var_1769:int;
      
      private var var_1811:int;
      
      public function PetInfoMessageParser()
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
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get maxEnergy() : int
      {
         return var_1816;
      }
      
      public function flush() : Boolean
      {
         var_1201 = -1;
         return true;
      }
      
      public function get maxLevel() : int
      {
         return var_1813;
      }
      
      public function get experienceRequiredToLevel() : int
      {
         return var_1814;
      }
      
      public function get maxNutrition() : int
      {
         return var_1811;
      }
      
      public function get figure() : String
      {
         return var_395;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get respect() : int
      {
         return var_1776;
      }
      
      public function get petId() : int
      {
         return var_1201;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var_1201 = param1.readInteger();
         _name = param1.readString();
         var_1609 = param1.readInteger();
         var_1813 = param1.readInteger();
         var_1815 = param1.readInteger();
         var_1814 = param1.readInteger();
         _energy = param1.readInteger();
         var_1816 = param1.readInteger();
         _nutrition = param1.readInteger();
         var_1811 = param1.readInteger();
         var_395 = param1.readString();
         var_1776 = param1.readInteger();
         var_1769 = param1.readInteger();
         var_1812 = param1.readInteger();
         _ownerName = param1.readString();
         return true;
      }
      
      public function get nutrition() : int
      {
         return _nutrition;
      }
      
      public function get experience() : int
      {
         return var_1815;
      }
      
      public function get ownerId() : int
      {
         return var_1769;
      }
      
      public function get age() : int
      {
         return var_1812;
      }
   }
}
