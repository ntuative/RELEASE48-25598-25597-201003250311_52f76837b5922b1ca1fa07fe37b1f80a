package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.viewer.Offer;
   import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.SetExtraPurchaseParameterEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.WidgetEvent;
   
   public class PurchaseCatalogWidget extends CatalogWidget implements ICatalogWidget
   {
       
      
      private var var_2155:XML;
      
      private var var_1546:ITextWindow;
      
      private var var_1544:ITextWindow;
      
      private var var_2152:XML;
      
      private var var_903:IWindowContainer;
      
      private var var_2317:ITextWindow;
      
      private var var_2154:String = "";
      
      private var var_2374:IButtonWindow;
      
      private var var_2153:XML;
      
      private var var_1545:ITextWindow;
      
      private var var_2151:XML;
      
      private var var_902:IButtonWindow;
      
      private var var_76:Offer;
      
      public function PurchaseCatalogWidget(param1:IWindowContainer)
      {
         super(param1);
      }
      
      private function attachStub(param1:String) : void
      {
         var _loc2_:* = null;
         switch(param1)
         {
            case Offer.const_478:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_2152) as IWindowContainer;
               break;
            case Offer.const_352:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_2151) as IWindowContainer;
               break;
            case Offer.const_438:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_2155) as IWindowContainer;
               break;
            case Offer.const_521:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_2153) as IWindowContainer;
               break;
            default:
               Logger.log("Unknown price-type, can\'t attach...undefined");
         }
         if(_loc2_ != null)
         {
            if(var_903 != null)
            {
               _window.removeChild(var_903);
               var_903.dispose();
            }
            var_903 = _loc2_;
            _window.addChild(_loc2_);
            var_903.x = 0;
            var_903.y = 0;
         }
         var_1545 = _window.findChildByName("ctlg_price_credits") as ITextWindow;
         var_1544 = _window.findChildByName("ctlg_price_pixels") as ITextWindow;
         var_1546 = _window.findChildByName("ctlg_price_credits_pixels") as ITextWindow;
         var_2317 = _window.findChildByName("ctlg_special_txt") as ITextWindow;
         var_902 = window.findChildByName("ctlg_buy_button") as IButtonWindow;
         if(var_902 != null)
         {
            var_902.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onPurchase);
            var_902.disable();
         }
      }
      
      private function onPurchase(param1:WindowMouseEvent) : void
      {
         if(var_76 != null)
         {
            Logger.log("Init Purchase: undefined undefined");
            (page.viewer.catalog as HabboCatalog).showPurchaseConfirmation(var_76,page,var_2154);
         }
      }
      
      override public function init() : void
      {
         var _loc1_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsStub") as XmlAsset;
         if(_loc1_ != null)
         {
            var_2152 = _loc1_.content as XML;
         }
         var _loc2_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetPixelsStub") as XmlAsset;
         if(_loc2_ != null)
         {
            var_2151 = _loc2_.content as XML;
         }
         var _loc3_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsPixelsStub") as XmlAsset;
         if(_loc3_ != null)
         {
            var_2155 = _loc3_.content as XML;
         }
         var _loc4_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsOrCreditsAndPixelsStub") as XmlAsset;
         if(_loc4_ != null)
         {
            var_2153 = _loc4_.content as XML;
         }
         events.addEventListener(WidgetEvent.CWE_SELECT_PRODUCT,onSelectProduct);
         events.addEventListener(WidgetEvent.const_889,onSetParameter);
      }
      
      private function onSetParameter(param1:SetExtraPurchaseParameterEvent) : void
      {
         var_2154 = param1.parameter;
      }
      
      private function onSelectProduct(param1:SelectProductEvent) : void
      {
         var _loc2_:ICoreLocalizationManager = (page.viewer.catalog as HabboCatalog).localization;
         var_76 = param1.offer;
         attachStub(var_76.priceType);
         if(var_1545 != null)
         {
            _loc2_.registerParameter("catalog.purchase.price.credits","credits",String(var_76.priceInCredits));
            var_1545.caption = "${catalog.purchase.price.credits}";
         }
         if(var_1544 != null)
         {
            _loc2_.registerParameter("catalog.purchase.price.pixels","pixels",String(var_76.priceInPixels));
            var_1544.caption = "${catalog.purchase.price.pixels}";
         }
         if(var_1546 != null)
         {
            _loc2_.registerParameter("catalog.purchase.price.credits+pixels","credits",String(var_76.priceInCredits));
            _loc2_.registerParameter("catalog.purchase.price.credits+pixels","pixels",String(var_76.priceInPixels));
            var_1546.caption = "${catalog.purchase.price.credits+pixels}";
         }
         if(var_902 != null)
         {
            var_902.enable();
         }
      }
   }
}
