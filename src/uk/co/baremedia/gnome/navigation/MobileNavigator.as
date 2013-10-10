package uk.co.baremedia.gnome.navigation
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.system.Capabilities;
	
	import mx.core.FlexGlobals;
	import mx.core.IUIComponent;
	import mx.core.IVisualElementContainer;
	import mx.events.ResizeEvent;
	
	import spark.components.Button;
	import spark.components.SkinnablePopUpContainer;
	import spark.components.TabbedViewNavigator;
	import spark.components.TabbedViewNavigatorApplication;
	import spark.components.View;
	import spark.components.ViewNavigator;
	import spark.events.ElementExistenceEvent;
	import spark.events.IndexChangeEvent;
	
	import uk.co.baremedia.gnomo.utils.UtilsStaticUIInfo;
	
	public class MobileNavigator implements IViewnNavigator
	{
		public var currentAlert			:SkinnablePopUpContainer;
		  
		private var _tabbedNavigator	:TabbedViewNavigator;
		private var _backButton			:Button;
		private var _app				:TabbedViewNavigatorApplication;
		
		public function MobileNavigator(app:TabbedViewNavigatorApplication, tabbedNavigator:TabbedViewNavigator, backButton:Button) 
		{
			_app				= app;
			_tabbedNavigator 	= tabbedNavigator; 
			_backButton 		= backButton;
			
			setupBackButton();
		}
		
		private function setupBackButton():void
		{
			// add back button for non-android OS
			if (Capabilities.version.indexOf("AND") != 0)
			{
				_tabbedNavigator.addEventListener(IndexChangeEvent.CHANGING, indexChangingHandler);
				_tabbedNavigator.addEventListener(IndexChangeEvent.CHANGE, indexChangeHandler);
				indexChangeHandler(null);
			}
		}
		
		public function indexChangingHandler(event:IndexChangeEvent):void
		{
			// remove back button from previous navigator
			var previousNav:ViewNavigator = ViewNavigator(_tabbedNavigator.getElementAt(event.oldIndex));
			
			if (previousNav.length > 1)
			{
				var backButtonParent:IVisualElementContainer = _backButton.parent as IVisualElementContainer;
				if (backButtonParent)
					backButtonParent.removeElement(_backButton);
				
				removeBackButton(previousNav.activeView);
			}
		}
		
		public function indexChangeHandler(event:IndexChangeEvent):void
		{
			if (!_tabbedNavigator.selectedNavigator)
				return;
			
			// install listeners on the active ViewNavigator
			var viewNav:ViewNavigator = ViewNavigator(_tabbedNavigator.selectedNavigator);
			viewNav.addEventListener(ElementExistenceEvent.ELEMENT_ADD, elementAdded);
			viewNav.addEventListener(ElementExistenceEvent.ELEMENT_REMOVE, elementRemoved);
			
			// add back button to the new navigator if it still has history
			if (viewNav.length > 1)
				addBackButton(viewNav.activeView);
		}
		
		public function elementAdded(event:ElementExistenceEvent):void
		{
			if (ViewNavigator(_tabbedNavigator.selectedNavigator).length > 1)
			{
				var view:View = View(event.element);
				
				if (view)
					addBackButton(view);
			}
		}
		
		public function addBackButton(view:View):void
		{
			// add backButton to the pending View's navigationContent
			// so that it animates in
			if (!view.navigationContent
				|| view.navigationContent.length == 0
				|| (view.navigationContent.length == 1 && view.navigationContent[0] == _backButton))
			{
				view.navigationContent = [_backButton];
			}
		}
		
		public function backButton_clickHandler(event:MouseEvent):void
		{
			ViewNavigator(_tabbedNavigator.selectedNavigator).popView();
		}
		
		public function navigateToIndex(index:int):void
		{
			_tabbedNavigator.selectedIndex = index;
		}
		
		public function elementRemoved(event:ElementExistenceEvent):void
		{
			var view:View = View(event.element);
			
			if (view)
				removeBackButton(view);
		}
		
		public function removeBackButton(view:View):void
		{
			if (view.navigationContent
				&& view.navigationContent.length == 1
				&& view.navigationContent[0] == _backButton)
			{
				view.navigationContent = [];
			}
		}	
	}
}