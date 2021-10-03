package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.communication.messages.incoming.navigator.FlatCategory;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomSearchResultData;
   import com.sulake.habbo.communication.messages.incoming.navigator.MsgWithRequestId;
   import com.sulake.habbo.communication.messages.incoming.navigator.OfficialRoomsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PopularRoomTagsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.parser.navigator.FavouritesMessageParser;
   import com.sulake.habbo.communication.messages.parser.navigator.NavigatorSettingsMessageParser;
   import com.sulake.habbo.communication.messages.parser.room.engine.RoomEntryInfoMessageParser;
   import com.sulake.habbo.navigator.HabboNavigator;
   import flash.utils.Dictionary;
   
   public class NavigatorData
   {
      
      private static const const_1417:int = 10;
       
      
      private var var_1524:NavigatorSettingsMessageParser;
      
      private var var_1300:int;
      
      private var var_2100:int;
      
      private var var_2099:Boolean;
      
      private var var_1055:Array;
      
      private var var_880:Dictionary;
      
      private var var_1056:Array;
      
      private var var_2310:int;
      
      private var var_2096:int;
      
      private var var_1612:int;
      
      private var var_2098:int;
      
      private var var_593:PublicRoomShortData;
      
      private var var_428:RoomEventData;
      
      private var var_133:MsgWithRequestId;
      
      private var var_1675:Boolean;
      
      private var _navigator:HabboNavigator;
      
      private var var_2097:Boolean;
      
      private var var_198:GuestRoomData;
      
      private var var_721:Boolean;
      
      private var _currentRoomOwner:Boolean;
      
      public function NavigatorData(param1:HabboNavigator)
      {
         var_1055 = new Array();
         var_1056 = new Array();
         var_880 = new Dictionary();
         super();
         _navigator = param1;
      }
      
      public function get createdFlatId() : int
      {
         return var_2100;
      }
      
      public function get eventMod() : Boolean
      {
         return var_2097;
      }
      
      public function startLoading() : void
      {
         this.var_721 = true;
      }
      
      public function isRoomFavourite(param1:int) : Boolean
      {
         return false;
      }
      
      public function set eventMod(param1:Boolean) : void
      {
         var_2097 = param1;
      }
      
      public function set roomEventData(param1:RoomEventData) : void
      {
         if(var_428 != null)
         {
            var_428.dispose();
         }
         var_428 = param1;
      }
      
      public function get popularTagsArrived() : Boolean
      {
         return var_133 != null && var_133 as PopularRoomTagsData != null;
      }
      
      public function get guestRoomSearchArrived() : Boolean
      {
         return var_133 != null && var_133 as GuestRoomSearchResultData != null;
      }
      
      public function get guestRoomSearchResults() : GuestRoomSearchResultData
      {
         return var_133 as GuestRoomSearchResultData;
      }
      
      public function get enteredGuestRoom() : GuestRoomData
      {
         return var_198;
      }
      
      public function get allCategories() : Array
      {
         return var_1055;
      }
      
      public function onRoomExit() : void
      {
         if(var_428 != null)
         {
            var_428.dispose();
            var_428 = null;
         }
         if(var_593 != null)
         {
            var_593.dispose();
            var_593 = null;
         }
         if(var_198 != null)
         {
            var_198.dispose();
            var_198 = null;
         }
         _currentRoomOwner = false;
      }
      
      public function set officialRooms(param1:OfficialRoomsData) : void
      {
         disposeCurrentMsg();
         var_133 = param1;
         var_721 = false;
      }
      
      public function get settings() : NavigatorSettingsMessageParser
      {
         return var_1524;
      }
      
      public function set popularTags(param1:PopularRoomTagsData) : void
      {
         disposeCurrentMsg();
         var_133 = param1;
         var_721 = false;
      }
      
      public function onRoomEnter(param1:RoomEntryInfoMessageParser) : void
      {
         var_593 = null;
         var_198 = null;
         _currentRoomOwner = false;
         if(param1.guestRoom)
         {
            _currentRoomOwner = param1.owner;
         }
         else
         {
            var_593 = param1.publicSpace;
            var_428 = null;
         }
      }
      
      public function get currentRoomOwner() : Boolean
      {
         return _currentRoomOwner;
      }
      
      public function onFavourites(param1:FavouritesMessageParser) : void
      {
         var _loc2_:int = 0;
         this.var_2310 = param1.limit;
         this.var_1300 = param1.favouriteRoomIds.length;
         this.var_880 = new Dictionary();
         for each(_loc2_ in param1.favouriteRoomIds)
         {
            this.var_880[_loc2_] = "yes";
         }
      }
      
      public function get popularTags() : PopularRoomTagsData
      {
         return var_133 as PopularRoomTagsData;
      }
      
      public function get enteredPublicSpace() : PublicRoomShortData
      {
         return var_593;
      }
      
      public function get hotRoomPopupOpen() : Boolean
      {
         return var_2099;
      }
      
      public function set guestRoomSearchResults(param1:GuestRoomSearchResultData) : void
      {
         disposeCurrentMsg();
         var_133 = param1;
         var_721 = false;
      }
      
      public function set avatarId(param1:int) : void
      {
         var_1612 = param1;
      }
      
      public function get canEditRoomSettings() : Boolean
      {
         return var_198 != null && _currentRoomOwner;
      }
      
      public function isLoading() : Boolean
      {
         return this.var_721;
      }
      
      public function get visibleCategories() : Array
      {
         return var_1056;
      }
      
      public function set categories(param1:Array) : void
      {
         var _loc2_:* = null;
         var_1055 = param1;
         var_1056 = new Array();
         for each(_loc2_ in var_1055)
         {
            if(_loc2_.visible)
            {
               var_1056.push(_loc2_);
            }
         }
      }
      
      public function get currentRoomRating() : int
      {
         return var_2096;
      }
      
      public function get publicSpaceNodeId() : int
      {
         return var_2098;
      }
      
      public function set settings(param1:NavigatorSettingsMessageParser) : void
      {
         var_1524 = param1;
      }
      
      private function disposeCurrentMsg() : void
      {
         if(var_133 == null)
         {
            return;
         }
         var_133.dispose();
         var_133 = null;
      }
      
      public function get roomEventData() : RoomEventData
      {
         return var_428;
      }
      
      public function favouriteChanged(param1:int, param2:Boolean) : void
      {
         var_880[param1] = !!param2 ? "yes" : null;
         var_1300 += !!param2 ? 1 : -1;
      }
      
      public function get officialRooms() : OfficialRoomsData
      {
         return var_133 as OfficialRoomsData;
      }
      
      public function get avatarId() : int
      {
         return var_1612;
      }
      
      public function isCurrentRoomFavourite() : Boolean
      {
         var _loc1_:int = 0;
         return false;
      }
      
      public function get officialRoomsArrived() : Boolean
      {
         return var_133 != null && var_133 as OfficialRoomsData != null;
      }
      
      public function set hotRoomPopupOpen(param1:Boolean) : void
      {
         var_2099 = param1;
      }
      
      public function set currentRoomRating(param1:int) : void
      {
         var_2096 = param1;
      }
      
      public function set hcMember(param1:Boolean) : void
      {
         var_1675 = param1;
      }
      
      public function set enteredRoom(param1:GuestRoomData) : void
      {
         if(var_198 != null)
         {
            var_198.dispose();
         }
         var_198 = param1;
      }
      
      public function isCurrentRoomHome() : Boolean
      {
         if(var_198 == null)
         {
            return false;
         }
         var _loc1_:int = 0;
         return this.var_1524.homeRoomId == _loc1_;
      }
      
      public function isFavouritesFull() : Boolean
      {
         return var_1300 >= var_2310;
      }
      
      public function set publicSpaceNodeId(param1:int) : void
      {
         var_2098 = param1;
      }
      
      public function get hcMember() : Boolean
      {
         return var_1675;
      }
      
      public function get canAddFavourite() : Boolean
      {
         return var_198 != null && !_currentRoomOwner;
      }
      
      public function set createdFlatId(param1:int) : void
      {
         var_2100 = param1;
      }
   }
}
