package com.sulake.habbo.navigator.inroom
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IContainerButtonWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.outgoing.navigator.AddFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.CanCreateEventMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.DeleteFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RateFlatMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.UpdateNavigatorSettingsMessageComposer;
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.SimpleAlertView;
   import com.sulake.habbo.navigator.TagRenderer;
   import com.sulake.habbo.navigator.Util;
   import com.sulake.habbo.navigator.events.HabboRoomSettingsTrackingEvent;
   import com.sulake.habbo.navigator.roomsettings.IRoomSettingsCtrlOwner;
   import com.sulake.habbo.navigator.roomsettings.RoomSettingsCtrl;
   import com.sulake.habbo.navigator.roomthumbnails.RoomThumbnailCtrl;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class RoomInfoViewCtrl implements IRoomSettingsCtrlOwner
   {
       
      
      private var var_728:IWindowContainer;
      
      private var var_1070:ITextWindow;
      
      private var var_201:RoomSettingsCtrl;
      
      private var var_1315:IContainerButtonWindow;
      
      private var _window:IWindowContainer;
      
      private var _hideInfoTimer:Timer;
      
      private var var_1319:ITextWindow;
      
      private var var_357:IWindowContainer;
      
      private var var_2136:IWindowContainer;
      
      private var var_2137:ITextWindow;
      
      private var var_893:IWindowContainer;
      
      private var var_1539:IButtonWindow;
      
      private var _ownerName:ITextWindow;
      
      private var var_662:ITextWindow;
      
      private var var_1536:IWindowContainer;
      
      private var var_1318:IWindowContainer;
      
      private var var_896:ITextWindow;
      
      private var var_1069:ITextFieldWindow;
      
      private var var_315:IWindowContainer;
      
      private var var_894:ITextWindow;
      
      private var var_1535:IButtonWindow;
      
      private var var_1068:ITextWindow;
      
      private var var_2315:int;
      
      private var var_1317:IContainerButtonWindow;
      
      private var var_895:IWindowContainer;
      
      private var var_1321:ITextWindow;
      
      private var var_1320:IContainerButtonWindow;
      
      private var var_1538:ITextWindow;
      
      private var var_1537:IButtonWindow;
      
      private var var_858:TagRenderer;
      
      private var var_2135:ITextWindow;
      
      private var var_356:RoomEventViewCtrl;
      
      private var _navigator:HabboNavigator;
      
      private var var_727:ITextWindow;
      
      private var var_272:RoomThumbnailCtrl;
      
      private var var_1316:IContainerButtonWindow;
      
      private var var_2138:IWindowContainer;
      
      private var var_273:IWindowContainer;
      
      public function RoomInfoViewCtrl(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
         var_356 = new RoomEventViewCtrl(_navigator);
         var_201 = new RoomSettingsCtrl(_navigator,this,true);
         var_272 = new RoomThumbnailCtrl(_navigator);
         var_858 = new TagRenderer(_navigator);
         _navigator.roomSettingsCtrls.push(this.var_201);
         _hideInfoTimer = new Timer(6000,1);
         _hideInfoTimer.addEventListener(TimerEvent.TIMER,hideInfo);
      }
      
      public function backToRoomSettings() : void
      {
         this.var_201.active = true;
         this.var_356.active = false;
         this.var_272.active = false;
         this.reload();
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      private function refreshEventButtons(param1:RoomEventData) : void
      {
         if(false)
         {
            return;
         }
         var_1539.visible = param1 == null && _navigator.data.currentRoomOwner;
         var_1537.visible = param1 != null && (_navigator.data.currentRoomOwner || _navigator.data.eventMod);
         var_1536.visible = Util.hasVisibleChildren(var_1536);
      }
      
      private function refreshRoomDetails(param1:GuestRoomData, param2:Boolean) : void
      {
         if(param1 == null || false || false)
         {
            return;
         }
         var_662.text = param1.roomName;
         var_662.height = NaN;
         _ownerName.text = param1.ownerName;
         var_896.text = param1.description;
         var_858.refreshTags(var_357,param1.tags);
         var_896.visible = false;
         if(param1.description != "")
         {
            var_896.height = NaN;
            var_896.visible = true;
         }
         var _loc3_:* = _navigator.data.currentRoomRating == -1;
         _navigator.refreshButton(var_357,"thumb_up",_loc3_,onThumbUp,0);
         _navigator.refreshButton(var_357,"thumb_down",_loc3_,onThumbDown,0);
         var_2137.visible = _loc3_;
         var_894.visible = !_loc3_;
         var_1538.visible = !_loc3_;
         var_1538.text = "" + _navigator.data.currentRoomRating;
         _navigator.refreshButton(var_357,"home",param2,null,0);
         _navigator.refreshButton(var_357,"favourite",!param2 && _navigator.data.isCurrentRoomFavourite(),null,0);
         Util.moveChildrenToColumn(var_357,["room_name","owner_name_cont","tags","room_desc","rating_cont"],var_662.y,0);
         var_357.visible = true;
         var_357.height = Util.getLowestPoint(var_357);
      }
      
      private function getButtonsMinHeight() : int
      {
         return !!_navigator.data.currentRoomOwner ? 0 : 21;
      }
      
      public function dispose() : void
      {
         if(_hideInfoTimer)
         {
            _hideInfoTimer.removeEventListener(TimerEvent.TIMER,hideInfo);
            _hideInfoTimer.reset();
            _hideInfoTimer = null;
         }
      }
      
      private function onThumbUp(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         _navigator.send(new RateFlatMessageComposer(1));
      }
      
      private function hideInfo(param1:Event) : void
      {
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_395,HabboToolbarIconEnum.ROOMINFO,_window,false));
      }
      
      private function getRoomInfoMinHeight() : int
      {
         return 37;
      }
      
      public function onAddFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         if(_navigator.data.isFavouritesFull())
         {
            _loc3_ = new SimpleAlertView(_navigator,"${navigator.favouritesfull.title}","${navigator.favouritesfull.body}");
            _loc3_.show();
         }
         else
         {
            _navigator.send(new AddFavouriteRoomMessageComposer(_navigator.data.enteredGuestRoom.flatId));
         }
      }
      
      private function refreshRoomButtons(param1:Boolean) : void
      {
         if(_navigator.data.enteredGuestRoom == null || false || false)
         {
            return;
         }
         var_1535.visible = _navigator.data.canEditRoomSettings;
         var _loc2_:Boolean = _navigator.data.isCurrentRoomFavourite();
         var_1315.visible = _navigator.data.canAddFavourite && !_loc2_;
         var_1316.visible = _navigator.data.canAddFavourite && _loc2_;
         var_1317.visible = _navigator.data.canEditRoomSettings && !param1;
         var_1320.visible = _navigator.data.canEditRoomSettings && param1;
         var_1318.visible = Util.hasVisibleChildren(var_1318);
      }
      
      public function open(param1:Boolean) : void
      {
         this._hideInfoTimer.reset();
         this.var_356.active = false;
         this.var_201.active = false;
         this.var_272.active = false;
         if(param1)
         {
            this.startRoomSettingsEdit(_navigator.data.enteredGuestRoom.flatId);
         }
         refresh();
         _window.visible = true;
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_46,HabboToolbarIconEnum.ROOMINFO,_window,false));
         _window.parent.activate();
         _window.activate();
         if(!param1)
         {
            this._hideInfoTimer.start();
         }
      }
      
      public function toggle() : void
      {
         this._hideInfoTimer.reset();
         this.var_356.active = false;
         this.var_201.active = false;
         this.var_272.active = false;
         refresh();
         if(true)
         {
            _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_46,HabboToolbarIconEnum.ROOMINFO,_window,false));
            _window.parent.activate();
         }
         else
         {
            _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_395,HabboToolbarIconEnum.ROOMINFO,_window,false));
         }
      }
      
      private function refreshRoom() : void
      {
         Util.hideChildren(var_315);
         var_315.findChildByName("close").visible = true;
         var _loc1_:GuestRoomData = _navigator.data.enteredGuestRoom;
         var _loc2_:Boolean = _navigator.data.settings != null && _loc1_ != null && _loc1_.flatId == _navigator.data.settings.homeRoomId;
         refreshRoomDetails(_loc1_,_loc2_);
         refreshPublicSpaceDetails(_navigator.data.enteredPublicSpace);
         refreshRoomButtons(_loc2_);
         this.var_201.refresh(var_315);
         this.var_272.refresh(var_315);
         Util.moveChildrenToColumn(var_315,["room_details","room_buttons"],0,2);
         var_315.height = Util.getLowestPoint(var_315);
         var_315.visible = true;
         Logger.log("XORP: undefined, undefined, undefined, undefined, undefined");
      }
      
      private function onCloseButtonClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         hideInfo(null);
      }
      
      private function onEmbedSrcClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var_1069.setSelection(0,var_1069.text.length);
      }
      
      private function getEmbedData() : String
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(_navigator.data.enteredGuestRoom != null)
         {
            _loc1_ = "private";
            _loc2_ = "" + _navigator.data.enteredGuestRoom.flatId;
         }
         else
         {
            _loc1_ = "public";
            _loc2_ = "" + _navigator.data.publicSpaceNodeId;
            Logger.log("Node id is: " + _loc2_);
         }
         var _loc3_:String = _navigator.configuration.getKey("user.hash","");
         _navigator.registerParameter("navigator.embed.src","roomType",_loc1_);
         _navigator.registerParameter("navigator.embed.src","embedCode",_loc3_);
         _navigator.registerParameter("navigator.embed.src","roomId",_loc2_);
         return _navigator.getText("navigator.embed.src");
      }
      
      private function onThumbDown(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         _navigator.send(new RateFlatMessageComposer(-1));
      }
      
      private function refreshEvent() : void
      {
         Util.hideChildren(var_273);
         var _loc1_:RoomEventData = _navigator.data.roomEventData;
         refreshEventDetails(_loc1_);
         refreshEventButtons(_loc1_);
         this.var_356.refresh(var_273);
         if(Util.hasVisibleChildren(var_273) && !this.var_272.active)
         {
            Util.moveChildrenToColumn(var_273,["event_details","event_buttons"],0,2);
            var_273.height = Util.getLowestPoint(var_273);
            var_273.visible = true;
         }
         else
         {
            var_273.visible = false;
         }
         Logger.log("EVENT: undefined, undefined");
      }
      
      public function startEventEdit() : void
      {
         this._hideInfoTimer.reset();
         this.var_356.active = true;
         this.var_201.active = false;
         this.var_272.active = false;
         this.reload();
      }
      
      private function getEventInfoMinHeight() : int
      {
         return 18;
      }
      
      public function onRemoveFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         _navigator.send(new DeleteFavouriteRoomMessageComposer(_navigator.data.enteredGuestRoom.flatId));
      }
      
      private function onHover(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            return;
         }
         _hideInfoTimer.reset();
      }
      
      private function refreshPublicSpaceDetails(param1:PublicRoomShortData) : void
      {
         if(param1 == null || false || false)
         {
            return;
         }
         var_1070.text = _navigator.getPublicSpaceName(param1.unitPropertySet,param1.worldId);
         var_1070.height = NaN;
         var_1319.text = _navigator.getPublicSpaceDesc(param1.unitPropertySet,param1.worldId);
         var_1319.height = NaN;
         Util.moveChildrenToColumn(var_728,["public_space_name","public_space_desc"],var_1070.y,0);
         var_728.visible = true;
         var_728.height = Math.max(86,Util.getLowestPoint(var_728));
      }
      
      public function reload() : void
      {
         if(_window != null && false)
         {
            refresh();
         }
      }
      
      private function find(param1:String) : IWindow
      {
         var _loc2_:IWindow = _window.findChildByName(param1);
         if(_loc2_ == null)
         {
            throw new Error("Window element with name: " + param1 + " cannot be found!");
         }
         return _loc2_;
      }
      
      private function refreshEmbed() : void
      {
         var _loc1_:* = _navigator.configuration.getKey("embed.showInRoomInfo","false") == "true";
         if(_loc1_ && true && true && true)
         {
            var_895.visible = true;
            var_1069.text = this.getEmbedData();
         }
         else
         {
            var_895.visible = false;
         }
      }
      
      public function startRoomSettingsEdit(param1:int) : void
      {
         this._hideInfoTimer.reset();
         this.var_201.load(param1);
         this.var_201.active = true;
         this.var_356.active = false;
         this.var_272.active = false;
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      public function startThumbnailEdit() : void
      {
         this._hideInfoTimer.reset();
         this.var_201.active = false;
         this.var_356.active = false;
         this.var_272.active = true;
         this.reload();
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_THUMBS));
      }
      
      private function prepareWindow() : void
      {
         if(_window != null)
         {
            return;
         }
         _window = IWindowContainer(_navigator.getXmlWindow("iro_room_details"));
         _window.setParamFlag(HabboWindowParam.const_66,false);
         _window.setParamFlag(HabboWindowParam.const_1203,true);
         _window.visible = false;
         var_315 = IWindowContainer(find("room_info"));
         var_357 = IWindowContainer(find("room_details"));
         var_728 = IWindowContainer(find("public_space_details"));
         var_2138 = IWindowContainer(find("owner_name_cont"));
         var_2136 = IWindowContainer(find("rating_cont"));
         var_1318 = IWindowContainer(find("room_buttons"));
         var_662 = ITextWindow(find("room_name"));
         var_1070 = ITextWindow(find("public_space_name"));
         _ownerName = ITextWindow(find("owner_name"));
         var_896 = ITextWindow(find("room_desc"));
         var_1319 = ITextWindow(find("public_space_desc"));
         var_1068 = ITextWindow(find("owner_caption"));
         var_894 = ITextWindow(find("rating_caption"));
         var_2137 = ITextWindow(find("rate_caption"));
         var_1538 = ITextWindow(find("rating_txt"));
         var_273 = IWindowContainer(find("event_info"));
         var_893 = IWindowContainer(find("event_details"));
         var_1536 = IWindowContainer(find("event_buttons"));
         var_2135 = ITextWindow(find("event_name"));
         var_727 = ITextWindow(find("event_desc"));
         var_1315 = IContainerButtonWindow(find("add_favourite_button"));
         var_1316 = IContainerButtonWindow(find("rem_favourite_button"));
         var_1317 = IContainerButtonWindow(find("make_home_button"));
         var_1320 = IContainerButtonWindow(find("unmake_home_button"));
         var_1535 = IButtonWindow(find("room_settings_button"));
         var_1539 = IButtonWindow(find("create_event_button"));
         var_1537 = IButtonWindow(find("edit_event_button"));
         var_895 = IWindowContainer(find("embed_info"));
         var_1321 = ITextWindow(find("embed_info_txt"));
         var_1069 = ITextFieldWindow(find("embed_src_txt"));
         Util.setProcDirectly(var_1315,onAddFavouriteClick);
         Util.setProcDirectly(var_1316,onRemoveFavouriteClick);
         Util.setProcDirectly(var_1535,onRoomSettingsClick);
         Util.setProcDirectly(var_1317,onMakeHomeClick);
         Util.setProcDirectly(var_1320,onUnmakeHomeClick);
         Util.setProcDirectly(var_1539,onEventSettingsClick);
         Util.setProcDirectly(var_1537,onEventSettingsClick);
         Util.setProcDirectly(var_1069,onEmbedSrcClick);
         _navigator.refreshButton(var_1315,"favourite",true,null,0);
         _navigator.refreshButton(var_1316,"favourite",true,null,0);
         _navigator.refreshButton(var_1317,"home",true,null,0);
         _navigator.refreshButton(var_1320,"home",true,null,0);
         _window.findChildByName("close").procedure = onCloseButtonClick;
         Util.setProcDirectly(var_315,onHover);
         Util.setProcDirectly(var_273,onHover);
         var_1068.width = var_1068.textWidth;
         Util.moveChildrenToRow(var_2138,["owner_caption","owner_name"],var_1068.x,var_1068.y,3);
         var_894.width = var_894.textWidth;
         Util.moveChildrenToRow(var_2136,["rating_caption","rating_txt"],var_894.x,var_894.y,3);
         var_1321.height = NaN;
         Util.moveChildrenToColumn(var_895,["embed_info_txt","embed_src_txt"],var_1321.y,2);
         var_895.height = Util.getLowestPoint(var_895) + 5;
         var_2315 = NaN;
      }
      
      private function refreshEventDetails(param1:RoomEventData) : void
      {
         if(param1 == null || false)
         {
            return;
         }
         var_2135.text = param1.eventName;
         var_727.text = param1.eventDescription;
         var_858.refreshTags(var_893,[_navigator.getText("roomevent_type_" + param1.eventType),param1.tags[0],param1.tags[1]]);
         var_727.visible = false;
         if(param1.eventDescription != "")
         {
            var_727.height = NaN;
            var_727.y = Util.getLowestPoint(var_893) + 2;
            var_727.visible = true;
         }
         var_893.visible = true;
         var_893.height = Util.getLowestPoint(var_893);
      }
      
      private function refresh() : void
      {
         prepareWindow();
         refreshRoom();
         refreshEvent();
         refreshEmbed();
         Util.moveChildrenToColumn(this._window,["room_info","event_info","embed_info"],0,2);
         _window.height = Util.getLowestPoint(_window);
         _window.y = _window.desktop.height - 0 - 5;
         Logger.log("MAIN: undefined, undefined, undefined");
      }
      
      private function onRoomSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = _navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         startRoomSettingsEdit(_loc3_.flatId);
      }
      
      private function onUnmakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("CLEARING HOME ROOM:");
         _navigator.send(new UpdateNavigatorSettingsMessageComposer(0));
      }
      
      private function onEventSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.roomEventData == null)
         {
            if(_navigator.data.currentRoomOwner)
            {
               _navigator.send(new CanCreateEventMessageComposer());
            }
         }
         else
         {
            startEventEdit();
         }
      }
      
      public function roomSettingsRefreshNeeded() : void
      {
         refresh();
      }
      
      public function close() : void
      {
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_833,HabboToolbarIconEnum.ROOMINFO,_window,false));
         if(_window == null)
         {
            return;
         }
         this._window.visible = false;
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_CLOSED));
      }
      
      private function onMakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = _navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         Logger.log("SETTING HOME ROOM TO: " + _loc3_.flatId);
         _navigator.send(new UpdateNavigatorSettingsMessageComposer(_loc3_.flatId));
      }
   }
}
