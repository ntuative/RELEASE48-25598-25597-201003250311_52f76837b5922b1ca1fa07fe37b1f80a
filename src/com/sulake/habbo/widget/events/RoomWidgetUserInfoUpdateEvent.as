package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetUserInfoUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_216:String = "RWUIUE_PEER";
      
      public static const const_212:String = "RWUIUE_OWN_USER";
      
      public static const TRADE_REASON_NO_OWN_RIGHT:int = 1;
      
      public static const BOT:String = "RWUIUE_BOT";
      
      public static const const_1245:String = "BOT";
      
      public static const const_906:int = 2;
      
      public static const const_1234:int = 0;
      
      public static const const_980:int = 3;
       
      
      private var var_1155:String = "";
      
      private var var_2006:Boolean = false;
      
      private var var_1855:int = 0;
      
      private var var_2010:int = 0;
      
      private var var_2000:Boolean = false;
      
      private var var_1153:String = "";
      
      private var var_2009:Boolean = false;
      
      private var var_796:int = 0;
      
      private var var_2004:Boolean = true;
      
      private var var_968:int = 0;
      
      private var var_2002:Boolean = false;
      
      private var var_1199:Boolean = false;
      
      private var var_2008:Boolean = false;
      
      private var var_2011:int = 0;
      
      private var var_2003:Boolean = false;
      
      private var _image:BitmapData = null;
      
      private var var_261:Array;
      
      private var var_1198:Boolean = false;
      
      private var _name:String = "";
      
      private var var_1853:int = 0;
      
      private var var_2007:Boolean = false;
      
      private var var_2001:int = 0;
      
      private var var_2005:String = "";
      
      public function RoomWidgetUserInfoUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         var_261 = [];
         super(param1,param2,param3);
      }
      
      public function get userRoomId() : int
      {
         return var_2010;
      }
      
      public function set userRoomId(param1:int) : void
      {
         var_2010 = param1;
      }
      
      public function get canBeAskedAsFriend() : Boolean
      {
         return var_2006;
      }
      
      public function get canBeKicked() : Boolean
      {
         return var_2004;
      }
      
      public function set canBeKicked(param1:Boolean) : void
      {
         var_2004 = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set amIAnyRoomController(param1:Boolean) : void
      {
         var_2009 = param1;
      }
      
      public function get motto() : String
      {
         return var_1155;
      }
      
      public function set isIgnored(param1:Boolean) : void
      {
         var_2002 = param1;
      }
      
      public function get isRoomOwner() : Boolean
      {
         return var_1199;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function set motto(param1:String) : void
      {
         var_1155 = param1;
      }
      
      public function get amIOwner() : Boolean
      {
         return var_2007;
      }
      
      public function get groupBadgeId() : String
      {
         return var_2005;
      }
      
      public function set isRoomOwner(param1:Boolean) : void
      {
         var_1199 = param1;
      }
      
      public function get hasFlatControl() : Boolean
      {
         return var_2003;
      }
      
      public function set carryItem(param1:int) : void
      {
         var_2011 = param1;
      }
      
      public function get badges() : Array
      {
         return var_261;
      }
      
      public function get amIController() : Boolean
      {
         return var_2000;
      }
      
      public function set amIController(param1:Boolean) : void
      {
         var_2000 = param1;
      }
      
      public function set amIOwner(param1:Boolean) : void
      {
         var_2007 = param1;
      }
      
      public function set image(param1:BitmapData) : void
      {
         _image = param1;
      }
      
      public function set canTradeReason(param1:int) : void
      {
         var_2001 = param1;
      }
      
      public function set groupBadgeId(param1:String) : void
      {
         var_2005 = param1;
      }
      
      public function set realName(param1:String) : void
      {
         var_1153 = param1;
      }
      
      public function get amIAnyRoomController() : Boolean
      {
         return var_2009;
      }
      
      public function get isIgnored() : Boolean
      {
         return var_2002;
      }
      
      public function get carryItem() : int
      {
         return var_2011;
      }
      
      public function get isSpectatorMode() : Boolean
      {
         return var_1198;
      }
      
      public function set isSpectatorMode(param1:Boolean) : void
      {
         var_1198 = param1;
      }
      
      public function set respectLeft(param1:int) : void
      {
         var_796 = param1;
      }
      
      public function get image() : BitmapData
      {
         return _image;
      }
      
      public function get canTradeReason() : int
      {
         return var_2001;
      }
      
      public function get realName() : String
      {
         return var_1153;
      }
      
      public function set webID(param1:int) : void
      {
         var_1853 = param1;
      }
      
      public function set badges(param1:Array) : void
      {
         var_261 = param1;
      }
      
      public function set canTrade(param1:Boolean) : void
      {
         var_2008 = param1;
      }
      
      public function set hasFlatControl(param1:Boolean) : void
      {
         var_2003 = param1;
      }
      
      public function get respectLeft() : int
      {
         return var_796;
      }
      
      public function get webID() : int
      {
         return var_1853;
      }
      
      public function set groupId(param1:int) : void
      {
         var_968 = param1;
      }
      
      public function get xp() : int
      {
         return var_1855;
      }
      
      public function set canBeAskedAsFriend(param1:Boolean) : void
      {
         var_2006 = param1;
      }
      
      public function get groupId() : int
      {
         return var_968;
      }
      
      public function get canTrade() : Boolean
      {
         return var_2008;
      }
      
      public function set xp(param1:int) : void
      {
         var_1855 = param1;
      }
   }
}
