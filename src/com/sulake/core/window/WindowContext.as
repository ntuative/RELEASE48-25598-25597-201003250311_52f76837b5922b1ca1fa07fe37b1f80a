package com.sulake.core.window
{
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.localization.ILocalizable;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.core.window.components.DesktopController;
   import com.sulake.core.window.components.IDesktopWindow;
   import com.sulake.core.window.components.IScrollableWindow;
   import com.sulake.core.window.components.IScrollbarWindow;
   import com.sulake.core.window.components.SubstituteParentController;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowState;
   import com.sulake.core.window.graphics.IGraphicContextHost;
   import com.sulake.core.window.graphics.IWindowRenderer;
   import com.sulake.core.window.utils.IInternalWindowServices;
   import com.sulake.core.window.utils.IMouseCursor;
   import com.sulake.core.window.utils.IWindowParser;
   import com.sulake.core.window.utils.InternalWindowServices;
   import com.sulake.core.window.utils.KeyboardEventQueue;
   import com.sulake.core.window.utils.MouseCursorControl;
   import com.sulake.core.window.utils.MouseEventQueue;
   import com.sulake.core.window.utils.WindowParser;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class WindowContext implements IWindowContext, IDisposable, IUpdateReceiver
   {
      
      public static var var_929:MouseEventQueue;
      
      public static var var_1599:IMouseCursor;
      
      public static const const_1526:int = 2;
      
      private static var var_1072:Factory;
      
      private static var var_137:IWindowRenderer;
      
      public static var var_1370:KeyboardEventQueue;
      
      public static const const_1560:int = 1;
      
      public static const ERROR_DURING_EVENT_HANDLING:int = 5;
      
      public static const const_1456:int = 0;
      
      public static const const_1461:int = 3;
      
      public static const const_1191:int = 4;
       
      
      protected var var_2277:IWindowFactory;
      
      private var _disposed:Boolean = false;
      
      private var var_732:WindowController;
      
      private var var_739:Date;
      
      protected var var_2278:IWindowParser;
      
      protected var var_941:Error;
      
      protected var var_2276:IInternalWindowServices;
      
      protected var var_93:WindowController;
      
      protected var var_1385:int = -1;
      
      protected var var_88:IDesktopWindow;
      
      private var var_1542:Boolean = false;
      
      protected var var_2351:Boolean = true;
      
      private var var_179:Boolean = false;
      
      protected var var_1110:SubstituteParentController;
      
      private var var_2316:Point;
      
      protected var var_326:DisplayObjectContainer;
      
      private var var_365:IWindowContextStateListener;
      
      private var _name:String;
      
      protected var _localization:ICoreLocalizationManager;
      
      private var var_600:Point;
      
      public function WindowContext(param1:String, param2:IWindowRenderer, param3:IWindowFactory, param4:ICoreLocalizationManager, param5:DisplayObjectContainer, param6:Rectangle, param7:IWindowContextStateListener)
      {
         var_600 = new Point();
         var_2316 = new Point();
         super();
         _name = param1;
         var_137 = param2;
         _localization = param4;
         var_326 = param5;
         var_2276 = new InternalWindowServices(this,param5);
         var_2277 = param3;
         var_2278 = new WindowParser(this);
         var_739 = new Date();
         if(var_1072 == null)
         {
            var_1072 = new Factory();
         }
         if(var_929 == null)
         {
            var_929 = new MouseEventQueue(param5);
         }
         if(var_1370 == null)
         {
            var_1370 = new KeyboardEventQueue(param5);
         }
         if(param6 == null)
         {
            param6 = new Rectangle(0,0,800,600);
         }
         var_88 = new DesktopController("_CONTEXT_DESKTOP_" + _name,this,param6);
         var_326.addChild(var_88.getDisplayObject());
         var_326.doubleClickEnabled = true;
         var_326.addEventListener(Event.RESIZE,stageResizedHandler);
         var_93 = WindowController(var_88);
         var_1110 = new SubstituteParentController(this);
         var_365 = param7;
      }
      
      public function destroy(param1:IWindow) : Boolean
      {
         if(param1 == var_88)
         {
            var_88 = null;
         }
         if(param1.state != WindowState.const_404)
         {
            param1.destroy();
         }
         return true;
      }
      
      public function create(param1:String, param2:String, param3:uint, param4:uint, param5:uint, param6:Rectangle, param7:Function, param8:IWindow, param9:uint, param10:Array = null, param11:Array = null) : IWindow
      {
         var _loc12_:Class = var_1072.getWindowClassByType(param3);
         if(_loc12_ == null)
         {
            handleError(WindowContext.const_1191,new Error("Failed to solve implementation for window \"" + param1 + "\"!"));
            return null;
         }
         if(param8 == null)
         {
            if(param5 & 0)
            {
               param8 = var_1110;
            }
         }
         var _loc13_:IWindow = new _loc12_(param1,param3,param4,param5,this,param6,param8 != null ? param8 : var_88,param7,param10,param11,param9);
         if(param2 && param2.length)
         {
            _loc13_.caption = param2;
         }
         return _loc13_;
      }
      
      public function getDesktopWindow() : IDesktopWindow
      {
         return var_88;
      }
      
      public function render(param1:uint) : void
      {
         var_1542 = true;
         var_137.update(param1);
         var_1542 = false;
      }
      
      public function dispose() : void
      {
         _disposed = true;
         var_326.removeEventListener(Event.RESIZE,stageResizedHandler);
         var_326.removeChild(IGraphicContextHost(var_88).getGraphicContext(true) as DisplayObject);
         var_88.destroy();
         var_88 = null;
         var_1110.destroy();
         var_1110 = null;
         var_1072 = null;
         var_137 = null;
         var_93 = null;
         var_739 = null;
         var_365 = null;
      }
      
      private function stageResizedHandler(param1:Event) : void
      {
         if(var_88 != null && true)
         {
            if(var_326 is Stage)
            {
               var_88.width = Stage(var_326).stageWidth;
               var_88.height = Stage(var_326).stageHeight;
            }
            else
            {
               var_88.width = var_326.width;
               var_88.height = var_326.height;
            }
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function registerLocalizationListener(param1:String, param2:IWindow) : void
      {
         _localization.registerListener(param1,param2 as ILocalizable);
      }
      
      public function invalidate(param1:IWindow, param2:Rectangle, param3:uint) : Boolean
      {
         var_137.addToRenderQueue(WindowController(param1),param2,param3);
         return true;
      }
      
      public function getWindowParser() : IWindowParser
      {
         return var_2278;
      }
      
      public function removeLocalizationListener(param1:String, param2:IWindow) : void
      {
         _localization.removeListener(param1,param2 as ILocalizable);
      }
      
      public function getWindowFactory() : IWindowFactory
      {
         return var_2277;
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var_179 = true;
         if(var_941)
         {
            throw var_941;
         }
         var _loc6_:Point = new Point();
         var _loc7_:MouseEventQueue = WindowContext.var_929;
         _loc7_.begin();
         var_600.x = -1;
         var_600.y = -1;
         while(true)
         {
            _loc2_ = _loc7_.next() as MouseEvent;
            if(_loc2_ == null)
            {
               break;
            }
            if(_loc2_.stageX != var_600.x || _loc2_.stageY != var_600.y)
            {
               var_600.x = _loc2_.stageX;
               var_600.y = _loc2_.stageY;
               _loc5_ = new Array();
               var_88.groupChildrenUnderPoint(var_600,_loc5_);
            }
            _loc3_ = _loc5_ != null ? int(_loc5_.length) : 0;
            if(_loc3_ == 1)
            {
               if(_loc2_.type == MouseEvent.MOUSE_MOVE)
               {
                  if(var_93 != var_88 && true)
                  {
                     var_93.getGlobalPosition(_loc6_);
                     var_93.update(var_93,new MouseEvent(MouseEvent.MOUSE_OUT,false,false,_loc2_.stageX - _loc6_.x,_loc2_.stageY - _loc6_.y,null,_loc2_.altKey,_loc2_.ctrlKey,_loc2_.shiftKey,_loc2_.buttonDown,_loc2_.delta));
                     var_93 = WindowController(var_88);
                  }
               }
            }
            while(--_loc3_ > -1)
            {
               _loc4_ = passMouseEvent(WindowController(_loc5_[_loc3_]),_loc2_);
               if(_loc4_ != null && _loc4_.visible)
               {
                  if(_loc2_.type == MouseEvent.MOUSE_MOVE)
                  {
                     if(_loc4_ != var_93)
                     {
                        if(true)
                        {
                           var_93.getGlobalPosition(_loc6_);
                           var_93.update(var_93,new MouseEvent(MouseEvent.MOUSE_OUT,false,false,_loc2_.stageX - _loc6_.x,_loc2_.stageY - _loc6_.y,null,_loc2_.altKey,_loc2_.ctrlKey,_loc2_.shiftKey,_loc2_.buttonDown,_loc2_.delta));
                        }
                        if(!_loc4_.disposed)
                        {
                           _loc4_.getGlobalPosition(_loc6_);
                           _loc4_.update(_loc4_,new MouseEvent(MouseEvent.MOUSE_OVER,false,false,_loc2_.stageX - _loc6_.x,_loc2_.stageY - _loc6_.y,null,_loc2_.altKey,_loc2_.ctrlKey,_loc2_.shiftKey,_loc2_.buttonDown,_loc2_.delta));
                        }
                        if(!_loc4_.disposed)
                        {
                           var_93 = _loc4_;
                        }
                     }
                  }
                  else if(_loc2_.type == MouseEvent.MOUSE_UP || _loc2_.type == MouseEvent.CLICK)
                  {
                     if(var_93 && true)
                     {
                        if(var_365 != null)
                        {
                           var_365.mouseEventReceived(_loc2_.type,var_93);
                        }
                     }
                  }
                  if(_loc2_.altKey)
                  {
                     if(var_93)
                     {
                        Logger.log("HOVER: undefined");
                     }
                  }
                  if(_loc4_ != var_88)
                  {
                     _loc2_.stopPropagation();
                     _loc7_.remove();
                  }
                  break;
               }
            }
         }
         _loc7_.end();
         var_179 = false;
      }
      
      public function handleError(param1:int, param2:Error) : void
      {
         var_941 = param2;
         var_1385 = param1;
         if(var_2351)
         {
            throw param2;
         }
      }
      
      public function getLastError() : Error
      {
         return var_941;
      }
      
      public function getMouseCursor() : IMouseCursor
      {
         if(var_1599 == null)
         {
            var_1599 = new MouseCursorControl(var_326);
         }
         return var_1599;
      }
      
      public function flushError() : void
      {
         var_941 = null;
         var_1385 = -1;
      }
      
      public function getLastErrorCode() : int
      {
         return var_1385;
      }
      
      private function passMouseEvent(param1:WindowController, param2:MouseEvent) : WindowController
      {
         if(param1.disposed)
         {
            return null;
         }
         if(!param1.testParamFlag(WindowParam.const_50))
         {
            return null;
         }
         if(param1.testStateFlag(WindowState.const_68))
         {
            return null;
         }
         var _loc3_:Point = new Point(param2.stageX,param2.stageY);
         param1.convertPointFromGlobalToLocalSpace(_loc3_);
         var _loc4_:BitmapData = var_137.getDrawBufferForRenderable(param1);
         if(!param1.validateLocalPointIntersection(_loc3_,_loc4_))
         {
            return null;
         }
         if(param1.testParamFlag(WindowParam.const_455))
         {
            if(param1.parent != null)
            {
               return passMouseEvent(WindowController(param1.parent),param2);
            }
         }
         var _loc5_:Boolean = true;
         switch(param2.type)
         {
            case MouseEvent.MOUSE_DOWN:
               var_732 = param1;
               break;
            case MouseEvent.CLICK:
               if(var_732 != param1)
               {
                  _loc5_ = false;
               }
               else
               {
                  var_732 = null;
               }
               break;
            case MouseEvent.DOUBLE_CLICK:
               if(var_732 != param1)
               {
                  _loc5_ = false;
               }
               else
               {
                  var_732 = null;
               }
               break;
            case MouseEvent.MOUSE_WHEEL:
               if(!(param1 is IScrollableWindow) && !(param1 is IScrollbarWindow))
               {
                  return null;
               }
               break;
         }
         if(_loc5_)
         {
            if(!param1.update(param1,param2))
            {
               if(param1.parent)
               {
                  return passMouseEvent(WindowController(param1.parent),param2);
               }
            }
         }
         return param1;
      }
      
      public function findWindowByName(param1:String) : IWindow
      {
         return var_88.findChildByName(param1);
      }
      
      public function getWindowServices() : IInternalWindowServices
      {
         return var_2276;
      }
   }
}
