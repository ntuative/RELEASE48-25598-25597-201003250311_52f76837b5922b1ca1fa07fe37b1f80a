package com.sulake.habbo.navigator.mainview
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.core.utils.ErrorReportStorage;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.components.ISelectableWindow;
   import com.sulake.core.window.components.ITabButtonWindow;
   import com.sulake.core.window.components.ITabContextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.outgoing.navigator.GetOfficialRoomsMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.GetPopularRoomTagsMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.LatestEventsSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.MyFavouriteRoomsSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.MyFriendsRoomsSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.MyRoomHistorySearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.MyRoomsSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.PopularRoomsSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RoomTagSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RoomTextSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RoomsWhereMyFriendsAreSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RoomsWithHighestScoreSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.room.session.QuitMessageComposer;
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.IViewCtrl;
   import com.sulake.habbo.navigator.Util;
   import com.sulake.habbo.navigator.domain.Tab;
   import com.sulake.habbo.navigator.domain.Tabs;
   import com.sulake.habbo.navigator.events.HabboNavigatorTrackingEvent;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class MainViewCtrl implements IUpdateReceiver, IDisposable
   {
      
      public static const const_622:int = 2;
      
      public static const const_960:int = 4;
      
      private static const const_489:int = 2;
      
      private static const const_757:int = 1;
      
      public static const const_1446:int = 3;
      
      private static const const_1048:int = 4;
      
      private static const SCROLLBAR_WIDTH:int = 22;
      
      public static const const_372:int = 1;
      
      private static const const_756:int = 3;
       
      
      private var var_1750:int = 0;
      
      private var _disposed:Boolean = false;
      
      private var var_1167:IRegionWindow;
      
      private var var_392:int;
      
      private var var_1170:Boolean = true;
      
      private var var_654:GuestRoomListCtrl;
      
      private var var_13:IFrameWindow;
      
      private var var_379:Timer;
      
      private var var_247:IWindowContainer;
      
      private var var_184:IWindowContainer;
      
      private var var_220:IWindowContainer;
      
      private var var_1169:IWindow;
      
      private var var_1168:Boolean;
      
      private var var_801:OfficialRoomListCtrl;
      
      private var var_19:IWindowContainer;
      
      private var var_655:PopularTagsListCtrl;
      
      private var _navigator:HabboNavigator;
      
      private var var_1171:int = 0;
      
      private var var_215:ITabContextWindow;
      
      public function MainViewCtrl(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
         var_655 = new PopularTagsListCtrl(_navigator);
         var_654 = new GuestRoomListCtrl(_navigator);
         var_801 = new OfficialRoomListCtrl(_navigator);
         var_379 = new Timer(300,1);
         var_379.addEventListener(TimerEvent.TIMER,onResizeTimer);
      }
      
      private function getSearchMsg(param1:int, param2:String) : IMessageComposer
      {
         if(param1 == Tabs.const_683)
         {
            return new MyFavouriteRoomsSearchMessageComposer();
         }
         if(param1 == Tabs.const_572)
         {
            return new MyFriendsRoomsSearchMessageComposer();
         }
         if(param1 == Tabs.const_539)
         {
            return new MyRoomHistorySearchMessageComposer();
         }
         if(param1 == Tabs.const_214)
         {
            return new MyRoomsSearchMessageComposer();
         }
         if(param1 == Tabs.const_306)
         {
            return new PopularRoomsSearchMessageComposer(param2);
         }
         if(param1 == Tabs.const_717)
         {
            return new RoomsWhereMyFriendsAreSearchMessageComposer();
         }
         if(param1 == Tabs.const_668)
         {
            return new RoomsWithHighestScoreSearchMessageComposer();
         }
         if(param1 == Tabs.const_301)
         {
            return new RoomTagSearchMessageComposer(param2);
         }
         if(param1 == Tabs.const_196)
         {
            return new RoomTextSearchMessageComposer(param2);
         }
         if(param1 == Tabs.const_356)
         {
            return new LatestEventsSearchMessageComposer(param2);
         }
         Logger.log("No message for searchType: " + param1);
         return null;
      }
      
      private function prepare() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var_13 = IFrameWindow(_navigator.getXmlWindow("grs_main_window"));
         var_215 = ITabContextWindow(var_13.findChildByName("tab_context"));
         var_19 = IWindowContainer(var_13.findChildByName("tab_content"));
         var_220 = IWindowContainer(var_13.findChildByName("custom_content"));
         var_184 = IWindowContainer(var_13.findChildByName("list_content"));
         var_247 = IWindowContainer(var_13.findChildByName("custom_footer"));
         var_1169 = var_13.findChildByName("loading_text");
         var _loc1_:IWindow = var_13.findChildByTag("close");
         _loc1_.procedure = onWindowClose;
         var_1167 = IRegionWindow(var_13.findChildByName("to_hotel_view"));
         var_1167.procedure = onHotelView;
         refreshToHotelViewButton(false);
         var_13.procedure = onWindow;
         for each(_loc2_ in _navigator.tabs.tabs)
         {
            _loc3_ = var_215.getTabItemByID(_loc2_.id);
            _loc3_.setParamFlag(HabboWindowParam.const_41,true);
            _loc3_.procedure = onTabClick;
            _loc2_.button = _loc3_;
         }
         var_13.scaler.setParamFlag(HabboWindowParam.const_618,false);
         var_13.scaler.setParamFlag(HabboWindowParam.const_1246,true);
      }
      
      public function get mainWindow() : IFrameWindow
      {
         return var_13;
      }
      
      private function onTabClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_57)
         {
            return;
         }
         var _loc3_:int = param2.id;
         if(var_1168)
         {
            var_1168 = false;
            return;
         }
         var _loc4_:Tab = _navigator.tabs.getTab(_loc3_);
         _loc4_.sendSearchRequest();
         switch(_loc4_.id)
         {
            case Tabs.const_311:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_EVENTS));
               break;
            case Tabs.const_271:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_ME));
               break;
            case Tabs.const_331:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_OFFICIAL));
               break;
            case Tabs.const_238:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_ROOMS));
               break;
            case Tabs.const_198:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCH));
         }
      }
      
      private function refreshScrollbar(param1:IViewCtrl) : void
      {
         if(param1.content == null || !param1.content.visible)
         {
            return;
         }
         var _loc2_:IItemListWindow = IItemListWindow(param1.content.findChildByName("item_list"));
         var _loc3_:IWindow = param1.content.findChildByName("scroller");
         var _loc4_:* = _loc2_.scrollableRegion.height > _loc2_.height;
         if(_loc3_.visible)
         {
            if(_loc4_)
            {
               return;
            }
            _loc3_.visible = false;
            _loc2_.width += SCROLLBAR_WIDTH;
         }
         else
         {
            if(!_loc4_)
            {
               return;
            }
            _loc3_.visible = true;
            _loc2_.width -= SCROLLBAR_WIDTH;
         }
      }
      
      private function onWindowClose(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("Close window");
         this.close();
      }
      
      private function sendTrackingEvent(param1:int) : void
      {
         switch(param1)
         {
            case Tabs.const_356:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_LATEST_EVENTS));
               break;
            case Tabs.const_683:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_FAVOURITES));
               break;
            case Tabs.const_572:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_FRIENDS_ROOMS));
               break;
            case Tabs.const_539:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_HISTORY));
               break;
            case Tabs.const_214:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_ROOMS));
               break;
            case Tabs.const_625:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_OFFICIALROOMS));
               break;
            case Tabs.const_306:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_POPULAR_ROOMS));
               break;
            case Tabs.const_717:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_ROOMS_WHERE_MY_FRIENDS_ARE));
               break;
            case Tabs.const_668:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_ROOMS_WITH_HIGHEST_SCORE));
               break;
            case Tabs.const_301:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_TAG_SEARCH));
               break;
            case Tabs.const_196:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_TEXT_SEARCH));
         }
      }
      
      private function refreshList(param1:Boolean, param2:Boolean, param3:IViewCtrl, param4:String) : void
      {
         var _loc5_:* = null;
         if(!param2)
         {
            return;
         }
         if(param3.content == null)
         {
            _loc5_ = var_184.getChildByName(param4);
            param3.content = IWindowContainer(_loc5_);
         }
         if(param1)
         {
            param3.refresh();
         }
         param3.content.visible = true;
      }
      
      public function isOpen() : Boolean
      {
         return var_13 != null && false;
      }
      
      private function refreshListContent(param1:Boolean) : void
      {
         Util.hideChildren(var_184);
         refreshGuestRooms(param1,_navigator.data.guestRoomSearchArrived);
         refreshPopularTags(param1,_navigator.data.popularTagsArrived);
         refreshOfficialRooms(param1,_navigator.data.officialRoomsArrived);
      }
      
      private function onResizeTimer(param1:TimerEvent) : void
      {
         refreshScrollbar(var_655);
         refreshScrollbar(var_654);
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function stretchNewEntryIfNeeded(param1:IViewCtrl, param2:IWindowContainer) : void
      {
         var _loc3_:IWindow = param1.content.findChildByName("scroller");
         if(_loc3_.visible)
         {
            return;
         }
         param2.width += SCROLLBAR_WIDTH;
      }
      
      public function startSearch(param1:int, param2:int, param3:String = "-1", param4:int = 1) : void
      {
         var _loc5_:Tab = _navigator.tabs.getSelected();
         _navigator.tabs.setSelectedTab(param1);
         var _loc6_:Tab = _navigator.tabs.getSelected();
         ErrorReportStorage.addDebugData("StartSearch","Start search " + _loc5_.id + " => " + _loc6_.id);
         this.var_1170 = _loc5_ != _loc6_;
         if(_loc5_ != _loc6_)
         {
            _loc6_.tabPageDecorator.tabSelected();
         }
         _navigator.data.startLoading();
         if(param4 == const_372)
         {
            _navigator.send(getSearchMsg(param2,param3));
         }
         else if(param4 == const_622)
         {
            _navigator.send(new GetPopularRoomTagsMessageComposer());
         }
         else
         {
            _navigator.send(new GetOfficialRoomsMessageComposer());
         }
         if(!isOpen())
         {
            open();
            this.var_392 = const_489;
            this.var_184.blend = 0;
            if(this.var_220.visible)
            {
               this.var_220.blend = 0;
               this.var_247.blend = 0;
            }
         }
         else
         {
            this.var_392 = const_757;
         }
         this.var_1171 = 0;
         _navigator.registerUpdateReceiver(this,2);
         sendTrackingEvent(param2);
      }
      
      private function refreshCustomContent() : void
      {
         Util.hideChildren(var_220);
         var _loc1_:Tab = _navigator.tabs.getSelected();
         _loc1_.tabPageDecorator.refreshCustomContent(var_220);
         if(Util.hasVisibleChildren(var_220))
         {
            var_220.visible = true;
         }
         else
         {
            var_220.visible = false;
            var_220.blend = 1;
         }
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            _disposed = true;
            _navigator = null;
            if(var_13)
            {
               var_13.dispose();
               var_13 = null;
            }
            if(var_19)
            {
               var_19.dispose();
               var_19 = null;
            }
            if(var_379)
            {
               var_379.removeEventListener(TimerEvent.TIMER,onResizeTimer);
               var_379.reset();
               var_379 = null;
            }
            if(var_655)
            {
               var_655.dispose();
               var_655 = null;
            }
            if(var_654)
            {
               var_654.dispose();
               var_654 = null;
            }
            if(var_801)
            {
               var_801.dispose();
               var_801 = null;
            }
         }
      }
      
      private function onWindow(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_44 || param2 != var_13)
         {
            return;
         }
         if(!this.var_379.running)
         {
            this.var_379.reset();
            this.var_379.start();
         }
      }
      
      private function refreshOfficialRooms(param1:Boolean, param2:Boolean) : void
      {
         refreshList(param1,param2,var_801,"official_rooms");
      }
      
      private function refreshGuestRooms(param1:Boolean, param2:Boolean) : void
      {
         refreshList(param1,param2,var_654,"guest_rooms");
      }
      
      private function refreshTab() : void
      {
         var _loc1_:Tab = _navigator.tabs.getSelected();
         var _loc2_:ISelectableWindow = var_215.selector.getSelected();
         if(_loc1_.button != _loc2_)
         {
            var_1168 = true;
            var_215.selector.setSelected(_loc1_.button);
         }
      }
      
      private function refreshPopularTags(param1:Boolean, param2:Boolean) : void
      {
         refreshList(param1,param2,var_655,"popular_tags");
      }
      
      public function onNavigatorToolBarIconClick() : Boolean
      {
         if(isOpen())
         {
            close();
            return false;
         }
         var _loc1_:Tab = _navigator.tabs.getSelected();
         _loc1_.tabPageDecorator.navigatorOpenedWhileInTab();
         return true;
      }
      
      public function open() : void
      {
         var _loc1_:Boolean = false;
         if(this.var_13 == null)
         {
            prepare();
            _loc1_ = true;
         }
         refresh();
         var_13.visible = true;
         var_13.activate();
         if(_loc1_)
         {
            _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_46,HabboToolbarIconEnum.NAVIGATOR,var_13));
         }
      }
      
      private function refreshFooter() : void
      {
         Util.hideChildren(var_247);
         var _loc1_:Tab = _navigator.tabs.getSelected();
         _loc1_.tabPageDecorator.refreshFooter(var_247);
         if(Util.hasVisibleChildren(var_247))
         {
            var_247.visible = true;
         }
         else
         {
            var_247.visible = false;
         }
      }
      
      public function reloadRoomList(param1:int) : Boolean
      {
         ErrorReportStorage.addDebugData("MainViewCtrl","Reloading RoomList");
         if(this.isOpen() && this._navigator.data.guestRoomSearchResults != null && this._navigator.data.guestRoomSearchResults.searchType == param1)
         {
            startSearch(_navigator.tabs.getSelected().id,param1,"");
            return true;
         }
         return false;
      }
      
      private function onHotelView(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            refreshToHotelViewButton(true);
         }
         else if(param1.type == WindowMouseEvent.const_30)
         {
            refreshToHotelViewButton(false);
         }
         else if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            _navigator.send(new QuitMessageComposer());
         }
      }
      
      public function refresh() : void
      {
         if(var_13 == null)
         {
            return;
         }
         refreshTab();
         refreshCustomContent();
         refreshListContent(true);
         refreshFooter();
         var_220.height = Util.getLowestPoint(var_220);
         var_247.height = Util.getLowestPoint(var_247);
         var _loc1_:int = 0;
         Util.moveChildrenToColumn(var_19,["custom_content","list_content"],var_220.y,8);
         var_184.height = var_184.height + _loc1_ - 0 - 0 + var_1750;
         Util.moveChildrenToColumn(var_19,["list_content","custom_footer"],var_184.y,8);
         var_1750 = var_247.height;
         onResizeTimer(null);
      }
      
      public function update(param1:uint) : void
      {
         var _loc3_:Number = NaN;
         if(this.var_184 == null)
         {
            return;
         }
         var _loc2_:Number = param1 / 150;
         if(var_392 == const_757)
         {
            _loc3_ = Math.min(1,Math.max(0,this.var_184.blend - _loc2_));
            this.var_184.blend = _loc3_;
            this.var_220.blend = !!var_1170 ? Number(_loc3_) : Number(1);
            this.var_247.blend = !!var_1170 ? Number(_loc3_) : Number(1);
            if(_loc3_ == 0)
            {
               var_392 = const_489;
            }
         }
         else if(var_392 == const_489)
         {
            if(var_1171 % 10 == 1)
            {
               var_1169.visible = true;
            }
            ++var_1171;
            if(!_navigator.data.isLoading())
            {
               var_392 = const_756;
            }
         }
         else if(var_392 == const_756)
         {
            this.refresh();
            var_392 = const_1048;
         }
         else
         {
            var_1169.visible = false;
            _loc3_ = Math.min(1,Math.max(0,this.var_184.blend + _loc2_));
            this.var_184.blend = _loc3_;
            this.var_220.blend = !!var_1170 ? Number(_loc3_) : Number(1);
            this.var_247.blend = !!var_1170 ? Number(_loc3_) : Number(1);
            if(false)
            {
               _navigator.removeUpdateReceiver(this);
            }
         }
      }
      
      private function refreshToHotelViewButton(param1:Boolean) : void
      {
         _navigator.refreshButton(var_1167,"icon_hotelview",!param1,null,0);
         _navigator.refreshButton(var_1167,"icon_hotelview_reactive",param1,null,0);
      }
      
      public function close() : void
      {
         if(var_13 != null)
         {
            var_13.visible = false;
         }
      }
   }
}
