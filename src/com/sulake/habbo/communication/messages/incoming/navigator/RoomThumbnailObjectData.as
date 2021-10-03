package com.sulake.habbo.communication.messages.incoming.navigator
{
   public class RoomThumbnailObjectData
   {
       
      
      private var var_1570:int;
      
      private var var_1569:int;
      
      public function RoomThumbnailObjectData()
      {
         super();
      }
      
      public function get pos() : int
      {
         return var_1570;
      }
      
      public function set pos(param1:int) : void
      {
         this.var_1570 = param1;
      }
      
      public function getCopy() : RoomThumbnailObjectData
      {
         var _loc1_:RoomThumbnailObjectData = new RoomThumbnailObjectData();
         _loc1_.var_1570 = this.var_1570;
         _loc1_.var_1569 = this.var_1569;
         return _loc1_;
      }
      
      public function set imgId(param1:int) : void
      {
         this.var_1569 = param1;
      }
      
      public function get imgId() : int
      {
         return var_1569;
      }
   }
}
