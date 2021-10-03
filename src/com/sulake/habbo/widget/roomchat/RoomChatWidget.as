package com.sulake.habbo.widget.roomchat
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.widget.RoomWidgetBase;
   import com.sulake.habbo.widget.events.RoomWidgetChatUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomViewUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetChatSelectAvatarMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetRoomObjectMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.events.IEventDispatcher;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getTimer;
   
   public class RoomChatWidget extends RoomWidgetBase implements IUpdateReceiver
   {
      
      private static const const_754:int = 10;
      
      private static const const_486:int = 25;
      
      private static const const_1044:int = 6000;
      
      private static const const_1043:int = 9;
      
      private static const const_755:int = 4000;
      
      private static const const_1045:int = 3;
      
      private static const const_98:int = 18;
      
      private static const const_1036:int = 25;
      
      private static const const_1042:int = 1;
      
      private static const const_278:int = 9;
      
      private static const const_487:int = 8;
      
      private static const const_341:int = 0;
      
      private static const const_488:int = (const_487 + const_341) * const_98 + const_98;
       
      
      private var var_799:Number = 1;
      
      private var _disposed:Boolean = false;
      
      private var var_561:int = 18;
      
      private var var_336:IItemListWindow;
      
      private var var_651:int = 0;
      
      private var var_35:IWindowContainer;
      
      private var _isAnimating:Boolean = false;
      
      private var var_146:int;
      
      private var var_1737:int = 0;
      
      private var var_1165:Boolean = false;
      
      private var var_119:IWindowContainer;
      
      private var _itemList:Array;
      
      private var var_24:RoomChatHistoryViewer;
      
      private var var_1736:int = 150;
      
      private var var_468:Number = 1;
      
      private var var_62:Array;
      
      private var var_219:Array;
      
      private var var_652:int = 0;
      
      private var var_1735:int;
      
      private var var_653:Point;
      
      private var var_1423:Number = 0;
      
      private var var_21:Component = null;
      
      public function RoomChatWidget(param1:IHabboWindowManager, param2:IAssetLibrary, param3:IHabboLocalizationManager, param4:IHabboConfigurationManager, param5:int, param6:Component)
      {
         _itemList = new Array();
         var_62 = new Array();
         var_219 = new Array();
         var_653 = new Point();
         var_146 = const_488 + const_278;
         super(param1,param2,param3);
         var_1735 = param5;
         var_35 = param1.createWindow("chat_container","",HabboWindowType.const_55,HabboWindowStyle.const_39,HabboWindowParam.const_40,new Rectangle(0,0,200,var_146 + RoomChatHistoryPulldown.const_70),null,0) as IWindowContainer;
         var_35.background = true;
         var_35.color = 33554431;
         var_35.tags.push("room_widget_chat");
         var_336 = param1.createWindow("chat_contentlist","",HabboWindowType.const_973,HabboWindowStyle.const_40,0 | 0,new Rectangle(0,0,200,var_146),null,0) as IItemListWindow;
         var_35.addChild(var_336);
         var_119 = param1.createWindow("chat_active_content","",HabboWindowType.const_55,HabboWindowStyle.const_40,HabboWindowParam.const_66,new Rectangle(0,0,200,var_146),null,0) as IWindowContainer;
         var_336.addListItem(var_119);
         var_24 = new RoomChatHistoryViewer(this,param1,var_35,param2);
         var_1736 = int(param4.getKey("chat.history.item.max.count","150"));
         var _loc7_:Boolean = int(param4.getKey("chat.history.disabled","0")) == 1 ? true : false;
         if(var_24 != null)
         {
            var_24.disabled = _loc7_;
         }
         if(param6 != null)
         {
            var_21 = param6;
            var_21.registerUpdateReceiver(this,1);
         }
      }
      
      public function onPulldownCloseButtonClicked(param1:WindowMouseEvent) : void
      {
         if(var_24 != null)
         {
            var_24.hideHistoryViewer();
         }
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener(RoomWidgetChatUpdateEvent.const_551,onChatMessage);
         param1.addEventListener(RoomWidgetRoomViewUpdateEvent.const_253,onRoomViewUpdate);
         param1.addEventListener(RoomWidgetRoomViewUpdateEvent.const_585,onRoomViewUpdate);
         param1.addEventListener(RoomWidgetRoomViewUpdateEvent.const_512,onRoomViewUpdate);
         super.registerUpdateEvents(param1);
      }
      
      override public function get mainWindow() : IWindow
      {
         return var_35;
      }
      
      public function onItemMouseOver(param1:int, param2:int, param3:int, param4:int, param5:WindowMouseEvent) : void
      {
      }
      
      public function resetArea() : void
      {
         if(var_24 == null)
         {
            return;
         }
         animationStop();
         var_146 = const_488 + const_278;
         var_35.height = var_146 + var_24.pulldownBarHeight;
         var_336.width = 0 - 0;
         var_336.height = var_146;
         var_119.width = 0 - 0;
         if(historyViewerActive())
         {
            var_119.height = getTotalContentHeight() + const_278;
         }
         else
         {
            var_119.height = var_146;
         }
         var_336.scrollV = 1;
         if(!historyViewerActive())
         {
            var_24.containerResized(var_35.rectangle);
         }
         purgeItems();
         alignItems();
      }
      
      public function resizeContainerToLowestItem() : void
      {
         var _loc4_:* = null;
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         while(_loc2_ < _itemList.length)
         {
            _loc4_ = _itemList[_loc2_];
            if(_loc4_.y > _loc1_)
            {
               _loc1_ = _loc4_.y;
            }
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < var_62.length)
         {
            _loc4_ = var_62[_loc2_];
            if(_loc4_.y > _loc1_)
            {
               _loc1_ = _loc4_.y;
            }
            _loc2_++;
         }
         _loc1_ += const_486;
         _loc1_ = _loc1_ < 0 ? 0 : int(_loc1_);
         var _loc3_:int = var_35.rectangle.bottom;
         stretchAreaBottomTo(var_35.rectangle.top + _loc1_);
         _loc3_ -= var_35.rectangle.bottom;
         if(Math.abs(_loc3_) < RoomChatHistoryViewer.const_971)
         {
            resetArea();
            return;
         }
         _loc2_ = 0;
         while(_loc2_ < _itemList.length)
         {
            _loc4_ = _itemList[_loc2_];
            _loc4_.y += _loc3_;
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < var_62.length)
         {
            _loc4_ = var_62[_loc2_];
            _loc4_.y += _loc3_;
            _loc2_++;
         }
         var_1165 = true;
      }
      
      private function processBuffer() : void
      {
         if(_isAnimating)
         {
            return;
         }
         if(false)
         {
            return;
         }
         while(var_62.length > const_1042 || historyViewerActive() && false)
         {
            activateItemFromBuffer();
         }
         var _loc1_:Boolean = false;
         if(false)
         {
            _loc1_ = true;
         }
         else
         {
            _loc1_ = checkLastItemAllowsAdding(var_62[0]);
         }
         if(_loc1_)
         {
            activateItemFromBuffer();
            var_651 = getTimer() + const_755;
         }
         else
         {
            if(false && false)
            {
               var_561 = getItemSpacing(_itemList["-1"],var_62[0]);
            }
            else
            {
               var_561 = const_98;
            }
            animationStart();
         }
      }
      
      private function setChatItemLocHorizontal(param1:RoomChatItem) : void
      {
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         if(param1 == null || var_24 == null)
         {
            return;
         }
         var _loc2_:Number = (param1.senderX + var_653.x) * var_799;
         var _loc3_:Number = _loc2_ - param1.width / 2;
         var _loc4_:Number = _loc3_ + param1.width;
         var _loc5_:Number = 0 - const_754;
         var _loc6_:Number = 0 + const_754 - 0;
         var _loc7_:Boolean = _loc3_ >= _loc5_ && _loc3_ <= _loc6_;
         var _loc8_:Boolean = _loc4_ >= _loc5_ && _loc4_ <= _loc6_;
         if(_loc7_ && _loc8_)
         {
            _loc9_ = _loc3_;
            _loc10_ = _loc9_;
         }
         else if(_loc2_ >= 0)
         {
            _loc9_ = _loc6_ - param1.width;
         }
         else
         {
            _loc9_ = _loc5_;
         }
         param1.x = _loc9_ + 0 + var_35.x;
         if(_loc2_ < _loc5_ || _loc2_ > _loc6_)
         {
            param1.hidePointer();
         }
         else
         {
            param1.setPointerOffset(_loc3_ - _loc9_);
         }
      }
      
      public function onItemMouseOut(param1:int, param2:int, param3:int, param4:int, param5:WindowMouseEvent) : void
      {
      }
      
      private function checkLastItemAllowsAdding(param1:RoomChatItem) : Boolean
      {
         if(false)
         {
            return true;
         }
         var _loc2_:RoomChatItem = _itemList["-1"];
         if(param1 == null || _loc2_ == null)
         {
            return false;
         }
         if(_loc2_.view == null)
         {
            return true;
         }
         if(var_119.rectangle.bottom - (var_119.y + _loc2_.y + _loc2_.height) <= getItemSpacing(_loc2_,param1))
         {
            return false;
         }
         return true;
      }
      
      public function mouseUp() : void
      {
         var _loc1_:Number = var_35.rectangle.bottom - 0;
         if(_loc1_ < const_488)
         {
            if(_loc1_ <= var_146 + var_35.y)
            {
               if(historyViewerActive())
               {
                  hideHistoryViewer();
               }
               resetArea();
               return;
            }
         }
         if(var_1165 && !historyViewerActive())
         {
            resetArea();
            var_1165 = false;
         }
      }
      
      private function getFreeItemId() : String
      {
         return "chat_" + var_1735.toString() + "_item_" + (var_1737++).toString();
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         if(_disposed)
         {
            return;
         }
         while(false)
         {
            _loc1_ = var_219.shift();
         }
         var_24.dispose();
         var_24 = null;
         while(false)
         {
            _loc1_ = _itemList.shift();
            _loc1_.dispose();
         }
         while(false)
         {
            _loc1_ = var_62.shift();
            _loc1_.dispose();
         }
         var_35.dispose();
         if(var_21 != null)
         {
            var_21.removeUpdateReceiver(this);
            var_21 = null;
         }
         super.dispose();
         _disposed = true;
      }
      
      private function animationStop() : void
      {
         _isAnimating = false;
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetChatUpdateEvent.const_551,onChatMessage);
         param1.removeEventListener(RoomWidgetRoomViewUpdateEvent.const_253,onRoomViewUpdate);
         param1.removeEventListener(RoomWidgetRoomViewUpdateEvent.const_585,onRoomViewUpdate);
         param1.removeEventListener(RoomWidgetRoomViewUpdateEvent.const_512,onRoomViewUpdate);
      }
      
      public function onPulldownMouseDown(param1:WindowMouseEvent) : void
      {
         if(var_24 != null)
         {
            var_24.beginDrag(param1.stageY,true);
         }
      }
      
      private function alignItems() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         if(var_24 == null)
         {
            return;
         }
         _loc1_ = -1;
         while(_loc1_ >= 0)
         {
            _loc2_ = _itemList[_loc1_];
            if(_loc2_ != null)
            {
               setChatItemLocHorizontal(_loc2_);
               setChatItemLocVertical(_loc2_);
            }
            _loc1_--;
         }
         _loc1_ = 0;
         while(_loc1_ < _itemList.length)
         {
            _loc2_ = _itemList[_loc1_];
            if(_loc2_ != null)
            {
               setChatItemRenderable(_loc2_);
            }
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < var_62.length)
         {
            _loc2_ = var_62[_loc1_];
            if(_loc2_ != null)
            {
               setChatItemLocHorizontal(_loc2_);
            }
            _loc1_++;
         }
      }
      
      private function onChatMessage(param1:RoomWidgetChatUpdateEvent) : void
      {
         var _loc2_:RoomChatItem = new RoomChatItem(this,windowManager,assets,getFreeItemId(),localizations);
         _loc2_.define(param1);
         if(var_799 != 1)
         {
            _loc2_.senderX /= var_799;
         }
         _loc2_.senderX -= 0;
         setChatItemLocHorizontal(_loc2_);
         var_62.push(_loc2_);
         processBuffer();
      }
      
      private function setChatItemLocVertical(param1:RoomChatItem) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         if(param1 != null)
         {
            _loc2_ = _itemList.indexOf(param1);
            _loc3_ = !!historyViewerActive() ? 0 : Number(var_468);
            if(_loc2_ == -1)
            {
               param1.y = getAreaBottom() - (_loc3_ + 1) * const_98 - const_278;
            }
            else
            {
               _loc4_ = _itemList[_loc2_ + 1].aboveLevels;
               if(_loc4_ < 2)
               {
                  param1.y = _itemList[_loc2_ + 1].y - getItemSpacing(param1,_itemList[_loc2_ + 1]);
               }
               else
               {
                  param1.y = _itemList[_loc2_ + 1].y - _loc4_ * const_98;
               }
            }
         }
      }
      
      public function disableDragTooltips() : void
      {
         var _loc2_:int = 0;
         var _loc1_:* = null;
         _loc2_ = 0;
         while(_loc2_ < _itemList.length)
         {
            _loc1_ = _itemList[_loc2_];
            _loc1_.disableTooltip();
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < var_62.length)
         {
            _loc1_ = var_62[_loc2_];
            _loc1_.disableTooltip();
            _loc2_++;
         }
      }
      
      private function animationStart() : void
      {
         if(_isAnimating)
         {
            return;
         }
         selectItemsToMove();
         _isAnimating = true;
      }
      
      public function hideHistoryViewer() : void
      {
         if(var_24 != null)
         {
            var_24.hideHistoryViewer();
         }
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:int = 0;
         if(getTimer() > var_651 && var_651 > 0)
         {
            var_651 = -1;
            animationStart();
         }
         if(_isAnimating)
         {
            _loc2_ = param1 / const_1036 * const_1045;
            if(_loc2_ + var_652 > var_561)
            {
               _loc2_ = var_561 - var_652;
            }
            if(_loc2_ > 0)
            {
               moveItemsUp(_loc2_);
               var_652 += _loc2_;
            }
            if(var_652 >= var_561)
            {
               var_561 = const_98;
               var_652 = 0;
               animationStop();
               processBuffer();
               var_651 = getTimer() + const_755;
            }
         }
         if(var_24 != null)
         {
            var_24.update(param1);
         }
      }
      
      public function getTotalContentHeight() : int
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         while(_loc3_ < _itemList.length)
         {
            _loc1_ = _itemList[_loc3_];
            if(_loc1_ != null)
            {
               if(_loc3_ == 0)
               {
                  _loc2_ += const_98;
               }
               else
               {
                  _loc2_ += getItemSpacing(_itemList[_loc3_ - 1],_loc1_);
               }
               _loc2_ += (_loc1_.aboveLevels - 1) * const_98;
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      private function onRoomViewUpdate(param1:RoomWidgetRoomViewUpdateEvent) : void
      {
         var _loc2_:Rectangle = param1.rect;
         if(param1.scale > 0)
         {
            if(var_1423 == 0)
            {
               var_1423 = param1.scale;
            }
            else
            {
               var_799 = param1.scale / var_1423;
            }
         }
         if(param1.positionDelta != null)
         {
            var_653.x += param1.positionDelta.x / var_799;
            var_653.y += param1.positionDelta.y / var_799;
         }
         if(param1.rect != null)
         {
            if(var_24 == null)
            {
               return;
            }
            var_35.width = _loc2_.width;
            var_35.height = var_146 + var_24.pulldownBarHeight;
            var_336.width = 0 - 0;
            var_336.height = var_146;
            var_336.x = var_35.x;
            var_336.y = var_35.y;
            var_119.width = 0 - 0;
            var_119.height = var_146;
            if(historyViewerActive())
            {
               reAlignItemsToHistoryContent();
            }
            var_24.containerResized(var_35.rectangle,true);
         }
         alignItems();
      }
      
      private function getAreaBottom() : Number
      {
         if(historyViewerActive())
         {
            return var_119.height;
         }
         return var_146 + var_35.y;
      }
      
      private function purgeItems() : void
      {
         var _loc2_:* = null;
         if(historyViewerActive())
         {
            return;
         }
         var _loc1_:int = 0;
         var _loc3_:int = 0;
         while(_itemList.length > var_1736)
         {
            _loc2_ = _itemList.shift();
            _loc3_ = var_219.indexOf(_loc2_);
            if(_loc3_ > -1)
            {
               var_219.splice(_loc3_,1);
            }
            if(_loc2_.view != null)
            {
               var_119.removeChild(_loc2_.view);
               _loc2_.hideView();
            }
            _loc2_.dispose();
            _loc2_ = null;
         }
         var _loc4_:Boolean = false;
         _loc1_ = 0;
         for(; _loc1_ < _itemList.length; _loc1_++)
         {
            _loc2_ = _itemList[_loc1_];
            if(_loc2_ != null)
            {
               if(_loc2_.y > -const_486)
               {
                  _loc4_ = true;
               }
               _loc2_.aboveLevels = 1;
               if(_loc2_.view != null)
               {
                  _loc3_ = var_219.indexOf(_loc2_);
                  if(_loc3_ > -1)
                  {
                     var_219.splice(_loc3_,1);
                  }
                  var_119.removeChild(_loc2_.view);
                  _loc2_.hideView();
               }
               continue;
               break;
            }
         }
         if(false)
         {
            _loc4_ = true;
         }
         if(getTotalContentHeight() > const_98 && !_loc4_ && !historyViewerActive())
         {
            if(var_24 != null)
            {
               stretchAreaBottomTo(var_35.y);
               alignItems();
               if(!historyViewerActive())
               {
                  var_24.showHistoryViewer();
               }
               if(!historyViewerVisible())
               {
                  var_24.visible = true;
               }
            }
         }
         else if(historyViewerVisible())
         {
            var_24.visible = false;
         }
      }
      
      public function stretchAreaBottomBy(param1:Number) : void
      {
         var _loc2_:Number = var_35.rectangle.bottom + param1 - 0;
         stretchAreaBottomTo(_loc2_);
      }
      
      private function activateItemFromBuffer() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:int = 0;
         if(false)
         {
            return;
         }
         if(historyViewerMinimized())
         {
            resetArea();
            hideHistoryViewer();
         }
         if(!checkLastItemAllowsAdding(var_62[0]))
         {
            selectItemsToMove();
            moveItemsUp(getItemSpacing(_itemList["-1"],var_62[0]));
            if(!checkLastItemAllowsAdding(var_62[0]))
            {
               var_119.height += const_98;
               if(var_24 != null)
               {
                  var_24.containerResized(var_35.rectangle);
               }
            }
         }
         _loc1_ = var_62.shift();
         if(_loc1_ != null)
         {
            _loc1_.renderView();
            _loc2_ = _loc1_.view;
            if(_loc2_ != null)
            {
               var_119.addChild(_loc2_);
               _loc1_.timestamp = new Date().time;
               _itemList.push(_loc1_);
               _loc3_ = 0;
               if(false)
               {
                  _loc3_ = _itemList["-2"].screenLevel;
                  if(historyViewerActive())
                  {
                     _loc1_.screenLevel = _loc3_ + 1;
                  }
                  else
                  {
                     _loc1_.screenLevel = _loc3_ + Math.max(var_468,1);
                  }
               }
               else
               {
                  _loc1_.screenLevel = 100;
               }
               _loc1_.aboveLevels = var_468;
               if(_loc1_.aboveLevels > const_487 + const_341 + 2)
               {
                  _loc1_.aboveLevels = const_487 + const_341 + 2;
               }
               var_468 = 0;
               setChatItemLocHorizontal(_loc1_);
               setChatItemLocVertical(_loc1_);
               setChatItemRenderable(_loc1_);
            }
         }
      }
      
      public function stretchAreaBottomTo(param1:Number) : void
      {
         var _loc2_:int = var_35.context.getDesktopWindow().height - 0;
         param1 = Math.min(param1,_loc2_);
         var_146 = param1 - 0;
         var_35.height = var_146 + RoomChatHistoryPulldown.const_70;
         if(var_24 != null)
         {
            var_24.containerResized(var_35.rectangle);
         }
      }
      
      public function onItemMouseClick(param1:int, param2:String, param3:int, param4:int, param5:int, param6:WindowMouseEvent) : void
      {
         if(param6.shiftKey)
         {
            if(var_24 != null)
            {
               var_24.toggleHistoryViewer();
            }
            return;
         }
         var _loc7_:RoomWidgetRoomObjectMessage = new RoomWidgetRoomObjectMessage(RoomWidgetRoomObjectMessage.const_294,param1,param3);
         messageListener.processWidgetMessage(_loc7_);
         var _loc8_:RoomWidgetChatSelectAvatarMessage = new RoomWidgetChatSelectAvatarMessage(RoomWidgetChatSelectAvatarMessage.const_610,param1,param2,param4,param5);
         messageListener.processWidgetMessage(_loc8_);
      }
      
      private function selectItemsToMove() : void
      {
         var _loc4_:* = null;
         if(_isAnimating)
         {
            return;
         }
         purgeItems();
         var_219 = new Array();
         var _loc1_:int = new Date().time;
         var _loc2_:int = 0;
         if(false)
         {
            var_468 = 1;
            return;
         }
         if(historyViewerActive())
         {
            return;
         }
         ++var_468;
         var _loc3_:int = -1;
         while(_loc3_ >= 0)
         {
            _loc4_ = _itemList[_loc3_];
            if(_loc4_.view != null)
            {
               if(_loc4_.screenLevel > const_341 || _loc4_.screenLevel == _loc2_ - 1 || _loc1_ - _loc4_.timestamp >= const_1044)
               {
                  _loc4_.timestamp = _loc1_;
                  _loc2_ = _loc4_.screenLevel;
                  --_loc4_.screenLevel;
                  var_219.push(_loc4_);
               }
            }
            _loc3_--;
         }
      }
      
      public function enableDragTooltips() : void
      {
         var _loc2_:int = 0;
         var _loc1_:* = null;
         _loc2_ = 0;
         while(_loc2_ < _itemList.length)
         {
            _loc1_ = _itemList[_loc2_];
            _loc1_.enableTooltip();
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < var_62.length)
         {
            _loc1_ = var_62[_loc2_];
            _loc1_.enableTooltip();
            _loc2_++;
         }
      }
      
      public function reAlignItemsToHistoryContent() : void
      {
         if(historyViewerActive())
         {
            var_119.height = getTotalContentHeight() + const_278;
            alignItems();
         }
      }
      
      private function setChatItemRenderable(param1:RoomChatItem) : void
      {
         if(param1 != null)
         {
            if(param1.y < -const_486)
            {
               if(param1.view != null)
               {
                  var_119.removeChild(param1.view);
                  param1.hideView();
               }
            }
            else if(param1.view == null)
            {
               param1.renderView();
               if(param1.view != null)
               {
                  var_119.addChild(param1.view);
               }
            }
         }
      }
      
      private function historyViewerMinimized() : Boolean
      {
         return true;
      }
      
      private function moveItemsUp(param1:int) : void
      {
         var _loc3_:Boolean = false;
         if(var_219 == null)
         {
            return;
         }
         if(false)
         {
            return;
         }
         var _loc2_:* = null;
         var _loc4_:int = -1;
         var _loc5_:int = -1;
         while(_loc5_ >= 0)
         {
            _loc2_ = var_219[_loc5_];
            if(_loc2_ != null)
            {
               if(_loc4_ == -1)
               {
                  _loc4_ = _itemList.indexOf(_loc2_);
               }
               else
               {
                  _loc4_++;
               }
               _loc3_ = true;
               if(historyViewerActive())
               {
                  if(_loc2_.y - param1 + _loc2_.height < 0)
                  {
                     _loc3_ = false;
                  }
               }
               if(_loc4_ > 0)
               {
                  if(_itemList[_loc4_ - 1].view != null)
                  {
                     if(_loc2_.y - param1 - _itemList[_loc4_ - 1].y < getItemSpacing(_itemList[_loc4_ - 1],_loc2_))
                     {
                        _loc3_ = false;
                     }
                  }
               }
               if(_loc3_)
               {
                  _loc2_.y -= param1;
               }
            }
            _loc5_--;
         }
      }
      
      private function historyViewerActive() : Boolean
      {
         return var_24 == null ? false : Boolean(var_24.active);
      }
      
      private function getItemSpacing(param1:RoomChatItem, param2:RoomChatItem) : Number
      {
         if(param1.checkOverlap(param2.x,param1.y,param2.width,param2.height))
         {
            return const_98;
         }
         return const_1043;
      }
      
      public function onItemMouseDown(param1:int, param2:int, param3:int, param4:int, param5:WindowMouseEvent) : void
      {
         if(historyViewerVisible())
         {
            return;
         }
         if(var_24 != null)
         {
            var_24.beginDrag(param5.stageY);
         }
      }
      
      private function historyViewerVisible() : Boolean
      {
         return var_24 == null ? false : Boolean(var_24.visible);
      }
   }
}
