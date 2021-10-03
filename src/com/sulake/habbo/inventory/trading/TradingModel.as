package com.sulake.habbo.inventory.trading
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.incoming.inventory.trading.TradingAcceptEvent;
   import com.sulake.habbo.communication.messages.incoming.inventory.trading.TradingAlreadyOpenEvent;
   import com.sulake.habbo.communication.messages.incoming.inventory.trading.TradingCloseEvent;
   import com.sulake.habbo.communication.messages.incoming.inventory.trading.TradingCompletedEvent;
   import com.sulake.habbo.communication.messages.incoming.inventory.trading.TradingConfirmationEvent;
   import com.sulake.habbo.communication.messages.incoming.inventory.trading.TradingNotOpenEvent;
   import com.sulake.habbo.communication.messages.incoming.inventory.trading.TradingOtherNotAllowedEvent;
   import com.sulake.habbo.communication.messages.incoming.inventory.trading.TradingYouAreNotAllowedEvent;
   import com.sulake.habbo.communication.messages.outgoing.inventory.trading.AcceptTradingComposer;
   import com.sulake.habbo.communication.messages.outgoing.inventory.trading.AddItemToTradeComposer;
   import com.sulake.habbo.communication.messages.outgoing.inventory.trading.CloseTradingComposer;
   import com.sulake.habbo.communication.messages.outgoing.inventory.trading.ConfirmAcceptTradingComposer;
   import com.sulake.habbo.communication.messages.outgoing.inventory.trading.ConfirmDeclineTradingComposer;
   import com.sulake.habbo.communication.messages.outgoing.inventory.trading.OpenTradingComposer;
   import com.sulake.habbo.communication.messages.outgoing.inventory.trading.RemoveItemFromTradeComposer;
   import com.sulake.habbo.communication.messages.outgoing.inventory.trading.UnacceptTradingComposer;
   import com.sulake.habbo.inventory.HabboInventory;
   import com.sulake.habbo.inventory.IInventoryModel;
   import com.sulake.habbo.inventory.enum.FurniCategory;
   import com.sulake.habbo.inventory.enum.InventoryCategory;
   import com.sulake.habbo.inventory.enum.InventorySubCategory;
   import com.sulake.habbo.inventory.events.HabboInventoryTrackingEvent;
   import com.sulake.habbo.inventory.furni.FurniModel;
   import com.sulake.habbo.inventory.items.FloorItem;
   import com.sulake.habbo.inventory.items.GroupItem;
   import com.sulake.habbo.inventory.items.IItem;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.room.IGetImageListener;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.room.ImageResult;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   import flash.events.Event;
   
   public class TradingModel implements IInventoryModel, IGetImageListener
   {
      
      public static const const_297:uint = 2;
      
      public static const const_425:uint = 4;
      
      public static const TRADING_STATE_CANCELLED:uint = 6;
      
      public static const const_264:uint = 3;
      
      public static const const_174:uint = 1;
      
      public static const const_175:uint = 0;
      
      public static const const_1285:uint = 9;
      
      public static const const_195:uint = 5;
       
      
      private var var_584:Boolean = false;
      
      private var _disposed:Boolean = false;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var _otherUserCanTrade:Boolean = false;
      
      private var var_31:uint = 0;
      
      private var _roomEngine:IRoomEngine;
      
      private var var_2076:String = "";
      
      private var var_591:Map;
      
      private var var_45:TradingView;
      
      private var var_1295:int = -1;
      
      private var var_232:Map;
      
      private var var_717:int = -1;
      
      private var var_2074:Boolean = false;
      
      private var var_716:Boolean = false;
      
      private var _communication:IHabboCommunicationManager;
      
      private var var_514:Boolean = false;
      
      private var var_10:HabboInventory;
      
      private var var_2075:String = "";
      
      private var _localization:IHabboLocalizationManager;
      
      public function TradingModel(param1:HabboInventory, param2:IHabboWindowManager, param3:IHabboCommunicationManager, param4:IAssetLibrary, param5:IRoomEngine, param6:IHabboLocalizationManager)
      {
         super();
         var_10 = param1;
         _communication = param3;
         _assetLibrary = param4;
         _roomEngine = param5;
         _localization = param6;
         var_45 = new TradingView(this,param2,param4,param5,param6);
      }
      
      public function get otherUserItems() : Map
      {
         return var_591;
      }
      
      public function get ownUserCanTrade() : Boolean
      {
         return var_2074;
      }
      
      public function get otherUserCanTrade() : Boolean
      {
         return _otherUserCanTrade;
      }
      
      public function get state() : uint
      {
         return var_31;
      }
      
      public function getFurniInventoryModel() : FurniModel
      {
         return var_10.furniModel;
      }
      
      public function requestInitialization(param1:int = 0) : void
      {
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
         var_45.updateItemImage(param1,param2);
      }
      
      public function updateItemGroupMaps(param1:int, param2:Map, param3:int, param4:Map) : void
      {
         if(var_232 != null)
         {
            var_232.dispose();
         }
         if(var_591 != null)
         {
            var_591.dispose();
         }
         if(param1 == var_717)
         {
            var_232 = param2;
            var_591 = param4;
         }
         else
         {
            var_232 = param4;
            var_591 = param2;
         }
         var_514 = false;
         var_716 = false;
         var_45.updateItemList(var_717);
         var_45.updateItemList(var_1295);
         var_45.updateUserInterface();
         var _loc5_:FurniModel = var_10.furniModel;
         if(_loc5_ != null)
         {
            _loc5_.updateLocks();
         }
      }
      
      public function handleMessageEvent(param1:IMessageEvent) : void
      {
         var _loc2_:* = null;
         if(param1 is TradingAlreadyOpenEvent)
         {
            Logger.log("TRADING::TradingAlreadyOpenEvent");
            var_45.alertPopup(TradingView.const_897);
         }
         else if(param1 is TradingAcceptEvent)
         {
            Logger.log("TRADING::TradingAcceptEvent");
            if(TradingAcceptEvent(param1).userID == var_717)
            {
               var_514 = TradingAcceptEvent(param1).userAccepts != 0;
            }
            else
            {
               var_716 = TradingAcceptEvent(param1).userAccepts != 0;
            }
            var_45.updateUserInterface();
         }
         else if(param1 is TradingConfirmationEvent)
         {
            Logger.log("TRADING::TradingConfirmationEvent");
            state = const_297;
         }
         else if(param1 is TradingCompletedEvent)
         {
            Logger.log("TRADING::TradingCompletedEvent");
            state = const_195;
         }
         else if(param1 is TradingCloseEvent)
         {
            Logger.log("TRADING::TradingCloseEvent");
            if(!var_584)
            {
               Logger.log("Received TradingCloseEvent, but trading already stopped!!!");
               return;
            }
            _loc2_ = param1 as TradingCloseEvent;
            if(_loc2_.userID != var_717)
            {
               var_45.alertPopup(TradingView.const_904);
            }
            close();
         }
         else if(param1 is TradingNotOpenEvent)
         {
            Logger.log("TRADING::TradingNotOpenEvent");
         }
         else if(param1 is TradingOtherNotAllowedEvent)
         {
            var_45.showOtherUserNotification("${inventory.trading.warning.others_account_disabled}");
         }
         else if(param1 is TradingYouAreNotAllowedEvent)
         {
            var_45.showOwnUserNotification("${inventory.trading.warning.own_account_disabled}");
         }
         else
         {
            Logger.log("TRADING/Unknown message event: " + param1);
         }
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            if(var_45 && true)
            {
               var_45.dispose();
               var_45 = null;
            }
            var_10 = null;
            _communication = null;
            _assetLibrary = null;
            _roomEngine = null;
            _localization = null;
            _disposed = true;
         }
      }
      
      public function set state(param1:uint) : void
      {
         Logger.log("OLD STATE: " + var_31 + " NEW STATE: " + param1 + " OWN: " + var_514 + " OTHER: " + var_716);
         var _loc2_:Boolean = false;
         if(var_31 == param1)
         {
            return;
         }
         switch(var_31)
         {
            case const_175:
               if(param1 == const_174 || param1 == const_195)
               {
                  var_31 = param1;
                  _loc2_ = true;
               }
               break;
            case const_174:
               if(param1 == const_297)
               {
                  var_31 = param1;
                  _loc2_ = true;
                  startConfirmCountdown();
               }
               else if(param1 == TRADING_STATE_CANCELLED)
               {
                  var_31 = param1;
                  var_45.setMinimized(false);
                  _loc2_ = true;
               }
               break;
            case const_297:
               if(param1 == const_264)
               {
                  var_31 = param1;
                  _loc2_ = true;
               }
               else if(param1 == TRADING_STATE_CANCELLED)
               {
                  var_31 = param1;
                  var_45.setMinimized(false);
                  _loc2_ = true;
               }
               else if(param1 == const_174)
               {
                  var_31 = param1;
                  _loc2_ = true;
                  cancelConfirmCountdown();
               }
               break;
            case const_264:
               if(param1 == const_425)
               {
                  var_31 = param1;
                  _loc2_ = true;
               }
               else if(param1 == const_195)
               {
                  var_31 = param1;
                  _loc2_ = true;
                  close();
               }
               else if(param1 == TRADING_STATE_CANCELLED)
               {
                  var_31 = param1;
                  var_45.setMinimized(false);
                  _loc2_ = true;
                  close();
               }
               break;
            case const_425:
               if(param1 == const_195)
               {
                  var_31 = param1;
                  var_45.setMinimized(false);
                  _loc2_ = true;
                  close();
               }
               else if(param1 == TRADING_STATE_CANCELLED)
               {
                  var_31 = param1;
                  var_45.setMinimized(false);
                  _loc2_ = true;
                  close();
               }
               break;
            case const_195:
               if(param1 == const_175)
               {
                  var_31 = param1;
                  _loc2_ = true;
               }
               break;
            case TRADING_STATE_CANCELLED:
               if(param1 == const_175)
               {
                  var_31 = param1;
                  _loc2_ = true;
               }
               else if(param1 == const_174)
               {
                  var_31 = param1;
                  _loc2_ = true;
               }
               break;
            default:
               throw new Error("Unknown trading progress state: \"" + var_31 + "\"");
         }
         if(_loc2_)
         {
            var_45.updateUserInterface();
            return;
         }
         throw new Error("Error assigning trading process status!");
      }
      
      public function get ownUserName() : String
      {
         return var_2075;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get otherUserName() : String
      {
         return var_2076;
      }
      
      public function requestRemoveItemFromTrading(param1:int) : void
      {
         var _loc3_:* = null;
         if(var_514)
         {
            return;
         }
         var _loc2_:GroupItem = ownUserItems.getWithIndex(param1);
         if(_loc2_)
         {
            _loc3_ = _loc2_.peek();
            if(_loc3_)
            {
               _communication.getHabboMainConnection(null).send(new RemoveItemFromTradeComposer(_loc3_.id));
            }
         }
      }
      
      public function subCategorySwitch(param1:String) : void
      {
         if(var_584)
         {
            if(var_31 != const_175)
            {
               requestCancelTrading();
            }
         }
      }
      
      public function get ownUserAccepts() : Boolean
      {
         return var_514;
      }
      
      public function getWindowContainer() : IWindowContainer
      {
         return var_45.getWindowContainer();
      }
      
      public function requestCancelTrading() : void
      {
         _communication.getHabboMainConnection(null).send(new CloseTradingComposer());
      }
      
      public function get running() : Boolean
      {
         return var_31 != const_175;
      }
      
      public function getOwnItemIdsInTrade() : Array
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc5_:int = 0;
         var _loc1_:Array = new Array();
         if(var_232 == null || false)
         {
            return _loc1_;
         }
         var _loc4_:int = 0;
         while(_loc4_ < var_232.length)
         {
            _loc2_ = var_232.getWithIndex(_loc4_) as GroupItem;
            if(_loc2_ != null)
            {
               _loc5_ = 0;
               while(_loc5_ < _loc2_.getTotalCount())
               {
                  _loc3_ = _loc2_.getAt(_loc5_);
                  if(_loc3_ != null)
                  {
                     _loc1_.push(_loc3_.ref);
                  }
                  _loc5_++;
               }
            }
            _loc4_++;
         }
         return _loc1_;
      }
      
      public function requestAcceptTrading() : void
      {
         _communication.getHabboMainConnection(null).send(new AcceptTradingComposer());
      }
      
      public function get ownUserItems() : Map
      {
         return var_232;
      }
      
      public function categorySwitch(param1:String) : void
      {
         var_45.setMinimized(param1 != InventoryCategory.const_72);
         var_10.updateSubView();
      }
      
      public function startConfirmCountdown() : void
      {
         var_45.startConfirmCountdown();
      }
      
      public function requestFurniViewOpen() : void
      {
         var_10.toggleInventoryPage(InventoryCategory.const_72);
      }
      
      public function startTrading(param1:int, param2:String, param3:Boolean, param4:int, param5:String, param6:Boolean) : void
      {
         var_717 = param1;
         var_2075 = param2;
         var_232 = new Map();
         var_514 = false;
         var_2074 = param3;
         var_1295 = param4;
         var_2076 = param5;
         var_591 = new Map();
         var_716 = false;
         _otherUserCanTrade = param6;
         var_584 = true;
         state = const_174;
         var_45.setup(param1,param3,param4,param6);
         var_45.updateItemList(var_717);
         var_45.updateItemList(var_1295);
         var_45.updateUserInterface();
         var_45.clearItemLists();
         var_10.toggleInventoryPage(InventoryCategory.const_72);
         var_10.events.dispatchEvent(new Event(HabboInventoryTrackingEvent.HABBO_INVENTORY_TRACKING_EVENT_TRADING));
      }
      
      public function requestConfirmAcceptTrading() : void
      {
         state = const_425;
         _communication.getHabboMainConnection(null).send(new ConfirmAcceptTradingComposer());
      }
      
      public function requestConfirmDeclineTrading() : void
      {
         _communication.getHabboMainConnection(null).send(new ConfirmDeclineTradingComposer());
      }
      
      public function requestOpenTrading(param1:int) : void
      {
         _communication.getHabboMainConnection(null).send(new OpenTradingComposer(param1));
      }
      
      public function confirmCountdownReady() : void
      {
         if(var_31 == const_297)
         {
            state = const_264;
         }
      }
      
      public function cancelConfirmCountdown() : void
      {
         var_45.cancelConfirmCountdown();
      }
      
      public function get ownUserId() : int
      {
         return var_717;
      }
      
      public function requestUnacceptTrading() : void
      {
         _communication.getHabboMainConnection(null).send(new UnacceptTradingComposer());
      }
      
      public function getItemImage(param1:IItem) : BitmapData
      {
         var _loc2_:* = null;
         if(param1 is FloorItem)
         {
            _loc2_ = _roomEngine.getFurnitureImage(param1.type,new Vector3d(180,0,0),64,this,String(param1.extra));
         }
         else
         {
            _loc2_ = _roomEngine.getWallItemImage(param1.type,new Vector3d(180,0,0),64,this,param1.stuffData);
         }
         return _loc2_.data as BitmapData;
      }
      
      public function get otherUserId() : int
      {
         return var_1295;
      }
      
      public function get otherUserAccepts() : Boolean
      {
         return var_716;
      }
      
      public function requestAddItemToTrading(param1:int, param2:int, param3:int, param4:Boolean, param5:String = "") : Boolean
      {
         var _loc6_:* = null;
         if(var_514)
         {
            return false;
         }
         if(var_232.length < const_1285)
         {
            _communication.getHabboMainConnection(null).send(new AddItemToTradeComposer(param1));
         }
         else
         {
            if(!param4)
            {
               return false;
            }
            _loc6_ = String(param2);
            if(param3 == FurniCategory.const_178)
            {
               _loc6_ = String(param2) + "poster" + param5;
            }
            if(var_232.getValue(_loc6_) == null)
            {
               return false;
            }
            _communication.getHabboMainConnection(null).send(new AddItemToTradeComposer(param1));
         }
         return true;
      }
      
      public function closingInventoryView() : void
      {
         if(var_584)
         {
            close();
         }
      }
      
      public function close() : void
      {
         if(var_584)
         {
            if(var_31 != const_175 && var_31 != const_195)
            {
               requestCancelTrading();
               state = TradingModel.TRADING_STATE_CANCELLED;
            }
            state = const_175;
            var_10.toggleInventorySubPage(InventorySubCategory.const_924);
            var_584 = false;
         }
         var_45.setMinimized(false);
      }
   }
}
