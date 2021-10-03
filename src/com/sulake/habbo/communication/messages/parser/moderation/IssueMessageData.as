package com.sulake.habbo.communication.messages.parser.moderation
{
   import flash.utils.getTimer;
   
   public class IssueMessageData
   {
      
      public static const const_146:int = 1;
      
      public static const const_1148:int = 3;
      
      public static const const_474:int = 2;
       
      
      private var var_1988:int;
      
      private var var_1973:int;
      
      private var var_1994:int;
      
      private var var_1713:int;
      
      private var var_31:int;
      
      private var var_419:int;
      
      private var var_1215:int;
      
      private var var_1700:int;
      
      private var var_1061:int;
      
      private var _roomResources:String;
      
      private var var_1957:int;
      
      private var var_1995:int;
      
      private var var_1991:String;
      
      private var var_1698:String;
      
      private var var_1990:int = 0;
      
      private var var_1307:String;
      
      private var _message:String;
      
      private var var_1993:int;
      
      private var var_1989:String;
      
      private var var_1154:int;
      
      private var var_662:String;
      
      private var var_1992:String;
      
      private var var_1450:int;
      
      public function IssueMessageData()
      {
         super();
      }
      
      public function set reportedUserId(param1:int) : void
      {
         var_1061 = param1;
      }
      
      public function set temporalPriority(param1:int) : void
      {
         var_1990 = param1;
      }
      
      public function get reporterUserId() : int
      {
         return var_1995;
      }
      
      public function set roomName(param1:String) : void
      {
         var_662 = param1;
      }
      
      public function set chatRecordId(param1:int) : void
      {
         var_1957 = param1;
      }
      
      public function get state() : int
      {
         return var_31;
      }
      
      public function get roomResources() : String
      {
         return _roomResources;
      }
      
      public function set roomResources(param1:String) : void
      {
         _roomResources = param1;
      }
      
      public function get roomName() : String
      {
         return var_662;
      }
      
      public function get message() : String
      {
         return _message;
      }
      
      public function set worldId(param1:int) : void
      {
         var_1713 = param1;
      }
      
      public function set state(param1:int) : void
      {
         var_31 = param1;
      }
      
      public function get unitPort() : int
      {
         return var_1973;
      }
      
      public function get priority() : int
      {
         return var_1988 + var_1990;
      }
      
      public function set issueId(param1:int) : void
      {
         var_1700 = param1;
      }
      
      public function get pickerUserName() : String
      {
         return var_1698;
      }
      
      public function getOpenTime() : String
      {
         var _loc1_:int = (getTimer() - var_1450) / 1000;
         var _loc2_:int = _loc1_ % 60;
         var _loc3_:int = _loc1_ / 60;
         var _loc4_:int = _loc3_ % 60;
         var _loc5_:int = _loc3_ / 60;
         var _loc6_:String = _loc2_ < 10 ? "0" + _loc2_ : "" + _loc2_;
         var _loc7_:String = _loc4_ < 10 ? "0" + _loc4_ : "" + _loc4_;
         var _loc8_:String = _loc5_ < 10 ? "0" + _loc5_ : "" + _loc5_;
         return _loc8_ + ":" + _loc7_ + ":" + _loc6_;
      }
      
      public function get categoryId() : int
      {
         return var_1154;
      }
      
      public function set reporterUserId(param1:int) : void
      {
         var_1995 = param1;
      }
      
      public function get roomType() : int
      {
         return var_1215;
      }
      
      public function set flatType(param1:String) : void
      {
         var_1991 = param1;
      }
      
      public function get chatRecordId() : int
      {
         return var_1957;
      }
      
      public function set message(param1:String) : void
      {
         _message = param1;
      }
      
      public function get worldId() : int
      {
         return var_1713;
      }
      
      public function set flatOwnerName(param1:String) : void
      {
         var_1992 = param1;
      }
      
      public function set reportedUserName(param1:String) : void
      {
         var_1307 = param1;
      }
      
      public function get issueId() : int
      {
         return var_1700;
      }
      
      public function set priority(param1:int) : void
      {
         var_1988 = param1;
      }
      
      public function set unitPort(param1:int) : void
      {
         var_1973 = param1;
      }
      
      public function get flatType() : String
      {
         return var_1991;
      }
      
      public function set reportedCategoryId(param1:int) : void
      {
         var_1994 = param1;
      }
      
      public function set pickerUserName(param1:String) : void
      {
         var_1698 = param1;
      }
      
      public function set pickerUserId(param1:int) : void
      {
         var_1993 = param1;
      }
      
      public function get reportedUserName() : String
      {
         return var_1307;
      }
      
      public function set roomType(param1:int) : void
      {
         var_1215 = param1;
      }
      
      public function get reportedCategoryId() : int
      {
         return var_1994;
      }
      
      public function set flatId(param1:int) : void
      {
         var_419 = param1;
      }
      
      public function set categoryId(param1:int) : void
      {
         var_1154 = param1;
      }
      
      public function set timeStamp(param1:int) : void
      {
         var_1450 = param1;
      }
      
      public function get pickerUserId() : int
      {
         return var_1993;
      }
      
      public function set reporterUserName(param1:String) : void
      {
         var_1989 = param1;
      }
      
      public function get timeStamp() : int
      {
         return var_1450;
      }
      
      public function get reportedUserId() : int
      {
         return var_1061;
      }
      
      public function get flatId() : int
      {
         return var_419;
      }
      
      public function get flatOwnerName() : String
      {
         return var_1992;
      }
      
      public function get reporterUserName() : String
      {
         return var_1989;
      }
   }
}
