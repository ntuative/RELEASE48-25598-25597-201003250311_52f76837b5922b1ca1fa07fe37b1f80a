package com.sulake.habbo.inventory.furni
{
   import flash.display.BitmapData;
   
   public class FurniItem
   {
       
      
      private var _isSelected:Boolean = false;
      
      private var var_1632:int;
      
      private var var_1634:Boolean;
      
      private var var_1635:int;
      
      private var var_1386:String;
      
      private var var_1633:Boolean = false;
      
      private var var_1631:int;
      
      private var var_447:int;
      
      private var var_998:String;
      
      private var var_1430:String;
      
      private var _image:BitmapData;
      
      private var _objId:int;
      
      private var var_1200:int;
      
      private var var_1630:Boolean;
      
      private var var_1629:int;
      
      public function FurniItem(param1:int, param2:String, param3:int, param4:int, param5:String, param6:Boolean, param7:Boolean, param8:int, param9:String, param10:int)
      {
         super();
         var_1632 = param1;
         var_998 = param2;
         _objId = param3;
         var_1200 = param4;
         var_1386 = param5;
         var_1634 = param6;
         var_1630 = param7;
         var_1631 = param8;
         var_1430 = param9;
         var_1635 = param10;
         var_447 = -1;
      }
      
      public function get songId() : int
      {
         return var_1635;
      }
      
      public function get iconCallbackId() : int
      {
         return var_447;
      }
      
      public function get expiryTime() : int
      {
         return var_1631;
      }
      
      public function set prevCallbackId(param1:int) : void
      {
         var_1629 = param1;
      }
      
      public function set isLocked(param1:Boolean) : void
      {
         var_1633 = param1;
      }
      
      public function set iconCallbackId(param1:int) : void
      {
         var_447 = param1;
      }
      
      public function get isTradeable() : Boolean
      {
         return var_1630;
      }
      
      public function get slotId() : String
      {
         return var_1430;
      }
      
      public function get classId() : int
      {
         return var_1200;
      }
      
      public function get isRecyclable() : Boolean
      {
         return var_1634;
      }
      
      public function get stuffData() : String
      {
         return var_1386;
      }
      
      public function set iconImage(param1:BitmapData) : void
      {
         _image = param1;
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         _isSelected = param1;
      }
      
      public function get stripId() : int
      {
         return var_1632;
      }
      
      public function get isLocked() : Boolean
      {
         return var_1633;
      }
      
      public function get prevCallbackId() : int
      {
         return var_1629;
      }
      
      public function get iconImage() : BitmapData
      {
         return _image;
      }
      
      public function get isSelected() : Boolean
      {
         return _isSelected;
      }
      
      public function get objId() : int
      {
         return _objId;
      }
      
      public function get itemType() : String
      {
         return var_998;
      }
   }
}
