package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class GuestRoomData implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var var_1715:int;
      
      private var var_1717:String;
      
      private var var_1722:int;
      
      private var var_1721:int;
      
      private var var_745:Boolean;
      
      private var var_1719:Boolean;
      
      private var var_419:int;
      
      private var var_1166:String;
      
      private var var_1714:int;
      
      private var var_1154:int;
      
      private var _ownerName:String;
      
      private var var_662:String;
      
      private var var_1716:int;
      
      private var var_1718:RoomThumbnailData;
      
      private var var_1720:Boolean;
      
      private var var_625:Array;
      
      public function GuestRoomData(param1:IMessageDataWrapper)
      {
         var _loc4_:* = null;
         var_625 = new Array();
         super();
         var_419 = param1.readInteger();
         var_745 = param1.readBoolean();
         var_662 = param1.readString();
         _ownerName = param1.readString();
         var_1714 = param1.readInteger();
         var_1715 = param1.readInteger();
         var_1716 = param1.readInteger();
         var_1166 = param1.readString();
         var_1722 = param1.readInteger();
         var_1720 = param1.readBoolean();
         var_1721 = param1.readInteger();
         var_1154 = param1.readInteger();
         var_1717 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readString();
            var_625.push(_loc4_);
            _loc3_++;
         }
         var_1718 = new RoomThumbnailData(param1);
         var_1719 = param1.readBoolean();
      }
      
      public function get maxUserCount() : int
      {
         return var_1716;
      }
      
      public function get roomName() : String
      {
         return var_662;
      }
      
      public function get userCount() : int
      {
         return var_1715;
      }
      
      public function get score() : int
      {
         return var_1721;
      }
      
      public function get eventCreationTime() : String
      {
         return var_1717;
      }
      
      public function get allowTrading() : Boolean
      {
         return var_1720;
      }
      
      public function get tags() : Array
      {
         return var_625;
      }
      
      public function get allowPets() : Boolean
      {
         return var_1719;
      }
      
      public function get event() : Boolean
      {
         return var_745;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         this.var_625 = null;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get categoryId() : int
      {
         return var_1154;
      }
      
      public function get srchSpecPrm() : int
      {
         return var_1722;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get thumbnail() : RoomThumbnailData
      {
         return var_1718;
      }
      
      public function get doorMode() : int
      {
         return var_1714;
      }
      
      public function get flatId() : int
      {
         return var_419;
      }
      
      public function get description() : String
      {
         return var_1166;
      }
   }
}
