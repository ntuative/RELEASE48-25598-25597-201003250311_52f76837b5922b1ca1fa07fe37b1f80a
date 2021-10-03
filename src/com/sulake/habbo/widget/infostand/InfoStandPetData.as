package com.sulake.habbo.widget.infostand
{
   import com.sulake.habbo.widget.events.RoomWidgetPetInfoUpdateEvent;
   import flash.display.BitmapData;
   
   public class InfoStandPetData
   {
       
      
      private var var_1609:int;
      
      private var var_1815:int;
      
      private var var_1817:int;
      
      private var _type:int;
      
      private var var_1201:int = -1;
      
      private var var_1818:int;
      
      private var _nutrition:int;
      
      private var var_1821:int;
      
      private var _energy:int;
      
      private var var_1934:int;
      
      private var var_1823:int;
      
      private var var_1820:int;
      
      private var var_1812:int;
      
      private var _petRespect:int;
      
      private var _canOwnerBeKicked:Boolean;
      
      private var _image:BitmapData;
      
      private var _ownerName:String;
      
      private var var_1822:Boolean;
      
      private var _name:String = "";
      
      private var var_1769:int;
      
      public function InfoStandPetData()
      {
         super();
      }
      
      public function get isOwnPet() : Boolean
      {
         return var_1822;
      }
      
      public function get level() : int
      {
         return var_1609;
      }
      
      public function get energy() : int
      {
         return _energy;
      }
      
      public function get nutrition() : int
      {
         return _nutrition;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get experienceMax() : int
      {
         return var_1821;
      }
      
      public function get id() : int
      {
         return var_1201;
      }
      
      public function get nutritionMax() : int
      {
         return var_1817;
      }
      
      public function get ownerId() : int
      {
         return var_1769;
      }
      
      public function setData(param1:RoomWidgetPetInfoUpdateEvent) : void
      {
         _name = param1.name;
         var_1201 = param1.id;
         _type = param1.petType;
         var_1934 = param1.petRace;
         _image = param1.image;
         var_1822 = param1.isOwnPet;
         var_1769 = param1.ownerId;
         _ownerName = param1.ownerName;
         _canOwnerBeKicked = param1.canOwnerBeKicked;
         var_1609 = param1.level;
         var_1818 = param1.levelMax;
         var_1815 = param1.experience;
         var_1821 = param1.experienceMax;
         _energy = param1.energy;
         var_1823 = param1.energyMax;
         _nutrition = param1.nutrition;
         var_1817 = param1.nutritionMax;
         _petRespect = param1.petRespect;
         var_1820 = param1.roomIndex;
         var_1812 = param1.age;
      }
      
      public function get roomIndex() : int
      {
         return var_1820;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get energyMax() : int
      {
         return var_1823;
      }
      
      public function get levelMax() : int
      {
         return var_1818;
      }
      
      public function get petRespect() : int
      {
         return _petRespect;
      }
      
      public function get race() : int
      {
         return var_1934;
      }
      
      public function get image() : BitmapData
      {
         return _image;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get canOwnerBeKicked() : Boolean
      {
         return _canOwnerBeKicked;
      }
      
      public function get experience() : int
      {
         return var_1815;
      }
      
      public function get age() : int
      {
         return var_1812;
      }
   }
}
