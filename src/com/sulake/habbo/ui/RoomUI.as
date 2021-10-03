package com.sulake.habbo.ui
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.advertisement.IAdManager;
   import com.sulake.habbo.advertisement.events.AdEvent;
   import com.sulake.habbo.avatar.IAvatarRenderManager;
   import com.sulake.habbo.avatar.IHabboAvatarEditor;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.friendlist.IHabboFriendList;
   import com.sulake.habbo.help.IHabboHelp;
   import com.sulake.habbo.inventory.IHabboInventory;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.moderation.IHabboModeration;
   import com.sulake.habbo.navigator.IHabboNavigator;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.room.events.RoomEngineDimmerStateEvent;
   import com.sulake.habbo.room.events.RoomEngineEvent;
   import com.sulake.habbo.room.events.RoomEngineObjectEvent;
   import com.sulake.habbo.room.events.RoomEngineRoomColorEvent;
   import com.sulake.habbo.session.IRoomSession;
   import com.sulake.habbo.session.IRoomSessionManager;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.session.events.RoomSessionChatEvent;
   import com.sulake.habbo.session.events.RoomSessionDimmerPresetsEvent;
   import com.sulake.habbo.session.events.RoomSessionDoorbellEvent;
   import com.sulake.habbo.session.events.RoomSessionErrorMessageEvent;
   import com.sulake.habbo.session.events.RoomSessionEvent;
   import com.sulake.habbo.session.events.RoomSessionFriendRequestEvent;
   import com.sulake.habbo.session.events.RoomSessionPollEvent;
   import com.sulake.habbo.session.events.RoomSessionPresentEvent;
   import com.sulake.habbo.session.events.RoomSessionQueueEvent;
   import com.sulake.habbo.session.events.RoomSessionUserBadgesEvent;
   import com.sulake.habbo.session.events.RoomSessionVoteEvent;
   import com.sulake.habbo.sound.IHabboSoundManager;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.habbo.widget.IRoomWidgetFactory;
   import com.sulake.habbo.widget.RoomWidgetEnum;
   import com.sulake.habbo.widget.messages.RoomWidgetMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import com.sulake.iid.IIDAvatarRenderManager;
   import com.sulake.iid.IIDHabboAdManager;
   import com.sulake.iid.IIDHabboAvatarEditor;
   import com.sulake.iid.IIDHabboCatalog;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboFriendList;
   import com.sulake.iid.IIDHabboHelp;
   import com.sulake.iid.IIDHabboInventory;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboModeration;
   import com.sulake.iid.IIDHabboNavigator;
   import com.sulake.iid.IIDHabboRoomSessionManager;
   import com.sulake.iid.IIDHabboRoomWidget;
   import com.sulake.iid.IIDHabboSoundManager;
   import com.sulake.iid.IIDHabboToolbar;
   import com.sulake.iid.IIDRoomEngine;
   import com.sulake.iid.IIDSessionDataManager;
   import flash.events.Event;
   import iid.IIDHabboWindowManager;
   
   public class RoomUI extends Component implements IRoomUI, IUpdateReceiver
   {
       
      
      private var var_483:IHabboSoundManager;
      
      private var var_1230:IHabboAvatarEditor = null;
      
      private var var_256:IAdManager;
      
      private var var_802:IRoomWidgetFactory;
      
      private var var_18:IRoomSessionManager;
      
      private var _roomEngine:IRoomEngine;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_541:IAvatarRenderManager;
      
      private var var_255:Map;
      
      private var var_185:IHabboToolbar;
      
      private var var_680:IHabboModeration;
      
      private var var_350:ISessionDataManager;
      
      private var _navigator:IHabboNavigator;
      
      private var _catalog:IHabboCatalog;
      
      private var var_10:IHabboInventory;
      
      private var var_1477:int = -1;
      
      private var _config:IHabboConfigurationManager;
      
      private var _localization:IHabboLocalizationManager;
      
      private var _friendList:IHabboFriendList;
      
      private var _connection:IConnection;
      
      private var var_834:IHabboHelp;
      
      public function RoomUI(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         super(param1,param2,param3);
         queueInterface(new IIDHabboWindowManager(),onWindowManagerReady);
         queueInterface(new IIDRoomEngine(),onRoomEngineReady);
         queueInterface(new IIDHabboRoomSessionManager(),onRoomSessionManagerReady);
         queueInterface(new IIDHabboRoomWidget(),onRoomWidgetFactoryReady);
         queueInterface(new IIDSessionDataManager(),onSessionDataManagerReady);
         queueInterface(new IIDHabboFriendList(),onFriendListReady);
         queueInterface(new IIDAvatarRenderManager(),onAvatarRenderManagerReady);
         queueInterface(new IIDHabboInventory(),onInventoryReady);
         queueInterface(new IIDHabboToolbar(),onToolbarReady);
         queueInterface(new IIDHabboNavigator(),onNavigatorReady);
         queueInterface(new IIDHabboAvatarEditor(),onAvatarEditorReady);
         queueInterface(new IIDHabboCatalog(),onCatalogReady);
         queueInterface(new IIDHabboAdManager(),onAdManagerReady);
         queueInterface(new IIDHabboLocalizationManager(),onLocalizationManagerReady);
         queueInterface(new IIDHabboHelp(),onHabboHelpReady);
         queueInterface(new IIDHabboModeration(),onHabboModerationReady);
         queueInterface(new IIDHabboConfigurationManager(),onConfigurationManagerReady);
         queueInterface(new IIDHabboSoundManager(),onSoundManagerReady);
         queueInterface(new IIDHabboCommunicationManager(),onCommunicationReady);
         var_255 = new Map();
         registerUpdateReceiver(this,0);
      }
      
      public function createDesktop(param1:IRoomSession) : IRoomDesktop
      {
         if(param1 == null)
         {
            return null;
         }
         if(_roomEngine == null)
         {
            return null;
         }
         var _loc2_:String = getRoomIdentifier(param1.roomId,param1.roomCategory);
         var _loc3_:RoomDesktop = getDesktop(_loc2_) as RoomDesktop;
         if(_loc3_ != null)
         {
            return _loc3_;
         }
         _loc3_ = new RoomDesktop(param1,assets,_connection);
         _loc3_.roomEngine = _roomEngine;
         _loc3_.windowManager = _windowManager;
         _loc3_.roomWidgetFactory = var_802;
         _loc3_.sessionDataManager = var_350;
         _loc3_.roomSessionManager = var_18;
         _loc3_.friendList = _friendList;
         _loc3_.avatarRenderManager = var_541;
         _loc3_.inventory = var_10;
         _loc3_.toolbar = var_185;
         _loc3_.navigator = _navigator;
         _loc3_.avatarEditor = var_1230;
         _loc3_.catalog = _catalog;
         _loc3_.adManager = var_256;
         _loc3_.localization = _localization;
         _loc3_.habboHelp = var_834;
         _loc3_.moderation = var_680;
         _loc3_.config = _config;
         _loc3_.soundManager = var_483;
         var _loc4_:XmlAsset = _assets.getAssetByName("room_desktop_layout_xml") as XmlAsset;
         if(_loc4_ != null)
         {
            _loc3_.layout = _loc4_.content as XML;
         }
         _loc3_.createWidget(RoomWidgetEnum.const_403);
         _loc3_.createWidget(RoomWidgetEnum.const_660);
         _loc3_.init();
         var_255.add(_loc2_,_loc3_);
         return _loc3_;
      }
      
      public function processWidgetMessage(param1:int, param2:int, param3:RoomWidgetMessage) : void
      {
         if(param3 == null)
         {
            return;
         }
         if(_roomEngine == null)
         {
            return;
         }
         var _loc4_:String = getRoomIdentifier(param1,param2);
         var _loc5_:RoomDesktop = getDesktop(_loc4_) as RoomDesktop;
         if(_loc5_ == null)
         {
            return;
         }
         _loc5_.processWidgetMessage(param3);
      }
      
      private function onSoundManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         var_483 = param2 as IHabboSoundManager;
      }
      
      private function onCatalogReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         _catalog = param2 as IHabboCatalog;
      }
      
      private function roomSessionStateEventHandler(param1:RoomSessionEvent) : void
      {
         var _loc2_:* = null;
         if(_roomEngine == null)
         {
            return;
         }
         switch(param1.type)
         {
            case RoomSessionEvent.const_303:
               _loc2_ = createDesktop(param1.session);
               break;
            case RoomSessionEvent.const_96:
               break;
            case RoomSessionEvent.const_104:
               if(param1.session != null)
               {
                  disposeDesktop(getRoomIdentifier(param1.session.roomId,param1.session.roomCategory));
                  var_185.events.dispatchEvent(new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_180,HabboToolbarIconEnum.ZOOM));
                  var_185.events.dispatchEvent(new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_180,HabboToolbarIconEnum.MEMENU));
                  var_185.events.dispatchEvent(new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_180,HabboToolbarIconEnum.INVENTORY));
               }
         }
      }
      
      private function onAdManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         var_256 = param2 as IAdManager;
         if(var_256 != null && false)
         {
            var_256.events.addEventListener(AdEvent.const_376,adEventHandler);
            var_256.events.addEventListener(AdEvent.const_461,adEventHandler);
            var_256.events.addEventListener(AdEvent.const_480,adEventHandler);
         }
      }
      
      private function adEventHandler(param1:AdEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:String = getRoomIdentifier(param1.roomId,param1.roomCategory);
         var _loc3_:RoomDesktop = getDesktop(_loc2_) as RoomDesktop;
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.processEvent(param1);
      }
      
      private function onConnectionReady(param1:IConnection) : void
      {
         if(disposed)
         {
            return;
         }
         if(param1 != null)
         {
            _connection = param1;
         }
      }
      
      private function onRoomWidgetFactoryReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         var_802 = param2 as IRoomWidgetFactory;
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(_windowManager != null)
         {
            _windowManager.release(new IIDHabboWindowManager());
            _windowManager = null;
         }
         if(_roomEngine != null)
         {
            _roomEngine.release(new IIDRoomEngine());
            _roomEngine = null;
         }
         if(var_18 != null)
         {
            var_18.release(new IIDHabboRoomSessionManager());
            var_18 = null;
         }
         if(var_802 != null)
         {
            var_802.release(new IIDHabboRoomWidget());
            var_802 = null;
         }
         if(var_10 != null)
         {
            var_10.release(new IIDHabboInventory());
            var_10 = null;
         }
         if(var_185 != null)
         {
            var_185.release(new IIDHabboToolbar());
            var_185 = null;
         }
         if(_config != null)
         {
            _config.release(new IIDHabboConfigurationManager());
            _config = null;
         }
         if(var_483 != null)
         {
            var_483.release(new IIDHabboSoundManager());
            var_483 = null;
         }
         if(var_256 != null)
         {
            var_256.release(new IIDHabboAdManager());
            var_256 = null;
         }
         if(var_541 != null)
         {
            var_541.release(new IIDAvatarRenderManager());
            var_541 = null;
         }
         if(_catalog != null)
         {
            _catalog.release(new IIDHabboCatalog());
            _catalog = null;
         }
         if(_friendList != null)
         {
            _friendList.release(new IIDHabboFriendList());
            _friendList = null;
         }
         if(var_834 != null)
         {
            var_834.release(new IIDHabboHelp());
            var_834 = null;
         }
         if(_localization != null)
         {
            _localization.release(new IIDHabboLocalizationManager());
            _localization = null;
         }
         if(var_680 != null)
         {
            var_680.release(new IIDHabboModeration());
            var_680 = null;
         }
         if(_navigator != null)
         {
            _navigator.release(new IIDHabboNavigator());
            _navigator = null;
         }
         if(var_350 != null)
         {
            var_350.release(new IIDSessionDataManager());
            var_350 = null;
         }
         var_1230 = null;
         _connection = null;
         if(var_255)
         {
            while(false)
            {
               _loc1_ = var_255.getKey(0) as String;
               _loc2_ = var_255.remove(_loc1_) as RoomDesktop;
               if(_loc2_ != null)
               {
                  _loc2_.dispose();
               }
            }
            var_255.dispose();
            var_255 = null;
         }
         removeUpdateReceiver(this);
         super.dispose();
      }
      
      public function disposeDesktop(param1:String) : void
      {
         var _loc3_:int = 0;
         var _loc2_:RoomDesktop = var_255.remove(param1) as RoomDesktop;
         if(_loc2_ != null)
         {
            _loc3_ = _loc2_.getWidgetState(RoomWidgetEnum.const_252);
            if(_loc3_ != RoomDesktop.const_649)
            {
               var_1477 = _loc3_;
            }
            _loc2_.dispose();
         }
      }
      
      private function onHabboHelpReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         var_834 = param2 as IHabboHelp;
      }
      
      private function onCommunicationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         var _loc3_:IHabboCommunicationManager = param2 as IHabboCommunicationManager;
         if(_loc3_ != null)
         {
            _connection = _loc3_.getHabboMainConnection(onConnectionReady);
            if(_connection != null)
            {
               onConnectionReady(_connection);
            }
         }
      }
      
      private function onHabboModerationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         var_680 = param2 as IHabboModeration;
         Logger.log("XXXX GOT HABBO MODERATION: " + var_680);
      }
      
      private function onSessionDataManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         var_350 = param2 as ISessionDataManager;
      }
      
      private function roomSessionEventHandler(param1:RoomSessionEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(_roomEngine == null)
         {
            return;
         }
         if(param1.session != null)
         {
            _loc2_ = getRoomIdentifier(param1.session.roomId,param1.session.roomCategory);
            _loc3_ = getDesktop(_loc2_);
            if(_loc3_ != null)
            {
               _loc3_.processEvent(param1);
            }
         }
      }
      
      private function onLocalizationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         _localization = param2 as IHabboLocalizationManager;
      }
      
      private function onRoomEngineReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         _roomEngine = param2 as IRoomEngine;
         initializeRoomEngineEvents();
         if(var_18 != null && _roomEngine != null && false)
         {
            var_18.roomEngineReady = true;
         }
      }
      
      private function onFriendListReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         _friendList = param2 as IHabboFriendList;
      }
      
      public function update(param1:uint) : void
      {
         var _loc3_:* = null;
         var _loc2_:int = 0;
         while(_loc2_ < var_255.length)
         {
            _loc3_ = var_255.getWithIndex(_loc2_) as RoomDesktop;
            if(_loc3_ != null)
            {
               _loc3_.update();
            }
            _loc2_++;
         }
      }
      
      private function onNavigatorReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         _navigator = param2 as IHabboNavigator;
      }
      
      private function roomEventHandler(param1:RoomEngineEvent) : void
      {
         var _loc4_:* = null;
         var _loc5_:Boolean = false;
         var _loc6_:* = null;
         var _loc7_:* = null;
         if(param1 == null)
         {
            return;
         }
         if(_roomEngine == null)
         {
            return;
         }
         var _loc2_:String = getRoomIdentifier(param1.roomId,param1.roomCategory);
         var _loc3_:RoomDesktop = getDesktop(_loc2_) as RoomDesktop;
         if(_loc3_ == null)
         {
            if(var_18 == null)
            {
               return;
            }
            _loc4_ = var_18.getSession(param1.roomId,param1.roomCategory);
            if(_loc4_ != null)
            {
               _loc3_ = createDesktop(_loc4_) as RoomDesktop;
            }
         }
         if(_loc3_ == null)
         {
            return;
         }
         switch(param1.type)
         {
            case RoomEngineEvent.const_519:
               _loc5_ = false;
               _loc3_.createRoomView(getActiveCanvasId(param1.roomId,param1.roomCategory));
               if(_roomEngine != null)
               {
                  _roomEngine.setActiveRoom(param1.roomId,param1.roomCategory);
                  if(!_roomEngine.isPublicRoomWorldType(_roomEngine.getWorldType(param1.roomId,param1.roomCategory)))
                  {
                     _loc7_ = new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_158,HabboToolbarIconEnum.ZOOM);
                     _loc7_.iconState = "2";
                     var_185.events.dispatchEvent(_loc7_);
                  }
                  else
                  {
                     _loc5_ = true;
                  }
               }
               _loc3_.createWidget(RoomWidgetEnum.const_330);
               _loc3_.createWidget(RoomWidgetEnum.const_375);
               if(!_loc3_.session.isSpectatorMode)
               {
                  _loc3_.createWidget(RoomWidgetEnum.const_441);
                  _loc3_.createWidget(RoomWidgetEnum.CHAT_INPUT_WIDGET);
                  _loc3_.createWidget(RoomWidgetEnum.const_105);
               }
               _loc3_.createWidget(RoomWidgetEnum.const_678);
               _loc3_.createWidget(RoomWidgetEnum.const_402);
               _loc3_.createWidget(RoomWidgetEnum.const_458);
               _loc3_.createWidget(RoomWidgetEnum.const_443);
               _loc3_.createWidget(RoomWidgetEnum.const_398);
               _loc3_.createWidget(RoomWidgetEnum.const_415);
               _loc3_.createWidget(RoomWidgetEnum.const_101);
               _loc3_.createWidget(RoomWidgetEnum.const_319);
               _loc3_.createWidget(RoomWidgetEnum.const_119);
               _loc3_.createWidget(RoomWidgetEnum.const_472);
               if(!_loc5_)
               {
                  _loc3_.createWidget(RoomWidgetEnum.const_446);
               }
               _loc3_.createWidget(RoomWidgetEnum.const_252);
               if(var_1477 != RoomDesktop.const_649)
               {
                  _loc3_.initializeWidget(RoomWidgetEnum.const_252,var_1477);
               }
               if(var_256 != null)
               {
                  var_256.showRoomAd();
               }
               break;
            case RoomEngineEvent.const_731:
               disposeDesktop(_loc2_);
               break;
            case RoomEngineRoomColorEvent.const_554:
               _loc6_ = param1 as RoomEngineRoomColorEvent;
               if(_loc6_ == null)
               {
                  break;
               }
               if(_loc6_.bgOnly)
               {
                  _loc3_.setRoomViewColor(16777215,255);
               }
               else
               {
                  _loc3_.setRoomViewColor(_loc6_.color,_loc6_.brightness);
               }
               break;
            case RoomEngineDimmerStateEvent.const_64:
               _loc3_.processEvent(param1);
         }
      }
      
      private function roomSessionDialogEventHandler(param1:RoomSessionEvent) : void
      {
         var errorMessage:String = null;
         var event:RoomSessionEvent = param1;
         var errorTitle:String = "${error.title}";
         switch(event.type)
         {
            case RoomSessionErrorMessageEvent.const_193:
               errorMessage = "${room.error.cant_trade_stuff}";
               break;
            case RoomSessionErrorMessageEvent.const_197:
               errorMessage = "${room.error.cant_set_item}";
               break;
            case RoomSessionErrorMessageEvent.const_547:
               errorMessage = "${room.error.cant_set_not_owner}";
               break;
            case RoomSessionErrorMessageEvent.const_200:
               errorMessage = "${room.error.max_furniture}";
               break;
            case RoomSessionErrorMessageEvent.const_155:
               errorMessage = "${room.error.max_pets}";
               break;
            case RoomSessionErrorMessageEvent.const_202:
               errorMessage = "${room.error.max_queuetiles}";
               break;
            case RoomSessionErrorMessageEvent.const_211:
               errorMessage = "${room.error.max_soundfurni}";
               break;
            case RoomSessionErrorMessageEvent.const_223:
               errorMessage = "${room.error.max_stickies}";
               break;
            case RoomSessionErrorMessageEvent.const_228:
               errorMessage = "${room.error.kicked}";
               errorTitle = "${generic.alert.title}";
               break;
            case RoomSessionErrorMessageEvent.const_225:
               errorMessage = "${room.error.guide.not.available}";
               break;
            case RoomSessionErrorMessageEvent.const_222:
               errorMessage = "${room.error.guide.already.exists}";
               break;
            case RoomSessionErrorMessageEvent.const_719:
               errorMessage = "${room.error.pets.forbidden_in_hotel}";
               break;
            case RoomSessionErrorMessageEvent.const_669:
               errorMessage = "${room.error.pets.forbidden_in_flat}";
               break;
            case RoomSessionErrorMessageEvent.const_533:
               errorMessage = "${room.error.pets.no_free_tiles}";
               break;
            case RoomSessionErrorMessageEvent.const_517:
               errorMessage = "${room.error.pets.selected_tile_not_free}";
               break;
            default:
               return;
         }
         _windowManager.alert(errorTitle,errorMessage,0,function(param1:IAlertDialog, param2:Event):void
         {
            param1.dispose();
         });
      }
      
      private function onWindowManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         _windowManager = param2 as IHabboWindowManager;
      }
      
      public function getActiveCanvasId(param1:int, param2:int) : int
      {
         return 1;
      }
      
      private function initializeRoomEngineEvents() : void
      {
         if(_roomEngine != null && false)
         {
            _roomEngine.events.addEventListener(RoomEngineEvent.const_659,roomEngineEventHandler);
            _roomEngine.events.addEventListener(RoomEngineEvent.const_519,roomEventHandler);
            _roomEngine.events.addEventListener(RoomEngineEvent.const_731,roomEventHandler);
            _roomEngine.events.addEventListener(RoomEngineDimmerStateEvent.const_64,roomEventHandler);
            _roomEngine.events.addEventListener(RoomEngineRoomColorEvent.const_554,roomEventHandler);
            _roomEngine.events.addEventListener(RoomEngineObjectEvent.const_528,roomObjectEventHandler);
            _roomEngine.events.addEventListener(RoomEngineObjectEvent.const_383,roomObjectEventHandler);
            _roomEngine.events.addEventListener(RoomEngineObjectEvent.const_251,roomObjectEventHandler);
            _roomEngine.events.addEventListener(RoomEngineObjectEvent.const_714,roomObjectEventHandler);
            _roomEngine.events.addEventListener(RoomEngineObjectEvent.const_219,roomObjectEventHandler);
            _roomEngine.events.addEventListener(RoomEngineObjectEvent.const_635,roomObjectEventHandler);
            _roomEngine.events.addEventListener(RoomEngineObjectEvent.ROOM_OBJECT_WIDGET_REQUEST_CREDITFURNI,roomObjectEventHandler);
            _roomEngine.events.addEventListener(RoomEngineObjectEvent.const_129,roomObjectEventHandler);
            _roomEngine.events.addEventListener(RoomEngineObjectEvent.const_128,roomObjectEventHandler);
            _roomEngine.events.addEventListener(RoomEngineObjectEvent.const_117,roomObjectEventHandler);
            _roomEngine.events.addEventListener(RoomEngineObjectEvent.const_114,roomObjectEventHandler);
            _roomEngine.events.addEventListener(RoomEngineObjectEvent.const_124,roomObjectEventHandler);
            _roomEngine.events.addEventListener(RoomEngineObjectEvent.const_112,roomObjectEventHandler);
            _roomEngine.events.addEventListener(RoomEngineObjectEvent.const_358,roomObjectEventHandler);
            _roomEngine.events.addEventListener(RoomEngineObjectEvent.const_413,roomObjectEventHandler);
            _roomEngine.events.addEventListener(RoomEngineObjectEvent.const_440,roomObjectEventHandler);
            _roomEngine.events.addEventListener(RoomEngineObjectEvent.const_370,roomObjectEventHandler);
            _roomEngine.events.addEventListener(RoomEngineObjectEvent.const_92,roomObjectEventHandler);
         }
      }
      
      private function onAvatarRenderManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         var_541 = param2 as IAvatarRenderManager;
      }
      
      private function onInventoryReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         var_10 = param2 as IHabboInventory;
      }
      
      private function onToolbarReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         var_185 = param2 as IHabboToolbar;
      }
      
      private function getRoomIdentifier(param1:int, param2:int) : String
      {
         return "hard_coded_room_id";
      }
      
      private function roomObjectEventHandler(param1:RoomEngineObjectEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(_roomEngine == null)
         {
            return;
         }
         var _loc2_:String = getRoomIdentifier(param1.roomId,param1.roomCategory);
         var _loc3_:RoomDesktop = getDesktop(_loc2_) as RoomDesktop;
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.roomObjectEventHandler(param1);
      }
      
      private function onConfigurationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         _config = param2 as IHabboConfigurationManager;
      }
      
      private function onRoomSessionManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         var_18 = param2 as IRoomSessionManager;
         registerSessionEvents();
         if(var_18 != null && _roomEngine != null && false)
         {
            var_18.roomEngineReady = true;
         }
      }
      
      private function registerSessionEvents() : void
      {
         if(var_18)
         {
            var_18.events.addEventListener(RoomSessionEvent.const_303,roomSessionStateEventHandler);
            var_18.events.addEventListener(RoomSessionEvent.const_96,roomSessionStateEventHandler);
            var_18.events.addEventListener(RoomSessionEvent.const_104,roomSessionStateEventHandler);
            var_18.events.addEventListener(RoomSessionChatEvent.const_147,roomSessionEventHandler);
            var_18.events.addEventListener(RoomSessionUserBadgesEvent.const_113,roomSessionEventHandler);
            var_18.events.addEventListener(RoomSessionDoorbellEvent.const_101,roomSessionEventHandler);
            var_18.events.addEventListener(RoomSessionDoorbellEvent.const_106,roomSessionEventHandler);
            var_18.events.addEventListener(RoomSessionDoorbellEvent.const_53,roomSessionEventHandler);
            var_18.events.addEventListener(RoomSessionPresentEvent.const_269,roomSessionEventHandler);
            var_18.events.addEventListener(RoomSessionErrorMessageEvent.const_193,roomSessionDialogEventHandler);
            var_18.events.addEventListener(RoomSessionErrorMessageEvent.const_197,roomSessionDialogEventHandler);
            var_18.events.addEventListener(RoomSessionErrorMessageEvent.const_547,roomSessionDialogEventHandler);
            var_18.events.addEventListener(RoomSessionErrorMessageEvent.const_933,roomSessionDialogEventHandler);
            var_18.events.addEventListener(RoomSessionErrorMessageEvent.const_835,roomSessionDialogEventHandler);
            var_18.events.addEventListener(RoomSessionErrorMessageEvent.const_200,roomSessionDialogEventHandler);
            var_18.events.addEventListener(RoomSessionErrorMessageEvent.const_202,roomSessionDialogEventHandler);
            var_18.events.addEventListener(RoomSessionErrorMessageEvent.const_211,roomSessionDialogEventHandler);
            var_18.events.addEventListener(RoomSessionErrorMessageEvent.const_223,roomSessionDialogEventHandler);
            var_18.events.addEventListener(RoomSessionErrorMessageEvent.const_228,roomSessionDialogEventHandler);
            var_18.events.addEventListener(RoomSessionErrorMessageEvent.const_222,roomSessionDialogEventHandler);
            var_18.events.addEventListener(RoomSessionErrorMessageEvent.const_225,roomSessionDialogEventHandler);
            var_18.events.addEventListener(RoomSessionErrorMessageEvent.const_719,roomSessionDialogEventHandler);
            var_18.events.addEventListener(RoomSessionErrorMessageEvent.const_669,roomSessionDialogEventHandler);
            var_18.events.addEventListener(RoomSessionErrorMessageEvent.const_155,roomSessionDialogEventHandler);
            var_18.events.addEventListener(RoomSessionErrorMessageEvent.const_533,roomSessionDialogEventHandler);
            var_18.events.addEventListener(RoomSessionErrorMessageEvent.const_517,roomSessionDialogEventHandler);
            var_18.events.addEventListener(RoomSessionQueueEvent.const_451,roomSessionEventHandler);
            var_18.events.addEventListener(RoomSessionVoteEvent.const_125,roomSessionEventHandler);
            var_18.events.addEventListener(RoomSessionVoteEvent.const_130,roomSessionEventHandler);
            var_18.events.addEventListener(RoomSessionPollEvent.const_109,roomSessionEventHandler);
            var_18.events.addEventListener(RoomSessionPollEvent.const_58,roomSessionEventHandler);
            var_18.events.addEventListener(RoomSessionPollEvent.const_123,roomSessionEventHandler);
            var_18.events.addEventListener(RoomSessionDimmerPresetsEvent.const_477,roomSessionEventHandler);
            var_18.events.addEventListener(RoomSessionFriendRequestEvent.const_105,roomSessionEventHandler);
         }
      }
      
      private function roomEngineEventHandler(param1:RoomEngineEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(param1.type == RoomEngineEvent.const_659)
         {
            if(var_18 != null)
            {
               var_18.roomEngineReady = true;
            }
         }
      }
      
      public function getDesktop(param1:String) : IRoomDesktop
      {
         return var_255.getValue(param1) as RoomDesktop;
      }
      
      private function onAvatarEditorReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         var_1230 = param2 as IHabboAvatarEditor;
      }
   }
}
